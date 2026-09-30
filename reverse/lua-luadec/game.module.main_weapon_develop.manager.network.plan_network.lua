-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua2_573512\game.module.main_weapon_develop.manager.network.plan_network_-6671897728407966381.bin 

local l_0_0 = require("game.utils.events")
local l_0_1 = require("game.network.network_utils")
local l_0_2 = Game.redpoint_helper
local l_0_3 = import("..head")
local l_0_4 = l_0_3.plan_network
local l_0_5 = l_0_3.plan_data
local l_0_6 = l_0_3.data
local l_0_7 = l_0_3.event
local l_0_8 = Game.module.bag
l_0_4.init = function()
  local l_1_0 = l_0_4
  local l_1_1 = {}
  l_1_1.weapon_plan_s2c = l_0_4.on_weapon_plan_s2c
  l_1_1.weapon_wear_plan_s2c = l_0_4.on_weapon_wear_plan_s2c
  l_1_1.weapon_update_plan_s2c = l_0_4.on_weapon_update_plan_s2c
  l_1_0.net_event_names = l_1_1
  l_1_0 = l_0_1
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_4
  l_1_1 = l_1_1.net_event_names
  l_1_0(l_1_1, "main_weapon_develop_plan")
end

l_0_4.clear = function()
  l_0_1.unlisten_net_events(l_0_4.net_event_names)
end

l_0_4.role_gameplay_set_c2s = function(l_3_0, l_3_1, l_3_2)
  if not l_3_0 then
    local l_3_3 = Game.module.team
    local l_3_4 = l_3_3.data.is_in_team()
    if l_3_4 then
      local l_3_5 = DataConfigs.team_target
      local l_3_6 = l_3_3.data.get_team_info()
      local l_3_7 = l_3_5.get_cfg_by_type_target(l_3_6.type, l_3_6.target)
      if l_3_7.play_type > 0 then
        l_3_0 = l_3_7.play_type
      else
        l_3_0 = false
      end
    end
    if l_3_0 then
       -- Warning: missing end command somewhere! Added here
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_4.weapon_plan_c2s = function()
  l_0_1.send("weapon_plan_c2s", {})
end

l_0_4.weapon_wear_plan_c2s = function(l_5_0, l_5_1)
  local l_5_2 = l_0_1.send
  local l_5_3 = "weapon_wear_plan_c2s"
  local l_5_4 = {}
  l_5_4.id = l_5_0
  l_5_4.list = l_5_1
  l_5_2(l_5_3, l_5_4)
end

l_0_4.on_weapon_plan_s2c = function(l_6_0, l_6_1)
  l_0_5.update_list(l_6_1.list)
  l_0_0.brocast(l_0_7.update_weapon_plan)
  l_0_0.brocast(l_0_7.update_main_weapon_develop_info)
end

l_0_4.on_weapon_update_plan_s2c = function(l_7_0, l_7_1)
  l_0_5.update_list(l_7_1.list)
  l_0_0.brocast(l_0_7.update_weapon_plan)
  l_0_0.brocast(l_0_7.update_main_weapon_develop_info)
end

l_0_4.on_weapon_wear_plan_s2c = function(l_8_0, l_8_1)
  if l_8_0 ~= 0 then
    return 
  end
  l_0_5.update_weapon_wear_list(l_8_1.id, l_8_1.list)
  l_0_0.brocast(l_0_7.update_weapon_plan)
  l_0_0.brocast(l_0_7.update_main_weapon_develop_info)
end

l_0_4.on_role_gameplay_set_s2c = function(l_9_0, l_9_1)
  if l_9_0 ~= 0 then
    return 
  end
  l_0_5.update_game_play_dic(l_9_1)
end

return l_0_4

