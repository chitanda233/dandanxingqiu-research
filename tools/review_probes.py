"""Focused review probes. Execute original bytecode; assert observed boundaries.

Engine, account, clock and UI collaborators are explicit stubs. Unconfigured
function calls raise an error; this is not an online playtest or server emulator.
"""
from __future__ import annotations
import hashlib,json
from pathlib import Path
from lupa.lua51 import LuaRuntime
from repack_lua51 import repack
ROOT=Path(__file__).resolve().parents[1]

def main():
    index={r['name']:r for r in json.loads((ROOT/'reverse/lua-bytecode/manifest.json').read_text())}
    lua=LuaRuntime(encoding=None,register_eval=False,register_builtins=False,unpack_returned_tuples=True,max_memory=96*1024*1024)
    lua.execute(b'''
    function tree()
      return setmetatable({}, {__index=function(t,k) local v=tree();rawset(t,k,v);return v end,
        __call=function() error("Unconfigured external function called") end})
    end
    Game=tree();DataConfigs=tree();GlobalConst=tree();GameFunctions=tree();GameEnv={is_editor=false}
    BroadcastTips=tree();Time={time=0,unscaledTime=0};Vector3=tree();Color=tree();GameLogger=tree();FNSDKTool=tree()
    GlobalConst.item_quality={white=0,green=1,blue=2,purple=3,orange=4,red=5}
    Game.events.brocast=function() end;Game.sound_manager.play_effect=function() end
    imports={}; function require(n)
      if n=="game.utils.events" then return Game.events end
      if n=="game.other.server_time" then return Game.server_time end
      local mod=string.match(n,"^game%.module%.([^%.]+)%.manager%.")
      if mod then return Game.module[mod] end
      if not imports[n] then imports[n]=tree() end;return imports[n]
    end
    function import(n) return CURRENT_MODULE end
    table.clear=function(t) for k in pairs(t) do t[k]=nil end end
    table.find=function(t,v) for i,x in ipairs(t) do if x==v then return i end end end
    table.shallow_clear=table.clear
    function clone(t) if type(t)~="table" then return t end local r={} for k,v in pairs(t) do r[k]=clone(v) end return r end
    os=nil;io=nil;package=nil;dofile=nil;loadfile=nil;debug=nil;python=nil
    ''')
    tt=type(lua.table()); sources=[];configs=[];cases=[]
    def load(name,target=None):
        row=index[name];data=(ROOT/'reverse/lua-bytecode'/row['file']).read_bytes()
        lua.globals()[b'CURRENT_MODULE']=target if target is not None else lua.globals()[b'tree']()
        sources.append({'name':name,'source':row['file'],'sha256':hashlib.sha256(data).hexdigest()})
        return lua.execute(repack(data))
    def to_lua(value):
        if isinstance(value,dict):
            t=lua.table()
            for k,v in value.items():t[int(k) if k.lstrip('-').isdigit() else k.encode()]=to_lua(v)
            return t
        if isinstance(value,list):return lua.table_from([to_lua(v) for v in value])
        if isinstance(value,str):return value.encode()
        return value
    def config(name,key=None):
        path=ROOT/'analysis/review/configs'/(name+'.json');table=to_lua(json.loads(path.read_text()))
        configs.append({'name':name,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()})
        lua.globals()[b'CFTABLE']=table
        lua.execute(b'CFTABLE.get_config=function(id) return CFTABLE[id] end;CFTABLE.get_cfg_by_id=CFTABLE.get_config')
        # Capture a per-table upvalue instead of the mutable CFTABLE global.
        lua.execute(b'local t=CFTABLE;t.get_config=function(id) return t[id] end;t.get_cfg_by_id=t.get_config;t.get_all_config=function() return t end')
        lua.globals()[b'DataConfigs'][(key or name.split('.')[0]).encode()]=table
        return table
    def plain(v):
        if isinstance(v,bytes):return v.decode('utf8','replace')
        if isinstance(v,tt):return {str(plain(k)):plain(x) for k,x in v.items()}
        return v
    def case(topic,label,code,inputs,expected):
        out=lua.execute(code.encode());out=out if isinstance(out,tuple) else (out,)
        result=[plain(v) for v in out]
        if result!=expected:raise AssertionError(f'{label}: {result} != {expected}')
        cases.append({'topic':topic,'label':label,'inputs':inputs,'code':code,'returned':result,'expected':expected,'passed':True})

    load('kernel.utils.math')
    fight=lua.globals()[b'Game'][b'module'][b'fight'];load('game.module.fight.manager.base.fighting.unit.attrs')
    lua.globals()[b'BASE']=fight[b'ways'][b'base']
    lua.execute(b'''CTX=setmetatable({}, {__index=BASE})
      CTX.is_ctrl_unit=function() return false end
      CTX.try_to_perform_unit_hp_update=function() end
      CTX.perform_unit_energy_update=function() end
      CTX.update_unit_hp=function(s,u,v) u.attrs.hp=v end
    ''')
    for label,fn,hp,val,maxhp,exp in [('治疗超上限','add_unit_hp',90,30,100,100),('治疗负量','add_unit_hp',10,-30,100,-20),('伤害超当前','dec_unit_hp',10,30,100,0),('负伤害','dec_unit_hp',90,-30,100,120),('直接生命过上限','update_unit_hp',10,120,100,120),('直接负生命','update_unit_hp',10,-20,100,-20)]:
        target='BASE.update_unit_hp' if fn=='update_unit_hp' else 'BASE.'+fn
        case('combat',label,f'local u={{attrs={{hp={hp},max_hp={maxhp}}}}};{target}(CTX,u,{val});return u.attrs.hp',{'function':fn,'hp':hp,'value':val,'max_hp':maxhp},[exp])
    for fn,attr,maxkey in [('update_unit_strength','strength','max_strength'),('update_unit_energy','energy','max_energy')]:
        for val in (-10,50,120):
            case('combat',f'{attr}边界{val}',f'local u={{attrs={{{attr}=0,{maxkey}=100}}}};BASE.{fn}(CTX,u,{val});return u.attrs.{attr}',{'value':val,'maximum':100},[max(0,min(val,100))])
    load('game.module.fight.manager.base.fighting.trajectory')
    lua.execute(b'''TCTX=setmetatable({land_data={}}, {__index=BASE})
    TCTX.is_physics_env=function() return false end
    TCTX.land_data.land_to_world_pos=function(s,x,y,p) p.x=x;p.y=y end
    function projectile() return {pos={x=0,y=0},from_pos={x=0,y=0},world_pos={x=0,y=0},last_pos={x=0,y=0},last_world_pos={x=0,y=0},
      v0_x=10,v0_y=20,v_x=10,v_y=20,a_x=2,a_y=-10,mass=2,resistance=1,g_resistance=-20,fly_time=0} end
    ''')
    case('combat','标准抛物线1秒','local p=projectile();BASE.move_target_along_normal_parabola(TCTX,p,1);return p.pos.x,p.pos.y,p.fly_time',{'v0':[10,20],'a':[2,-10],'dt':1},[11,15,1])
    case('combat','阻力逐步积分一步','local p=projectile();BASE.move_target_along_parabola(TCTX,p,1,6);return p.pos.x,p.pos.y,p.v_x,p.v_y,p.a_x,p.a_y',{'v':[10,20],'a':[2,-10],'dt':1,'wind':6,'mass':2,'resistance':1,'g_resistance':-20},[10,20,12,10,-3,-15])
    case('combat','阻力逐步积分二步','local p=projectile();BASE.move_target_along_parabola(TCTX,p,1,6);BASE.move_target_along_parabola(TCTX,p,1,6);return p.pos.x,p.pos.y,p.v_x,p.v_y,p.a_x,p.a_y',{'steps':2,'dt':1,'wind':6},[22,30,9,-5,-1.5,-7.5])
    case('combat','直线位移','local p=projectile();BASE.move_target_along_line(TCTX,p,0.5);return p.pos.x,p.pos.y,p.v_x,p.v_y',{'v':[10,20],'dt':0.5},[5,10,10,20])
    case('combat','负坐标floor边界','local p=projectile();p.v0_x=-0.1;p.v0_y=0;p.a_x=0;p.a_y=0;BASE.move_target_along_normal_parabola(TCTX,p,1);return p.pos.x,p.pos.y',{'v0_x':-0.1,'dt':1},[-1,0])

    farm=lua.globals()[b'Game'][b'module'][b'farm'];config('farm_misc.farm_misc');load('game.module.farm.manager.const',farm);load('game.module.farm.manager.core',farm);lua.globals()[b'FARM']=farm
    lua.execute(b'''Game.module.data.get_player_id=function() return 1 end
    FARM.data.get_watering_times=function() return WATER_USED,5 end
    FARM.data.get_steal_times=function() return STEAL_USED,10 end
    FARM.is_role_same_alliance=function(id) return SAME_ALLIANCE end
    WATER_USED=0;STEAL_USED=0;SAME_ALLIANCE=false
    ''')
    for owner,crop,exp in [(1,False,True),(2,False,False),(1,True,False)]:
        case('farm',f'播种owner{owner}_crop{crop}',f'return FARM.can_sow({{crop={"{}" if crop else "nil"}}},{owner})',{'owner':owner,'has_crop':crop},[exp])
    for stage,thief,owner,exp in [(10,0,1,True),(9,0,1,False),(10,2,1,False),(10,0,2,False)]:
        case('farm',f'收获stage{stage}_thief{thief}_owner{owner}',f'return FARM.can_harvest({{crop={{stage={stage}}},active_thief={thief}}},{owner})',{'stage':stage,'active_thief':thief,'owner':owner},[exp])
    for label,stage,owner,used,watered,exp in [('正常浇水',1,2,0,False,True),('不能给自己浇水',1,1,0,False,False),('成熟不可浇水',10,2,0,False,False),('浇水次数达到上限',1,2,5,False,False),('同株已浇水',1,2,0,True,False)]:
        # Select the first return; text reasons are retained by the client listing.
        case('farm',label,f'WATER_USED={used};local ok=FARM.can_watering({{crop={{stage={stage},watered_roles={"{1}" if watered else "{}"}}}}},{owner},false);return ok',{'stage':stage,'owner':owner,'used':used,'already_watered':watered},[exp])
    for label,stage,thief,same,used,roles,exp in [('正常偷菜',10,0,False,0,[],True),('未成熟不能偷',1,0,False,0,[],False),('正在被偷不能偷',10,2,False,0,[],False),('同公会不能偷',10,0,True,0,[],False),('每日次数用完',10,0,False,10,[],False),('第三次偷后封顶',10,0,False,0,[3,4,5],False),('自己已偷过',10,0,False,0,[1],False)]:
        code=f'STEAL_USED={used};SAME_ALLIANCE={str(same).lower()};local ok=FARM.can_steal({{crop={{stage={stage},stolen_roles={{{",".join(map(str,roles))}}}}},active_thief={thief}}},2);return ok'
        case('farm',label,code,{'stage':stage,'thief':thief,'same_alliance':same,'used':used,'stolen_roles':roles},[exp])

    rogue=lua.globals()[b'Game'][b'module'][b'rogue'];config('rogue_hard.rogue_hard');load('game.module.rogue.manager.const',rogue);load('game.module.rogue.manager.core',rogue);lua.globals()[b'ROGUE']=rogue
    lua.execute(b'Game.module.open_func.is_open=function() return OPEN end;Game.module.open_func.get_no_open_tips=function() return "closed" end;ROGUE.data.get_rogue_info=function() return {pass_hard=PASSED} end')
    for h,passed,op,exp in [(1,0,True,True),(2,0,True,False),(2,1,True,True),(3,1,True,False),(2,2,False,False)]:
        case('rogue',f'肉鸽解锁难度{h}_通过{passed}_open{op}',f'PASSED={passed};OPEN={str(op).lower()};local ok=ROGUE.is_rouge_difficulty_open({h});return ok',{'difficulty':h,'pass_hard':passed,'open':op},[exp])
    lua.execute(b'ROGUE.data.get_rogue_challenge_info=function() return {hard=2,cur_node_index=3,cur_node_state=NODESTATE} end')
    for state,next_node in [(1,3),(2,3),(3,4)]:
        case('rogue',f'肉鸽节点状态{state}',f'NODESTATE={state};return ROGUE.get_next_challenge_info()',{'hard':2,'node':3,'state':state},[2,next_node])
    case('rogue','不能跨节点选择事件','NODESTATE=3;return ROGUE.can_select_event(2,4),ROGUE.can_select_event(2,5),ROGUE.can_select_event(1,4)',{'expected_next':[2,4]},[True,False,False])

    home=lua.globals()[b'Game'][b'module'][b'home'];load('game.module.home.manager.core',home);lua.globals()[b'HOM']=home
    for charm,claimed,expected in [(99,[],0),(100,[],1),(100,[1],2)]:
        case('home',f'魅力奖charm{charm}_claimed{bool(claimed)}',f'HOM.data.charm_value={charm};HOM.data.fetched_charm_stage={{{",".join(map(str,claimed))}}};return HOM.get_charm_reward_state({{id=1,charm_value=100}})',{'charm':charm,'threshold':100,'claimed':claimed},[expected])

    ad=lua.globals()[b'Game'][b'module'][b'advertisement'];load('game.module.advertisement.manager.core',ad);lua.globals()[b'AD']=ad
    lua.execute(b'AD.data.get_advert_watched_info=function() return ADINFO end;Game.server_time.get_server_time=function() return NOW end')
    for used,total,pre,interval,now,exp in [(0,2,100,30,129,1),(0,2,100,30,130,0),(2,2,100,30,140,-1)]:
        case('monetization',f'广告次数{used}/{total}_time{now}',f'NOW={now};ADINFO={{daily_cnt={used},daily_all_cnt={total},pre_time={pre},view_interval={interval}}};return AD.get_advert_watch_state(1).state',{'used':used,'total':total,'pre_time':pre,'interval':interval,'now':now},[exp])
    case('monetization','无广告信息的本地状态','ADINFO=nil;return AD.get_advert_watch_state(1).state',{'info':None},[0])

    mc=lua.globals()[b'Game'][b'module'][b'month_card'];load('game.module.month_card.manager.core',mc);lua.globals()[b'MC']=mc
    lua.execute(b'MC.data.get_month_card_info_by_id=function() return MCINFO end')
    for op,expiry,now,exp in [(True,101,100,True),(True,100,100,False),(True,99,100,False),(False,101,100,False)]:
        case('monetization',f'月卡open{op}_expiry{expiry}',f'OPEN={str(op).lower()};NOW={now};MCINFO={{expired_time={expiry}}};return MC.is_month_card_activated(9)',{'open':op,'expired_time':expiry,'server_time':now},[exp])

    material=lua.globals()[b'Game'][b'module'][b'dungeon_material'];config('dungeon_material_series.dungeon_material_series');config('dungeon_material_reward.dungeon_material_reward');load('game.module.dungeon_material.manager.data.data',material);lua.globals()[b'MAT']=material[b'data']
    for limit,used,rate,expected in [(7,2,0,[5,7]),(7,2,1,[1,1]),(7,7,1,[0,1])]:
        case('pve',f'材料奖励额度{limit}_{used}_助力{rate}',f'MAT.series_info={{[101]={{reward_limit_cnt={limit},reward_cur_cnt={used},sprouts_rate={rate}}}}};return MAT.get_award_left_times(101)',{'limit':limit,'used':used,'sprouts_rate':rate},expected)
    lua.execute(b'MAT.get_round_reward_is_got=function() return CLAIMED end')
    for round_,claimed,exp in [(4,False,True),(5,False,False),(0,False,False),(4,True,False)]:
        case('pve',f'材料回合奖pass{round_}_claimed{claimed}',f'CLAIMED={str(claimed).lower()};MAT.series_info={{[201]={{pass_round={round_}}}}};return MAT.get_round_reward_can_get_by_id(201,20104)',{'pass_round':round_,'finish_round':4,'claimed':claimed},[exp])

    pb=lua.globals()[b'Game'][b'module'][b'pin_ball_game'];config('pinball_stage.pinball_stage');config('pinball_prop.pinball_prop');config('pinball_ball.pinball_ball');load('game.module.pin_ball_game.manager.core',pb);lua.globals()[b'PB']=pb
    lua.execute(b'PB.get_first_ball_config=function() return DataConfigs.pinball_ball.get_config(7012001) end')
    for label,balls,expected in [('布局优先6球','{{ball_id=7012001,count=5},{ball_id=7012002,count=1}}',6),('布局优先18球','{{ball_id=7012001,count=10},{ball_id=7012002,count=8}}',18),('空布局退回8球','{}',8),('未知球ID退回8球','{{ball_id=999,count=3}}',8)]:
        case('pinball',label,f'local loadout,n=PB.build_initial_ball_loadout({{init_balls={balls}}},{{init_ball_count=8}});return n',{'layout_balls':balls,'configured_ball_count':8},[expected])
    for score,target,exp in [(744,745,False),(745,745,True),(746,745,True),(0,0,True)]:
        case('pinball',f'弹球分数{score}_目标{target}',f'PB.data.score={score};PB.data.target_score={target};return PB.is_stage_target_reached()',{'score':score,'target':target},[exp])
    case('pinball','死亡计数不为负','PB.data.active_unit_count=0;PB.data.score=0;PB.get_unit_prop_cfg=function() return {death_score=10} end;PB.on_kill(1,1);return PB.data.active_unit_count,PB.data.score',{'active_before':0,'death_score':10},[0,10])
    # Result submission is captured locally. The stub performs no network action.
    lua.execute(b'PB.network.req_pinball_submit_result_c2s=function(id,tp) SUBMIT_ID=id;SUBMIT_TYPE=tp;SUBMIT_N=SUBMIT_N+1 end;PB.show_result=function() end')
    for win,completed,expected in [(True,False,1),(True,True,0),(False,True,0),(False,False,0)]:
        case('pinball',f'弹球上报win{win}_passed{completed}',f'SUBMIT_N=0;PB.data.result_shown=false;PB.data.stage_id=70101013;PB.data.score={745 if win else 744};PB.data.target_score=745;PB.is_stage_completed=function() return {str(completed).lower()} end;PB.on_stage_finished();return SUBMIT_N',{'win':win,'already_completed':completed},[expected])

    guild=lua.globals()[b'Game'][b'module'][b'alliance'];config('alliance_misc.alliance_misc');config('alliance_status.alliance_status');load('game.module.alliance.manager.core.core',guild);lua.globals()[b'GUILD']=guild
    lua.execute(b'DataConfigs.alliance_status.get_status_cfg=DataConfigs.alliance_status.get_config')
    for position,right,exp in [(1,1,True),(2,1,True),(4,1,False),(4,4,True),(10,3,False),(999,1,False)]:
        case('guild',f'公会职位{position}_权限{right}',f'return GUILD.has_right_for_operate({position},{right})',{'position':position,'permission':right},[exp])

    story=lua.globals()[b'Game'][b'module'][b'story_level'];load('game.module.story_level.manager.core',story);lua.globals()[b'STORY']=story
    case('pve','剧情连续自动挑战被固定开关关闭','return STORY.can_auto_fight_next(1)',{'dungeon_id':1,'downstream_functions':'unconfigured: must not be called'},[False])

    bp=lua.globals()[b'Game'][b'module'][b'battle_pass'];load('game.module.battle_pass.manager.core',bp);lua.globals()[b'BP']=bp
    lua.execute(b'BP.get_is_buy=function() return BOUGHT end')
    for level,normal,advanced,bought,want,paid,expected in [(10,9,5,False,11,False,[True,False,False]),(10,9,5,False,10,False,[False,False,True]),(10,10,5,False,10,False,[False,True,False]),(10,9,5,False,6,True,[True,False,False]),(10,9,5,True,6,True,[False,False,True]),(10,9,6,True,6,True,[False,True,False])]:
        case('monetization',f'通行证等级{level}_领取{normal}/{advanced}_购买{bought}_目标{want}_付费轨{paid}',f'BP.data.level={level};BP.data.normal_level={normal};BP.data.advance_level={advanced};BOUGHT={str(bought).lower()};return BP.get_item_is_lock({want},{str(paid).lower()}),BP.get_item_is_got({want},{str(paid).lower()}),BP.get_item_can_get({want},{str(paid).lower()})',{'level':level,'normal_claimed_level':normal,'advanced_claimed_level':advanced,'bought':bought,'target':want,'paid_track':paid},expected)
    for exp,limit,expected in [(99,100,False),(100,100,True),(101,100,True)]:
        case('monetization',f'通行证周经验{exp}/{limit}',f'BP.data.week_exp={exp};BP.data.week_exp_limit={limit};return BP.get_is_exp_limit()',{'week_exp':exp,'week_exp_limit':limit},[expected])

    trade=lua.globals()[b'Game'][b'module'][b'trade'];config('trade_misc.trade_misc');load('game.module.trade.manager.core',trade);lua.globals()[b'TRADE']=trade
    lua.execute(b'imports["auto_gen.package_include.config.trade_misc.head"]=DataConfigs.trade_misc;imports["auto_gen.package_include.config.trade_misc.body"]={}')
    case('economy','贸易比例按万分单位换算','return TRADE.get_trade_shop_system_tax_rate(),TRADE.get_trade_shop_price_increase_premium(),TRADE.get_trade_shop_limit_up_ratio(),TRADE.get_trade_shop_limit_down_ratio()',{'raw_tax':1000,'raw_premium':1000,'raw_limit_up':1000,'raw_limit_down':1000},[0.1,0.1,0.1,0.1])
    case('economy','贸易涨跌显示向下截一位小数','return TRADE.get_ratio_keep_one_decimal_digit(0.02349,100),TRADE.get_ratio_keep_one_decimal_digit(-0.02349,100)',{'ratio':[0.02349,-0.02349],'display_multiplier':100},['2.3%','-2.4%'])

    tower=lua.globals()[b'Game'][b'module'][b'dungeon_tower'];load('game.module.dungeon_tower.manager.core',tower);lua.globals()[b'TOWER']=tower
    lua.execute(b'Game.server_time.get_server_open_day=function() return OPEN_DAY end;DataConfigs.tower.get_tower_cfg=function() return {night_mare_coeff={100000,5000},nightmare_press_power=2000} end')
    for day,night,coef,press in [(9,True,5000,2000),(10,False,0,0),(11,False,-5000,-2000)]:
        case('pve',f'噩梦爬塔开服第{day}天',f'OPEN_DAY={day};return TOWER.is_nightmare_floor(1),TOWER.get_nightmare_mon_coef(1),TOWER.get_nightmare_mon_crush_coef(1)',{'open_day':day,'threshold':100000,'coefficient':5000,'press_coefficient':2000},[night,coef,press])

    result={'scope':'Original client bytecode with explicit account/engine/UI/time/network stubs. No server or UI playtest.',
            'sources':list({r['name']:r for r in sources}.values()),'configs':configs,'cases':cases}
    (ROOT/'analysis/review/probes.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf8')
    print(f'PASS: {len(cases)} review cases, {len(result["sources"])} original sources')

if __name__=='__main__':main()
