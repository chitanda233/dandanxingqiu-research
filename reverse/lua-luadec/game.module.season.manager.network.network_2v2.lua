-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua6_573512\game.module.season.manager.network.network_2v2_-241261701606697360.bin 

local l_0_0 = DataConfigs
local l_0_1 = l_0_0.ranked_match_misc
local l_0_2 = Game
local l_0_3 = l_0_2.server_time
local l_0_4 = import("..head")
local l_0_5 = l_0_4.network_2v2
local l_0_6 = l_0_4.data_2v2
local l_0_7 = l_0_4.event
local l_0_8 = l_0_4.const
local l_0_9 = l_0_8.v2_champion_apply_option
local l_0_10 = l_0_2.module.data
local l_0_11 = l_0_2.events
local l_0_12 = require("game.network.network_utils")
local l_0_13 = l_0_2.redpoint_helper
local l_0_14 = l_0_2.ui_manager
l_0_5.init = function()
  local l_1_0 = l_0_5
  local l_1_1 = {}
  l_1_1.ranked_match_evaluation_info_s2c = l_0_5.on_ranked_match_evaluation_info_s2c
  l_1_1.ranked_match_evaluation_fight_result_s2c = l_0_5.on_ranked_match_evaluation_fight_result_s2c
  l_1_1.ranked_match_receive_evaluation_reward_s2c = l_0_5.on_ranked_match_receive_evaluation_reward_s2c
  l_1_1.ranked_match_enter_evaluation_s2c = l_0_5.on_ranked_match_enter_evaluation_s2c
  l_1_1.ranked_match_champion_role_list_s2c = l_0_5.on_ranked_match_champion_role_list_s2c
  l_1_1.ranked_match_champion_team_list_s2c = l_0_5.on_ranked_match_champion_team_list_s2c
  l_1_1.ranked_match_champion_update_team_info_s2c = l_0_5.on_ranked_match_champion_update_team_info_s2c
  l_1_1.ranked_match_champion_role_info_s2c = l_0_5.on_ranked_match_champion_role_info_s2c
  l_1_1.ranked_match_champion_set_team_s2c = l_0_5.on_ranked_match_champion_set_team_s2c
  l_1_1.ranked_match_champion_apply_s2c = l_0_5.on_ranked_match_champion_apply_s2c
  l_1_1.ranked_match_update_champion_apply_s2c = l_0_5.on_ranked_match_update_champion_apply_s2c
  l_1_1.ranked_match_champion_handle_apply_s2c = l_0_5.on_ranked_match_champion_handle_apply_s2c
  l_1_1.ranked_match_champion_handle_apply_result_s2c = l_0_5.on_ranked_match_champion_handle_apply_result_s2c
  l_1_1.ranked_match_champion_fight_s2c = l_0_5.on_ranked_match_champion_fight_s2c
  l_1_1.ranked_match_champion_fight_turn_s2c = l_0_5.on_ranked_match_champion_fight_turn_s2c
  l_1_1.ranked_match_champion_fight_info_s2c = l_0_5.on_ranked_match_champion_fight_info_s2c
  l_1_1.ranked_match_use_item_s2c = l_0_5.on_ranked_match_use_item_s2c
  l_1_1.ranked_match_role_info_s2c = l_0_5.on_ranked_match_role_info_s2c
  l_1_1.ranked_match_champion_fight_result_s2c = l_0_5.on_ranked_match_champion_fight_result_s2c
  l_1_1.ranked_match_receive_season_rank_s2c = l_0_5.on_ranked_match_receive_season_rank_s2c
  l_1_1.ranked_match_champion_guess_info_s2c = l_0_5.on_ranked_match_champion_guess_info_s2c
  l_1_1.ranked_match_update_champion_guess_s2c = l_0_5.on_ranked_match_update_champion_guess_s2c
  l_1_1.ranked_match_update_champion_guess_log_s2c = l_0_5.on_ranked_match_update_champion_guess_log_s2c
  l_1_1.ranked_match_champion_guess_s2c = l_0_5.on_ranked_match_champion_guess_s2c
  l_1_1.ranked_match_champion_guess_role_s2c = l_0_5.on_ranked_match_champion_guess_role_s2c
  l_1_1.ranked_match_champion_subscribe_s2c = l_0_5.on_ranked_match_champion_subscribe_s2c
  l_1_1.ranked_match_push_champion_battle_start_s2c = l_0_5.on_ranked_match_push_champion_battle_start_s2c
  l_1_1.ranked_match_get_champion_members_s2c = l_0_5.on_ranked_match_get_champion_members_s2c
  l_1_0.season_2v2_events = l_1_1
  l_1_0 = l_0_12
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_5
  l_1_1 = l_1_1.season_2v2_events
  l_1_0(l_1_1, "season_2v2")
end

l_0_5.clear = function()
  l_0_12.unlisten_net_events(l_0_5.season_2v2_events)
end

l_0_5.req_ranked_match_evaluation_info_c2s = function()
  l_0_12.send("ranked_match_evaluation_info_c2s", {})
end

l_0_5.on_ranked_match_evaluation_info_s2c = function(l_4_0, l_4_1)
  local l_4_2 = l_4_1.list
  l_0_6.init_2v2_evaluation_info(l_4_2)
  l_0_11.brocast(l_0_7.season_2v2_evaluation_changed)
  local l_4_3 = l_4_1.reward_list
  if l_4_3 and #l_4_3 > 0 then
    l_0_6.init_2v2_evaluation_reward_info(l_4_3)
    l_0_11.brocast(l_0_7.season_2v2_evaluation_reward_changed)
  end
  l_0_13.update_red_point("season_2v2_evaluation_reward")
end

l_0_5.req_ranked_match_enter_evaluation_c2s = function(l_5_0)
  local l_5_1 = l_0_12.send
  local l_5_2 = "ranked_match_enter_evaluation_c2s"
  local l_5_3 = {}
  l_5_3.boss_id = l_5_0
  l_5_1(l_5_2, l_5_3)
end

l_0_5.on_ranked_match_enter_evaluation_s2c = function(l_6_0, l_6_1)
end

l_0_5.on_ranked_match_evaluation_fight_result_s2c = function(l_7_0, l_7_1)
  if not l_7_1.info then
    return 
  end
end

l_0_5.req_ranked_match_receive_evaluation_reward_c2s = function(l_8_0)
  local l_8_1 = l_0_12.send
  local l_8_2 = "ranked_match_receive_evaluation_reward_c2s"
  local l_8_3 = {}
  l_8_3.reward_list = l_8_0
  l_8_1(l_8_2, l_8_3)
end

l_0_5.on_ranked_match_receive_evaluation_reward_s2c = function(l_9_0, l_9_1)
  local l_9_2 = l_9_1.reward_list
  if not l_9_2 or #l_9_2 == 0 then
    return 
  end
  l_0_6.update_2v2_evaluation_rewards(l_9_2)
  l_0_11.brocast(l_0_7.season_2v2_evaluation_reward_changed, l_9_2)
  l_0_13.update_red_point("season_2v2_evaluation_reward")
end

l_0_5.req_ranked_match_champion_role_list_c2s = function()
  l_0_12.send("ranked_match_champion_role_list_c2s", {})
end

l_0_5.on_ranked_match_champion_role_list_s2c = function(l_11_0, l_11_1)
  l_0_6.init_2v2_champion_roles(l_11_1)
  l_0_11.brocast(l_0_7.season_2v2_champion_roles_init, l_11_1.role_list)
  local l_11_2 = l_0_10.get_player_id()
  if l_0_6.is_champion_role(l_11_2) then
    l_0_5.req_ranked_match_champion_role_info_c2s()
  else
    l_0_6.set_2v2_champion_my_team_id(nil)
    l_0_11.brocast(l_0_7.season_2v2_champion_role_update)
  end
end

l_0_5.req_ranked_match_champion_team_list_c2s = function()
  l_0_12.send("ranked_match_champion_team_list_c2s", {})
end

l_0_5.on_ranked_match_champion_team_list_s2c = function(l_13_0, l_13_1)
  local l_13_2 = l_13_1.team_list
  l_0_6.init_2v2_champion_teams(l_13_2)
  l_0_6.init_2v2_champion_my_team_id()
  l_0_11.brocast(l_0_7.season_2v2_champion_teams_init)
  l_0_13.update_red_point("season_2v2_champion_team_open")
end

l_0_5.on_ranked_match_champion_update_team_info_s2c = function(l_14_0, l_14_1)
  local l_14_2 = l_14_1.del_team
  if l_14_2 then
    for l_14_6,l_14_7 in ipairs(l_14_2) do
      l_0_6.del_one_team(l_14_7)
    end
  end
  local l_14_8, l_14_14 = l_14_1.team_info
  if l_14_8 then
    l_14_14 = ipairs
    l_14_14 = l_14_14(l_14_8)
    for l_14_12,l_14_13 in l_14_14 do
       -- DECOMPILER ERROR: Confused at declaration of local variable

      l_14_8[l_14_7] = l_0_6.update_one_team(l_0_6.del_one_team)
    end
  end
  l_0_6.init_2v2_champion_my_team_id()
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_0_11.brocast(l_0_7.season_2v2_champion_team_update, l_14_8, l_14_2)
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  l_0_13.update_red_point("season_2v2_champion_team_open")
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_5.req_ranked_match_champion_role_info_c2s = function()
  l_0_12.send("ranked_match_champion_role_info_c2s", {})
end

l_0_5.on_ranked_match_champion_role_info_s2c = function(l_16_0, l_16_1)
  local l_16_2 = l_0_6.update_one_team(l_16_1.team_info)
  l_0_6.set_2v2_champion_my_team_id(l_16_2.team_id)
  l_0_6.init_2v2_champion_apply_info(l_16_1)
  if l_16_1.apply_join_list then
    l_0_13.update_red_point("season_2v2_champion_team_apply")
  end
  l_0_11.brocast(l_0_7.season_2v2_champion_role_update)
  l_0_13.update_red_point("season_2v2_champion_team_open")
end

l_0_5.req_ranked_match_champion_set_team_c2s = function(l_17_0)
  local l_17_1 = l_0_12.send
  local l_17_2 = "ranked_match_champion_set_team_c2s"
  local l_17_3 = {}
  l_17_3.msg = l_17_0
  l_17_1(l_17_2, l_17_3)
end

l_0_5.on_ranked_match_champion_set_team_s2c = function(l_18_0, l_18_1)
  local l_18_2 = l_18_1.msg
  local l_18_3 = l_0_6.get_2v2_champion_my_team()
  if l_18_3 then
    l_18_3.msg = l_18_2
  end
  l_0_11.brocast(l_0_7.season_2v2_champion_team_msg_changed, l_18_3)
  BroadcastTips.broadcast_tips("\230\155\180\230\148\185\233\152\159\228\188\141\229\174\163\232\168\128\230\136\144\229\138\159")
end

l_0_5.req_ranked_match_champion_apply_c2s = function(l_19_0, l_19_1)
  local l_19_2 = l_0_12.send
  local l_19_3 = "ranked_match_champion_apply_c2s"
  local l_19_4 = {}
  l_19_4.team_id = l_19_0
  l_19_4.type = l_19_1
  l_19_2(l_19_3, l_19_4)
end

l_0_5.on_ranked_match_champion_apply_s2c = function(l_20_0, l_20_1)
  local l_20_2 = l_20_1.team_id
  local l_20_3 = l_20_1.type
  l_0_6.update_2v2_champion_apply_info(l_20_2, l_20_3)
  do
    local l_20_4 = l_0_1.team_revert_cd.val or 0
  do
    end
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_0_6.set_2v2_champion_my_apply_cd(l_20_2, l_0_3.get_server_time() + l_20_4)
    l_0_11.brocast(l_0_7.season_2v2_champion_team_apply_changed, l_20_2, l_20_3)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_5.on_ranked_match_update_champion_apply_s2c = function(l_21_0, l_21_1)
  local l_21_2 = l_21_1.role_id
  local l_21_3 = l_21_1.type
  if not l_21_2 or not l_21_3 then
    return 
  end
  l_0_6.update_2v2_champion_join_info(l_21_2, l_21_3)
  l_0_11.brocast(l_0_7.season_2v2_champion_team_join_changed, l_21_3)
end

l_0_5.on_ranked_match_champion_handle_apply_s2c = function(l_22_0, l_22_1)
  local l_22_2 = l_22_1.role_list
  assert(l_22_2)
  local l_22_3 = l_22_1.type
  assert(l_22_3)
  l_0_6.update_2v2_champion_handle_apply(l_22_3, l_22_2)
  l_0_11.brocast(l_0_7.season_2v2_champion_team_apply_handled, l_22_2, l_22_3)
  l_0_13.update_red_point("season_2v2_champion_team_open")
end

l_0_5.req_ranked_match_champion_handle_apply_c2s = function(l_23_0, l_23_1)
  local l_23_2 = l_0_12.send
  local l_23_3 = "ranked_match_champion_handle_apply_c2s"
  local l_23_4 = {}
  l_23_4.role_list = l_23_0
  l_23_4.type = l_23_1
  l_23_2(l_23_3, l_23_4)
end

l_0_5.on_ranked_match_champion_handle_apply_result_s2c = function(l_24_0, l_24_1)
  local l_24_2 = l_24_1.team_id
  do
    local l_24_3 = l_24_1.type
    if l_24_3 == l_0_9.apply then
      l_0_6.set_2v2_champion_my_team_id(l_24_2)
      l_0_6.add_me_to_team(l_24_2)
    else
      do
        local l_24_4 = l_0_1.team_refuse_cd.val or 0
      end
       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused about usage of registers!

      l_0_6.set_2v2_champion_my_apply_cd(l_24_2, l_0_3.get_server_time() + l_24_4)
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_0_6.update_2v2_champion_apply_result(l_24_2, l_24_3)
    l_0_11.brocast(l_0_7.season_2v2_champion_role_update)
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_0_11.brocast(l_0_7.season_2v2_champion_handle_apply, l_24_2, l_24_3)
    l_0_13.update_red_point("season_2v2_champion_team_open")
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_5.req_ranked_match_champion_fight_c2s = function(l_25_0)
  local l_25_1 = l_0_12.send
  local l_25_2 = "ranked_match_champion_fight_c2s"
  local l_25_3 = {}
  l_25_3.group = l_25_0
  l_25_1(l_25_2, l_25_3)
end

l_0_5.on_ranked_match_champion_fight_s2c = function(l_26_0, l_26_1)
  local l_26_2 = l_26_1.group
  local l_26_3 = l_26_1.fight_list
  if not l_26_2 then
    return 
  end
  l_0_6.init_2v2_champion_fight_info(l_26_2, l_26_3)
  l_0_11.brocast(l_0_7.season_2v2_champion_fight_info_changed, l_26_2, l_26_3)
end

l_0_5.req_ranked_match_champion_fight_turn_c2s = function()
  l_0_12.send("ranked_match_champion_fight_turn_c2s", {})
end

l_0_5.on_ranked_match_champion_fight_turn_s2c = function(l_28_0, l_28_1)
  l_0_6.init_2v2_champion_fight_status(l_28_1)
  l_0_11.brocast(l_0_7.season_2v2_champion_fight_status_changed, l_28_1)
  l_0_5.req_ranked_match_champion_fight_info_c2s()
  l_0_13.update_red_point("season_2v2_champion_team_open")
end

l_0_5.req_ranked_match_champion_fight_info_c2s = function()
  l_0_12.send("ranked_match_champion_fight_info_c2s", {})
end

l_0_5.on_ranked_match_champion_fight_info_s2c = function(l_30_0, l_30_1)
  l_0_6.init_2v2_champion_fight_log_infos(l_30_1.list)
  l_0_11.brocast(l_0_7.season_2v2_champion_fight_log_changed, l_30_1.list)
end

l_0_5.req_battle_report_list_c2s = function()
  local l_31_0 = l_0_12.send
  local l_31_1 = "battle_report_list_c2s"
  local l_31_2 = {}
  l_31_2.gameplay_id = l_0_8.season_v2_fight_type_eliminate
  l_31_0(l_31_1, l_31_2)
end

l_0_5.on_battle_report_list_s2c = function(l_32_0, l_32_1)
  local l_32_2 = l_32_1.gameplay_id
  if not l_32_2 or l_32_2 ~= l_0_8.season_v2_fight_type_eliminate then
    return 
  end
  l_0_6.init_2v2_fight_report(l_32_1.list)
  l_0_11.brocast(l_0_7.season_2v2_champion_fight_report_changed, l_32_1)
end

l_0_5.send_ranked_match_role_info_c2s = function()
  l_0_12.send("ranked_match_role_info_c2s", {})
end

l_0_5.on_ranked_match_role_info_s2c = function(l_34_0, l_34_1)
  if l_34_0 == 0 then
    if l_34_1.season_id == 0 then
      l_34_1.season_id = 1
    end
    l_0_6.save_player_info(l_34_1)
    l_0_11.brocast("season_2v2_player_info_changed")
    l_0_13.update_red_point("season_2v2_day_reward")
  end
end

l_0_5.on_ranked_match_champion_fight_result_s2c = function(l_35_0, l_35_1)
  if not l_0_6.update_fight_result(l_35_1) then
    return 
  end
  l_0_13.update_red_point("season_2v2_fight_result")
  l_0_11.brocast(l_0_7.season_2v2_fight_result_changed)
end

l_0_5.send_ranked_match_receive_season_rank_c2s = function(l_36_0)
  local l_36_1 = l_0_12.send
  local l_36_2 = "ranked_match_receive_season_rank_c2s"
  local l_36_3 = {}
  l_36_3.rank_list = l_36_0
  l_36_1(l_36_2, l_36_3)
end

l_0_5.on_ranked_match_receive_season_rank_s2c = function(l_37_0, l_37_1)
  if l_37_0 == 0 then
    for l_37_5,l_37_6 in pairs(l_37_1.rank_list) do
      l_0_6.save_v2_get_season_rank_reward(l_37_6)
    end
    l_0_11.brocast("season_get_season_rank_award")
  end
end

l_0_5.req_ranked_match_use_item_c2s = function()
  l_0_12.send("ranked_match_use_item_c2s", {})
end

l_0_5.on_ranked_match_use_item_s2c = function(l_39_0, l_39_1)
  do
    local l_39_2, l_39_3 = l_39_1.add_star or 0
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_0_11.brocast("use_ranked_protect_card", l_39_2)
end

l_0_5.req_ranked_match_champion_guess_info_c2s = function(l_40_0)
  l_0_5.req_ranked_match_champion_guess_info_callback = l_40_0
  l_0_12.send("ranked_match_champion_guess_info_c2s", {})
end

l_0_5.on_ranked_match_champion_guess_info_s2c = function(l_41_0, l_41_1)
  l_0_6.guess_team_id = l_41_1.my_team_id
  l_0_6.guess_info = l_41_1.guess_info
  l_0_11.brocast(l_0_7.season_2v2_champion_guess)
  if l_0_5.req_ranked_match_champion_guess_info_callback then
    l_0_5.req_ranked_match_champion_guess_info_callback()
    l_0_5.req_ranked_match_champion_guess_info_callback = nil
  end
end

l_0_5.on_ranked_match_update_champion_guess_s2c = function(l_42_0, l_42_1)
  if not l_0_6.guess_info then
    l_0_6.guess_info = {}
  end
  l_0_6.guess_info.show_info = l_42_1.show_info
  l_0_11.brocast(l_0_7.season_2v2_champion_guess)
end

l_0_5.on_ranked_match_update_champion_guess_log_s2c = function(l_43_0, l_43_1)
  if l_0_6.guess_info and l_43_1.guess_log then
    if not l_0_6.guess_info.guess_log then
      l_0_6.guess_info.guess_log = {}
    end
    for l_43_5,l_43_6 in ipairs(l_43_1.guess_log) do
      table.insert(l_0_6.guess_info.guess_log, l_43_6)
    end
    l_0_11.brocast(l_0_7.season_2v2_champion_guess_log)
  end
end

l_0_5.req_ranked_match_champion_guess_c2s = function(l_44_0, l_44_1, l_44_2, l_44_3)
  local l_44_4 = {}
  l_44_4.guess_id = l_44_0
  l_44_4.team_id = l_44_1
  l_44_4.odds = l_44_2
  l_44_4.num = l_44_3
  l_0_12.send("ranked_match_champion_guess_c2s", l_44_4)
end

l_0_5.on_ranked_match_champion_guess_s2c = function(l_45_0, l_45_1)
  l_0_6.update_champion_guess_team_id(l_45_1)
  l_0_11.brocast(l_0_7.season_2v2_champion_guess)
  l_0_14.close_view("SeasonV2ChampionGuessCheerView")
  BroadcastTips.broadcast_tips("\229\138\169\229\168\129\230\136\144\229\138\159")
end

l_0_5.req_ranked_match_champion_guess_role_c2s = function()
  l_0_12.send("ranked_match_champion_guess_role_c2s", {})
end

l_0_5.on_ranked_match_champion_guess_role_s2c = function(l_47_0, l_47_1)
  l_0_6.guess_history = l_47_1.list
  l_0_11.brocast(l_0_7.season_2v2_champion_guess_history)
end

l_0_5.req_ranked_match_champion_subscribe_c2s = function(l_48_0, l_48_1)
  local l_48_2 = l_0_12.send
  local l_48_3 = "ranked_match_champion_subscribe_c2s"
  local l_48_4 = {}
  l_48_4.guess_id = l_48_0
  l_48_4.type = l_48_1
  l_48_2(l_48_3, l_48_4)
end

l_0_5.on_ranked_match_champion_subscribe_s2c = function(l_49_0, l_49_1)
end

l_0_5.on_ranked_match_push_champion_battle_start_s2c = function(l_50_0, l_50_1)
  if l_0_2.module.battle.will_or_is_in_fight() then
    return false
  end
  local l_50_2 = l_0_2.module.nat_match_api.data
  if l_50_2.is_in_nat_champ_fighting_stage() then
    return false
  end
  l_0_14.open_view("SeasonV2ChampionStartView", l_50_1)
end

l_0_5.req_ranked_match_get_champion_members_c2s = function()
  l_0_12.send("ranked_match_get_champion_members_c2s", {})
end

l_0_5.on_ranked_match_get_champion_members_s2c = function(l_52_0, l_52_1)
  l_0_6.set_champion_history_list(l_52_1.list)
  l_0_11.brocast(l_0_7.season_2v2_champion_history)
end


