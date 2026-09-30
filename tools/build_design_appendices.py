"""Build human-readable design data tables from effective Lua config exports.

Each report keeps handwritten rules in design-details and generated tables below.
This never invents a missing field or combines server override variants.
"""
import collections
import json
import re
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
DATA=ROOT/'analysis/data'
MARKER='\n<!-- DESIGN_DETAIL_BEGIN -->'
def read(name): return json.loads((DATA/(name+'.json')).read_text(encoding='utf8'))
def rows(name):
    x=read(name)
    return list(x.values()) if isinstance(x,dict) else x
def ordered(name,field='id'): return sorted(rows(name),key=lambda x:x.get(field,0))
ITEM=read('item_item');LANG=read('language_define_item')
def loc(value,domain='item'):
    if not isinstance(value,str):return value
    d=LANG if domain=='item' else read('language_define_'+domain)
    row=d.get(value)
    return row.get('1',value) if isinstance(row,dict) else row or value
def item(cid):
    row=ITEM.get(str(cid),{})
    name=loc(row.get('name','未收录'))
    return f'{name}（{cid}）'
def costs(pairs):
    if not pairs:return '无配置消耗'
    if isinstance(pairs,dict):return fmt(pairs)
    if isinstance(pairs[0],(int,float)):pairs=[pairs]
    return '；'.join(f'{item(x[0])}×{x[1]:,}' for x in pairs)
def attrs(value):
    if not value:return '—'
    if isinstance(value,dict):value=list(value.items())
    names={1:'攻击',2:'防御',3:'速度',11:'生命',12:'伤害',13:'减伤',14:'体力',61:'体质',62:'力量',64:'耐力',65:'敏捷',101:'暴击',103:'暴伤'}
    return '；'.join(f'{names.get(int(x[0]),str(x[0]))} {x[1]}' for x in value)
def fmt(x):
    if x is None:return '未配置'
    if isinstance(x,(dict,list)):return json.dumps(x,ensure_ascii=False,separators=(',',':'))
    if isinstance(x,bool):return str(x).lower()
    return str(x)
def table(head,body):
    def cell(v):return fmt(v).replace('|','&#124;').replace('\n',' / ')
    return '\n| '+' | '.join(head)+' |\n| '+' | '.join(['---']*len(head))+' |\n'+''.join('| '+' | '.join(cell(x) for x in r)+' |\n' for r in body)+'\n'
def fold(title,text): return '\n<details markdown="1">\n<summary>'+title+'</summary>\n\n'+text+'\n</details>\n'
def source(n):return f'[有效配置原表](../analysis/data/{n}.json)'
def cap(title,n,body):return '\n### '+title+'\n\n'+source(n)+'。已展开元表默认值；“未配置”仅表示有效行仍无该字段。\n'+body

def gameplay():
    fields=['play_type','desc','partner_num','use_skill','auto_battle','guaranteed_fire','can_adjust_play_speed','time_limit','show_mvp']
    return cap('全部 70 个玩法的操作规则矩阵','gameplay_gameplay',table(['玩法','名称','伙伴数','技能','自动','保底发炮','调速','总时限原值','MVP'],[[r.get(k) for k in fields] for r in ordered('gameplay_gameplay','play_type')]))
def newbie():
    presets={r['id']:r for r in rows('preset_rank_battle_preset_rank_battle')}
    out=''
    for suffix in ['0','543']:
        n='season_newbie_season_newbie_'+suffix
        body=[]
        for r in ordered(n):
            p=presets.get(r.get('preset_id'),{})
            body.append([r['id'],f"{r.get('min')}–{r.get('max')}",f"{r.get('min_lv')}–{r.get('max_lv')}",r.get('preset_id'),r.get('sling_shot_preset_id'),p.get('gameplay_list'),p.get('exp'),costs(p.get('reward',[])),r.get('start_condition',[])])
        out+=cap('新手场次与预设奖励：分片 '+suffix,n,table(['行','已配置场次范围','角色等级','预设','弹弓预设','玩法/战斗组/权重','经验字段','普通预设奖励','事件条件'],body))
    return out+'\n`gameplay_list` 第二项是战斗组引用；本表没有把它冒充 `battle.id`。弹弓预设奖励应再按其独立 preset ID 读取。关联表：'+source('preset_rank_battle_preset_rank_battle')+'。\n'
def skill_curves():
    groups=collections.defaultdict(list)
    for r in rows('skill_base_upgrade_skill_base_upgrade_0'):groups[r['skill_id']].append(r)
    out=cap('全部技能培养索引','skill_base_upgrade_skill_base_upgrade_0',table(['基础技能','配置等级段','解锁角色级','解锁消耗','解锁附加条件'],[[sid,f"{min(r['lvl'] for r in rr)}–{max(r['lvl'] for r in rr)}",min(rr,key=lambda x:x['lvl']).get('require_lvl'),costs(min(rr,key=lambda x:x['lvl']).get('cost')), {k:min(rr,key=lambda x:x['lvl']).get(k) for k in ['open_day','open_func_id','require_skill_task','require_skill_lvl']}] for sid,rr in sorted(groups.items())]))
    rr=sorted(groups[1001],key=lambda r:r['lvl']);spent=collections.Counter();body=[]
    for r in rr:
        lv=r['lvl'];step=f'{lv}→{lv+1}' if any(x['lvl']==lv+1 for x in rr) else f'{lv}（上限，无下一行）'
        body.append([step,r['require_lvl'],r.get('open_day'),costs(r.get('cost')),attrs(r.get('attrs')),costs(list(spent.items())) if spent else '起点'])
        for cid,num in r.get('cost',[]):spent[cid]+=num
    out+=cap('技能 1001 的全部升级步骤与到达当前级累计支出','skill_base_upgrade_skill_base_upgrade_0',table(['当前→下一等级','角色级门槛','开服日','本次消耗（当前行）','当前行属性','到达当前级累计消耗'],body))
    allskills=rows('skill_skill')
    out+='\n### 所有培养技能的完整逐级规则\n\n以下每组保留该技能的全部配置行，不将1001的成本曲线套用到其他技能。消耗仍取当前行，最后一行无后续等级时不能继续升级。\n'
    for sid,rr in sorted(groups.items()):
        candidates=[r for r in allskills if r.get('prototype_id')==sid]
        name=loc(candidates[0].get('name'),'skill') if candidates else '基础技能'
        body=[[r['lvl'],r.get('require_lvl'),r.get('open_day'),r.get('open_func_id'),r.get('require_skill_lvl'),r.get('require_skill_task'),costs(r.get('cost')),attrs(r.get('attrs'))] for r in sorted(rr,key=lambda r:r['lvl'])]
        out+=fold(f'{sid} · {name} · {len(rr)}行完整培养规则',table(['当前级','角色级','开服日','功能ID','技能数量/等级前置','任务前置','当前行消耗','属性'],body))
    base={r['id']:r for r in rows('skill_base_upgrade_skill_base_upgrade_0')}
    differences=[]
    keys=['require_lvl','open_day','open_func_id','require_skill_lvl','require_skill_task','cost','attrs']
    for r in ordered('skill_base_upgrade_skill_base_upgrade_543'):
        old=base.get(r['id'],{})
        for k in keys:
            if old.get(k)!=r.get(k):differences.append([r['skill_id'],r['lvl'],k,old.get(k),r.get(k)])
    out+=cap('543分片相对默认分片的培养差异','skill_base_upgrade_skill_base_upgrade_543',fold(f'展开 {len(differences)} 个有效字段差异',table(['技能','当前级','字段','默认分片','543'],differences)))
    return out
def skill_samples():
    allr=read('skill_skill');body=[]
    for proto in range(1001,1019):
        candidates=[r for r in allr.values() if r.get('prototype_id')==proto and r.get('lvl') in [9,19,29,39,49,59] and r.get('id',0)//1000==proto]
        for r in sorted(candidates,key=lambda x:x['id']):
            body.append([r['id'],loc(r.get('name'),'skill'),r.get('lvl'),r.get('cost'),r.get('init_cd'),r.get('turn_cd'),r.get('turn_max'),r.get('match_max'),r.get('pve_match_max'),r.get('cancel_normal_atk'),loc(r.get('desc'),'skill')])
    return cap('玩家通用原型的关键等级档（按确切技能 ID）','skill_skill',table(['技能 ID','名称','等级','费用类/值','初始 CD','行动回合 CD','回合次数','单局次数','PVE 次数','替代普攻','配置关联说明'],body))
def resources():
    ids=[1001010001,1001010003,1001010004,1001010007,1010010001,1402010001,1402020003,1405020001,1405010001,1205010001,1201010001,1019010001,1618010001,1603010001]
    return cap('资源名称对照','item_item',table(['ID','名称','物品类','背包类'],[[i,loc(ITEM.get(str(i),{}).get('name')),ITEM.get(str(i),{}).get('item_type'),ITEM.get(str(i),{}).get('bag_type')] for i in ids]))
def open_funcs():
    rr=ordered('open_func_open_func');body=[[r['id'],r.get('desc'),r.get('is_open'),r.get('isShow'),r.get('open_days'),r.get('unlock_and'),r.get('unlock_or'),r.get('noOpenTips')] for r in rr]
    return cap('707 条功能开放定义','open_func_open_func',fold('展开完整开放清单：ID、名称、开服日、条件与提示',table(['ID','功能','配置开关','显示','开服日','AND 条件','OR 条件','锁定提示'],body)))
def level_numbers():
    out=cap('角色 1–133 级完整曲线','exp_player',fold('展开等级、经验、点数、生命与防御表',table(['等级','exp 字段','每日经验字段','属性点','额外点字段','生命','防御','单项上限'],[[r['level'],r.get('exp'),r.get('day_max_exp'),r['attr_points'],r.get('extra_attr_points'),r['base_attrs'].get('11'),r['base_attrs'].get('2'),r.get('attr_limit')] for r in ordered('exp_player','level')])))
    out+=cap('宠物 1–100 级完整曲线','pet_level_pet_level',fold('展开宠物等级、经验、属性与培养上限',table(['等级','exp 字段','生命','攻击','防御','体力','培养上限'],[[r['id'],r['exp'],r['attrs'].get('11'),r['attrs'].get('1'),r['attrs'].get('2'),r['attrs'].get('14'),r.get('attr_limit')] for r in ordered('pet_level_pet_level')])))
    out+=cap('六个武器阶级的完整门槛','weapon_class_weapon_class',table(['阶级','品质','角色级','开服日','评分','强化上限','属性进度修正'],[[r['class'],r['quality'],r['lv'],r['open_server_limit'],r['score'],r['strengthen_max'],r['equip_attr_progress_adjust']] for r in ordered('weapon_class_weapon_class','class')]))
    out+=cap('30 个武器强化门槛','weapon_strength_weapon_strength',table(['强化等级','其他部位门槛','功能 ID'],[[r['id'],r.get('other_part_strengthen_limit'),r.get('open_func')] for r in ordered('weapon_strength_weapon_strength')]))
    out+=cap('宝石全部品质升级行','gem_level_gem_level',fold('展开 130 行宝石升级成本',table(['品质','等级','角色级','消耗','词条数','被动参数'],[[r['quality'],r['lv'],r.get('role_lv'),costs(r.get('cost')),r.get('attr_num'),r.get('passive_per')] for r in sorted(rows('gem_level_gem_level'),key=lambda r:(r['quality'],r['lv']))])))
    return out
def pet_catalogue():
    return cap('47 个宠物配置的继承、技能槽与洗练数据','pet_pet',fold('展开宠物养成与战斗继承矩阵',table(['ID','名称','星字段','种族/攻击类型','普通属性继承','PVP 属性继承','学习槽等级','解锁成本','洗练材料'],[[r['id'],r['name'],r['star'],[r.get('race'),r.get('attack_type')],r.get('attr_base_inherit'),r.get('attr_base_Inherit_pvp'),r.get('slot_learn_skill_level_limit'),r.get('unlock_slot_cost_list'),costs(r.get('roll_item_list'))] for r in ordered('pet_pet')])))
def ranks():
    return cap('53 个杯分节点：真人、人机、保护与继承','season_cup_season_cup',fold('展开完整杯分与赛季继承清单',table(['节点','段位','星','真人胜','真人负','人机胜','人机负','失败加杯字段','日保护','继承节点','首达奖励'],[[r['id'],r.get('rank_id'),r.get('star'),r.get('win_cup'),r.get('lose_cup'),r.get('robot_win_cup'),r.get('robot_lose_cup'),r.get('lose_add_cup'),r.get('lose_protect_daily'),r.get('inherit_id'),costs(r.get('first_reward'))] for r in ordered('season_cup_season_cup')])))+cap('16 个 ELO 档位的 K 与赛季重置','season_pvp_elo_pvp_elo',table(['分值档','elo_K','重置值'],[[r['score'],r.get('elo_K'),r.get('season_reset')] for r in ordered('season_pvp_elo_pvp_elo','score')]))
def robot_tables():
    out=cap('全部 23 个 AI 模板：保留权重与扰动原值','ai_ai',table(['ID','目标策略','技能','位移 plane','规避','隐身参数','可见目标力度表','不可见目标力度表'],[[r['id'],r.get('target'),r.get('skill'),r.get('plane'),r.get('evasion'),r.get('invisability'),r.get('visible_power'),r.get('invisible_power')] for r in ordered('ai_ai')]))
    robots={r['id']:r for r in rows('robot_robot')}
    out+=cap('全部 18 个自由对战陪练配置','free_battle_robot_free_battle_robot',table(['配置','类型','职业','AI 模板','机器人实例','实例名称','武器池'],[[r['id'],r['type'],r['job_type'],r['ai_type'],r['robot_id'],robots.get(r['robot_id'],{}).get('name'),robots.get(r['robot_id'],{}).get('weapon')] for r in ordered('free_battle_robot_free_battle_robot')]))
    out+=cap('全部 91 个机器人构筑方案','robot_plan_robot_plan',fold('展开方案、宠物、主动技能、被动与武器池',table(['机器人/方案','等级','宠物级','宠物候选','主动技能','被动技能','武器候选','装备技能','加点'],[[r['robot_id'],r.get('lv'),r.get('pet_lv'),r.get('fixed_pet_id'),r.get('select_place_skill_id'),r.get('select_passive_skill_id'),r.get('fixed_weap_id'),r.get('fixed_equ_skill'),r.get('fix_add_point')] for r in ordered('robot_plan_robot_plan','robot_id')])))
    return out
def economy_tables():
    out=cap('任务基础表与分片的覆盖规模','tasks_tasks',table(['task_tp','基础配置条数'],sorted(collections.Counter(r.get('task_tp') for r in rows('tasks_tasks')).items())))
    merged={r['id']:r for r in rows('tasks_tasks')};merged.update({r['id']:r for r in rows('tasks_tasks_0')})
    rr=[r for r in merged.values() if r.get('task_tp')==3]
    out+=cap('默认分片合并后的日常任务明细','tasks_tasks_0',fold(f'展开 {len(rr)} 条日常候选定义：实际任务列表由回包给出',table(['ID','名称','目标量','活跃','角色门槛字段','功能 ID','奖励','跳转'],[[r['id'],loc(r.get('name'),'tasks'),r.get('target_num'),r.get('liveness'),r.get('open_cond'),r.get('open_func'),costs(r.get('task_award')),r.get('jump_id')] for r in sorted(rr,key=lambda r:r['id'])])))
    out+=cap('五档活跃宝箱的两组奖励','task_liveness_task_liveness',table(['档','活跃门槛','分支1奖励','分支2奖励'],[[r['id'],r['liveness'],costs(r['reward'][0][1]),costs(r['reward'][1][1])] for r in ordered('task_liveness_task_liveness')]))
    out+=cap('六个基础抽取入口','gacha_gacha',table(['ID','名称','类型','开放条件','单次消耗','单次/十次动作','保底规则引用','主池','分支池'],[[r['id'],r['name'],r.get('type'),r.get('open_cond'),costs(r.get('cost_item_list')),r.get('act_type'),r.get('ultra_reward_rule'),r.get('pool_list'),r.get('pool_list_branch')] for r in ordered('gacha_gacha')]))
    out+=cap('十条保底规则','gacha_guarantee_gacha_guarantee',table(['规则','类型','周期','品质','价值字段','解锁','描述'],[[r['id'],r.get('type'),r.get('loop_num'),r.get('quality'),r.get('value'),r.get('unlock'),r.get('desc')] for r in ordered('gacha_guarantee_gacha_guarantee')]))
    goods=rows('shop_shop');grouped=collections.defaultdict(list)
    for r in goods:grouped[r['type']].append(r)
    body=[]
    for tp,rr in sorted(grouped.items()):
        currencies=sorted({x[0] for r in rr for x in r.get('price',[])})
        body.append([tp,len(rr),'；'.join(item(i) for i in currencies),sorted({r.get('subtype',0) for r in rr})])
    out+=cap('2529条基础商品按类型与计价货币统计','shop_shop',fold('展开商品类型数量与货币映射（不表示当前在售）',table(['商品type','定义条数','价格货币','子类型'],body)))
    out+=cap('普通分片通行证全部 50 级基础奖励','battlepass_reward_item_0',fold('展开免费轨和付费轨奖励（季节专属追加另算）',table(['等级','免费奖励','付费基础奖励','特殊级标志'],[[r['lv'],costs(r.get('free_reward')),costs(r.get('pay_reward')),r.get('sp_lv')] for r in ordered('battlepass_reward_item_0','lv')])))
    free=collections.Counter();paid=collections.Counter()
    for r in rows('battlepass_reward_item_0'):
        for key,counter in [('free_reward',free),('pay_reward',paid)]:
            for cid,num in r.get(key,[]):counter[cid]+=num
    out+=cap('奖励组1001基础50级资源预算','battlepass_reward_item_0',table(['物品','免费轨总量','付费基础轨总量','两轨基础合计'],[[item(i),free[i],paid[i],free[i]+paid[i]] for i in sorted(set(free)|set(paid))]))
    out+='\n预算前提为该奖励组50级全部领取；付费列仅统计付费基础轨，实际还需购买资格与季节专属追加，不包含商品退款/其他活动。\n'
    for suffix in ['0','543']:
        merged={r['id']:r for r in rows('seven_sign_seven_sign')};merged.update({r['id']:r for r in rows('seven_sign_seven_sign_'+suffix)})
        rr=sorted(merged.values(),key=lambda r:(r['sign_type'],r['day']))
        out+=cap('签到基础＋分片 '+suffix+'：按签到类型与天数','seven_sign_seven_sign_'+suffix,table(['记录','签到类型','天数','功能ID','奖励'],[[r['id'],r['sign_type'],r['day'],r.get('open_func'),costs(r['reward'])] for r in rr]))
    return out

def main():
    generated={'systems':resources()+open_funcs(),'growth':pet_catalogue()+ranks(),
               'matching':newbie(),'battle':gameplay(),'combat-math':'',
               'skills':skill_curves()+skill_samples(),'robots':robot_tables()+newbie(),
               'growth-numbers':level_numbers(),'economy':economy_tables(),'design-spec':''}
    for slug,extra in generated.items():
        path=ROOT/'analysis'/f'{slug}.md';base=path.read_text(encoding='utf8').split(MARKER)[0]
        detail=(ROOT/'analysis/design-details'/f'{slug}.md').read_text(encoding='utf8')
        content=base.rstrip()+MARKER+'\n\n'+detail.rstrip()
        if extra:
            content+='\n\n## 可查的配置明细\n'+extra
        path.write_text(content.rstrip()+'\n',encoding='utf8')
    print('Updated 10 reports with code rules and generated design data.')

if __name__=='__main__':main()
