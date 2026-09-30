"""Run ORIGINAL Lua bytecode decision functions against explicit stub contexts.

This observes client branches; it does not emulate a live account or server.
All inputs, returned values, and source hashes are retained as report evidence.
"""
from __future__ import annotations
import hashlib
import json
from pathlib import Path
from lupa.lua51 import LuaRuntime
from repack_lua51 import repack

ROOT = Path(__file__).resolve().parents[1]

def main() -> None:
    index = {x["name"]: x for x in json.loads((ROOT / "reverse/lua-bytecode/manifest.json").read_text(encoding="utf-8"))}
    lua = LuaRuntime(encoding=None, register_eval=False, register_builtins=False, unpack_returned_tuples=True)
    lua.execute(b'''
    function tree()
      return setmetatable({}, {__index=function(t,k) local v=tree();rawset(t,k,v);return v end,
                              __call=function() return nil end})
    end
    Game=tree(); DataConfigs=tree(); GlobalConst=tree(); BroadcastTips=tree()
    GameLogger=tree(); Time={time=0}; Color=tree(); Vector3=tree(); PlayerPrefs=tree(); PrintSwitcher=tree(); GameFunctions=tree(); log_error=function() end
    imports={}; function require(n) if not imports[n] then imports[n]=tree() end return imports[n] end
    CONFIG_HEADER={et={}}
    function import(n) if n=="..head" and IS_CONFIG then return CONFIG_HEADER end return CURRENT_MODULE end
    math.round=function(x) return math.floor(x+0.5) end
    table.clear=function(t) for k in pairs(t) do t[k]=nil end end
    os=nil;io=nil;package=nil;dofile=nil;loadfile=nil
    ''')
    sources=[]
    def load(name, target=None):
        row=index[name]; path=ROOT / "reverse/lua-bytecode" / row["file"]
        lua.globals()[b"CURRENT_MODULE"]=target if target is not None else lua.globals()[b"tree"]()
        lua.globals()[b"IS_CONFIG"]=name.startswith("auto_gen.package_include.config.")
        data=path.read_bytes()
        sources.append({"name":name,"source":row["file"],"sha256":hashlib.sha256(data).hexdigest()})
        return lua.execute(repack(data))

    cfg=lua.globals()[b"DataConfigs"]
    skill=load("auto_gen.package_include.config.skill.skill")
    cfg[b"skill"]=skill
    load("auto_gen.package_include.config.skill.const",skill)
    misc=lua.table()
    for name in ("fight_misc.attr_const","fight_misc.attr_parabola"):
        table=load("auto_gen.package_include.config."+name)
        for k,v in table.items():
            misc[k]=v
    cfg[b"fight_misc"]=misc
    fight=lua.globals()[b"Game"][b"module"][b"fight"]
    load("game.module.fight.manager.const",fight)
    load("game.module.fight.manager.base.fighting.skill.core")
    base=fight[b"ways"][b"base"]
    lua.globals()[b"BASE"]=base
    lua.globals()[b"FIGHT"]=fight
    lua.globals()[b"SKILL"]=skill
    lua.execute(b'''
    function context(id)
      local u={id=1,role={is_auto_battle=false},is_cur_round_attacker=true,
               round_status=FIGHT.unit_round_status.action,attrs={},skill_cf_id_to_info={},
               forbidden_skill_types={},round_count=10,holding_fire=false}
      for _,name in pairs(FIGHT.const_attr_str) do u.attrs[name]=100000 end
      u.skill_cf_id_to_info[id]={cd=0,round_count=0,all_count=0,cf_info=SKILL[id]}
      local c=setmetatable({fight_state="attack",round={is_repeat_round=false}}, {__index=BASE})
      c.unit_can_do_round_action=function() return true end
      c.is_unit_buff_ban_skill=function() return false end
      c.is_unit_has_buff_state=function() return false end
      c.is_unit_skill_forbid=function() return false end
      c.is_repeat_round=function(s) return s.round.is_repeat_round end
      c.is_dungeon_play=function() return false end
      c.get_soul_attr_val_by_unit_id=function() return 100000 end
      return c,u
    end
    function check_case(id, setup)
      local c,u=context(id); if setup then setup(c,u) end
      local ok,reason=BASE.unit_can_use_skill(c,u,SKILL[id],true)
      return ok,reason
    end
    ''')
    cases=[]
    def case(label, code, inputs):
        out=lua.execute(code.encode("utf-8"))
        if not isinstance(out,tuple):out=(out,)
        cases.append({"label":label,"inputs":inputs,"returned":[v.decode("utf-8","replace") if isinstance(v,bytes) else v for v in out]})

    for label,setup in [
        ("正常冰冻可用",""),
        ("非攻击状态",'c.fight_state="watch"'),
        ("不是本回合行动者",'u.is_cur_round_attacker=false'),
        ("已离开行动阶段",'u.round_status=FIGHT.unit_round_status.watch'),
        ("自动战斗禁止手动技能",'u.role.is_auto_battle=true'),
        ("沉默",'c.is_unit_buff_ban_skill=function() return true end'),
        ("重复回合禁用冰冻",'c.round.is_repeat_round=true'),
        ("本回合次数耗尽",'u.skill_cf_id_to_info[1001009].round_count=1'),
        ("本局次数耗尽",'u.skill_cf_id_to_info[1001009].all_count=1'),
        ("冷却未好",'u.skill_cf_id_to_info[1001009].cd=1'),
        ("禁用原型",'c.is_unit_skill_forbid=function() return true end'),
        ("费用不足",'u.attrs.strength=-1'),
    ]:
        case(label,'return check_case(1001009,function(c,u) '+setup+' end)',{"skill_id":1001009,"setup":setup})
    case("技能费用边界低于10000",'return check_case(1011010,function(c,u) u.attrs.strength=9999 end)',{"skill_id":1011010,"strength":9999})
    case("技能费用边界等于10000",'return check_case(1011010,function(c,u) u.attrs.strength=10000 end)',{"skill_id":1011010,"strength":10000})
    # CD decrement is invoked on the unit's own turn; fixed-CD prototypes skip it.
    case("普通冷却与回合次数重置",'''
      local c,u=context(1011010); u.skill_cf_id_to_info[1011010].cd=3
      u.skill_cf_id_to_info[1011010].round_count=1;c.reset_unit_forbidden_skills=function() end
      BASE.reset_unit_skill_cost_when_turn_round(c,u)
      return u.skill_cf_id_to_info[1011010].cd,u.skill_cf_id_to_info[1011010].round_count
    ''',{"skill_id":1011010,"cd_before":3,"round_count_before":1})

    pet=lua.globals()[b"Game"][b"module"][b"pet"]
    load("game.module.pet.manager.data.data",pet)
    lua.globals()[b"PETDATA"]=pet[b"data"]
    for lv,plv,pause in [(30,50,0),(30,30,0),(30,50,10),(100,133,0)]:
        case(f"宠物衰减level{lv}_角色{plv}_暂停{pause}",f'''
          Game.module.data.get_player=function() return {{level={plv},pause_level={pause}}} end
          return PETDATA.get_pet_weaken_rate({{level={lv}}})
        ''',{"pet_level":lv,"player_level":plv,"pause_level":pause})

    bp=lua.globals()[b"Game"][b"module"][b"battle_pass"]
    load("game.module.battle_pass.manager.core",bp)
    lua.globals()[b"BP"]=bp
    lua.execute(b'BP.data.level=10;BP.data.normal_level=5;BP.data.advance_level=3;BP.data.is_buy=false')
    for label,level,paid,bought in [("免费已领取",5,False,False),("免费可领取",6,False,False),
                                  ("等级未达",11,False,False),("付费未购",4,True,False),
                                  ("付费已领取",3,True,True),("付费可领取",4,True,True)]:
        case("通行证_"+label,f'''
          BP.data.is_buy={str(bought).lower()}
          return BP.get_item_is_lock({level},{str(paid).lower()}),
                 BP.get_item_is_got({level},{str(paid).lower()}),
                 BP.get_item_can_get({level},{str(paid).lower()})
        ''',{"current_level":10,"normal_claimed":5,"paid_claimed":3,"reward_level":level,"paid":paid,"bought":bought})

    upgrade=load("auto_gen.package_include.config.skill_base_upgrade.skill_base_upgrade_0")
    cfg[b"skill_upgrade"]=lua.table();lua.globals()[b"UPGRADE"]=upgrade
    lua.execute(b'''
      DataConfigs.skill_upgrade.get_by_id_lv=function(id,lv) return UPGRADE[id*1000+lv] end
      DataConfigs.item.get_item=function(id) return {bag_type=1} end
      Game.module.data.get_player_lv=function() return PLAYERLV end
      Game.module.open_func.is_open=function() return true end
      require("game.other.server_time").get_server_open_day=function() return OPENDAY end
      Game.module.bag.get_bag_item_count_by_cid=function(bag,id) return INVENTORY[id] or 0 end
    ''')
    sm=lua.globals()[b"Game"][b"module"][b"skill"]
    sm[b"data"]=lua.table()
    cfg[b"misc"]=lua.table()
    load("game.module.skill.manager.core",sm);lua.globals()[b"SM"]=sm
    case("技能槽默认与类别槽",'SM.skill_pos=false;return SM.get_slot_count(),SM.get_active_slot_count(),SM.get_passive_slot_count()',{"cached_skill_pos":False})
    for label,lv,plv,day,mat,gold in [("20升21资源足",20,40,10,4000,90000),
                                    ("20升21材料差1",20,40,10,3999,90000),
                                    ("40升41角色未达",40,39,10,7500,150000),
                                    ("40升41开服未达",40,40,4,7500,150000),
                                    ("40升41满足门槛",40,40,5,7500,150000)]:
        case(label,f'''SM.data.id_to_skill_lv={{[1001]={lv}}};PLAYERLV={plv};OPENDAY={day}
          INVENTORY={{[1402010001]={mat},[1001010001]={gold}}}
          return SM.can_upgrade_skill_lvl(1001,false)
        ''',{"skill_id":1001,"current_level":lv,"player_level":plv,"server_day":day,"skill_knowledge":mat,"gold":gold})

    load("game.module.fight.manager.base.fighting.ui.core")
    for label,aim,env,buff in [("标准蓄力",0,0,0),("瞄准修正20%",0.2,0,0),
                               ("磁暴蓄力",0,18000,0),("增益蓄力20%",0,0,2000)]:
        case(label,f'''
          Game.module.setting.get_setting_value=function() return 100 end
          local c=setmetatable({{cf_battle_env={{env_arg={{add_speed_rate={env}}}}}}},{{__index=BASE}})
          c.get_custom_power_add_speed_key=function() return "probe" end
          c.get_unit_total_buff_eff_val=function() return {buff} end
          local speed=BASE.get_unit_power_add_speed(c,{{attrs={{aim_factor={aim}}}}})
          return speed,math.round(speed*10000)
        ''',{"setting_percent":100,"aim_factor":aim,"env_add_speed_rate":env,"buff_power_add_speed":buff})

    table_type=type(lua.table())
    def plain(v):
        if isinstance(v,bytes):return v.decode("utf-8","replace")
        if isinstance(v,table_type):return {str(plain(k)):plain(x) for k,x in v.items() if not callable(x)}
        return v
    enums={k:plain(fight[k.encode()]) for k in ["const_attr_str","unit_round_status","buff_states","skill_proto_type"]}
    enums["skill_prototype"]=plain(skill[b"const"][b"prototype"])
    result={"scope":"Original client Lua bytecode with explicit battle, inventory, growth, reward and control stubs; not server behavior", "sources":sources,"cases":cases,"enums":enums}
    for c in cases:
        if any(isinstance(v,table_type) for v in c["returned"]):
            raise ValueError(f"Unexpected stub table in result: {c['label']}")
    path=ROOT/"analysis/data/client_rule_probes.json"
    path.write_text(json.dumps(result,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    for c in cases: print(c["label"],c["returned"])
    print("Saved",path)

if __name__=="__main__":main()
