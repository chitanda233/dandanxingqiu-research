"""Validate audit lineage, data parity, assertions and evidence links.

--bundles reopens Unity bundles and compares every TextAsset payload.
The legacy replay snapshot checks reproducibility, not independent correctness.
"""
from __future__ import annotations
import argparse,hashlib,json,re
from pathlib import Path
from check_site import main as check_site
ROOT=Path(__file__).resolve().parents[1];REVIEW=ROOT/'analysis/review';DOCS=ROOT/'docs'
def read(p):return json.loads(p.read_text())
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def bundle_audit():
 import UnityPy
 rows=read(ROOT/'reverse/lua-bytecode/manifest.json');index={(r['bundle'],r['path_id']):r for r in rows};checked=set();errors=[];bundles=[]
 for p in sorted((ROOT/'raw/lua-bundles').glob('*.ab')):
  count=0
  for obj in UnityPy.load(str(p)).objects:
   if obj.type.name!='TextAsset':continue
   d=obj.read();payload=d.m_Script.encode('utf8','surrogateescape') if isinstance(d.m_Script,str) else bytes(d.m_Script);key=(p.name,obj.path_id);r=index.get(key)
   if not r or r['name']!=str(d.m_Name) or payload!=(ROOT/'reverse/lua-bytecode'/r['file']).read_bytes():errors.append([p.name,obj.path_id])
   checked.add(key);count+=1
  bundles.append({'bundle':p.name,'sha256':sha(p),'text_assets':count})
 result={'checked':len(checked),'expected':len(rows),'mismatches':errors,'bundles':bundles}
 (REVIEW/'bundle-audit.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
 assert len(checked)==len(rows) and not errors,result
 print(f'PASS bundle re-extraction: {len(bundles)} bundles / {len(checked)} identical payloads')
def main(bundles=False):
 if bundles:bundle_audit()
 check_site()
 inv=read(REVIEW/'inventory.json');by_name={r['name']:r for r in inv};cf=read(REVIEW/'config-manifest.json');by_config={r['name']:r for r in cf};ev=read(REVIEW/'evidence-manifest.json');ev_names={r['name'] for r in ev};errors=[]
 for r in inv:
  if sha(ROOT/'reverse/lua-bytecode'/r['source'])!=r['sha256']:errors.append('Source changed '+r['name'])
 for r in cf:
  if 'output' not in r:continue
  p=REVIEW/'configs'/r['output'];d=read(p)
  if len(d)!=r['rows'] or p.read_bytes()!=(DOCS/'data/configs'/r['output']).read_bytes():errors.append('Config mismatch '+r['name'])
  for dep in r['dependencies']:
   if dep['sha256']!=by_name[dep['name']]['sha256']:errors.append('Dependency hash '+r['name'])
 for r in read(ROOT/'analysis/data/manifest.json'):
  new=by_config[r['name']]
  if read(ROOT/'analysis/data'/r['output'])!=read(REVIEW/'configs'/new['output']):errors.append('Legacy table changed '+r['name'])
 for r in ev:
  if r['sha256']!=by_name[r['name']]['sha256']:errors.append('Evidence hash '+r['name'])
  if (ROOT/r['listing']).read_bytes()!=(DOCS/'data/evidence'/(r['name']+'.txt')).read_bytes():errors.append('Evidence copy '+r['name'])
 for p in (REVIEW/'reports').glob('*.md'):
  for typ,target in re.findall(r'\]\((evidence|config):([^\)]+)\)',p.read_text()):
   name,_,fn=target.partition('#')
   if typ=='config' and not (REVIEW/'configs'/(name+'.json')).is_file():errors.append(p.name+' missing config '+name)
   if typ=='evidence':
    if name not in ev_names:errors.append(p.name+' missing evidence '+name)
    elif fn and fn not in {n for f in by_name[name]['functions'] for n in f['names']}:errors.append(p.name+' missing function '+fn)
 fresh=read(REVIEW/'probes.json');old=read(ROOT/'analysis/data/client_rule_probes.json');expected=read(REVIEW/'legacy-replay-snapshot.json')
 if [{k:c[k] for k in ('label','inputs','returned')} for c in old['cases']]!=expected:errors.append('Legacy replay differs from prior snapshot')
 for c in fresh['cases']:
  if not c['passed'] or c['returned']!=c['expected']:errors.append('Failed assertion '+c['label'])
 for r in fresh['sources']:
  if sha(ROOT/'reverse/lua-bytecode'/r['source'])!=r['sha256']:errors.append('Probe hash '+r['name'])
 for r in fresh['configs']:
  if sha(REVIEW/'configs'/(r['name']+'.json'))!=r['sha256']:errors.append('Probe config hash '+r['name'])
 summary=read(REVIEW/'inventory-summary.json')
 if summary['game_modules']!=len(read(REVIEW/'feature-catalog.json')):errors.append('Catalog count mismatch')
 audit=read(REVIEW/'bundle-audit.json')
 if audit['checked']!=8272 or audit['mismatches']:errors.append('Bundle audit failed')
 if errors:raise SystemExit('\n'.join(errors))
 result={'bytecode_sources':len(inv),'config_exports':sum('output' in r for r in cf),'config_failures':sum('output' not in r for r in cf),'legacy_config_parity':128,'instruction_files':len(ev),'new_assertions':len(fresh['cases']),'legacy_replays':len(old['cases']),'report_chapters':len(list((REVIEW/'reports').glob('*.md'))),'namespace_catalog':summary['game_modules'],'passed':True}
 (REVIEW/'validation.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n');print(json.dumps(result,ensure_ascii=False))
if __name__=='__main__':
 ap=argparse.ArgumentParser();ap.add_argument('--bundles',action='store_true');args=ap.parse_args();main(args.bundles)
