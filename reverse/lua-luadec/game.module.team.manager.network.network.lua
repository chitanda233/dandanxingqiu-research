-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.network.network_-5480163981327235990.bin 

local l_0_0 = Game.events
local l_0_1 = require("game.network.network_utils")
local l_0_2 = Game.ui_manager
local l_0_3 = Game.module.open_func
local l_0_4 = require("game.module.common_view.manager.confirm")
local l_0_5 = Game.module.data
local l_0_6 = l_0_5.const
local l_0_7 = Game.redpoint_helper
local l_0_8 = Game.module.scene_manager
local l_0_9 = import("..head")
local l_0_10 = l_0_9.network
local l_0_11, l_0_12, l_0_13 = nil, nil, nil
local l_0_14 = l_0_9.data
local l_0_15 = l_0_9.const
local l_0_16 = l_0_9.event
local l_0_17 = DataConfigs.team_misc
local l_0_18 = DataConfigs.language_define
local l_0_19 = DataConfigs.team_target
local l_0_20 = DataConfigs.avatar_act
local l_0_21 = require("game.utils.sound_manager")
local l_0_22 = Game.server_time
local l_0_23 = l_0_17.team_recruit_amount.val
local l_0_24 = false
local l_0_25 = 2
local l_0_26 = {}
l_0_26.role_ids = {}
l_0_26.key_list = l_0_6.cross_open_func_key
l_0_10.init = function()
  l_0_11 = Game.module.season
  upvalue_512 = l_0_11.data_2v2
  upvalue_1024 = l_0_11.const
  local l_1_0 = l_0_10
  local l_1_1 = {}
  l_1_1.team_info_s2c = l_0_10.on_team_info_s2c
  l_1_1.team_create_s2c = l_0_10.on_team_create_s2c
  l_1_1.team_update_role_s2c = l_0_10.on_team_update_role_s2c
  l_1_1.team_quit_s2c = l_0_10.on_team_quit_s2c
  l_1_1.team_quit_info_s2c = l_0_10.on_team_quit_info_s2c
  l_1_1.team_change_leader_s2c = l_0_10.on_team_change_leader_s2c
  l_1_1.team_apply_s2c = l_0_10.on_team_apply_s2c
  l_1_1.team_apply_list_s2c = l_0_10.on_team_apply_list_s2c
  l_1_1.team_receive_apply_s2c = l_0_10.on_team_receive_apply_s2c
  l_1_1.team_handle_apply_s2c = l_0_10.on_team_handle_apply_s2c
  l_1_1.team_invite_s2c = l_0_10.on_team_invite_s2c
  l_1_1.team_receive_invite_s2c = l_0_10.on_team_receive_invite_s2c
  l_1_1.season_invite_s2c = l_0_10.on_season_invite_s2c
  l_1_1.team_invite_list_s2c = l_0_10.on_team_invite_list_s2c
  l_1_1.team_handle_invite_s2c = l_0_10.on_team_handle_invite_s2c
  l_1_1.team_request_invite_s2c = l_0_10.on_team_request_invite_s2c
  l_1_1.team_kick_s2c = l_0_10.on_team_kick_s2c
  l_1_1.team_handover_leader_s2c = l_0_10.on_team_handover_leader_s2c
  l_1_1.team_handle_apply_leader_s2c = l_0_10.on_team_handle_apply_leader_s2c
  l_1_1.team_dismiss_s2c = l_0_10.on_team_dismiss_s2c
  l_1_1.team_role_info_s2c = l_0_10.on_team_role_info_s2c
  l_1_1.team_role_join_s2c = l_0_10.on_team_role_join_s2c
  l_1_1.team_update_target_s2c = l_0_10.on_team_update_target_s2c
  l_1_1.team_open_recruit_s2c = l_0_10.on_team_open_recruit_s2c
  l_1_1.team_stop_recruit_s2c = l_0_10.on_team_stop_recruit_s2c
  l_1_1.team_auto_match_s2c = l_0_10.on_team_auto_match_s2c
  l_1_1.team_stop_auto_match_s2c = l_0_10.on_team_stop_auto_match_s2c
  l_1_1.role_list_s2c = l_0_10.on_role_list_s2c
  l_1_1.team_be_kick_s2c = l_0_10.on_team_be_kick_s2c
  l_1_1.team_refuse_apply_s2c = l_0_10.on_team_refuse_apply_s2c
  l_1_1.team_cancel_match_s2c = l_0_10.on_team_cancel_match_s2c
  l_1_1.team_set_condition_s2c = l_0_10.on_team_set_condition_s2c
  l_1_1.team_set_options_s2c = l_0_10.on_team_set_options_s2c
  l_1_1.team_match_team_s2c = l_0_10.on_team_match_team_s2c
  l_1_1.team_get_team_info_s2c = l_0_10.on_team_get_team_info_s2c
  l_1_1.friend_action_s2c = l_0_10.on_friend_action_s2c
  l_1_1.friend_broadcast_action_s2c = l_0_10.on_friend_broadcast_action_s2c
  l_1_1.team_switch_pos_s2c = l_0_10.on_team_switch_pos_s2c
  l_1_1.team_received_switch_s2c = l_0_10.on_team_received_switch_s2c
  l_1_1.team_handle_switch_s2c = l_0_10.on_team_handle_switch_s2c
  l_1_1.team_switch_result_s2c = l_0_10.on_team_switch_result_s2c
  l_1_1.role_dup_tale_update_s2c = l_0_10.on_role_dup_tale_update_s2c
  l_1_1.role_dup_tale_enter_role_list_s2c = l_0_10.on_role_dup_tale_enter_role_list_s2c
  l_1_1.team_set_message_s2c = l_0_10.on_team_set_message_s2c
  l_1_1.team_list_s2c = l_0_10.on_team_list_s2c
  l_1_1.team_cancel_match_quit_s2c = l_0_10.on_team_cancel_match_quit_s2c
  l_1_1.team_simple_info_s2c = l_0_10.on_team_simple_info_s2c
  l_1_1.team_ready_s2c = l_0_10.on_team_ready_s2c
  l_1_1.team_cancel_ready_s2c = l_0_10.on_team_cancel_ready_s2c
  l_1_1.team_join_team_s2c = l_0_10.on_team_join_team_s2c
  l_1_1.team_open_match_s2c = l_0_10.on_team_open_match_s2c
  l_1_1.team_stop_match_s2c = l_0_10.on_team_stop_match_s2c
  l_1_1.team_del_invite_s2c = l_0_10.on_team_del_invite_s2c
  l_1_1.team_receive_rally_s2c = l_0_10.on_team_receive_rally_s2c
  l_1_1.team_set_setting_s2c = l_0_10.on_team_set_setting_s2c
  l_1_1.team_del_settings_s2c = l_0_10.on_team_del_settings_s2c
  l_1_1.team_del_conditions_s2c = l_0_10.on_team_del_conditions_s2c
  l_1_1.season_handle_invite_s2c = l_0_10.on_season_handle_invite_s2c
  l_1_1.team_wx_share_log_s2c = l_0_10.on_team_wx_share_log_s2c
  l_1_1.team_match_stat_s2c = l_0_10.on_team_match_stat_s2c
  l_1_1.team_role_status_s2c = l_0_10.on_team_role_status_s2c
  l_1_1.avatar_act_request_info_s2c = l_0_10.on_avatar_act_request_info_s2c
  l_1_1.avatar_act_update_s2c = l_0_10.on_avatar_act_update_s2c
  l_1_1.season_demo_info_s2c = l_0_10.on_season_demo_info_s2c
  l_1_1.season_demo_plan_set_s2c = l_0_10.on_season_demo_plan_set_s2c
  l_1_0.net_event_names = l_1_1
  l_1_0 = l_0_1
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_10
  l_1_1 = l_1_1.net_event_names
  l_1_0(l_1_1, "team")
  l_1_0 = l_0_10
  l_1_0.is_first_get_team_info = true
  l_1_0 = l_0_10
  l_1_0.wait_check_timer = nil
end

l_0_10.season_demo_plan_set_c2s = function(l_2_0)
  local l_2_1 = l_0_1.send
  local l_2_2 = "season_demo_plan_set_c2s"
  local l_2_3 = {}
  l_2_3.plan_id = l_2_0
  l_2_1(l_2_2, l_2_3)
end

l_0_10.season_demo_info_c2s = function()
  l_0_1.send("season_demo_info_c2s", {})
end

l_0_10.avatar_act_request_info_c2s = function()
  l_0_1.send("avatar_act_request_info_c2s", {})
end

l_0_10.team_add_bot_c2s = function(l_5_0, l_5_1)
  local l_5_2 = l_0_1.send
  local l_5_3 = "team_add_bot_c2s"
  local l_5_4 = {}
  l_5_4.pos = l_5_0
  l_5_4.bot = l_5_1
  l_5_2(l_5_3, l_5_4)
end

l_0_10.team_switch_pos_c2s = function(l_6_0)
  local l_6_1 = l_0_1.send
  local l_6_2 = "team_switch_pos_c2s"
  local l_6_3 = {}
  l_6_3.pos = l_6_0
  l_6_1(l_6_2, l_6_3)
end

l_0_10.team_set_setting_c2s = function(l_7_0)
  local l_7_1 = l_0_1.send
  local l_7_2 = "team_set_setting_c2s"
  local l_7_3 = {}
  l_7_3.settings = l_7_0
  l_7_1(l_7_2, l_7_3)
end

l_0_10.team_rally_c2s = function(l_8_0)
  BroadcastTips.broadcast_tips("\230\173\163\229\156\168\230\143\144\233\134\146\229\176\154\230\156\170\229\135\134\229\164\135\231\154\132\233\152\159\229\145\152!")
  local l_8_1 = l_0_14.get_value("next_rally_time")
  local l_8_2 = l_0_22.get_server_time()
  if l_8_1 and l_8_2 < l_8_1 then
    return 
  end
  l_0_14.set_value("next_rally_time", l_8_2 + 5)
  local l_8_3 = l_0_1.send
  local l_8_4 = "team_rally_c2s"
  local l_8_5 = {}
  l_8_5.role_id = l_8_0
  l_8_3(l_8_4, l_8_5)
end

l_0_10.team_cancel_ready_c2s = function()
  l_0_1.send("team_cancel_ready_c2s", {})
end

l_0_10.team_ready_c2s = function()
  local l_10_0, l_10_1 = Game.module.nat_match_api.data.is_can_team_ready_by_nat_champ_ready_room()
  if not l_10_0 then
    BroadcastTips.broadcast_tips(l_10_1)
    return 
  end
  l_0_1.send("team_ready_c2s", {})
end

l_0_10.team_stop_match_c2s = function()
  l_0_1.send("team_stop_match_c2s", {})
end

l_0_10.team_stop_match_quit_c2s = function()
  l_0_1.send("team_stop_match_quit_c2s", {})
end

local l_0_27 = {}
l_0_10.team_open_match_c2s = function(l_13_0, l_13_1, l_13_2)
  l_0_21.play_effect("sd_1145")
  local l_13_3 = l_0_27
   -- DECOMPILER ERROR: Confused at declaration of local variable

  if not l_13_0 then
    l_13_3.type = l_0_15.target_main_type.pvp
  end
  l_13_3 = l_0_27
  if not l_13_1 then
    l_13_3.target = l_0_15.pvp_target_type.match
  end
  l_13_3 = l_0_27
  l_13_3.arg = l_13_2
  l_13_3 = l_0_1
  l_13_3 = l_13_3.send
  do
    local l_13_5 = "team_open_match_c2s"
    l_13_3(l_13_5, {target = l_0_27})
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_10.season_handle_invite_c2s = function(l_14_0)
  l_0_14.set_value("season_handle_invite_c2s", l_14_0)
  local l_14_1 = l_0_1.send
  local l_14_2 = "season_handle_invite_c2s"
  local l_14_3 = {}
  l_14_3.robot_id = l_14_0
  l_14_1(l_14_2, l_14_3)
end

l_0_10.role_dup_tale_info_c2s = function()
  l_0_1.send("role_dup_tale_info_c2s", {})
end

l_0_10.role_dup_tale_enter_role_list_c2s = function(l_16_0)
  local l_16_1 = l_0_1.send
  local l_16_2 = "role_dup_tale_enter_role_list_c2s"
  local l_16_3 = {}
  l_16_3.dup_id = l_16_0
  l_16_1(l_16_2, l_16_3)
end

l_0_10.on_role_dup_tale_update_s2c = function(l_17_0, l_17_1)
  if l_17_0 ~= 0 then
    return 
  end
  local l_17_2 = require("game.module.season.manager.legend_fight")
  l_17_2:update_pass_info(l_17_1.info)
  l_0_0.brocast("refresh_legend_fight_pass_info")
end

l_0_10.on_role_dup_tale_enter_role_list_s2c = function(l_18_0, l_18_1)
  if l_18_0 ~= 0 then
    return 
  end
  local l_18_2 = require("game.module.season.manager.legend_fight")
  l_18_2:update_dungeon_info(l_18_1.dup_id, l_18_1.role_list)
  l_0_0.brocast("update_tale_enter_dungeon")
end

l_0_10.team_handle_switch_c2s = function(l_19_0, l_19_1)
  local l_19_2 = l_0_1.send
  local l_19_3 = "team_handle_switch_c2s"
  local l_19_4 = {}
  l_19_4.role_id = l_19_0
  l_19_4.result = l_19_1
  l_19_2(l_19_3, l_19_4)
end

l_0_10.team_info_c2s = function()
  l_0_24 = true
  l_0_1.send("team_info_c2s", {})
end

l_0_10.team_create_c2s = function(l_21_0, l_21_1, l_21_2, l_21_3, l_21_4)
  local l_21_5, l_21_6 = nil, nil
  if l_21_0 ~= l_0_15.target_main_type.pve then
    l_21_6 = string.format("%s_%s_setting", l_21_0, l_21_1)
  else
    l_21_6 = string.format("%s_%s_%s_setting", l_21_0, l_21_1, l_21_2)
  end
  l_21_5 = l_0_14.get_value(l_21_6)
  if l_21_5 then
    l_21_4 = l_21_5.options
    l_21_3 = l_21_5.condition
  end
   -- DECOMPILER ERROR: Overwrote pending register.

   -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

end
local l_21_7 = nil
local l_21_8 = l_0_1.send
l_21_8("team_create_c2s", {target = l_21_7, condition = l_21_3, options = l_21_4})
end

l_0_10.team_quit_c2s = function()
  local l_22_0 = l_0_14.get_teammate_count()
  l_0_14.set_value("pre_teammate_count", l_22_0)
  l_0_1.send("team_quit_c2s", {})
end

l_0_10.team_apply_c2s = function(l_23_0)
  local l_23_1 = l_0_1.send
  local l_23_2 = "team_apply_c2s"
  local l_23_3 = {}
  l_23_3.other_id = l_23_0
  l_23_1(l_23_2, l_23_3)
end

l_0_10.team_apply_list_c2s = function()
  l_0_1.send("team_apply_list_c2s", {})
end

l_0_10.team_handle_apply_c2s = function(l_25_0, l_25_1)
  l_0_14.set_value("handle_apply_role_list", l_25_0)
  l_0_14.set_value("handle_apply_role_result", l_25_1)
  local l_25_2 = l_0_1.send
  local l_25_3 = "team_handle_apply_c2s"
  local l_25_4 = {}
  l_25_4.role_list = l_25_0
  l_25_4.handle = l_25_1
  l_25_2(l_25_3, l_25_4)
end

local l_0_28 = {}
l_0_10.team_invite_c2s = function(l_26_0, l_26_1, l_26_2, l_26_3)
  local l_26_4, l_26_5 = Game.module.nat_match_api.data.is_can_invite_read_room_role_by_nat_champ_ready_room()
  if not l_26_4 then
    BroadcastTips.broadcast_tips(l_26_5)
    return 
  end
  if l_0_5.is_robot(l_26_0) then
    BroadcastTips.broadcast_tips("\229\183\178\229\143\145\233\128\129\233\130\128\232\175\183")
    return 
  end
  l_0_14.set_send_invite_time(l_26_0)
  local l_26_6, l_26_7, l_26_8 = l_0_14.get_team_type_target_args()
  local l_26_9 = l_0_28
   -- DECOMPILER ERROR: Confused at declaration of local variable

  l_26_9.type = l_26_1 or l_26_6
  l_26_9 = l_0_28
  l_26_9.target = l_26_2 or l_26_7
  l_26_9 = l_0_28
  l_26_9.arg = l_26_3 or l_26_8
  l_26_9 = l_0_1
  l_26_9 = l_26_9.send
  do
    local l_26_11 = "team_invite_c2s"
    l_26_9(l_26_11, {role_id = l_26_0, target = l_0_28})
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_10.team_invite_list_c2s = function()
  l_0_1.send("team_invite_list_c2s", {})
end

l_0_10.team_handle_invite_c2s = function(l_28_0, l_28_1)
  l_0_14.set_value("handle_invite_roles", l_28_0)
  for l_28_5,l_28_6 in ipairs(l_28_0) do
    l_0_14.set_value("handle_invite_" .. l_28_6, l_28_1)
  end
  local l_28_7, l_28_10 = l_0_1.send
  l_28_10 = "team_handle_invite_c2s"
   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
    local l_28_9, l_28_12 = {}
    l_28_9.role_id = l_28_0
    l_28_9.result = l_28_1
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_28_7(l_28_10, l_28_9)
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_10.team_request_invite_c2s = function(l_29_0)
  local l_29_1 = l_0_1.send
  local l_29_2 = "team_request_invite_c2s"
  local l_29_3 = {}
  l_29_3.role_id = l_29_0
  l_29_1(l_29_2, l_29_3)
end

l_0_10.team_handle_request_invite_c2s = function(l_30_0, l_30_1)
  do
    local l_30_2 = l_0_14.get_team_info()
    if l_30_2 and l_30_2.status == l_0_15.team_status.matching then
      BroadcastTips.broadcast_tips("\229\183\178\229\188\128\229\167\139\229\140\185\233\133\141\239\188\140\230\151\160\230\179\149\230\137\167\232\161\140\230\173\164\230\147\141\228\189\156")
      return 
    end
    for l_30_6,l_30_7 in ipairs(l_30_0) do
      l_0_14.set_value("handle_request_invite_" .. l_30_7, l_30_1)
    end
    local l_30_8, l_30_11 = l_0_1.send
    l_30_11 = "team_handle_request_invite_c2s"
     -- DECOMPILER ERROR: Confused at declaration of local variable

    do
      local l_30_10, l_30_13 = {}
      l_30_10.role_id = l_30_0
      l_30_10.result = l_30_1
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_30_8(l_30_11, l_30_10)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_10.team_kick_c2s = function(l_31_0)
  if l_0_14.is_in_fight(l_31_0) then
    BroadcastTips.broadcast_tips("\233\152\159\229\143\139\228\187\141\229\156\168\230\136\152\230\150\151\228\184\173\239\188\140\230\151\160\230\179\149\232\175\183\231\166\187")
    return 
  end
  local l_31_1 = l_0_1.send
  local l_31_2 = "team_kick_c2s"
  local l_31_3 = {}
  l_31_3.role_id = l_31_0
  l_31_1(l_31_2, l_31_3)
end

l_0_10.team_handover_leader_c2s = function(l_32_0)
  local l_32_1 = l_0_1.send
  local l_32_2 = "team_handover_leader_c2s"
  local l_32_3 = {}
  l_32_3.role_id = l_32_0
  l_32_1(l_32_2, l_32_3)
end

l_0_10.team_role_info_c2s = function()
  l_0_1.send("team_role_info_c2s", {})
end

local l_0_29 = {}
l_0_29[l_0_15.target_main_type.dungeon_rogue] = true
l_0_10.team_update_target_c2s = function(l_34_0, l_34_1, l_34_2, l_34_3)
  local l_34_4, l_34_5, l_34_6 = l_0_14.raw_get_team_type_target_args()
  if l_34_4 == l_34_0 and l_34_5 == l_34_1 and l_34_6 == l_34_2 then
    return 
  end
  if l_0_14.is_in_team() and not l_0_29[l_34_0] then
    local l_34_7 = l_0_14.set_value
    local l_34_8 = "REQUEST_CHANGE_TYPE_TARGET"
    local l_34_9 = {}
     -- DECOMPILER ERROR: No list found. Setlist fails

    l_34_7(l_34_8, l_34_9)
     -- DECOMPILER ERROR: Overwrote pending register.

    do
      local l_34_10 = {}
      l_34_8(l_34_9, l_34_10)
  end
   -- DECOMPILER ERROR: Overwrote pending register.

   -- DECOMPILER ERROR: Overwrote pending register.

  else
    l_0_0.brocast(l_34_8.change_team_target)
    l_0_0.brocast(l_0_16.update_team_info)
  end
   -- Warning: undefined locals caused missing assignments!
end

l_0_10.team_open_recruit_c2s = function(l_35_0)
  local l_35_1 = l_0_1.send
  local l_35_2 = "team_open_recruit_c2s"
  local l_35_3 = {}
  l_35_3.msg = l_35_0
  l_35_1(l_35_2, l_35_3)
end

l_0_10.team_stop_recruit_c2s = function()
  l_0_1.send("team_stop_recruit_c2s", {})
end

l_0_10.team_recruit_list_c2s = function(l_37_0, l_37_1, l_37_2, l_37_3)
  if l_37_0 then
    local l_37_4 = l_0_14.get_value("team_recruit_target_list")
    local l_37_5 = table.insert
    local l_37_6 = l_37_4
    local l_37_7 = {}
    l_37_7.type = l_37_0
    l_37_7.target = l_37_1
    l_37_5(l_37_6, l_37_7)
  end
  local l_37_8 = {}
  l_37_8.type = l_37_0
  l_37_8.target = l_37_1
  l_37_8.arg = l_37_2
  l_37_8.extend_type = l_37_3
  local l_37_9 = l_0_1.send
  local l_37_10 = "team_recruit_list_c2s"
  local l_37_11 = {}
  l_37_11.target = l_37_8
  l_37_9(l_37_10, l_37_11)
end

l_0_10.team_auto_match_c2s = function(l_38_0, l_38_1, l_38_2, l_38_3)
  local l_38_4 = {}
  l_38_4.type = l_38_0
  l_38_4.target = l_38_1
  l_38_4.arg = l_38_2
   -- DECOMPILER ERROR: Confused at declaration of local variable

  if not l_38_3 then
    l_38_4.extend_type = l_0_15.extend_type.normal
  end
  local l_38_6 = l_0_1.send
  do
    local l_38_7 = "team_auto_match_c2s"
    l_38_6(l_38_7, {target = l_38_4})
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_10.team_stop_auto_match_c2s = function()
  l_0_1.send("team_stop_auto_match_c2s", {})
end

l_0_10.role_list_c2s = function(l_40_0, l_40_1)
  l_0_14.set_value("role_list_c2s_source", l_40_1)
  local l_40_2 = l_0_1.send
  local l_40_3 = "role_list_c2s"
  local l_40_4 = {}
  l_40_4.relation = l_40_0
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    l_40_4.source = l_40_1 or 0
    l_40_2(l_40_3, l_40_4)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_10.team_set_add_robot_c2s = function(l_41_0)
  local l_41_1 = l_0_1.send
  local l_41_2 = "team_set_add_robot_c2s"
  local l_41_3 = {}
  l_41_3.is_add_robot = l_41_0
  l_41_1(l_41_2, l_41_3)
end

l_0_10.team_set_condition_c2s = function(l_42_0)
  local l_42_1 = l_0_1.send
  local l_42_2 = "team_set_condition_c2s"
  local l_42_3 = {}
  l_42_3.condition = l_42_0
  l_42_1(l_42_2, l_42_3)
end

l_0_10.team_set_options_c2s = function(l_43_0)
  local l_43_1 = l_0_1.send
  local l_43_2 = "team_set_options_c2s"
  local l_43_3 = {}
  l_43_3.options = l_43_0
  l_43_1(l_43_2, l_43_3)
end

l_0_10.team_get_team_info_c2s = function(l_44_0)
  local l_44_1 = l_0_1.send
  local l_44_2 = "team_get_team_info_c2s"
  local l_44_3 = {}
  l_44_3.team_id = l_44_0
  l_44_1(l_44_2, l_44_3)
end

l_0_10.try_join_team = function(l_45_0, l_45_1, l_45_2, l_45_3, l_45_4, l_45_5, l_45_6)
  if not l_45_2 then
    l_45_2 = 1
  end
  if l_45_3 and l_45_4 then
    local l_45_7 = l_0_9.get_target_module(l_45_3)
    local l_45_8, l_45_9 = l_45_7:is_team_target_open(l_45_4, l_45_5)
    if not l_45_8 then
      BroadcastTips.broadcast_tips(l_45_9)
      GameFunctions.call_callback(l_45_6, false)
      return 
    end
    local l_45_10 = l_45_7:can_join_other_team(l_45_4, l_45_5)
    if not l_45_10 then
      local l_45_11 = {}
      l_45_11.content = "\229\183\178\230\151\160\229\165\150\229\138\177\230\172\161\230\149\176\239\188\140\230\152\175\229\144\166\229\138\160\229\133\165\233\152\159\228\188\141?\n(\229\184\174\229\138\169\230\156\137\229\165\150\229\138\177\230\172\161\230\149\176\231\154\132\231\142\169\229\174\182\229\143\175\232\142\183\229\190\151<img=Module/Friend-friend_affinityvalue_icon_xiaoshou>\229\143\139\231\136\177\229\128\188)"
      l_45_11.sure_click = function()
        local l_46_0 = l_0_1.send
        local l_46_1 = "team_join_team_c2s"
        local l_46_2 = {}
        l_46_2.team_id = l_45_0
        l_46_2.password = l_45_1
        l_46_2.type = l_45_2
        l_46_0(l_46_1, l_46_2)
        l_46_0 = GameFunctions
        l_46_0 = l_46_0.call_callback
        l_46_1 = l_45_6
        l_46_2 = true
        l_46_0(l_46_1, l_46_2)
         end
      l_45_11.cancel_click = function()
        GameFunctions.call_callback(l_45_6, false)
         end
      l_45_11.close_click = function()
        GameFunctions.call_callback(l_45_6, false)
         end
      l_45_11.hide_cb = function()
        GameFunctions.call_callback(l_45_6, false)
         end
      l_0_4.confirm(l_45_11)
      return 
    end
  end
  local l_45_12 = l_0_1.send
  local l_45_13 = "team_join_team_c2s"
  local l_45_14 = {}
  l_45_14.team_id = l_45_0
  l_45_14.password = l_45_1
  l_45_14.type = l_45_2
  l_45_12(l_45_13, l_45_14)
  l_45_12 = GameFunctions
  l_45_12 = l_45_12.call_callback
  l_45_13 = l_45_6
  l_45_14 = true
  l_45_12(l_45_13, l_45_14)
end

l_0_10.team_join_team_c2s = function(l_46_0, l_46_1, l_46_2, l_46_3, l_46_4, l_46_5)
  if l_46_3 then
    local l_46_6 = l_0_9.get_target_module(l_46_3)
    do
      if l_46_6 then
        local l_46_7, l_46_8 = l_46_6:is_team_target_open(l_46_4, l_46_5)
        if not l_46_7 then
          BroadcastTips.broadcast_tips(l_46_8)
          return 
        end
      end
    end
  end
  if l_0_14.is_in_team() then
    local l_46_9 = l_0_14.get_team_info()
    local l_46_10 = #l_46_9.members
    local l_46_11, l_46_12, l_46_13 = l_0_14.get_team_type_target_args()
    local l_46_14 = l_0_14.get_team_target_name(l_46_11, l_46_12, l_46_13)
    if l_46_10 >= 2 then
      local l_46_15 = {}
      l_46_15.content = string.format("\229\189\147\229\137\141\228\189\141\228\186\142\227\128\144%s\227\128\145\230\136\191\233\151\180\239\188\140\230\152\175\229\144\166\233\128\128\229\135\186\230\136\191\233\151\180\229\185\182\229\138\160\229\133\165\239\188\159", l_46_14)
      l_46_15.sure_click = function()
        l_0_10.try_join_team(l_46_0, l_46_1, l_46_2, l_46_8, l_46_9, l_46_10)
         end
      l_0_4.confirm(l_46_15)
      return 
    end
  end
  l_0_10.try_join_team(l_46_0, l_46_1, l_46_2, l_46_3, l_46_4, l_46_5)
end

l_0_10.friend_action_c2s = function(l_47_0, l_47_1, l_47_2)
  local l_47_3 = l_0_1.send
  local l_47_4 = "friend_action_c2s"
  local l_47_5 = {}
  l_47_5.scene_type = l_47_0
  l_47_5.friend_id = l_47_1
  l_47_5.action_id = l_47_2
  l_47_3(l_47_4, l_47_5)
end

l_0_10.team_open_match_team_c2s = function()
  l_0_1.send("team_open_match_team_c2s", {})
end

l_0_10.team_set_message_c2s = function(l_49_0)
  local l_49_1 = l_0_1.send
  local l_49_2 = "team_set_message_c2s"
  local l_49_3 = {}
  l_49_3.team_message = l_49_0
  l_49_1(l_49_2, l_49_3)
end

l_0_10.team_list_c2s = function(l_50_0, l_50_1, l_50_2)
  if not l_50_1 then
    l_50_1 = 1
  end
  if not l_50_2 then
    l_50_2 = 10
  end
  local l_50_3 = l_0_1.send
  local l_50_4 = "team_list_c2s"
  local l_50_5 = {}
  l_50_5.target = l_50_0
  l_50_5.min = l_50_1
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    l_50_5.max = l_50_2 or l_0_23
    l_50_3(l_50_4, l_50_5)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_10.team_cancel_match_quit_c2s = function()
  l_0_1.send("team_cancel_match_quit_c2s", {})
end

l_0_10.team_simple_info_c2s = function(l_52_0)
  local l_52_1 = l_0_1.send
  local l_52_2 = "team_simple_info_c2s"
  local l_52_3 = {}
  l_52_3.team_id = l_52_0
  l_52_1(l_52_2, l_52_3)
end

l_0_10.team_wx_share_log_c2s = function(l_53_0, l_53_1, l_53_2, l_53_3, l_53_4)
  local l_53_5 = l_0_1.send
  local l_53_6 = "team_wx_share_log_c2s"
  local l_53_7 = {}
  l_53_7.action = l_53_0
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    l_53_7.team_id = l_53_1 or 0
    l_53_7.type = l_53_2
    l_53_7.target = l_53_3
    l_53_7.target_role_id = l_53_4
    l_53_5(l_53_6, l_53_7)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_10.team_match_stat_c2s = function(l_54_0, l_54_1)
  local l_54_2 = l_0_19.get_cfg_by_type_target(l_54_0, l_54_1)
  if not l_54_2 then
    return 
  end
  local l_54_3 = l_54_2.play_type
  local l_54_4 = l_54_2.max_count
  local l_54_5 = l_0_1.send
  local l_54_6 = "team_match_stat_c2s"
  local l_54_7 = {}
  l_54_7.gameplay_id = l_54_3
  l_54_7.room_capacity = l_54_4
  l_54_5(l_54_6, l_54_7)
end

l_0_10.team_role_status_c2s = function(l_55_0)
  local l_55_1 = l_0_1.send
  local l_55_2 = "team_role_status_c2s"
  local l_55_3 = {}
  l_55_3.other_id = l_55_0
  l_55_1(l_55_2, l_55_3)
end

l_0_10.on_team_info_s2c = function(l_56_0, l_56_1)
  if l_56_0 ~= 0 then
    return 
  end
  l_0_10.trans_target(l_56_1.team)
  local l_56_2 = clone(l_0_14.get_team_info())
  local l_56_3 = l_0_14.is_team_captain()
  local l_56_4 = l_0_5.get_player_id()
  l_0_14.update_team_data(l_56_1.team)
  if l_56_1.team then
    if (not l_56_2 or not l_56_3) and l_0_14.is_team_captain() then
      l_0_10.team_apply_list_c2s()
    end
    if l_56_2 and l_56_2.is_room == 1 and l_56_1.team.is_room == 0 then
      BroadcastTips.broadcast_tips("\230\136\191\233\151\180\229\183\178\232\167\163\230\149\163")
    end
  end
  if l_0_14.get_value("invite_success") then
    l_0_14.set_value("invite_success", false)
    local l_56_5 = Game.module.jump_to
    local l_56_6 = l_56_5.jump_to
    local l_56_7 = "MainView"
    local l_56_8 = {}
    local l_56_9 = {}
    l_56_9.key = "team"
    l_56_8.handler_args = l_56_9
    l_56_6(l_56_7, l_56_8)
  end
end

l_0_10.on_team_create_s2c = function(l_57_0, l_57_1)
  if l_57_0 ~= 0 then
    return 
  end
  l_0_14.set_value("team_create_not_broad", false)
  l_0_14.set_value("team_open_room_c2s", false)
  local l_57_2 = l_0_14.get_team_info()
  l_0_14.set_value("is_create_one_dragon", false)
  local l_57_3 = l_0_14.get_value("share_team_args")
  if not l_57_3 then
    return 
  end
  l_0_9.share_team(l_57_3.team_type, l_57_3.team_target, l_57_3.team_arg)
  l_0_14.set_value("share_team_args", nil)
end

l_0_10.on_team_update_role_s2c = function(l_58_0, l_58_1)
  if l_58_0 ~= 0 then
    return 
  end
  if not l_0_14.team_info then
    return 
  end
  l_0_14.update_member(l_58_1.role)
end

l_0_10.on_team_quit_s2c = function(l_59_0, l_59_1)
  if l_59_0 ~= 0 then
    return 
  end
  if not l_0_14.get_value("skip_quit_team_target_set") and l_0_14.team_info then
    l_0_14.alone_team_type_key = l_0_14.team_info.type
    l_0_14.alone_team_target_key = l_0_14.team_info.target
    l_0_14.alone_team_args_key = l_0_14.team_info.args
  else
    l_0_14.set_value("skip_quit_team_target_set", nil)
  end
  l_0_14.quit_team()
end

l_0_10.on_team_quit_info_s2c = function(l_60_0, l_60_1)
  if l_60_0 ~= 0 then
    if l_60_0 then
      error(string.format("team_quit_info_s2c err %s", l_60_0))
    end
    return 
  end
  if not l_60_1 then
    error("team_quit_info_s2c net_data is nil")
    return 
  end
  l_0_14.member_quit_team(l_60_1.role_id, l_60_1.name, l_60_1.action)
end

l_0_10.on_team_change_leader_s2c = function(l_61_0, l_61_1)
  if l_61_0 ~= 0 then
    return 
  end
  l_0_14.change_captain(l_61_1.role_id)
end

l_0_10.on_team_apply_s2c = function(l_62_0, l_62_1)
  l_0_14.update_has_apply_team(l_62_1)
  BroadcastTips.broadcast_tips("\229\183\178\229\143\145\233\128\129\231\148\179\232\175\183")
end

l_0_10.on_team_apply_list_s2c = function(l_63_0, l_63_1)
  if not l_63_1.apply_list then
    return 
  end
  local l_63_2 = l_0_14.is_in_team()
  if not l_63_2 then
    return 
  end
  l_0_14.update_team_apply_list(l_63_1)
  l_0_7.update_red_point("team_apply_red_point")
end

l_0_10.on_team_receive_apply_s2c = function(l_64_0, l_64_1)
  if not l_64_1.apply then
    return 
  end
  l_0_14.insert_apply(l_64_1)
  l_0_0.brocast(l_0_16.check_pop)
  l_0_7.update_red_point("team_apply_red_point")
end

l_0_10.on_team_handle_apply_s2c = function(l_65_0, l_65_1)
  l_0_14.handle_apply()
  l_0_7.update_red_point("team_apply_red_point")
end

l_0_10.on_team_invite_s2c = function(l_66_0, l_66_1)
  if l_66_0 ~= 0 then
    return 
  end
  l_0_14.try_record_invite_info(l_66_1)
  BroadcastTips.broadcast_tips("\229\183\178\229\143\145\233\128\129\233\130\128\232\175\183")
end

l_0_10.on_team_receive_invite_s2c = function(l_67_0, l_67_1)
  if not l_67_1.invite then
    return 
  end
  l_0_10.trans_target(l_67_1.invite)
  l_0_14.insert_invite(l_67_1.invite)
  l_0_0.brocast(l_0_16.update_invite_list)
  l_0_0.brocast(l_0_16.check_pop)
end

l_0_10.on_season_invite_s2c = function(l_68_0, l_68_1)
  l_0_14.insert_robot_invite(l_68_1)
  l_0_0.brocast(l_0_16.update_invite_list)
  l_0_0.brocast(l_0_16.check_pop)
  l_0_7.update_red_point("team_invite_red_point")
end

l_0_10.on_team_invite_list_s2c = function(l_69_0, l_69_1)
  if l_69_0 ~= 0 then
    return 
  end
  if l_69_1.invites then
    for l_69_5,l_69_6 in ipairs(l_69_1.invites) do
      l_0_10.trans_target(l_69_6)
    end
  end
  if l_69_1.invites then
    for l_69_10,l_69_11 in ipairs(l_69_1.invites) do
      l_69_11.org_time = l_69_11.time
    end
  end
  l_0_14.update_invite_list(l_69_1.invites)
end

l_0_10.on_team_handle_invite_s2c = function(l_70_0, l_70_1)
  local l_70_2 = l_0_14.handle_invite
  local l_70_3 = l_70_1.role_id
  l_70_2(l_70_3, l_70_0 == 0)
  if l_70_0 ~= 0 then
    l_70_2 = DataConfigs
    l_70_2 = l_70_2.error_code
    l_70_3 = l_70_2.get_dsc
    l_70_3 = l_70_3(l_70_0)
    if not l_70_3 then
      l_70_3 = tostring(l_70_3)
    else
      l_70_3 = l_0_18.get_string(l_70_3)
    end
    BroadcastTips.broadcast_tips(l_70_3)
    l_0_10.team_invite_list_c2s()
  end
end

l_0_10.on_team_kick_s2c = function(l_71_0, l_71_1)
  if l_71_0 ~= 0 then
    return 
  end
end

l_0_10.on_team_handover_leader_s2c = function(l_72_0, l_72_1)
  if l_72_0 ~= 0 then
    return 
  end
end

l_0_10.on_team_handle_apply_leader_s2c = function(l_73_0, l_73_1)
  if l_73_0 ~= 0 then
    return 
  end
  if l_73_1.role_id and not l_0_14.is_team_captain() then
    BroadcastTips.broadcast_tips("\229\183\178\232\189\172\232\174\169\233\152\159\233\149\191")
  end
end

l_0_10.on_team_dismiss_s2c = function(l_74_0, l_74_1)
  if l_74_0 ~= 0 then
    return 
  end
  l_0_14.team_dismiss()
end

l_0_10.on_team_request_invite_s2c = function(l_75_0)
  if l_75_0 ~= 0 then
    return 
  end
  BroadcastTips.broadcast_tips("\229\143\145\233\128\129\230\136\144\229\138\159")
end

l_0_10.trans_target = function(l_76_0)
  if l_76_0 and l_76_0.target then
    local l_76_1 = l_76_0.target
    l_76_0.target = l_76_1.target
    l_76_0.type = l_76_1.type
    l_76_0.args = l_76_1.arg
    l_76_0.extend_type = l_76_1.extend_type
    if l_76_1.type == 0 then
      l_76_1.type = 1
      l_76_1.target = 1
      l_76_0.type = 1
      l_76_0.target = 1
    end
  end
end

l_0_10.on_team_role_info_s2c = function(l_77_0, l_77_1)
  if l_77_0 ~= 0 then
    return 
  end
  if not l_77_1.role_info then
    return 
  end
  l_0_14.update_team_role_info(l_77_1.role_info)
  if l_77_1.role_info.team_id ~= 0 and l_0_10.is_first_get_team_info then
    l_0_10.team_info_c2s()
  end
  if l_0_10.is_first_get_team_info then
    l_0_10.is_first_get_team_info = false
    l_0_10.team_invite_list_c2s()
    if l_77_1.role_info.team_id ~= 0 then
      do return end
    end
    l_0_14.has_init_request_invite = true
    l_0_14.has_init_apply_leader = true
  end
end

l_0_10.on_team_role_join_s2c = function(l_78_0, l_78_1)
  if l_78_0 ~= 0 then
    return 
  end
  local l_78_2 = l_0_14.get_team_info()
  l_0_14.join_member(l_78_1)
end

l_0_10.on_team_update_target_s2c = function(l_79_0)
  if l_79_0 ~= 0 then
    return 
  end
  local l_79_1 = l_0_14.get_value("NOT_BROAD_CHANGE_TYPE_TARGET")
  local l_79_2 = l_0_14.get_value("REQUEST_CHANGE_TYPE_TARGET")
  local l_79_3 = (l_0_14.get_value("is_change_daily_dragon"))
  local l_79_4, l_79_5, l_79_6, l_79_7 = nil, nil, nil, nil
  if l_79_2 then
    l_79_4, l_79_5, l_79_6, l_79_7 = l_79_2[1], l_79_2[2], l_79_2[3], l_79_2[4]
    local l_79_8 = l_0_19.get_cfg_by_type_target(l_79_4, l_79_5)
    local l_79_9 = DataConfigs.language_define
    if l_0_14.is_team_captain() then
      local l_79_10 = l_0_9.get_target_module(l_79_4)
      local l_79_11 = l_0_19.get_cfg_by_type_target(l_79_4, l_79_5)
      local l_79_12 = l_79_10:get_detail_title(l_79_11, l_79_6)
      if not l_79_1 then
        l_0_14.set_value("NOT_BROAD_CHANGE_TYPE_TARGET")
        l_0_14.set_value("is_change_daily_dragon")
        if not l_79_3 then
          BroadcastTips.broadcast_tips(string.format("\229\183\178\229\176\134[%s]\232\174\190\228\184\186\231\155\174\230\160\135", l_79_12))
        elseif l_79_7 == 1 then
          BroadcastTips.broadcast_tips("\230\151\165\229\184\184\228\184\128\230\157\161\233\190\153\229\183\178\231\148\159\230\149\136")
        else
          BroadcastTips.broadcast_tips("\230\151\165\229\184\184\228\184\128\230\157\161\233\190\153\229\183\178\229\143\150\230\182\136")
        end
      end
    end
  end
  local l_79_13 = l_0_14.get_value("NEED_RECRUIT")
  if l_79_13 then
    l_0_14.set_value("NEED_RECRUIT", false)
  end
end

l_0_10.on_team_open_recruit_s2c = function(l_80_0)
  if l_80_0 ~= 0 then
    return 
  end
  if l_0_14.get_value("is_click_open_room") then
    BroadcastTips.broadcast_tips("\229\188\128\229\167\139\230\139\155\229\139\159")
    l_0_14.set_value("is_click_open_room", nil)
  end
  l_0_14.recruiting()
end

l_0_10.on_team_stop_recruit_s2c = function(l_81_0)
  if l_81_0 ~= 0 then
    return 
  end
  BroadcastTips.broadcast_tips("\229\129\156\230\173\162\229\143\172\233\155\134")
  l_0_14.stop_recruiting()
end

l_0_10.on_team_auto_match_s2c = function(l_82_0)
  if l_82_0 ~= 0 then
    return 
  end
  l_0_14.auto_match()
end

l_0_10.on_team_stop_auto_match_s2c = function(l_83_0)
  if l_83_0 ~= 0 then
    return 
  end
  l_0_14.stop_auto_match()
end

l_0_10.on_role_list_s2c = function(l_84_0, l_84_1)
  if l_84_0 ~= 0 then
    return 
  end
  l_0_14.update_relation_role(l_84_1)
  local l_84_2 = l_0_14.get_value("role_list_c2s_source")
  l_0_14.set_value("role_list_c2s_source", nil)
  l_0_0.brocast(l_0_16.get_relation_role, l_0_14.relation_role_data[l_84_1.relation], l_84_2, l_84_1.relation)
end

l_0_10.on_team_be_kick_s2c = function(l_85_0, l_85_1)
  if l_85_0 ~= 0 then
    return 
  end
  BroadcastTips.broadcast_tips("\230\130\168\229\183\178\232\162\171\232\175\183\231\166\187\233\152\159\228\188\141")
  l_0_14.team_be_kick()
end

l_0_10.on_team_refuse_apply_s2c = function(l_86_0, l_86_1)
  if l_86_0 ~= 0 then
    return 
  end
  l_0_14.team_be_refuse_apply(l_86_1.team_id)
end

l_0_10.on_team_cancel_match_s2c = function(l_87_0, l_87_1)
  if l_87_0 ~= 0 then
    return 
  end
  if l_87_1.role_id then
    if l_87_1.role_id == 0 then
      do return end
    end
    if l_0_14.is_team_captain(l_87_1.role_id) then
      local l_87_2 = l_0_14.get_value("NOT_BROAD_CANCEL_MATCHING")
      if not l_87_2 then
        l_0_14.set_value("NOT_BROAD_CANCEL_MATCHING")
        BroadcastTips.broadcast_tips("\233\152\159\233\149\191\229\183\178\229\143\150\230\182\136\229\140\185\233\133\141")
      else
        if l_0_14.is_in_team() then
          BroadcastTips.broadcast_tips("\230\156\137\233\152\159\228\188\141\230\136\144\229\145\152\229\143\150\230\182\136\229\140\185\233\133\141")
        end
      end
    end
  end
end

l_0_10.on_team_set_condition_s2c = function(l_88_0, l_88_1)
  if l_88_0 ~= 0 then
    return 
  end
  l_0_14.update_condition(l_88_1.condition)
  l_0_0.brocast("team_condition_changed")
end

l_0_10.on_team_set_options_s2c = function(l_89_0, l_89_1)
  if l_89_0 ~= 0 then
    return 
  end
  l_0_14.update_options(l_89_1.options)
  l_0_0.brocast("team_option_changed")
end

l_0_10.on_team_match_team_s2c = function(l_90_0, l_90_1)
  if l_90_0 ~= 0 then
    return 
  end
  l_0_14.update_match_team_info(l_90_1.info)
  local l_90_2 = l_0_14.get_match_info()
  local l_90_3 = l_0_14.get_team_target_name(l_90_2.target.type, l_90_2.target.target, l_90_2.target.arg)
  local l_90_4 = l_0_19.get_cfg_by_id(l_90_2.target.type)
  local l_90_5 = l_0_18.get_string(l_90_4.name)
  local l_90_6 = string.format("\230\137\190\229\136\176\228\184\128\230\148\175<color=#339a3a>%s-%s</color>\231\154\132\233\152\159\228\188\141\239\188\136%s/%s\239\188\137\239\188\140\230\152\175\229\144\166\228\189\156\228\184\186\233\152\159\229\145\152\229\138\160\229\133\165\239\188\159", l_90_5, l_90_3, l_90_2.team_num, l_90_2.team_max_num)
  local l_90_7 = {}
  l_90_7.content = l_90_6
  l_90_7.sure_click = function()
    l_0_10.team_get_team_info_c2s(l_90_2.team_id)
   end
  l_0_4.confirm(l_90_7)
end

l_0_10.on_team_get_team_info_s2c = function(l_91_0, l_91_1)
  if l_91_0 ~= 0 then
    l_0_10.team_open_match_team_c2s()
    return 
  end
  l_0_14.update_match_team_info(l_91_1)
  local l_91_2 = l_0_14.get_match_info()
  if l_91_2.team_num == l_91_2.team_max_num then
    BroadcastTips.broadcast_tips("\232\175\165\233\152\159\228\188\141\229\183\178\230\187\161\239\188\140\230\141\162\228\184\170\229\136\171\231\154\132\232\175\149\232\175\149\229\144\167")
    l_0_10.team_open_match_team_c2s()
    return 
  end
  if l_91_2.team_status == l_0_15.team_status.matching then
    BroadcastTips.broadcast_tips("\232\175\165\233\152\159\228\188\141\229\183\178\232\191\155\229\133\165\229\140\185\233\133\141\233\152\159\229\136\151\239\188\140\230\141\162\228\184\170\229\136\171\231\154\132\232\175\149\232\175\149\229\144\167")
    l_0_10.team_open_match_team_c2s()
    return 
  end
  if l_91_2.team_status == l_0_15.team_status.fighting then
    BroadcastTips.broadcast_tips("\232\175\165\233\152\159\228\188\141\229\183\178\229\156\168\228\189\156\230\136\152\228\184\173\239\188\140\230\141\162\228\184\170\229\136\171\231\154\132\232\175\149\232\175\149\229\144\167")
    l_0_10.team_open_match_team_c2s()
    return 
  end
  if l_91_2.options[1].v == 1 then
    local l_91_3 = {}
    l_91_3.content = "\232\175\165\233\152\159\228\188\141\233\156\128\232\166\129\231\148\179\232\175\183\239\188\140\230\152\175\229\144\166\233\128\128\229\135\186\233\152\159\228\188\141\229\185\182\231\148\179\232\175\183\229\138\160\229\133\165\239\188\159"
    l_91_3.sure_click = function()
      l_0_10.team_join_team_c2s(l_91_2.team_id)
      end
    l_91_3.cancel_click = function()
      l_0_10.team_open_match_team_c2s()
      end
    l_91_3.close_click = function()
      l_0_10.team_open_match_team_c2s()
      end
    l_0_4.confirm(l_91_3)
    return 
  end
  l_0_10.team_join_team_c2s(l_91_2.team_id)
end

l_0_10.on_friend_action_s2c = function(l_92_0, l_92_1)
  if l_92_0 ~= 0 then
    return 
  end
end

l_0_10.on_friend_broadcast_action_s2c = function(l_93_0, l_93_1)
  if l_93_0 ~= 0 then
    return 
  end
  local l_93_2 = l_0_5.raw_get_player_info(l_93_1.send_id)
  local l_93_3 = l_0_5.raw_get_player_info(l_93_1.recv_id)
   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
    if l_93_2 then
      local l_93_5 = l_93_2.name
    if l_93_2 then
      end
    end
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

      if l_93_5 and l_93_3.name then
        if l_93_5 == l_93_3.name then
          BroadcastTips.broadcast_tips(string.format("[%s]\228\189\191\231\148\168\228\186\134%s", l_93_5, l_0_18.get_string(l_0_20.get_cfg_by_id(l_93_1.action_id).act)))
      end
       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused at declaration of local variable

      else
        BroadcastTips.broadcast_tips(string.format("[%s]\229\175\185[%s]\228\189\191\231\148\168\228\186\134%s", l_93_5, l_93_3.name, l_0_18.get_string(l_0_20.get_cfg_by_id(l_93_1.action_id).act)))
      end
    end
    l_0_0.brocast(l_0_16.team_friend_broadcast_action, l_93_1)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_10.on_team_switch_pos_s2c = function(l_94_0, l_94_1)
  if l_94_0 ~= 0 then
    return 
  end
end

l_0_10.on_team_received_switch_s2c = function(l_95_0, l_95_1)
  if l_95_0 ~= 0 then
    return 
  end
  local l_95_2 = Game.module.scene_manager
  if not l_0_2.view_is_opened("RaffleView") and (l_95_2.the_cur_scene_tp_is("fight") or l_95_2.the_cur_scene_tp_is("mini_play")) then
    return 
  end
  local l_95_3 = l_0_14.get_member_info(l_95_1.role_id)
  if l_95_3 then
    local l_95_4 = "exchange_pos_" .. l_95_1.role_id
    if not l_0_10.exchange_confirm_key then
      l_0_10.exchange_confirm_key = {}
    end
    local l_95_5 = false
    do
      for l_95_9,l_95_10 in ipairs(l_0_10.exchange_confirm_key) do
        if l_95_10 == l_95_4 then
          l_95_5 = true
        end
      end
    end
    if not l_95_5 then
      table.insert(l_0_10.exchange_confirm_key, l_95_4)
      local l_95_11 = require("game.module.common_view.manager.confirm")
      local l_95_12 = string.format("\230\152\175\229\144\166\229\144\140\230\132\143\228\184\142%s\228\186\164\230\141\162\228\189\141\231\189\174", l_95_3.name)
      local l_95_13 = {}
      l_95_13.content = l_95_12
      l_95_13.sure_click = function()
        for l_96_3,l_96_4 in ipairs(l_0_10.exchange_confirm_key) do
          l_95_6.hide(l_96_4)
        end
        l_0_10.exchange_confirm_key = {}
        l_0_10.team_handle_switch_c2s(l_95_1.role_id, 1)
         end
      l_95_13.cancel_click = function()
        local l_97_0 = "exchange_pos_" .. l_95_1.role_id
        for l_97_4,l_97_5 in ipairs(l_0_10.exchange_confirm_key) do
          if l_97_5 == l_97_0 then
            table.remove(l_0_10.exchange_confirm_key, l_97_4)
        else
          end
        end
        l_0_10.team_handle_switch_c2s(l_95_1.role_id, 0)
         end
      l_95_13.close_click = function()
        local l_98_0 = "exchange_pos_" .. l_95_1.role_id
        for l_98_4,l_98_5 in ipairs(l_0_10.exchange_confirm_key) do
          if l_98_5 == l_98_0 then
            table.remove(l_0_10.exchange_confirm_key, l_98_4)
        else
          end
        end
        l_0_10.team_handle_switch_c2s(l_95_1.role_id, 0)
         end
      l_95_13.key = l_95_4
      l_95_11.confirm(l_95_13)
    end
  end
end

l_0_10.on_team_handle_switch_s2c = function(l_96_0, l_96_1)
  if l_96_0 ~= 0 then
    return 
  end
end

l_0_10.on_team_switch_result_s2c = function(l_97_0, l_97_1)
  if l_97_0 ~= 0 then
    return 
  end
  if l_97_1.result == 1 then
    BroadcastTips.broadcast_tips("\229\175\185\230\150\185\229\144\140\230\132\143\228\189\141\231\189\174\228\186\164\230\141\162\232\175\183\230\177\130")
  else
    BroadcastTips.broadcast_tips("\229\175\185\230\150\185\230\139\146\231\187\157\228\189\141\231\189\174\228\186\164\230\141\162\232\175\183\230\177\130")
  end
end

l_0_10.on_team_set_message_s2c = function(l_98_0, l_98_1)
  if l_98_0 ~= 0 then
    return 
  end
  l_0_14.team_change_message(l_98_1.team_message or "")
end

l_0_10.on_team_list_s2c = function(l_99_0, l_99_1)
  if l_99_0 ~= 0 then
    return 
  end
  l_0_14.refresh_hall_team_list(l_99_1)
  l_0_0.brocast(l_0_16.update_recruit_list, l_99_1.target)
end

l_0_10.on_team_cancel_match_quit_s2c = function(l_100_0, l_100_1)
  if l_100_0 ~= 0 then
    return 
  end
end

l_0_10.on_team_simple_info_s2c = function(l_101_0, l_101_1)
  if l_101_0 ~= 0 then
    return 
  end
  if l_101_1.team_simple then
    l_0_0.brocast("team_simple_info", l_101_1.team_simple)
    l_0_9.try_handle_team_simple_info_s2c(l_101_1.team_simple)
  end
end

l_0_10.on_team_ready_s2c = function()
end

l_0_10.on_team_cancel_ready_s2c = function()
end

l_0_10.on_team_join_team_s2c = function(l_104_0, l_104_1)
  if l_104_0 == 0 then
    l_0_14.set_value("team_quick_join_team_id", nil)
  else
    if l_0_14.get_value("team_quick_join_team_id") then
      local l_104_2 = l_0_14.get_value("team_quick_join_team_id")
      local l_104_3 = l_0_14.get_hall_team_list(true)
      local l_104_4 = 0
      for l_104_8,l_104_9 in ipairs(l_104_3) do
        if l_104_9.team_id == l_104_2 then
          l_104_4 = l_104_8
        end
      end
      do
        if l_104_3[l_104_4 + 1] then
          local l_104_10, l_104_11 = l_104_3[l_104_4 + 1].team_id
          l_104_11 = l_0_14
          l_104_11 = l_104_11.set_value
          l_104_11("team_quick_join_team_id", l_104_10)
          l_104_11 = l_0_10
          l_104_11 = l_104_11.team_join_team_c2s
        end
         -- DECOMPILER ERROR: Confused about usage of registers!

        l_104_11(l_104_10)
      end
    end
  end
  l_0_0.brocast("on_team_join_team_s2c", l_104_0, l_104_1)
end

l_0_10.on_team_open_match_s2c = function(l_105_0, l_105_1)
  if l_105_0 ~= 0 then
    return 
  end
  l_0_9.try_get_match_stat()
  l_0_0.brocast("team_open_match_success")
end

l_0_10.on_team_stop_match_s2c = function()
end

l_0_10.on_team_del_invite_s2c = function(l_107_0, l_107_1)
  local l_107_2 = l_0_14.del_invite(l_107_1)
  if l_107_2 then
    local l_107_3 = Game.module.common_view
    l_107_3.invite_mgr.remove_by_key(string.format("team_invite_%s", l_107_1.role_id))
    l_0_0.brocast(l_0_16.update_invite_list)
  end
end

l_0_10.on_team_receive_rally_s2c = function(l_108_0, l_108_1)
  local l_108_2 = l_0_14.get_team_captain()
  if l_108_2 then
    BroadcastTips.broadcast_tips(string.format("\233\152\159\233\149\191[%s]\230\143\144\233\134\146\228\189\160\229\176\189\229\191\171\229\174\140\230\136\144\229\135\134\229\164\135!", l_108_2.role_name))
  end
end

l_0_10.on_team_set_setting_s2c = function(l_109_0, l_109_1)
  l_0_14.update_team_settings(l_109_1)
  l_0_0.brocast(l_0_16.update_team_settings)
end

l_0_10.on_team_del_settings_s2c = function(l_110_0, l_110_1)
  l_0_14.del_team_settings(l_110_1)
  l_0_0.brocast(l_0_16.update_team_settings)
end

l_0_10.on_team_del_conditions_s2c = function(l_111_0, l_111_1)
  l_0_14.del_team_conditions(l_111_1)
  l_0_0.brocast("team_condition_changed")
end

l_0_10.on_season_handle_invite_s2c = function(l_112_0, l_112_1)
  local l_112_2 = l_0_14.get_value("season_handle_invite_c2s")
  local l_112_3 = l_0_14.handle_robot_invite
  local l_112_4 = {}
   -- DECOMPILER ERROR: No list found. Setlist fails

  l_112_3(l_112_4, true)
  l_112_3 = l_0_14
  l_112_3 = l_112_3.set_value
  l_112_4 = "season_handle_invite_c2s"
  l_112_3(l_112_4, nil)
end

l_0_10.on_team_wx_share_log_s2c = function(l_113_0, l_113_1)
end

l_0_10.on_team_match_stat_s2c = function(l_114_0, l_114_1)
  l_0_14.set_estimate_time(l_114_1)
  l_0_0.brocast("update_match_stat")
end

l_0_10.on_team_role_status_s2c = function(l_115_0, l_115_1)
  l_0_14.set_team_role_status(l_115_1)
  l_0_0.brocast("update_team_role_status")
end

l_0_10.on_avatar_act_request_info_s2c = function(l_116_0, l_116_1)
  if l_116_1.unlocked_id_list and next(l_116_1.unlocked_id_list) then
    table.clear(l_0_14.avatar_act_unlocked_id_dic)
    for l_116_5,l_116_6 in ipairs(l_116_1.unlocked_id_list) do
      l_0_14.avatar_act_unlocked_id_dic[l_116_6] = true
    end
  end
end

l_0_10.on_avatar_act_update_s2c = function(l_117_0, l_117_1)
  if l_117_1.unlocked_id then
    l_0_14.avatar_act_unlocked_id_dic[l_117_1.unlocked_id] = true
    l_0_0.brocast("avatar_act_unlock", l_117_1.unlocked_id)
  end
end

l_0_10.on_season_demo_info_s2c = function(l_118_0, l_118_1)
  if l_118_1 then
    l_0_14.season_demo_info = l_118_1
    l_0_0.brocast("update_demo_plan")
  end
end

l_0_10.on_season_demo_plan_set_s2c = function(l_119_0, l_119_1)
  l_0_14.season_demo_info.plan_id = l_119_1.plan_id
  l_0_0.brocast("update_demo_plan")
end

l_0_10.clear_wait_check_timer = function()
  if l_0_10.wait_check_timer then
    Game.timer:clear_timer(l_0_10.wait_check_timer)
    l_0_10.wait_check_timer = nil
  end
end

l_0_10.clear = function()
  l_0_1.unlisten_net_events(l_0_10.net_event_names)
  l_0_10.clear_wait_check_timer()
end

return l_0_10

