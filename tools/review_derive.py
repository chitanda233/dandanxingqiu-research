"""Derived planning tables with explicit input tables and aggregation rules."""
from __future__ import annotations
import collections,hashlib,json
from pathlib import Path
from lupa.lua51 import LuaRuntime
from repack_lua51 import repack
from extract_config_tables import convert
ROOT=Path(__file__).resolve().parents[1];OUT=ROOT/'analysis/review'
def read(name):return json.loads((OUT/'configs'/(name+'.json')).read_text())
def records(data):return list(data.values()) if isinstance(data,dict) else data
def save(name,data): (OUT/(name+'.json')).write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n',encoding='utf8')
def main():
    translations={}
    for p in (OUT/'configs').glob('language_define.*.json'):
        d=json.loads(p.read_text())
        if isinstance(d,dict):
            for k,v in d.items():
                if isinstance(v,dict) and isinstance(v.get('1'),str):translations[k]=v['1']
    save('translations',translations)
    def translate(n):return translations.get(n,n)
    items={str(r['id']):translate(r.get('name',str(r['id']))) for r in records(read('item.item'))}
    for shard in ('0','543'):
        items.update({str(r['id']):translate(r.get('name',str(r['id']))) for r in records(read('item.item_'+shard))})
    save('item-names',items)
    def costs(pairs):
        return [{'id':int(k),'name':items.get(str(int(k)),str(int(k))),'count':v} for k,v in sorted(pairs.items())]
    upgrades=records(read('skill_base_upgrade.skill_base_upgrade_0'));by_skill=collections.defaultdict(dict)
    for r in upgrades:by_skill[r['skill_id']][r['lvl']]=r
    budgets=[]
    for sid,levels in sorted(by_skill.items()):
        cumulative=collections.Counter()
        for lv,row in sorted(levels.items()):
            if lv in (0,1,10,20,30,40,50,60,70,80,100):
                budgets.append({'skill_id':sid,'current_level':lv,'spent_to_reach_current':costs(cumulative),
                    'next_step_cost':row.get('cost',{}),'next_step_exists':lv+1 in levels,
                    'require_player_level':row.get('require_lvl',0),'open_day':row.get('open_day',0)})
            for cid,count in row.get('cost',[]):cumulative[cid]+=count
    save('skill-budgets',{'source':'skill_base_upgrade.skill_base_upgrade_0','rule':'cost is CURRENT level row; cumulative sums rows 0 through L-1. No server discounts or additional rewards.', 'rows':budgets})
    stages=read('pinball_stage.pinball_stage');index=json.loads((ROOT/'reverse/lua-bytecode/manifest.json').read_text());layouts=[];stage_rows=[]
    for r in sorted((r for r in index if r['name'].startswith('game.module.pin_ball_game.stage_config.pinball-stage-')),key=lambda r:r['name']):
        sid=int(r['name'].rsplit('-',1)[1]);raw=(ROOT/'reverse/lua-bytecode'/r['file']).read_bytes()
        lua=LuaRuntime(encoding=None,register_eval=False,register_builtins=False,max_memory=32*1024*1024)
        lua.execute(b'debug.sethook(function() error("instruction limit") end,"",1000000);os=nil;io=nil;package=nil;debug=nil;require=nil;python=nil')
        data=convert(lua.execute(repack(raw)),type(lua.table()),lua.eval(b'getmetatable'))
        layout=data.get('layout',data);waves=layout.get('waves',[]);units=list(layout.get('initial_units',[]));props=list(layout.get('initial_props',[]))
        wave_summaries=[]
        for i,w in enumerate(waves,1):
            us=w.get('units',[]);ps=w.get('props',[]);units.extend(us);props.extend(ps)
            wave_summaries.append({'wave':i,'units':len(us),'props':len(ps),'hp_sum':sum(u.get('hp',0) for u in us)})
        row={'stage_id':sid,'name':stages.get(str(sid),{}).get('stage_name',str(sid)),
             'target_score':stages.get(str(sid),{}).get('target_score'),
             'reward':stages.get(str(sid),{}).get('reward',[]),'pre_dup':stages.get(str(sid),{}).get('pre_dup'),
             'configured_ball_count':stages.get(str(sid),{}).get('init_ball_count'),
             'layout_init_balls':data.get('init_balls',[]),'layout_ball_count':sum(b.get('count',0) for b in data.get('init_balls',[])),
             'canvas':data.get('canvas',{}),'initial_units':len(layout.get('initial_units',[])),
             'waves':len(waves),'unit_count':len(units),'props':len(props),'hp_sum':sum(u.get('hp',0) for u in units),
             'prop_counts':dict(collections.Counter(str(p.get('prop_id')) for p in props)),
             'wave_summaries':wave_summaries,'source':r['file'],'source_name':r['name'],'sha256':hashlib.sha256(raw).hexdigest()}
        stage_rows.append(row);layouts.append({'stage_id':sid,'layout':data,'source':r['file'],'sha256':row['sha256']})
    save('pinball-stages',{'scope':'50 ORIGINAL layout chunks plus stage config. HP sum counts all initial and later units; no inferred achievable score.', 'rows':stage_rows})
    save('pinball-layouts',layouts)
    # The 70 cached modes are definitions, not 70 verified live modes.
    modes=[]
    for r in sorted(records(read('gameplay.gameplay')),key=lambda r:r['play_type']):
        modes.append({k:r.get(k) for k in ('play_type','name','desc','single_player','use_skill','auto_battle','can_adjust_play_speed','guaranteed_fire','time_limit','intelligent_force','soul','fight_plan','cross_type','watcher_delay','show_mvp')})
    save('mode-matrix',modes)
    configs=json.loads((OUT/'config-manifest.json').read_text())
    stats={'exports':sum('output' in r for r in configs),'pure_tables':sum(r.get('complete',False) for r in configs),
           'nonempty_pure_tables':sum(r.get('complete',False) and r.get('rows',0)>0 for r in configs),
           'exported_rows_including_shards':sum(r.get('rows',0) for r in configs),
           'localization_keys':len(translations),'items_with_name':len(items),
           'gameplay_modes':len(modes),'pinball_layouts':len(stage_rows),
           'pinball_target_range':[min(r['target_score'] for r in stage_rows),max(r['target_score'] for r in stage_rows)],
           'active_skill_rows':len(read('skill.skill')),'passive_skill_rows':len(read('passive_skill.passive_skill')),
           'active_skill_prototypes':len({r['prototype_id'] for r in records(read('skill.skill'))}),
           'weapon_rows':len(read('weapon.weapon')),'weapon_groups':len({r['group'] for r in records(read('weapon.weapon'))}),
           'pet_rows':len(read('pet.pet')),'pet_types':len({r['type'] for r in records(read('pet.pet'))})}
    save('derived-summary',stats);print(json.dumps(stats,ensure_ascii=False))
    print('1001 budgets:',json.dumps([r for r in budgets if r['skill_id']==1001],ensure_ascii=False))
    print('Pinball first/last:',json.dumps([stage_rows[0],stage_rows[-1]],ensure_ascii=False))
if __name__=='__main__':main()
