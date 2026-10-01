"""Audit every original chunk and export static tables without guessing defaults.

This does not reconstruct source or infer that a cached feature is live.
Config execution is bounded by an instruction hook and a Lua memory limit.
Original configuration imports and inherited defaults are resolved recursively;
unresolved imports fail explicitly, while Lua function values are marked.
"""
from __future__ import annotations
import argparse
import collections
import hashlib
import json
import math
from pathlib import Path
from lua51_disassemble import Reader, decode, disassemble

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'analysis/review'
PREFIX = 'auto_gen.package_include.config.'

def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, separators=(',', ':'))+'\n', encoding='utf8')

def walk(p, path='0'):
    yield p, path
    for i, c in enumerate(p.children, 1):
        yield from walk(c, f'{path}.{i}')

def group(name):
    if name.startswith('game.module.'):
        return name[len('game.module.'):].split('.')[0]
    return None

def inventory():
    rows = json.loads((ROOT/'reverse/lua-bytecode/manifest.json').read_text())
    results, errors, counts = [], [], collections.Counter()
    for row in rows:
        data = (ROOT/'reverse/lua-bytecode'/row['file']).read_bytes()
        item = {'name': row['name'], 'source': row['file'], 'bundle': row['bundle'],
                'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest(), 'module': group(row['name'])}
        try:
            reader = Reader(data); p = reader.proto()
            if reader.pos != len(data): raise ValueError('Trailing bytes')
            funcs = []
            strings = set()
            for f, path in walk(p):
                ss = [v for v in f.constants if isinstance(v,str)]
                strings.update(ss)
                funcs.append({'path':path,'names':f.names,'params':f.params,'upvalues':f.nups,
                              'instructions':len(f.code),'source_lines':[f.first_line,f.last_line],
                              'constants':f.constants if not row['name'].startswith(PREFIX) else []})
            item.update(functions=funcs, instructions=sum(f['instructions'] for f in funcs),
                        messages=sorted(s for s in strings if s.endswith(('_c2s','_s2c')) and ' ' not in s),
                        imports=sorted(s for s in strings if s.startswith(('game.','auto_gen.','common.'))),
                        ui=sorted(s for s in strings if s.endswith(('View','Window','Panel'))))
            counts[item['module'] or ('config' if row['name'].startswith(PREFIX) else 'framework')] += 1
        except Exception as exc:
            item['error']=str(exc); errors.append({'name':row['name'],'error':str(exc)})
        results.append(item)
    save(OUT/'inventory.json',results)
    stats={'chunks':len(rows),'parsed':len(rows)-len(errors),'errors':errors,
           'game_modules':len({r['module'] for r in results if r['module']}),
           'module_counts':dict(counts),'functions':sum(len(r.get('functions',[])) for r in results),
           'config_groups':len({r['name'][len(PREFIX):].split('.')[0] for r in results if r['name'].startswith(PREFIX)}),
           'messages':len(set(m for r in results for m in r.get('messages',[])))}
    save(OUT/'inventory-summary.json',stats)
    print(json.dumps({k:v for k,v in stats.items() if k!='module_counts'},ensure_ascii=False))

def export_configs():
    from lupa.lua51 import LuaRuntime
    from repack_lua51 import repack
    inventory_rows=json.loads((OUT/'inventory.json').read_text())
    by_name={r['name']:r for r in inventory_rows}
    skipped={'head','init','core','body','const','brach','branch','illegal_character','servers_diff_config'}
    candidates=[r for r in inventory_rows if r['name'].startswith(PREFIX) and r['name'].split('.')[-1] not in skipped]
    results=[]
    for i,row in enumerate(candidates):
        item={k:row[k] for k in ('name','source','sha256','bundle')}
        try:
            lua=LuaRuntime(encoding=None, register_eval=False, register_builtins=False, max_memory=96*1024*1024)
            lua.execute(b'debug.sethook(function() error("instruction limit") end, "", 2000000)')
            table_type=type(lua.table()); function_type=type(lua.eval(b'function() end'))
            g=lua.globals(); getmeta=lua.eval(b'getmetatable')
            for key in ('os','io','package','debug','require','dofile','loadfile','loadstring','python'):
                g[key.encode()]=None
            imports=[]; dependencies=[]; cache={}; stack=[]
            def load(name):
                if name in cache:return cache[name]
                if name not in by_name or not name.startswith(PREFIX):raise ValueError(f'Unresolved config import: {name}')
                src=by_name[name];stack.append(name)
                try:
                    table=lua.execute(repack((ROOT/'reverse/lua-bytecode'/src['source']).read_bytes()))
                    if name==PREFIX+'head':table[b'et']=lua.table()
                    cache[name]=table
                    dependencies.append({k:src[k] for k in ('name','source','sha256')})
                    return table
                finally:stack.pop()
            def imp(n):
                name=n.decode('utf8','replace');imports.append(name)
                dots=len(name)-len(name.lstrip('.'))
                full='.'.join(stack[-1].split('.')[:-dots])+'.'+name[dots:] if dots else name
                return load(full)
            g[b'import']=imp
            result=load(row['name'])
            function_values=0
            def convert(v, depth=0):
                nonlocal function_values
                if depth>70:raise ValueError('Recursive/deep table')
                if isinstance(v,bytes):return v.decode('utf8','replace')
                if isinstance(v,function_type):
                    function_values+=1;return {'$lua_function':True}
                if isinstance(v,table_type):
                    meta=getmeta(v);default=meta[b'__index'] if isinstance(meta,table_type) else None
                    inherited=convert(default,depth+1) if isinstance(default,table_type) else {}
                    inherited=inherited if isinstance(inherited,dict) else {str(i):x for i,x in enumerate(inherited,1)}
                    pairs=[(k,x) for k,x in v.items() if k not in (b'__index',b'__newindex',b'__metatable')]
                    keys={k for k,_ in pairs}
                    if not inherited and pairs and all(isinstance(k,(int,float)) and k==int(k) for k,_ in pairs) and keys==set(range(1,len(pairs)+1)):
                        return [convert(v[k],depth+1) for k in range(1,len(pairs)+1)]
                    inherited.update({str(convert(k,depth+1)):convert(x,depth+1) for k,x in pairs})
                    return inherited
                if v is None or isinstance(v,(bool,int,str)):return v
                if isinstance(v,float):return v if math.isfinite(v) else str(v)
                raise ValueError(f'Non-static value: {type(v).__name__}')
            data=convert(result)
            if not isinstance(data,(dict,list)):raise ValueError('No returned table')
            filename=row['name'][len(PREFIX):]+'.json'
            save(OUT/'configs'/filename,data)
            item.update(output=filename,rows=len(data),resolved_table_defaults=True,imports=imports,dependencies=dependencies,
                        function_values=function_values,complete=not function_values)
        except Exception as exc:
            item['error']=str(exc)
        results.append(item)
        if (i+1)%200==0:print(f'Processed {i+1}/{len(candidates)}',flush=True)
    save(OUT/'config-manifest.json',results)
    print(f'Config exports: {sum("output" in r for r in results)}/{len(results)}; complete: {sum(r.get("complete",False) for r in results)}')

def evidence():
    rows=json.loads((OUT/'inventory.json').read_text())
    selected=[r for r in rows if r['module'] and ('.manager.' in r['name'] or r['name'].startswith('game.module.fight.'))]
    out=ROOT/'reverse/review-disassembled';out.mkdir(exist_ok=True)
    result=[]
    for r in selected:
        try:
            f=out/(r['name']+'.txt')
            f.write_text(disassemble((ROOT/'reverse/lua-bytecode'/r['source']).read_bytes(),r['name']),encoding='utf8')
            result.append({'name':r['name'],'source':r['source'],'sha256':r['sha256'],'listing':f.relative_to(ROOT).as_posix()})
        except Exception as exc:result.append({'name':r['name'],'error':str(exc)})
    save(OUT/'evidence-manifest.json',result)
    print(f'Instruction evidence: {sum("listing" in r for r in result)}/{len(result)}')

if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('mode',choices=['inventory','configs','evidence']);args=ap.parse_args()
    {'inventory':inventory,'configs':export_configs,'evidence':evidence}[args.mode]()
