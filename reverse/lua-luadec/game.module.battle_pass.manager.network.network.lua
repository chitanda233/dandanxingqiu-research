-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua1_573660\game.module.battle_pass.manager.network.network_-6727519831356728346.bin 

local l_0_0 = require("game.network.network_utils")
local l_0_1 = Game.events
local l_0_2 = Game.redpoint_helper
local l_0_3 = Game.ui_manager
local l_0_4 = BroadcastTips
local l_0_5 = Game.module.dungeon_main
local l_0_6 = import("..head")
local l_0_7 = l_0_6.data
local l_0_8 = l_0_6.network
local l_0_9 = l_0_6.event
l_0_8.init = function()
  local l_1_0 = l_0_8
  local l_1_1 = {}
  l_1_1.battle_pass_info_s2c = l_0_8.on_battle_pass_info_s2c
  l_1_1.battle_pass_buy_level_s2c = l_0_8.on_battle_pass_buy_level_s2c
  l_1_1.battle_pass_one_key_get_rewards_s2c = l_0_8.on_battle_pass_one_key_get_rewards_s2c
  l_1_1.battle_pass_notify_add_changed_s2c = l_0_8.on_battle_pass_notify_add_changed_s2c
  l_1_1.battle_pass_notify_buy_battle_pass_s2c = l_0_8.on_battle_pass_notify_buy_battle_pass_s2c
  l_1_1.battle_pass_common_info_s2c = l_0_8.on_battle_pass_common_info_s2c
  l_1_1.battle_pass_common_get_rewards_s2c = l_0_8.on_battle_pass_common_get_rewards_s2c
  l_1_1.battle_pass_common_notify_exp_changed_s2c = l_0_8.on_battle_pass_common_notify_exp_changed_s2c
  l_1_1.battle_pass_common_notify_buy_s2c = l_0_8.on_battle_pass_common_notify_buy_s2c
  l_1_1.battle_pass_common_buy_s2c = l_0_8.on_battle_pass_common_buy_s2c
  l_1_0.net_event_names = l_1_1
  l_1_0 = l_0_0
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_8
  l_1_1 = l_1_1.net_event_names
  l_1_0(l_1_1, "battle_pass")
end

l_0_8.clear = function()
  l_0_0.unlisten_net_events(l_0_8.net_event_names)
  l_0_8.net_event_names = nil
end

l_0_8.req_battle_pass_info_c2s = function()
  l_0_0.send("battle_pass_info_c2s", {})
end

l_0_8.on_battle_pass_info_s2c = function(l_4_0, l_4_1)
  if l_4_0 ~= 0 then
    return 
  end
  l_0_7.init_info(l_4_1)
  l_0_1.brocast(l_0_9.update_info)
  l_0_2.update_red_point("battle_pass_red_point")
  l_0_2.update_red_point("battle_pass_task_red_point")
  l_0_2.update_red_point("battle_pass_dress_up_red_point")
end

l_0_8.req_battle_pass_buy_level_c2s = function(l_5_0)
  local l_5_1 = {}
  l_5_1.level = l_5_0
  l_0_0.send("battle_pass_buy_level_c2s", l_5_1)
end

l_0_8.on_battle_pass_buy_level_s2c = function(l_6_0, l_6_1)
  if l_6_0 ~= 0 then
    return 
  end
  l_0_3.close_view("BattlePassBuyView")
  l_0_7.init_info(l_6_1)
  l_0_1.brocast(l_0_9.update_info)
  l_0_2.update_red_point("battle_pass_red_point")
  l_0_2.update_red_point("battle_pass_task_red_point")
end

l_0_8.req_battle_pass_one_key_get_rewards_c2s = function()
  l_0_0.send("battle_pass_one_key_get_rewards_c2s", {})
end

l_0_8.on_battle_pass_one_key_get_rewards_s2c = function(l_8_0, l_8_1)
  if l_8_0 ~= 0 then
    return 
  end
  l_0_7.init_info(l_8_1)
  l_0_1.brocast(l_0_9.update_info)
  l_0_2.update_red_point("battle_pass_red_point")
end

l_0_8.on_battle_pass_notify_add_changed_s2c = function(l_9_0, l_9_1)
  if l_9_0 ~= 0 then
    return 
  end
  l_0_7.init_info(l_9_1)
  l_0_1.brocast(l_0_9.update_info)
  l_0_2.update_red_point("battle_pass_red_point")
  l_0_2.update_red_point("battle_pass_task_red_point")
end

l_0_8.on_battle_pass_notify_buy_battle_pass_s2c = function(l_10_0, l_10_1)
  if l_10_0 ~= 0 then
    return 
  end
  l_0_7.is_buy = true
  l_0_1.brocast(l_0_9.update_info)
  l_0_2.update_red_point("battle_pass_red_point")
end

l_0_8.req_battle_pass_common_info_c2s = function(l_11_0)
  local l_11_1 = {}
  l_11_1.type = l_11_0
  l_0_0.send("battle_pass_common_info_c2s", l_11_1)
end

l_0_8.on_battle_pass_common_info_s2c = function(l_12_0, l_12_1)
  if l_12_0 ~= 0 then
    return 
  end
  if not l_12_1.battle_pass then
    return 
  end
  local l_12_2 = l_12_1.battle_pass.type
  l_0_7.init_common_info(l_12_1.battle_pass)
  if l_12_2 == l_0_6.const.common_type.tower then
    l_0_5.try_save_last_tower_fund_info()
  end
  l_0_1.brocast(l_0_9.common_info, l_12_2)
  l_0_6.update_common_red_points(l_12_2)
  l_0_6.update_common_once_red_points(l_12_2)
end

l_0_8.req_battle_pass_common_get_rewards_c2s = function(l_13_0)
  local l_13_1 = {}
  l_13_1.type = l_13_0
  l_0_0.send("battle_pass_common_get_rewards_c2s", l_13_1)
end

l_0_8.on_battle_pass_common_get_rewards_s2c = function(l_14_0, l_14_1)
  if l_14_0 ~= 0 then
    return 
  end
  l_0_7.init_common_info(l_14_1)
  l_0_1.brocast(l_0_9.common_info, l_14_1.type)
  l_0_6.update_common_red_points(l_14_1.type)
end

l_0_8.on_battle_pass_common_notify_exp_changed_s2c = function(l_15_0, l_15_1)
  l_0_1.brocast("update_battle_pass_common_notify_exp_changed", l_15_1)
end

l_0_8.on_battle_pass_common_notify_buy_s2c = function(l_16_0, l_16_1)
  l_0_1.brocast("update_battle_pass_common_notify_buy", l_16_1)
end

l_0_8.req_battle_pass_common_buy_c2s = function(l_17_0)
  local l_17_1 = {}
  l_17_1.type = l_17_0
  l_0_0.send("battle_pass_common_buy_c2s", l_17_1)
end

l_0_8.on_battle_pass_common_buy_s2c = function(l_18_0, l_18_1)
  if l_18_0 ~= 0 then
    return 
  end
  local l_18_2 = l_0_7.battle_pass_info
  local l_18_3 = l_18_1.type
  if not l_0_7.battle_pass_info[l_18_1.type] then
    l_18_2[l_18_3] = {}
  end
  l_18_2 = l_0_7
  l_18_2 = l_18_2.battle_pass_info
  l_18_3 = l_18_1.type
  l_18_2 = l_18_2[l_18_3]
  l_18_2.is_buy = true
  l_18_2 = l_0_1
  l_18_2 = l_18_2.brocast
  l_18_3 = l_0_9
  l_18_3 = l_18_3.common_info
  l_18_2(l_18_3, l_18_1.type)
  l_18_2 = l_0_6
  l_18_2 = l_18_2.update_common_red_points
  l_18_3 = l_18_1.type
  l_18_2(l_18_3)
  l_18_2 = l_0_6
  l_18_2 = l_18_2.update_common_once_red_points
  l_18_3 = l_18_1.type
  l_18_2(l_18_3)
end


