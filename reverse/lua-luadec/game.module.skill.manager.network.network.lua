-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua7_573533\game.module.skill.manager.network.network_-7219182476719539519.bin 

local l_0_0 = assert
local l_0_1 = ipairs
local l_0_2 = require("game.network.network_utils")
local l_0_3 = require("game.utils.events")
local l_0_4 = Game.redpoint_helper
local l_0_5 = import("..head")
local l_0_6 = l_0_0(l_0_5.network)
local l_0_7 = l_0_0(l_0_5.data)
l_0_6.init = function()
  local l_1_0 = l_0_6
  local l_1_1 = {}
  l_1_1.skill_info_s2c = l_0_6.on_skill_info_s2c
  l_1_1.skill_wear_s2c = l_0_6.on_skill_wear_s2c
  l_1_1.skill_up_s2c = l_0_6.on_skill_up_s2c
  l_1_1.skill_up_onekey_s2c = l_0_6.on_skill_up_onekey_s2c
  l_1_0.net_events = l_1_1
  l_1_0 = l_0_2
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_6
  l_1_1 = l_1_1.net_events
  l_1_0(l_1_1, "skill")
end

l_0_6.clear = function()
  l_0_2.unlisten_net_events(l_0_6.net_events)
  l_0_6.net_events = nil
end

l_0_6.skill_info_c2s = function()
  l_0_2.send("skill_info_c2s", {})
end

l_0_6.skill_wear_c2s = function(l_4_0, l_4_1, l_4_2, l_4_3)
  local l_4_4 = {}
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    if not l_4_3 then
      l_4_4.plan_id = l_0_7.get_active_plan_id()
    end
    l_4_4.pos = l_0_0(l_4_1)
    l_4_4.skill_id = l_0_0(l_4_0)
    l_4_4.opt = l_0_0(l_4_2)
    l_0_2.send("skill_wear_c2s", l_4_4)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_6.skill_upgrade_c2s = function(l_5_0)
  local l_5_1 = {}
  l_5_1.skill_id = l_0_0(l_5_0)
  l_0_2.send("skill_up_c2s", l_5_1)
end

l_0_6.skill_up_onekey_c2s = function(l_6_0)
  local l_6_1 = l_0_2.send
  local l_6_2 = "skill_up_onekey_c2s"
  local l_6_3 = {}
  l_6_3.up_tp = l_6_0
  l_6_1(l_6_2, l_6_3)
end

l_0_6.on_skill_info_s2c = function(l_7_0, l_7_1)
  if l_7_0 ~= 0 then
    return 
  end
  if not l_7_1.skills then
    for l_7_5,l_7_6 in l_0_1({}) do
    end
    local l_7_7 = l_0_7.id_to_skill_lv
    local l_7_8 = l_7_6.skill_id
    l_7_7[l_7_8] = l_7_6.lvl
  end
  l_0_7.init_skill_plan(l_7_1)
  l_0_5.init_red_points()
  l_0_3.brocast("update_skill_plan")
  l_0_4.update_red_point("skill_manager_upgrade_red_point")
  l_0_4.update_red_point("skill_manager_unlock_unequip_red_point")
  l_0_4.update_red_point("skill_manager_fast_upgrade_red_point")
  l_0_4.update_red_point("skill_manager_fix_equip_red_point_2")
  l_0_4.update_red_point("skill_manager_fix_equip_red_point_3")
end

l_0_6.on_skill_wear_s2c = function(l_8_0, l_8_1)
  if l_8_0 ~= 0 then
    return 
  end
  local l_8_2 = l_8_1.pos
  if l_8_1.opt == 1 then
    l_0_7.update_pos_to_equip_skill(l_8_1.plan_id, l_8_1.pos, l_8_1.skill_id)
  else
    l_0_7.update_pos_to_equip_skill(l_8_1.plan_id, l_8_1.pos, nil)
  end
  if not l_8_2 or l_8_2 <= 0 then
    return 
  end
  l_0_3.brocast("skill_equip_update", l_8_2, l_8_1.opt, l_8_1.skill_id)
  l_0_3.brocast("update_skill_plan")
  l_0_4.update_red_point("skill_manager_upgrade_red_point")
  l_0_4.update_red_point("skill_manager_unlock_unequip_red_point")
  l_0_4.update_red_point("skill_manager_fast_upgrade_red_point")
  l_0_4.update_red_point("skill_manager_fix_equip_red_point_2")
  l_0_4.update_red_point("skill_manager_fix_equip_red_point_3")
end

l_0_6.on_skill_up_s2c = function(l_9_0, l_9_1)
  if l_9_0 ~= 0 then
    return 
  end
  local l_9_2 = l_0_7.id_to_skill_lv
  local l_9_3 = l_9_1.skill_id
  l_9_2[l_9_3] = l_9_1.lvl
  l_9_2 = l_0_5
  l_9_2 = l_9_2.update_pre_skill_rp
  l_9_2()
  l_9_2 = l_0_3
  l_9_2 = l_9_2.brocast
  l_9_3 = "skill_lvl_update"
  l_9_2(l_9_3, l_9_1.skill_id, l_9_1.lvl)
  l_9_2 = l_0_4
  l_9_2 = l_9_2.update_red_point
  l_9_3 = "skill_manager_upgrade_red_point"
  l_9_2(l_9_3)
  l_9_2 = l_0_4
  l_9_2 = l_9_2.update_red_point
  l_9_3 = "skill_manager_unlock_unequip_red_point"
  l_9_2(l_9_3)
  l_9_2 = l_0_4
  l_9_2 = l_9_2.update_red_point
  l_9_3 = "skill_manager_fast_upgrade_red_point"
  l_9_2(l_9_3)
  l_9_2 = Game
  l_9_2 = l_9_2.module
  l_9_2 = l_9_2.guide_system
  l_9_3 = l_9_2.trigger
  l_9_3(l_9_2.const.trigger_type.skill_up_s2c)
end

l_0_6.on_skill_up_onekey_s2c = function(l_10_0, l_10_1)
  if l_10_0 ~= 0 or not l_10_1.up_skill_list then
    return 
  end
  for l_10_5,l_10_6 in pairs(l_10_1.up_skill_list) do
    local l_10_7 = l_0_7.id_to_skill_lv
    local l_10_8 = l_10_6.skill_id
    l_10_7[l_10_8] = l_10_6.new_lvl
    l_10_7 = l_0_3
    l_10_7 = l_10_7.brocast
    l_10_8 = "skill_lvl_update"
    l_10_7(l_10_8, l_10_6.skill_id, l_10_6.new_lvl)
  end
  l_0_5.update_pre_skill_rp()
  l_0_3.brocast("skill_upgrade_onekey")
  l_0_4.update_red_point("skill_manager_upgrade_red_point")
  l_0_4.update_red_point("skill_manager_unlock_unequip_red_point")
  l_0_4.update_red_point("skill_manager_fast_upgrade_red_point")
  do
    local l_10_9, l_10_10 = Game.module.guide_system
    l_10_10 = l_10_9.trigger
    l_10_10(l_10_9.const.trigger_type.skill_up_s2c)
    l_10_10 = l_0_5
    l_10_10 = l_10_10.try_pop_skill_evol_view
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_10_10(l_10_1.up_skill_list)
end

l_0_6.on_role_gameplay_set_s2c = function(l_11_0, l_11_1)
  l_0_7.update_gameplay_plan_dic(l_11_1)
end

return l_0_6

