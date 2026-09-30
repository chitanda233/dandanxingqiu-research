-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua5_573650\game.module.task.manager.network.network_7347662550331206628.bin 

local l_0_0 = require("game.utils.events")
local l_0_1 = require("game.network.network_utils")
local l_0_2 = Game.redpoint_helper
local l_0_3 = import("..head")
local l_0_4 = l_0_3.network
local l_0_5 = l_0_3.data
local l_0_6 = l_0_3.const
local l_0_7 = l_0_3.event
local l_0_8 = Game.module.common_view
local l_0_9 = DataConfigs.tasks
local l_0_10 = require("game.other.player_prefs")
l_0_4.init = function()
  local l_1_0 = l_0_4
  local l_1_1 = {}
  l_1_1.task_info_s2c = l_0_4.on_task_info_s2c
  l_1_1.task_daily_liveness_info_s2c = l_0_4.on_task_daily_liveness_info_s2c
  l_1_1.task_daily_liveness_reward_s2c = l_0_4.on_task_daily_liveness_reward_s2c
  l_1_1.task_daily_week_reward_s2c = l_0_4.on_task_daily_week_reward_s2c
  l_1_1.task_commit_s2c = l_0_4.on_task_commit_s2c
  l_1_1.task_update_s2c = l_0_4.on_task_update_s2c
  l_1_1.task_delete_s2c = l_0_4.on_task_delete_s2c
  l_1_1.task_start_alliance_trust_s2c = l_0_4.on_task_start_alliance_trust_s2c
  l_1_1.task_accept_s2c = l_0_4.on_task_accept_s2c
  l_1_1.task_finish_s2c = l_0_4.on_task_finish_s2c
  l_1_1.task_alliance_trust_reward_s2c = l_0_4.on_task_alliance_trust_reward_s2c
  l_1_1.role_equip_be_task_s2c = l_0_4.on_role_equip_be_task_s2c
  l_1_1.task_main_info_s2c = l_0_4.on_task_main_info_s2c
  l_1_1.task_receive_main_reward_s2c = l_0_4.on_task_receive_main_reward_s2c
  l_1_1.task_career_info_s2c = l_0_4.on_task_career_info_s2c
  l_1_1.task_batch_commit_s2c = l_0_4.on_task_batch_commit_s2c
  l_1_1.task_main_task_s2c = l_0_4.on_task_main_task_s2c
  l_1_0.net_event_names = l_1_1
  l_1_0 = l_0_1
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_4
  l_1_1 = l_1_1.net_event_names
  l_1_0(l_1_1, "task")
end

l_0_4.clear = function()
  l_0_1.unlisten_net_events(l_0_4.net_event_names)
end

l_0_4.task_batch_commit_c2s = function(l_3_0)
  local l_3_1 = l_0_1.send
  local l_3_2 = "task_batch_commit_c2s"
  local l_3_3 = {}
  l_3_3.task_list = l_3_0
  l_3_1(l_3_2, l_3_3)
end

l_0_4.task_career_info_c2s = function()
  l_0_1.send("task_career_info_c2s", {})
end

l_0_4.task_receive_main_reward_c2s = function(l_5_0)
  local l_5_1 = l_0_1.send
  local l_5_2 = "task_receive_main_reward_c2s"
  local l_5_3 = {}
  l_5_3.id = l_5_0
  l_5_1(l_5_2, l_5_3)
end

l_0_4.task_main_info_c2s = function()
  l_0_1.send("task_main_info_c2s", {})
end

l_0_4.role_equip_be_task_c2s = function()
  l_0_1.send("role_equip_be_task_c2s", {})
end

l_0_4.task_start_alliance_trust_c2s = function()
  l_0_1.send("task_start_alliance_trust_c2s", {})
end

l_0_4.task_info_c2s = function(l_9_0)
  local l_9_1 = l_0_1.send
  local l_9_2 = "task_info_c2s"
  local l_9_3 = {}
  l_9_3.type = l_9_0
  l_9_1(l_9_2, l_9_3)
end

l_0_4.task_daily_liveness_info_c2s = function()
  l_0_1.send("task_daily_liveness_info_c2s", {})
end

l_0_4.task_daily_liveness_reward_c2s = function(l_11_0)
  local l_11_1 = l_0_1.send
  local l_11_2 = "task_daily_liveness_reward_c2s"
  local l_11_3 = {}
  l_11_3.act_id = l_11_0
  l_11_1(l_11_2, l_11_3)
end

l_0_4.task_daily_week_reward_c2s = function(l_12_0)
  local l_12_1 = l_0_1.send
  local l_12_2 = "task_daily_week_reward_c2s"
  local l_12_3 = {}
  l_12_3.week_id = l_12_0
  l_12_1(l_12_2, l_12_3)
end

l_0_4.task_commit_c2s = function(l_13_0, l_13_1)
  local l_13_2 = l_0_5.get_task_data_by_id(l_13_0)
  if l_13_2 and l_13_2.status and l_13_2.status == l_0_6.task_status.finish then
    l_0_0.brocast(l_0_7.update_task_info, nil, l_13_0)
    return 
  end
  local l_13_3 = l_0_1.send
  local l_13_4 = "task_commit_c2s"
  local l_13_5 = {}
  l_13_5.task_id = l_13_0
  l_13_5.npc_id = l_13_1
  l_13_3(l_13_4, l_13_5)
end

l_0_4.task_accept_c2s = function(l_14_0, l_14_1)
  local l_14_2 = l_0_1.send
  local l_14_3 = "task_accept_c2s"
  local l_14_4 = {}
  l_14_4.task_id = l_14_0
  l_14_4.npc_id = l_14_1
  l_14_2(l_14_3, l_14_4)
end

l_0_4.task_finish_c2s = function(l_15_0)
  local l_15_1 = l_0_1.send
  local l_15_2 = "task_finish_c2s"
  local l_15_3 = {}
  l_15_3.task_id = l_15_0
  l_15_1(l_15_2, l_15_3)
end

l_0_4.task_long_press_c2s = function()
  l_0_1.send("task_long_press_c2s", {})
end

l_0_4.task_main_task_c2s = function()
  l_0_1.send("task_main_task_c2s", {})
end

l_0_4.task_role_gem_look_c2s = function()
  l_0_1.send("task_role_gem_look_c2s", {})
end

l_0_4.on_task_info_s2c = function(l_19_0, l_19_1)
  if not l_19_0 == 0 then
    return 
  end
  local l_19_2 = l_0_5.set_value
  local l_19_3 = "has_click_exchange_task"
  l_19_2(l_19_3, l_0_10.get_player_data("has_click_exchange_task", "number", 0) == 1)
  l_19_2 = l_0_5
  l_19_2 = l_19_2.init_task_data
  l_19_3 = l_19_1
  l_19_2(l_19_3)
  l_19_2 = l_0_6
  l_19_2 = l_19_2.daily_task_setting
  l_19_3 = l_19_1.type
  l_19_2 = l_19_2[l_19_3]
  if l_19_2 then
    l_19_2 = l_0_3
    l_19_2 = l_19_2.check_daily_task
    l_19_3 = l_19_1.type
    l_19_2(l_19_3)
  end
  l_19_2 = l_0_2
  l_19_2 = l_19_2.update_red_point
  l_19_3 = l_0_6
  l_19_3 = l_19_3.task_red_point_id
  l_19_2(l_19_3)
  l_19_2 = l_0_3
  l_19_2 = l_19_2.trigger_task_red_point
  l_19_3 = l_19_1.type
  l_19_2(l_19_3)
  l_19_2 = l_0_0
  l_19_2 = l_19_2.brocast
  l_19_3 = "after_task_info_s2c"
  l_19_2(l_19_3, l_19_1.type)
end

l_0_4.on_task_daily_liveness_info_s2c = function(l_20_0, l_20_1)
  if not l_20_0 == 0 then
    return 
  end
  l_0_5.update_daily_liveness_data(l_20_1)
end

l_0_4.on_task_commit_s2c = function(l_21_0, l_21_1)
  if not l_21_0 == 0 then
    return 
  end
  l_0_5.finish_task(l_21_1.task_id)
  if l_0_6.daily_task_setting[l_21_1.type] then
    l_0_3.check_daily_task(l_21_1.type)
  else
    if l_21_1.type == l_0_6.task_type.main then
      local l_21_2 = l_0_5.get_task_data_by_type(l_0_6.task_type.main)
      local l_21_3 = 1
      l_0_5.set_value("show_task_type_index", l_21_3)
    else
      if l_21_1.type == l_0_6.task_type.career_pve then
        l_0_3.check_career_pve_task_tips_cache(l_21_1)
      end
    end
  end
  l_0_3.trigger_task_red_point(l_21_1.type)
  l_0_0.brocast("update_task_main_reward")
  l_0_0.brocast("hook_gift_task_refresh")
  l_0_0.brocast(l_0_7.update_recent_main_task)
end

l_0_4.on_task_update_s2c = function(l_22_0, l_22_1)
  if not l_22_0 == 0 then
    return 
  end
  l_0_5.update_task_data(l_22_1)
  if l_0_6.daily_task_setting[l_22_1.type] then
    l_0_3.check_daily_task(l_22_1.type)
  end
  l_0_3.trigger_task_red_point(l_22_1.type)
  l_0_2.update_red_point(l_0_6.task_red_point_id)
  l_0_2.update_red_point("strength_return_task_red_point")
end

l_0_4.on_task_delete_s2c = function(l_23_0, l_23_1)
  if not l_23_0 == 0 then
    return 
  end
  l_0_5.delete_task_data(l_23_1)
  if l_0_6.daily_task_setting[l_23_1.type] then
    l_0_3.check_daily_task(l_23_1.type)
  end
  l_0_2.update_red_point(l_0_6.task_red_point_id)
  l_0_2.update_red_point("daily_task_tab_red_point")
  l_0_2.update_red_point("alliance_daily_task_red_point")
end

l_0_4.on_task_daily_liveness_reward_s2c = function(l_24_0, l_24_1)
  if not l_24_0 == 0 then
    return 
  end
  l_0_5.update_liveness_reward(l_24_1)
  l_0_2.update_red_point("daily_task_tab_red_point")
  l_0_2.update_red_point("daily_task_reward_red_point_total")
end

l_0_4.on_task_daily_week_reward_s2c = function(l_25_0, l_25_1)
  if not l_25_0 == 0 then
    return 
  end
  l_0_5.update_week_point_reward(l_25_1)
  l_0_2.update_red_point("daily_task_tab_red_point")
end

l_0_4.on_task_start_alliance_trust_s2c = function(l_26_0, l_26_1)
  if not l_26_0 == 0 then
    return 
  end
end

l_0_4.on_task_accept_s2c = function(l_27_0, l_27_1)
  if not l_27_0 == 0 then
    return 
  end
  l_0_5.accept_task(l_27_1)
  l_0_0.brocast(l_0_7.update_task_info, nil, l_27_1.task_id)
end

l_0_4.on_task_finish_s2c = function(l_28_0, l_28_1)
  if not l_28_0 == 0 then
    return 
  end
  l_0_5.finish_task(l_28_1)
  l_0_0.brocast(l_0_7.update_task_info, nil, l_28_1.task_id)
end

l_0_4.on_task_alliance_trust_reward_s2c = function(l_29_0, l_29_1)
  if l_29_0 ~= 0 then
    return 
  end
  if l_29_1.list then
    local l_29_2 = {}
    l_29_2.img_title = l_0_8.set
    l_29_2.items = {}
    for l_29_6,l_29_7 in ipairs(l_29_1.list) do
      local l_29_8 = table.insert
      local l_29_9 = l_29_2.items
      local l_29_10 = {}
      l_29_10.item_cid = l_29_7.k
      l_29_10.number = l_29_7.v
      l_29_8(l_29_9, l_29_10)
    end
    l_0_8.show_reward_display(l_29_2)
  end
end

l_0_4.on_role_equip_be_task_s2c = function(l_30_0, l_30_1)
  if l_30_0 ~= 0 then
    return 
  end
  l_0_5.update_role_equip_be_task(l_30_1.list)
end

l_0_4.on_task_main_info_s2c = function(l_31_0, l_31_1)
  if l_31_0 ~= 0 then
    return 
  end
  l_0_5.update_main_info(l_31_1)
  l_0_0.brocast("update_task_main_reward")
  l_0_2.update_red_point("task_main_red_point")
end

l_0_4.on_task_receive_main_reward_s2c = function(l_32_0, l_32_1)
  if l_32_0 ~= 0 then
    return 
  end
  l_0_5.get_main_stage_reward(l_32_1.id)
  l_0_5.get_task_career_reward(l_32_1.id)
  l_0_2.update_red_point("task_other_red_point")
  l_0_2.update_red_point("task_other_show_red_point")
  l_0_0.brocast("update_task_main_reward")
  l_0_0.brocast(l_0_7.update_task_career_info)
end

l_0_4.on_task_career_info_s2c = function(l_33_0, l_33_1)
  if l_33_0 ~= 0 then
    return 
  end
  l_0_5.update_task_career_info(l_33_1)
  l_0_0.brocast(l_0_7.update_task_career_info)
end

local l_0_11 = {}
l_0_4.on_task_batch_commit_s2c = function(l_34_0, l_34_1)
  if l_34_1.task_list and #l_34_1.task_list > 0 then
    l_0_5.finish_batch_task(l_34_1.task_list)
    table.clear(l_0_11)
    for l_34_5,l_34_6 in ipairs(l_34_1.task_list) do
      local l_34_7 = l_0_9.get_task_cfg(l_34_6)
      l_0_11[l_34_7.task_tp] = true
    end
    for l_34_11,l_34_12 in pairs(l_0_11) do
      l_0_3.trigger_task_red_point(l_34_11)
    end
    l_0_0.brocast("hook_gift_task_refresh")
  end
end

l_0_4.on_task_main_task_s2c = function(l_35_0, l_35_1)
  l_0_5.set_recent_finish_main_task_list(l_35_1.list)
  l_0_0.brocast(l_0_7.update_recent_main_task)
end


