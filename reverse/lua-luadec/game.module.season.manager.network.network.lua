-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua6_573512\game.module.season.manager.network.network_8258935832480552082.bin 

local l_0_0 = assert
local l_0_1 = table.insert
local l_0_2 = require("game.utils.events")
local l_0_3 = require("game.network.network_utils")
local l_0_4 = require("game.ui.manager.ui_manager.init")
local l_0_5 = import("..head")
local l_0_6 = l_0_5.network
local l_0_7 = l_0_5.data
local l_0_8 = l_0_5.event
local l_0_9 = l_0_5.const
local l_0_10 = DataConfigs.rank_define
local l_0_11 = Game.redpoint_helper
l_0_6.init = function()
  local l_1_0 = l_0_6
  local l_1_1 = {}
  l_1_1.season_info_s2c = l_0_6.on_season_info_s2c
  l_1_1.season_role_info_s2c = l_0_6.on_season_role_info_s2c
  l_1_1.season_receive_rank_s2c = l_0_6.on_season_receive_rank_s2c
  l_1_1.season_receive_season_rank_s2c = l_0_6.on_season_receive_season_rank_s2c
  l_1_1.season_fight_result_s2c = l_0_6.on_season_fight_result_s2c
  l_1_1.team_force_open_match_s2c = l_0_6.on_team_force_open_match_s2c
  l_1_1.season_unlock_s2c = l_0_6.on_season_unlock_s2c
  l_1_1.season_match_succ_s2c = l_0_6.on_season_match_succ_s2c
  l_1_1.season_use_item_s2c = l_0_6.on_season_use_item_s2c
  l_1_1.season_receive_repeat_reward_s2c = l_0_6.on_season_receive_repeat_reward_s2c
  l_1_1.task_season_s2c = l_0_6.on_task_season_s2c
  l_1_1.task_receive_repeat_reward_s2c = l_0_6.on_task_receive_repeat_reward_s2c
  l_1_1.task_receive_season_rank_s2c = l_0_6.on_task_receive_season_rank_s2c
  l_1_1.season_cultivation_info_s2c = l_0_6.on_season_cultivation_info_s2c
  l_1_1.season_cultivation_upgrade_s2c = l_0_6.on_season_cultivation_upgrade_s2c
  l_1_1.season_cultivation_unlock_talent_s2c = l_0_6.on_season_cultivation_unlock_talent_s2c
  l_1_1.season_cultivation_use_talent_s2c = l_0_6.on_season_cultivation_use_talent_s2c
  l_1_1.season_simple_battle_report_s2c = l_0_6.on_season_simple_battle_report_s2c
  l_1_1.battle_report_info_s2c = l_0_6.on_battle_report_info_s2c
  l_1_1.battle_report_like_role_s2c = l_0_6.on_battle_report_like_role_s2c
  l_1_1.battle_report_report_role_s2c = l_0_6.on_battle_report_report_role_s2c
  l_1_1.season_receive_day_reward_s2c = l_0_6.on_season_receive_day_reward_s2c
  l_1_0.net_event_names = l_1_1
  l_1_0 = l_0_3
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_6
  l_1_1 = l_1_1.net_event_names
  l_1_0(l_1_1, "season")
end

l_0_6.clear = function()
  l_0_3.unlisten_net_events(l_0_6.net_event_names)
end

l_0_6.season_rank_c2s = function(l_3_0)
  local l_3_1 = l_0_3.send
  local l_3_2 = "season_rank_c2s"
  local l_3_3 = {}
  l_3_3.role_list = l_3_0
  l_3_1(l_3_2, l_3_3)
end

l_0_6.req_season_info_c2s = function()
  l_0_3.send("season_info_c2s", {})
end

l_0_6.req_season_role_info_c2s = function()
  l_0_3.send("season_role_info_c2s", {})
end

l_0_6.req_season_receive_rank_c2s = function(l_6_0)
  local l_6_1 = l_0_3.send
  local l_6_2 = "season_receive_rank_c2s"
  local l_6_3 = {}
  l_6_3.rank_id = l_6_0
  l_6_1(l_6_2, l_6_3)
end

l_0_6.req_season_receive_season_rank_c2s = function(l_7_0)
  local l_7_1 = l_0_3.send
  local l_7_2 = "season_receive_season_rank_c2s"
  local l_7_3 = {}
  l_7_3.cup = l_7_0
  l_7_1(l_7_2, l_7_3)
end

l_0_6.req_season_receive_repeat_reward_c2s = function(l_8_0)
  local l_8_1 = {}
  l_0_3.send("season_receive_repeat_reward_c2s", l_8_1)
end

local l_0_12 = nil
l_0_6.req_team_force_open_match_c2s = function(l_9_0, l_9_1)
  l_0_12 = l_9_1
  local l_9_2 = l_0_3.send
  local l_9_3 = "team_open_match_c2s"
  local l_9_4 = {}
  l_9_4.target = l_9_0
  l_9_2(l_9_3, l_9_4)
end

l_0_6.req_season_use_item_c2s = function()
  l_0_3.send("season_use_item_c2s", {})
end

l_0_6.req_season_report_c2s = function(l_11_0, l_11_1, l_11_2)
  local l_11_3 = l_0_3.send
  local l_11_4 = "content_moderation_complaint_c2s"
  local l_11_5 = {}
  l_11_5.role_id = l_11_0
  l_11_5.reason = l_11_1
  l_11_5.msg = l_11_2
  l_11_3(l_11_4, l_11_5)
end

l_0_6.req_season_cultivation_info_c2s = function()
  l_0_3.send("season_cultivation_info_c2s", {})
end

l_0_6.req_season_cultivation_upgrade_c2s = function()
  l_0_3.send("season_cultivation_upgrade_c2s", {})
end

l_0_6.req_season_cultivation_unlock_talent_c2s = function(l_14_0)
  local l_14_1 = l_0_3.send
  local l_14_2 = "season_cultivation_unlock_talent_c2s"
  local l_14_3 = {}
  l_14_3.talent_id = l_14_0
  l_14_1(l_14_2, l_14_3)
end

l_0_6.req_season_cultivation_use_talent_c2s = function(l_15_0)
  local l_15_1 = l_0_3.send
  local l_15_2 = "season_cultivation_use_talent_c2s"
  local l_15_3 = {}
  l_15_3.talent_id = l_15_0
  l_15_1(l_15_2, l_15_3)
end

l_0_6.req_season_simple_battle_report_c2s = function(l_16_0, l_16_1)
  local l_16_2 = l_0_3.send
  local l_16_3 = "season_simple_battle_report_c2s"
  local l_16_4 = {}
  l_16_4.page = l_16_0
  l_16_4.size = l_16_1
  l_16_2(l_16_3, l_16_4)
end

l_0_6.req_battle_report_info_c2s = function(l_17_0)
  local l_17_1 = l_0_3.send
  local l_17_2 = "battle_report_info_c2s"
  local l_17_3 = {}
  l_17_3.report_id = l_17_0
  l_17_1(l_17_2, l_17_3)
end

l_0_6.req_battle_report_like_role_c2s = function(l_18_0, l_18_1)
  local l_18_2 = l_0_3.send
  local l_18_3 = "battle_report_like_role_c2s"
  local l_18_4 = {}
  l_18_4.report_id = l_18_0
  l_18_4.role_id = l_18_1
  l_18_2(l_18_3, l_18_4)
end

l_0_6.req_battle_report_report_role_c2s = function(l_19_0, l_19_1, l_19_2, l_19_3)
  local l_19_4 = l_0_3.send
  local l_19_5 = "battle_report_report_role_c2s"
  local l_19_6 = {}
  l_19_6.report_id = l_19_0
  l_19_6.role_id = l_19_1
  l_19_6.reason = l_19_2
  l_19_6.msg = l_19_3
  l_19_4(l_19_5, l_19_6)
end

l_0_6.on_season_unlock_s2c = function(l_20_0, l_20_1)
  l_0_7.update_map_env_list(l_20_1)
end

l_0_6.on_season_match_succ_s2c = function(l_21_0, l_21_1)
  l_0_5.match_succ_finish_cb = nil
  l_0_4.open_view("MatchSuccessView", l_21_1)
  l_0_2.brocast("team_match_success")
end

l_0_6.on_season_use_item_s2c = function(l_22_0, l_22_1)
  do
    local l_22_2, l_22_3, l_22_4 = l_22_1.add_cup or 0
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_0_7.player_info.rank.cup = l_0_7.player_info.rank.cup + l_22_2
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_0_2.brocast("use_protect_card", l_22_2)
end

l_0_6.on_season_receive_repeat_reward_s2c = function(l_23_0, l_23_1)
  local l_23_2 = l_23_1.num
  if not l_23_2 then
    return 
  end
  l_0_7.set_season_reward_overflow(l_23_2)
  l_0_2.brocast("season_get_season_rank_extra_award")
  Game.redpoint_helper.update_red_point("season_cup_reward_redpoint")
end

l_0_6.on_team_force_open_match_s2c = function(l_24_0, l_24_1)
  if l_0_12 then
    l_0_12(l_24_0, l_24_1)
  end
end

l_0_6.on_season_info_s2c = function(l_25_0, l_25_1)
  l_0_0(l_25_1.season_id)
  l_0_0(l_25_1.status)
  if l_25_1.season_id == 0 then
    l_25_1.season_id = 1
  end
  l_0_7.save_season_info(l_25_1)
  l_0_2.brocast(l_0_8.season_info_changed)
end

l_0_6.on_season_role_info_s2c = function(l_26_0, l_26_1)
  l_0_0(l_26_1)
  l_0_7.update_player_info(l_26_1)
  if l_26_1.season_id == 0 then
    l_26_1.season_id = 1
  end
  l_0_2.brocast("season_player_info_changed", l_0_7.player_info)
  l_0_5.refresh_all_award_red_point()
  l_0_5.report_season_score()
  l_0_5.network_pve.req_task_season_c2s()
  l_0_2.brocast(l_0_8.season_2v2_day_reward)
  l_0_11.update_red_point("season_2v2_day_reward")
  for l_26_5,l_26_6 in pairs(l_0_9.season_balance_redpoint) do
    if l_0_5.get_season_balance_red_point(l_26_5) then
      l_0_11.update_red_point(l_26_6)
    end
  end
end

l_0_6.on_season_receive_rank_s2c = function(l_27_0, l_27_1)
  local l_27_2 = l_27_1.rank_id
  if not l_27_2 then
    return 
  end
  l_0_7.save_get_rank_award(l_27_2)
  l_0_2.brocast(l_0_8.season_get_rank_award, l_27_2)
  Game.redpoint_helper.update_red_point(l_0_5.get_rank_first_award_red_point_id(l_27_2))
end

l_0_6.on_season_receive_season_rank_s2c = function(l_28_0, l_28_1)
  if not l_28_1.cup then
    return 
  end
  for l_28_5,l_28_6 in pairs(l_28_1.cup) do
    l_0_7.save_get_season_rank_award(l_28_6)
    l_0_2.brocast("season_get_season_rank_award", l_28_6)
    Game.redpoint_helper.update_red_point(l_0_5.get_rank_season_award_red_point_id(l_28_6))
    Game.redpoint_helper.update_red_point("season_cup_reward_redpoint")
    if l_28_6 == 2200 then
      local l_28_7 = require("game.platform.fnsdk.fnsdk_interface")
      l_28_7.iOS_store_guide("iOS_store_guide_get_2200_cup")
    end
  end
  l_0_5.check_pop_reach_mode_unlock(l_28_1.cup)
end

l_0_6.on_season_fight_result_s2c = function(l_29_0, l_29_1)
end

l_0_6.trans_target = function(l_30_0)
  if l_30_0.target then
    local l_30_1 = l_30_0.target
    l_30_0.target = l_30_1.target
    l_30_0.type = l_30_1.type
    l_30_0.args = l_30_1.arg
    l_30_0.extend_type = l_30_1.extend_type
    if l_30_1.type == 0 then
      l_30_1.type = 1
      l_30_1.target = 1
      l_30_0.type = 1
      l_30_0.target = 1
    end
  end
end

l_0_6.on_team_open_match_s2c = function(l_31_0, l_31_1)
  if l_31_0 ~= 0 then
    return 
  end
  l_0_2.brocast("team_open_match_success")
end

l_0_6.on_team_stop_match_s2c = function()
end

l_0_6.on_team_ready_s2c = function()
end

l_0_6.on_team_cancel_ready_s2c = function()
  l_0_2.brocast("room_cancel_ready")
end

l_0_6.on_season_cultivation_info_s2c = function(l_35_0, l_35_1)
  if l_35_0 ~= 0 then
    return 
  end
  l_0_7.cutivation_info = l_35_1
  Game.redpoint_helper.update_red_point("season_cultivate_upgrade_redpoint")
  Game.redpoint_helper.update_red_point("season_cultivate_equip_redpoint")
end

l_0_6.on_season_cultivation_upgrade_s2c = function(l_36_0, l_36_1)
  if l_36_0 ~= 0 then
    return 
  end
  l_0_7.cutivation_info.level = l_36_1.level
  l_0_2.brocast("update_season_cultivation_talent")
  l_0_2.brocast("upgrade_season_cultivation_level", l_36_1.level)
  Game.redpoint_helper.update_red_point("season_cultivate_upgrade_redpoint")
  Game.redpoint_helper.update_red_point("season_cultivate_equip_redpoint")
end

l_0_6.on_season_cultivation_unlock_talent_s2c = function(l_37_0, l_37_1)
  if l_37_0 ~= 0 then
    return 
  end
  if not l_0_7.cutivation_info.unlock_talent_ids then
    l_0_7.cutivation_info.unlock_talent_ids = {}
  end
  l_0_1(l_0_7.cutivation_info.unlock_talent_ids, l_37_1.talent_id)
  Game.redpoint_helper.update_red_point("season_cultivate_equip_redpoint")
  l_0_2.brocast("update_season_cultivation_talent")
end

l_0_6.on_season_cultivation_use_talent_s2c = function(l_38_0, l_38_1)
  if l_38_0 ~= 0 then
    return 
  end
  l_0_7.cutivation_info.use_talent_id = l_38_1.talent_id
  l_0_2.brocast("update_season_cultivation_talent")
  Game.redpoint_helper.update_red_point("season_cultivate_equip_redpoint")
end

l_0_6.on_season_simple_battle_report_s2c = function(l_39_0, l_39_1)
  if l_39_0 ~= 0 then
    return 
  end
  if not l_39_1.size or l_39_1.size == 0 or not l_39_1.report_list then
    return 
  end
  for l_39_5,l_39_6 in pairs(l_39_1.report_list) do
    l_39_6.play_type = 102
  end
  table.sort(l_39_1.report_list, function(l_1_0, l_1_1)
    return l_1_1.time < l_1_0.time
   end)
  l_0_7.battle_report_total_num = l_39_1.report_num
  local l_39_7, l_39_9 = l_0_7.battle_report_list
  l_39_9 = l_39_1.page
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    l_39_7[l_39_9] = l_39_1.report_list
    l_39_7 = l_0_2
    l_39_7 = l_39_7.brocast
    l_39_9 = "update_battle_report_list"
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_39_7(l_39_9)
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_6.on_battle_report_info_s2c = function(l_40_0, l_40_1)
  if l_40_0 ~= 0 then
    return 
  end
  if not l_40_1.report_id then
    return 
  end
  local l_40_2 = l_0_7.battle_report_info
  local l_40_3 = l_40_1.report_id
  l_40_2[l_40_3] = l_40_1.battle_record
  l_40_2 = l_0_7
  l_40_2 = l_40_2.battle_report_info
  l_40_3 = l_40_1.report_id
  l_40_2 = l_40_2[l_40_3]
  l_40_3 = l_40_1.like_role
  if not l_40_3 then
    l_40_3 = {}
  end
  l_40_2.like_role = l_40_3
  l_40_2 = l_0_7
  l_40_2 = l_40_2.battle_report_info
  l_40_3 = l_40_1.report_id
  l_40_2 = l_40_2[l_40_3]
  l_40_3 = l_40_1.report_role
  if not l_40_3 then
    l_40_3 = {}
  end
  l_40_2.report_role = l_40_3
  l_40_2 = l_0_2
  l_40_2 = l_40_2.brocast
  l_40_3 = "get_battle_report_info"
  l_40_2(l_40_3)
end

l_0_6.on_battle_report_like_role_s2c = function(l_41_0, l_41_1)
  if l_41_0 ~= 0 then
    return 
  end
  if not l_0_7.battle_report_info[l_41_1.report_id] or not l_41_1.role_id then
    return 
  end
  if not l_0_7.battle_report_info[l_41_1.report_id].like_role then
    l_0_7.battle_report_info[l_41_1.report_id].like_role = {}
  end
  l_0_1(l_0_7.battle_report_info[l_41_1.report_id].like_role, l_41_1.role_id)
end

l_0_6.on_battle_report_report_role_s2c = function(l_42_0, l_42_1)
  if l_42_0 ~= 0 then
    return 
  end
  if not l_0_7.battle_report_info[l_42_1.report_id] or not l_42_1.role_id then
    return 
  end
  if not l_0_7.battle_report_info[l_42_1.report_id].report_role then
    l_0_7.battle_report_info[l_42_1.report_id].report_role = {}
  end
  l_0_1(l_0_7.battle_report_info[l_42_1.report_id].report_role, l_42_1.role_id)
end

l_0_6.req_season_receive_day_reward_c2s = function()
  l_0_3.send("season_receive_day_reward_c2s", {})
end

l_0_6.on_season_receive_day_reward_s2c = function(l_44_0, l_44_1)
  if l_0_7.player_info then
    if l_44_1.day_protect then
      l_0_7.player_info.day_protect = l_44_1.day_protect
    end
    if l_44_1.day_protect_max then
      l_0_7.player_info.day_protect_max = l_44_1.day_protect_max
    end
    l_0_7.player_info.is_receive_day_reward = 1
  end
  l_0_2.brocast(l_0_8.season_2v2_day_reward)
  l_0_11.update_red_point("season_2v2_day_reward")
  local l_44_2 = {}
  l_44_2.items = {}
  if l_44_1.day_protect_max and l_44_1.day_protect_max > 0 then
    l_44_2.ext_tips = string.format("\228\187\138\230\151\165\229\137\141%s\229\156\186\230\142\146\228\189\141\232\181\155<color=#8DF19E>\229\164\177\232\180\165\228\184\141\230\137\163\230\157\175\230\149\176</color>", l_44_1.day_protect_max)
  end
  for l_44_6,l_44_7 in ipairs(l_0_10.daily_reward.val) do
    local l_44_8 = table.insert
    local l_44_9 = l_44_2.items
    local l_44_10 = {}
    l_44_10.item_cid = l_44_7[1]
    l_44_10.number = l_44_7[2]
    l_44_8(l_44_9, l_44_10)
  end
  Game.module.common_view.show_reward_display(l_44_2)
end


