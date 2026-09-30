local L0_0
L0_0 = Game
local L0_0, L3_3, L6_6, L7_7, L8_8, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30 = L0_0.events, L3_3, L6_6, L7_7, L8_8, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30
L3_3 = require
L6_6 = "game.network.network_utils"
L3_3 = L3_3(L6_6)
L6_6 = Game
L6_6 = L6_6.ui_manager
L7_7 = Game
L7_7 = L7_7.module
L7_7 = L7_7.open_func
L8_8 = require
L11_11 = "game.module.common_view.manager.confirm"
L8_8 = L8_8(L11_11)
L11_11 = Game
L11_11 = L11_11.module
L11_11 = L11_11.data
L12_12 = L11_11.const
L13_13 = Game
L13_13 = L13_13.redpoint_helper
L14_14 = Game
L14_14 = L14_14.module
L14_14 = L14_14.scene_manager
L15_15 = import
L16_16 = "..head"
L15_15 = L15_15(L16_16)
L16_16 = L15_15.network
L17_17 = nil
L18_18 = nil
L19_19 = nil
L20_20 = L15_15.data
L23_23 = L15_15.const
L24_24 = L15_15.event
L25_25 = DataConfigs
L25_25 = L25_25.team_misc
L26_26 = DataConfigs
L26_26 = L26_26.language_define
L27_27 = DataConfigs
L27_27 = L27_27.team_target
L28_28 = DataConfigs
L28_28 = L28_28.avatar_act
L29_29 = require
L30_30 = "game.utils.sound_manager"
L29_29 = L29_29(L30_30)
L30_30 = Game
L30_30 = L30_30.server_time
;({}).role_ids = {}
;({}).key_list = L12_12.cross_open_func_key
function L16_16.init()
	_ENV = Game.module.season
	L18_18 = _ENV.data_2v2
	L19_19 = _ENV.const
	;({}).team_info_s2c = L16_16.on_team_info_s2c
	;({}).team_create_s2c = L16_16.on_team_create_s2c
	;({}).team_update_role_s2c = L16_16.on_team_update_role_s2c
	;({}).team_quit_s2c = L16_16.on_team_quit_s2c
	;({}).team_quit_info_s2c = L16_16.on_team_quit_info_s2c
	;({}).team_change_leader_s2c = L16_16.on_team_change_leader_s2c
	;({}).team_apply_s2c = L16_16.on_team_apply_s2c
	;({}).team_apply_list_s2c = L16_16.on_team_apply_list_s2c
	;({}).team_receive_apply_s2c = L16_16.on_team_receive_apply_s2c
	;({}).team_handle_apply_s2c = L16_16.on_team_handle_apply_s2c
	;({}).team_invite_s2c = L16_16.on_team_invite_s2c
	;({}).team_receive_invite_s2c = L16_16.on_team_receive_invite_s2c
	;({}).season_invite_s2c = L16_16.on_season_invite_s2c
	;({}).team_invite_list_s2c = L16_16.on_team_invite_list_s2c
	;({}).team_handle_invite_s2c = L16_16.on_team_handle_invite_s2c
	;({}).team_request_invite_s2c = L16_16.on_team_request_invite_s2c
	;({}).team_kick_s2c = L16_16.on_team_kick_s2c
	;({}).team_handover_leader_s2c = L16_16.on_team_handover_leader_s2c
	;({}).team_handle_apply_leader_s2c = L16_16.on_team_handle_apply_leader_s2c
	;({}).team_dismiss_s2c = L16_16.on_team_dismiss_s2c
	;({}).team_role_info_s2c = L16_16.on_team_role_info_s2c
	;({}).team_role_join_s2c = L16_16.on_team_role_join_s2c
	;({}).team_update_target_s2c = L16_16.on_team_update_target_s2c
	;({}).team_open_recruit_s2c = L16_16.on_team_open_recruit_s2c
	;({}).team_stop_recruit_s2c = L16_16.on_team_stop_recruit_s2c
	;({}).team_auto_match_s2c = L16_16.on_team_auto_match_s2c
	;({}).team_stop_auto_match_s2c = L16_16.on_team_stop_auto_match_s2c
	;({}).role_list_s2c = L16_16.on_role_list_s2c
	;({}).team_be_kick_s2c = L16_16.on_team_be_kick_s2c
	;({}).team_refuse_apply_s2c = L16_16.on_team_refuse_apply_s2c
	;({}).team_cancel_match_s2c = L16_16.on_team_cancel_match_s2c
	;({}).team_set_condition_s2c = L16_16.on_team_set_condition_s2c
	;({}).team_set_options_s2c = L16_16.on_team_set_options_s2c
	;({}).team_match_team_s2c = L16_16.on_team_match_team_s2c
	;({}).team_get_team_info_s2c = L16_16.on_team_get_team_info_s2c
	;({}).friend_action_s2c = L16_16.on_friend_action_s2c
	;({}).friend_broadcast_action_s2c = L16_16.on_friend_broadcast_action_s2c
	;({}).team_switch_pos_s2c = L16_16.on_team_switch_pos_s2c
	;({}).team_received_switch_s2c = L16_16.on_team_received_switch_s2c
	;({}).team_handle_switch_s2c = L16_16.on_team_handle_switch_s2c
	;({}).team_switch_result_s2c = L16_16.on_team_switch_result_s2c
	;({}).role_dup_tale_update_s2c = L16_16.on_role_dup_tale_update_s2c
	;({}).role_dup_tale_enter_role_list_s2c = L16_16.on_role_dup_tale_enter_role_list_s2c
	;({}).team_set_message_s2c = L16_16.on_team_set_message_s2c
	;({}).team_list_s2c = L16_16.on_team_list_s2c
	;({}).team_cancel_match_quit_s2c = L16_16.on_team_cancel_match_quit_s2c
	;({}).team_simple_info_s2c = L16_16.on_team_simple_info_s2c
	;({}).team_ready_s2c = L16_16.on_team_ready_s2c
	;({}).team_cancel_ready_s2c = L16_16.on_team_cancel_ready_s2c
	;({}).team_join_team_s2c = L16_16.on_team_join_team_s2c
	;({}).team_open_match_s2c = L16_16.on_team_open_match_s2c
	;({}).team_stop_match_s2c = L16_16.on_team_stop_match_s2c
	;({}).team_del_invite_s2c = L16_16.on_team_del_invite_s2c
	;({}).team_receive_rally_s2c = L16_16.on_team_receive_rally_s2c
	;({}).team_set_setting_s2c = L16_16.on_team_set_setting_s2c
	;({}).team_del_settings_s2c = L16_16.on_team_del_settings_s2c
	;({}).team_del_conditions_s2c = L16_16.on_team_del_conditions_s2c
	;({}).season_handle_invite_s2c = L16_16.on_season_handle_invite_s2c
	;({}).team_wx_share_log_s2c = L16_16.on_team_wx_share_log_s2c
	;({}).team_match_stat_s2c = L16_16.on_team_match_stat_s2c
	;({}).team_role_status_s2c = L16_16.on_team_role_status_s2c
	;({}).avatar_act_request_info_s2c = L16_16.on_avatar_act_request_info_s2c
	;({}).avatar_act_update_s2c = L16_16.on_avatar_act_update_s2c
	;({}).season_demo_info_s2c = L16_16.on_season_demo_info_s2c
	L16_16.net_event_names, ({}).season_demo_plan_set_s2c = {}, L16_16.on_season_demo_plan_set_s2c
	local L0_31 = L0_31
	local L1_32 = L1_32
	L0_31(L1_32, "team")
	local L2_33 = L2_33
	L0_31 = L16_16
	L0_31.is_first_get_team_info = true
	L0_31 = L16_16
	L0_31.wait_check_timer = nil
end
function L16_16.season_demo_plan_set_c2s(A0_34)
	local L1_35 = L1_35
	local L2_36 = L2_36
	;({}).plan_id = A0_34
	L1_35(L2_36, {})
	local L3_37 = L3_37
end
function L16_16.season_demo_info_c2s()
	local L1_38 = L1_38
	L1_38("season_demo_info_c2s", {})
	local L2_39 = L2_39
end
function L16_16.avatar_act_request_info_c2s()
	local L1_40 = L1_40
	L1_40("avatar_act_request_info_c2s", {})
	local L2_41 = L2_41
end
function L16_16.team_add_bot_c2s(A0_42, A1_43)
	local L2_44 = L2_44
	local L3_45 = L3_45
	;({}).pos = A0_42
	;({}).bot = A1_43
	L2_44(L3_45, {})
	local L4_46 = L4_46
end
function L16_16.team_switch_pos_c2s(A0_47)
	local L1_48 = L1_48
	local L2_49 = L2_49
	;({}).pos = A0_47
	L1_48(L2_49, {})
	local L3_50 = L3_50
end
function L16_16.team_set_setting_c2s(A0_51)
	local L1_52 = L1_52
	local L2_53 = L2_53
	;({}).settings = A0_51
	L1_52(L2_53, {})
	local L3_54 = L3_54
end
function L16_16.team_rally_c2s(A0_55)
	BroadcastTips.broadcast_tips("\230\173\163\229\156\168\230\143\144\233\134\146\229\176\154\230\156\170\229\135\134\229\164\135\231\154\132\233\152\159\229\145\152!")
	local L1_56 = L1_56
	L1_56 = L1_56("next_rally_time")
	local L2_57 = L30_30.get_server_time()
	if L1_56 and L1_56 > L2_57 then
		return
	end
	_ENV.set_value("next_rally_time", L2_57 + 5)
	local L3_58 = L3_58
	local L4_59 = L4_59
	;({}).role_id = A0_55
	L3_58(L4_59, {})
	local L5_60 = L5_60
end
function L16_16.team_cancel_ready_c2s()
	local L1_61 = L1_61
	L1_61("team_cancel_ready_c2s", {})
	local L2_62 = L2_62
end
function L16_16.team_ready_c2s()
	local L1_64 = Game.module
	L1_64 = L1_64.nat_match_api
	L1_64 = L1_64.data
	L1_64 = L1_64.is_can_team_ready_by_nat_champ_ready_room
	L1_64 = L1_64()
	if not L1_64 then
		BroadcastTips.broadcast_tips(L1_64())
		return
	end
	local L2_65 = L2_65
	local L3_66 = L3_66
	L3_66("team_ready_c2s", {})
	local L4_67 = L4_67
end
function L16_16.team_stop_match_c2s()
	local L1_68 = L1_68
	L1_68("team_stop_match_c2s", {})
	local L2_69 = L2_69
end
function L16_16.team_stop_match_quit_c2s()
	local L1_70 = L1_70
	L1_70("team_stop_match_quit_c2s", {})
	local L2_71 = L2_71
end
function L16_16.team_open_match_c2s(A0_72, A1_73, A2_74)
	_ENV.play_effect("sd_1145")
	if not A0_72 then
	end
	_UPVALUE1_.type = L21_21.target_main_type.pvp
	if not A1_73 then
	end
	_UPVALUE1_.target = L21_21.pvp_target_type.match
	_UPVALUE1_.arg = A2_74
	local L3_75 = L3_75
	local L4_76 = L4_76
	local ({}).target, L6_78 = _UPVALUE1_, L6_78
	L3_75(L4_76, L6_78)
end
function L16_16.season_handle_invite_c2s(A0_79)
	_ENV.set_value("season_handle_invite_c2s", A0_79)
	local L1_80 = L1_80
	local L2_81 = L2_81
	;({}).robot_id = A0_79
	L1_80(L2_81, {})
	local L3_82 = L3_82
end
function L16_16.role_dup_tale_info_c2s()
	local L1_83 = L1_83
	L1_83("role_dup_tale_info_c2s", {})
	local L2_84 = L2_84
end
function L16_16.role_dup_tale_enter_role_list_c2s(A0_85)
	local L1_86 = L1_86
	local L2_87 = L2_87
	;({}).dup_id = A0_85
	L1_86(L2_87, {})
	local L3_88 = L3_88
end
function L16_16.on_role_dup_tale_update_s2c(A0_89, A1_90)
	if A0_89 ~= 0 then
		return
	end
	local L2_91 = L2_91
	L2_91 = L2_91("game.module.season.manager.legend_fight")
	L2_91:update_pass_info(A1_90.info)
	local L5_94 = L5_94
	L5_94 = _ENV
	L5_94 = L5_94.brocast
	L5_94("refresh_legend_fight_pass_info")
	local L4_93 = L4_93
end
function L16_16.on_role_dup_tale_enter_role_list_s2c(A0_95, A1_96)
	if A0_95 ~= 0 then
		return
	end
	local L2_97 = L2_97
	L2_97 = L2_97("game.module.season.manager.legend_fight")
	local L5_100 = L5_100
	L5_100(L2_97, A1_96.dup_id, A1_96.role_list)
	local L6_101 = L6_101
	L5_100 = _ENV
	L5_100 = L5_100.brocast
	L6_101 = "update_tale_enter_dungeon"
	L5_100(L6_101)
end
function L16_16.team_handle_switch_c2s(A0_102, A1_103)
	local L2_104 = L2_104
	local L3_105 = L3_105
	;({}).role_id = A0_102
	;({}).result = A1_103
	L2_104(L3_105, {})
	local L4_106 = L4_106
end
function L16_16.team_info_c2s()
	_ENV = true
	local L1_107 = L1_107
	L1_107("team_info_c2s", {})
	local L2_108 = L2_108
end
function L16_16.team_create_c2s(A0_109, A1_110, A2_111, A3_112, A4_113)
	local L5_114, L6_115
	if A0_109 ~= _ENV.target_main_type.pve then
		L6_115 = string.format("%s_%s_setting", A0_109, A1_110)
	else
		local L11_120 = string.format("%s_%s_%s_setting", A0_109, A1_110, A2_111)
		L6_115 = L11_120
	end
	L11_120 = L20_20
	L11_120 = L11_120.get_value
	L11_120 = L11_120(L6_115)
	L5_114 = L11_120
	if L5_114 then
		A4_113 = L5_114.options
		A3_112 = L5_114.condition
	end
	L11_120 = nil
	if A0_109 and A1_110 then
		({}).type = A0_109
		;({}).target = A1_110
		L11_120, ({}).arg = {}, A2_111
	end
	local L8_117 = L8_117
	local L9_118 = L9_118
	;({}).target = L11_120
	;({}).condition = A3_112
	;({}).options = A4_113
	L8_117(L9_118, {})
	local L10_119 = L10_119
end
function L16_16.team_quit_c2s()
	local L0_121 = _ENV.get_teammate_count()
	_ENV.set_value("pre_teammate_count", L0_121)
	local L1_122 = L1_122
	local L2_123 = L2_123
	L1_122(L2_123, {})
	local L3_124 = L3_124
end
function L16_16.team_apply_c2s(A0_125)
	local L1_126 = L1_126
	local L2_127 = L2_127
	;({}).other_id = A0_125
	L1_126(L2_127, {})
	local L3_128 = L3_128
end
function L16_16.team_apply_list_c2s()
	local L1_129 = L1_129
	L1_129("team_apply_list_c2s", {})
	local L2_130 = L2_130
end
function L16_16.team_handle_apply_c2s(A0_131, A1_132)
	_ENV.set_value("handle_apply_role_list", A0_131)
	_ENV.set_value("handle_apply_role_result", A1_132)
	local L2_133 = L2_133
	local L3_134 = L3_134
	;({}).role_list = A0_131
	;({}).handle = A1_132
	L2_133(L3_134, {})
	local L4_135 = L4_135
end
function L16_16.team_invite_c2s(A0_136, A1_137, A2_138, A3_139)
	local L5_141, L8_144 = Game.module, L8_144
	L5_141 = L5_141.nat_match_api
	L5_141 = L5_141.data
	L5_141 = L5_141.is_can_invite_read_room_role_by_nat_champ_ready_room
	L5_141, L8_144 = L5_141()
	if not L5_141 then
		BroadcastTips.broadcast_tips(L8_144)
		return
	end
	if _ENV.is_robot(A0_136) then
		BroadcastTips.broadcast_tips("\229\183\178\229\143\145\233\128\129\233\130\128\232\175\183")
		return
	end
	L20_20.set_send_invite_time(A0_136)
	if not A1_137 then
	end
	_UPVALUE2_.type = L20_20.get_team_type_target_args()
	if not A2_138 then
	end
	_UPVALUE2_.target = L20_20.get_team_type_target_args()
	if not A3_139 then
	end
	_UPVALUE2_.arg = L20_20.get_team_type_target_args()
	local L9_145 = L9_145
	local L10_146 = L10_146
	;({}).role_id = A0_136
	local ({}).target, L12_148 = _UPVALUE2_, L12_148
	L1_1.send("team_invite_c2s", {})
end
function L16_16.team_invite_list_c2s()
	local L1_149 = L1_149
	L1_149("team_invite_list_c2s", {})
	local L2_150 = L2_150
end
function L16_16.team_handle_invite_c2s(A0_151, A1_152)
	L5_156 = _ENV.set_value
	L6_157 = "handle_invite_roles"
	L5_156(L6_157, A0_151)
	L5_156 = ipairs
	L6_157 = A0_151
	L5_156, L6_157, _FOR_ = L5_156(L6_157)
	for _FORV_5_, _FORV_6_ in L5_156, L6_157, _FOR_ do
		_ENV.set_value("handle_invite_" .. _FORV_6_, A1_152)
	end
	L5_156 = L1_1
	L5_156 = L5_156.send
	L6_157 = "team_handle_invite_c2s"
	L7_158 = {}
	L7_158.role_id = A0_151
	L7_158.result = A1_152
	L5_156(L6_157, L7_158)
end
function L16_16.team_request_invite_c2s(A0_161)
	local L1_162 = L1_162
	local L2_163 = L2_163
	;({}).role_id = A0_161
	L1_162(L2_163, {})
	local L3_164 = L3_164
end
function L16_16.team_handle_request_invite_c2s(A0_165, A1_166)
	local L6_171 = _ENV.get_team_info
	L6_171 = L6_171()
	if L6_171 then
		L7_172 = L6_171.status
		if L7_172 == L21_21.team_status.matching then
			L7_172 = BroadcastTips
			L7_172 = L7_172.broadcast_tips
			L7_172("\229\183\178\229\188\128\229\167\139\229\140\185\233\133\141\239\188\140\230\151\160\230\179\149\230\137\167\232\161\140\230\173\164\230\147\141\228\189\156")
			return
		end
	end
	L7_172 = ipairs
	L7_172, _FOR_, _FOR_ = L7_172(A0_165)
	for _FORV_6_, _FORV_7_ in L7_172, _FOR_, _FOR_ do
		_ENV.set_value("handle_request_invite_" .. _FORV_7_, A1_166)
	end
	L7_172 = L1_1
	L7_172 = L7_172.send
	L8_173 = "team_handle_request_invite_c2s"
	L9_174 = {}
	L9_174.role_id = A0_165
	L9_174.result = A1_166
	L7_172(L8_173, L9_174)
end
function L16_16.team_kick_c2s(A0_176)
	if _ENV.is_in_fight(A0_176) then
		BroadcastTips.broadcast_tips("\233\152\159\229\143\139\228\187\141\229\156\168\230\136\152\230\150\151\228\184\173\239\188\140\230\151\160\230\179\149\232\175\183\231\166\187")
		return
	end
	local L1_177 = L1_177
	local L2_178 = L2_178
	;({}).role_id = A0_176
	L1_177(L2_178, {})
	local L3_179 = L3_179
end
function L16_16.team_handover_leader_c2s(A0_180)
	local L1_181 = L1_181
	local L2_182 = L2_182
	;({}).role_id = A0_180
	L1_181(L2_182, {})
	local L3_183 = L3_183
end
function L16_16.team_role_info_c2s()
	local L1_184 = L1_184
	L1_184("team_role_info_c2s", {})
	local L2_185 = L2_185
end
;({})[L23_23.target_main_type.dungeon_rogue] = true
function L16_16.team_update_target_c2s(A0_186, A1_187, A2_188, A3_189)
	repeat
		local L5_191, L6_192 = _ENV.raw_get_team_type_target_args, L6_192
		L5_191, L6_192 = L5_191()
		if L5_191 == A0_186 and L6_192 == A1_187 and L5_191() == A2_188 then
			return
		end
		if _ENV.is_in_team() and not _UPVALUE1_[A0_186] then
			local L11_197 = L11_197
			local L12_198 = L12_198
			;({})[1] = A0_186
			;({})[2] = A1_187
			;({})[3] = A2_188
			local ({})[4], L13_199 = A3_189, L13_199
			L12_198(L13_199, {})
			L12_198 = {}
			L12_198.type = A0_186
			L12_198.target = A1_187
			L12_198.arg = A2_188
			L13_199 = L1_1
			L13_199 = L13_199.send
			;({}).target = L12_198
			L13_199("team_update_target_c2s", {})
			break -- pseudo-goto
		end
		L12_198 = _ENV
		L12_198.alone_team_type_key = A0_186
		L12_198 = _ENV
		L12_198.alone_team_target_key = A1_187
		L12_198 = _ENV
		L12_198.alone_team_args_key = A2_188
		L12_198 = L0_0
		L12_198 = L12_198.brocast
		L13_199 = L22_22
		L13_199 = L13_199.change_team_target
		L12_198(L13_199)
		L12_198 = L0_0
		L12_198 = L12_198.brocast
		L13_199 = L22_22
		L13_199 = L13_199.update_team_info
		L12_198(L13_199)
	until true
end
function L16_16.team_open_recruit_c2s(A0_200)
	local L1_201 = L1_201
	local L2_202 = L2_202
	;({}).msg = A0_200
	L1_201(L2_202, {})
	local L3_203 = L3_203
end
function L16_16.team_stop_recruit_c2s()
	local L1_204 = L1_204
	L1_204("team_stop_recruit_c2s", {})
	local L2_205 = L2_205
end
function L16_16.team_recruit_list_c2s(A0_206, A1_207, A2_208, A3_209)
	if A0_206 then
		local L4_210 = L4_210
		L4_210 = L4_210("team_recruit_target_list")
		;({}).type = A0_206
		;({}).target = A1_207
		table.insert(L4_210, {})
	end
	L4_210 = {}
	L4_210.type = A0_206
	L4_210.target = A1_207
	L4_210.arg = A2_208
	L4_210.extend_type = A3_209
	local L5_211 = L5_211
	local L6_212 = L6_212
	;({}).target = L4_210
	L5_211(L6_212, {})
	local L7_213 = L7_213
end
function L16_16.team_auto_match_c2s(A0_214, A1_215, A2_216, A3_217)
	local L4_218
	L4_218 = {}
	L4_218.type = A0_214
	L4_218.target = A1_215
	L4_218.arg = A2_216
	if not A3_217 then
	end
	L4_218.extend_type = _ENV.extend_type.normal
	local L5_219 = L5_219
	local L6_220 = L6_220
	;({}).target = L4_218
	L5_219(L6_220, {})
	local L7_221 = L7_221
end
function L16_16.team_stop_auto_match_c2s()
	local L1_222 = L1_222
	L1_222("team_stop_auto_match_c2s", {})
	local L2_223 = L2_223
end
function L16_16.role_list_c2s(A0_224, A1_225)
	_ENV.set_value("role_list_c2s_source", A1_225)
	local L2_226 = L2_226
	local L3_227 = L3_227
	;({}).relation = A0_224
	if not A1_225 then
	end
	local ({}).source, L5_229 = 0, L5_229
	L2_226(L3_227, L5_229)
end
function L16_16.team_set_add_robot_c2s(A0_230)
	local L1_231 = L1_231
	local L2_232 = L2_232
	;({}).is_add_robot = A0_230
	L1_231(L2_232, {})
	local L3_233 = L3_233
end
function L16_16.team_set_condition_c2s(A0_234)
	local L1_235 = L1_235
	local L2_236 = L2_236
	;({}).condition = A0_234
	L1_235(L2_236, {})
	local L3_237 = L3_237
end
function L16_16.team_set_options_c2s(A0_238)
	local L1_239 = L1_239
	local L2_240 = L2_240
	;({}).options = A0_238
	L1_239(L2_240, {})
	local L3_241 = L3_241
end
function L16_16.team_get_team_info_c2s(A0_242)
	local L1_243 = L1_243
	local L2_244 = L2_244
	;({}).team_id = A0_242
	L1_243(L2_244, {})
	local L3_245 = L3_245
end
function L16_16.try_join_team(A0_246, A1_247, A2_248, A3_249, A4_250, A5_251, A6_252)
	if not A2_248 then
		A2_248 = 1
	end
	if A3_249 and A4_250 then
		if not _ENV.get_target_module(A3_249):is_team_target_open(A4_250, A5_251) then
			BroadcastTips.broadcast_tips(_ENV.get_target_module(A3_249):is_team_target_open(A4_250, A5_251))
			GameFunctions.call_callback(A6_252, false)
			return
		end
		local L10_256 = L10_256
		if not _ENV.get_target_module(A3_249):can_join_other_team(A4_250, A5_251) then
			({}).content = "\229\183\178\230\151\160\229\165\150\229\138\177\230\172\161\230\149\176\239\188\140\230\152\175\229\144\166\229\138\160\229\133\165\233\152\159\228\188\141?\n(\229\184\174\229\138\169\230\156\137\229\165\150\229\138\177\230\172\161\230\149\176\231\154\132\231\142\169\229\174\182\229\143\175\232\142\183\229\190\151<img=Module/Friend-friend_affinityvalue_icon_xiaoshou>\229\143\139\231\136\177\229\128\188)"
			;({}).sure_click = function()
				({}).team_id = A0_246
				;({}).password = A1_247
				local ({}).type, L3_263 = A2_248, L3_263
				L3_263("team_join_team_c2s", {})
				L3_263 = GameFunctions
				L3_263 = L3_263.call_callback
				local L1_261 = L1_261
				L3_263(L1_261, true)
				local L2_262 = L2_262
			end
			;({}).cancel_click = function()
				local L1_264 = L1_264
				L1_264(_ENV, false)
				local L2_265 = L2_265
			end
			;({}).close_click = function()
				local L1_266 = L1_266
				L1_266(_ENV, false)
				local L2_267 = L2_267
			end
			;({}).hide_cb = function()
				local L1_268 = L1_268
				L1_268(_ENV, false)
				local L2_269 = L2_269
			end
			local L11_257 = L11_257
			local L12_258 = L12_258
			L5_5.confirm({})
			local L13_259 = L13_259
			return
		end
	end
	L10_256 = L1_1
	L10_256 = L10_256.send
	L11_257 = "team_join_team_c2s"
	L12_258 = {}
	L12_258.team_id = A0_246
	L12_258.password = A1_247
	L12_258.type = A2_248
	L10_256(L11_257, L12_258)
	L10_256 = GameFunctions
	L10_256 = L10_256.call_callback
	L11_257 = A6_252
	L12_258 = true
	L10_256(L11_257, L12_258)
end
function L16_16.team_join_team_c2s(A0_270, A1_271, A2_272, A3_273, A4_274, A5_275)
	if A3_273 and _ENV.get_target_module(A3_273) and not _ENV.get_target_module(A3_273):is_team_target_open(A4_274, A5_275) then
		BroadcastTips.broadcast_tips(_ENV.get_target_module(A3_273):is_team_target_open(A4_274, A5_275))
		return
	end
	if L20_20.is_in_team() then
		if #L20_20.get_team_info().members >= 2 then
			local L15_285 = L15_285
			;({}).content = string.format("\229\189\147\229\137\141\228\189\141\228\186\142\227\128\144%s\227\128\145\230\136\191\233\151\180\239\188\140\230\152\175\229\144\166\233\128\128\229\135\186\230\136\191\233\151\180\229\185\182\229\138\160\229\133\165\239\188\159", (L20_20.get_team_target_name(L20_20.get_team_type_target_args())))
			;({}).sure_click = function()
				local L1_286 = L1_286
				local L2_287 = L2_287
				local L3_288 = L3_288
				local L4_289 = L4_289
				local L5_290 = L5_290
				L1_286(L2_287, L3_288, L4_289, L5_290, _UPVALUE5_, _UPVALUE6_)
				local L6_291 = L6_291
			end
			L5_5.confirm({})
			local L14_284 = L14_284
			return
		end
	end
	L15_285 = L16_16
	L15_285 = L15_285.try_join_team
	L14_284 = A0_270
	local L8_278 = L8_278
	local L9_279 = L9_279
	local L10_280 = L10_280
	local L11_281 = L11_281
	L15_285(L14_284, L8_278, L9_279, L10_280, L11_281, A5_275)
	local L12_282 = L12_282
end
function L16_16.friend_action_c2s(A0_292, A1_293, A2_294)
	local L3_295 = L3_295
	local L4_296 = L4_296
	;({}).scene_type = A0_292
	;({}).friend_id = A1_293
	;({}).action_id = A2_294
	L3_295(L4_296, {})
	local L5_297 = L5_297
end
function L16_16.team_open_match_team_c2s()
	local L1_298 = L1_298
	L1_298("team_open_match_team_c2s", {})
	local L2_299 = L2_299
end
function L16_16.team_set_message_c2s(A0_300)
	local L1_301 = L1_301
	local L2_302 = L2_302
	;({}).team_message = A0_300
	L1_301(L2_302, {})
	local L3_303 = L3_303
end
function L16_16.team_list_c2s(A0_304, A1_305, A2_306)
	if not A1_305 then
		A1_305 = 1
	end
	if not A2_306 then
		A2_306 = 10
	end
	local L3_307 = L3_307
	local L4_308 = L4_308
	;({}).target = A0_304
	;({}).min = A1_305
	if not A2_306 then
	end
	local ({}).max, L6_310 = _UPVALUE1_, L6_310
	L3_307(L4_308, L6_310)
end
function L16_16.team_cancel_match_quit_c2s()
	local L1_311 = L1_311
	L1_311("team_cancel_match_quit_c2s", {})
	local L2_312 = L2_312
end
function L16_16.team_simple_info_c2s(A0_313)
	local L1_314 = L1_314
	local L2_315 = L2_315
	;({}).team_id = A0_313
	L1_314(L2_315, {})
	local L3_316 = L3_316
end
function L16_16.team_wx_share_log_c2s(A0_317, A1_318, A2_319, A3_320, A4_321)
	local L5_322 = L5_322
	local L6_323 = L6_323
	;({}).action = A0_317
	if not A1_318 then
	end
	local ({}).team_id, L8_325 = 0, L8_325
	L8_325.type = A2_319
	L8_325.target = A3_320
	L8_325.target_role_id = A4_321
	L5_322(L6_323, L8_325)
end
function L16_16.team_match_stat_c2s(A0_326, A1_327)
	local L2_328 = L2_328
	local L3_329 = L3_329
	local L2_328, L4_330 = L2_328(L3_329, A1_327), L4_330
	if not L2_328 then
		return
	end
	L3_329 = L2_328.play_type
	L4_330 = L2_328.max_count
	local L5_331 = L5_331
	local L6_332 = L6_332
	;({}).gameplay_id = L3_329
	;({}).room_capacity = L4_330
	L5_331(L6_332, {})
	local L7_333 = L7_333
end
function L16_16.team_role_status_c2s(A0_334)
	local L1_335 = L1_335
	local L2_336 = L2_336
	;({}).other_id = A0_334
	L1_335(L2_336, {})
	local L3_337 = L3_337
end
function L16_16.on_team_info_s2c(A0_338, A1_339)
	if A0_338 ~= 0 then
		return
	end
	local L2_340 = L2_340
	L2_340(A1_339.team)
	L2_340 = clone
	L2_340 = L2_340(L20_20.get_team_info())
	local L3_341 = L20_20.is_team_captain()
	local L4_342 = L9_9.get_player_id()
	L20_20.update_team_data(A1_339.team)
	if A1_339.team then
		if (not L2_340 or not L3_341) and L20_20.is_team_captain() then
			_ENV.team_apply_list_c2s()
		end
		if L2_340 and L2_340.is_room == 1 and A1_339.team.is_room == 0 then
			BroadcastTips.broadcast_tips("\230\136\191\233\151\180\229\183\178\232\167\163\230\149\163")
		end
	end
	if L20_20.get_value("invite_success") then
		local L5_343 = L5_343
		L5_343("invite_success", false)
		L5_343 = Game
		L5_343 = L5_343.module
		L5_343 = L5_343.jump_to
		local L6_344 = L6_344
		local L7_345 = L7_345
		;({}).handler_args, ({}).key = {}, "team"
		local L9_347 = L9_347
		L6_344(L7_345, L9_347)
	end
end
function L16_16.on_team_create_s2c(A0_348, A1_349)
	if A0_348 ~= 0 then
		return
	end
	_ENV.set_value("team_create_not_broad", false)
	_ENV.set_value("team_open_room_c2s", false)
	local L2_350 = _ENV.get_team_info()
	_ENV.set_value("is_create_one_dragon", false)
	local L3_351 = L3_351
	L3_351 = L3_351("share_team_args")
	if not L3_351 then
		return
	end
	L15_15.share_team(L3_351.team_type, L3_351.team_target, L3_351.team_arg)
	local L7_355 = L7_355
	L7_355 = _ENV
	L7_355 = L7_355.set_value
	local L5_353 = L5_353
	L7_355(L5_353, nil)
	local L6_354 = L6_354
end
function L16_16.on_team_update_role_s2c(A0_356, A1_357)
	if A0_356 ~= 0 then
		return
	end
	if not _ENV.team_info then
		return
	end
	local L2_358 = L2_358
	L2_358(A1_357.role)
	local L3_359 = L3_359
end
function L16_16.on_team_quit_s2c(A0_360, A1_361)
	if A0_360 ~= 0 then
		return
	end
	if not _ENV.get_value("skip_quit_team_target_set") and _ENV.team_info then
		_ENV.alone_team_type_key = _ENV.team_info.type
		_ENV.alone_team_target_key = _ENV.team_info.target
		_ENV.alone_team_args_key = _ENV.team_info.args
	else
		local L3_363 = L3_363
		L3_363("skip_quit_team_target_set", nil)
		local L4_364 = L4_364
	end
	L3_363 = _ENV
	L3_363 = L3_363.quit_team
	L3_363()
end
function L16_16.on_team_quit_info_s2c(A0_365, A1_366)
	if A0_365 ~= 0 then
		if A0_365 then
			error(string.format("team_quit_info_s2c err %s", A0_365))
		end
		return
	end
	if not A1_366 then
		error("team_quit_info_s2c net_data is nil")
		return
	end
	local L2_367 = L2_367
	local L3_368 = L3_368
	local L4_369 = L4_369
	L2_367(L3_368, L4_369, A1_366.action)
	local L5_370 = L5_370
end
function L16_16.on_team_change_leader_s2c(A0_371, A1_372)
	if A0_371 ~= 0 then
		return
	end
	local L2_373 = L2_373
	L2_373(A1_372.role_id)
	local L3_374 = L3_374
end
function L16_16.on_team_apply_s2c(A0_375, A1_376)
	_ENV.update_has_apply_team(A1_376)
	BroadcastTips.broadcast_tips("\229\183\178\229\143\145\233\128\129\231\148\179\232\175\183")
	local L3_377 = L3_377
end
function L16_16.on_team_apply_list_s2c(A0_378, A1_379)
	if not A1_379.apply_list then
		return
	end
	if not _ENV.is_in_team() then
		return
	end
	_ENV.update_team_apply_list(A1_379)
	local L3_380 = L3_380
	L13_13.update_red_point("team_apply_red_point")
	local L4_381 = L4_381
end
function L16_16.on_team_receive_apply_s2c(A0_382, A1_383)
	if not A1_383.apply then
		return
	end
	_ENV.insert_apply(A1_383)
	L0_0.brocast(L22_22.check_pop)
	L13_13.update_red_point("team_apply_red_point")
	local L3_384 = L3_384
end
function L16_16.on_team_handle_apply_s2c(A0_385, A1_386)
	_ENV.handle_apply()
	L13_13.update_red_point("team_apply_red_point")
	local L3_387 = L3_387
end
function L16_16.on_team_invite_s2c(A0_388, A1_389)
	if A0_388 ~= 0 then
		return
	end
	_ENV.try_record_invite_info(A1_389)
	local L2_390 = L2_390
	L2_390("\229\183\178\229\143\145\233\128\129\233\130\128\232\175\183")
	local L3_391 = L3_391
end
function L16_16.on_team_receive_invite_s2c(A0_392, A1_393)
	if not A1_393.invite then
		return
	end
	_ENV.trans_target(A1_393.invite)
	L20_20.insert_invite(A1_393.invite)
	L0_0.brocast(L22_22.update_invite_list)
	L0_0.brocast(L22_22.check_pop)
	local L3_394 = L3_394
end
function L16_16.on_season_invite_s2c(A0_395, A1_396)
	_ENV.insert_robot_invite(A1_396)
	L0_0.brocast(L22_22.update_invite_list)
	L0_0.brocast(L22_22.check_pop)
	L13_13.update_red_point("team_invite_red_point")
	local L3_397 = L3_397
end
function L16_16.on_team_invite_list_s2c(A0_398, A1_399)
	if A0_398 ~= 0 then
		return
	end
	L5_403 = A1_399.invites
	if L5_403 then
		L5_403 = ipairs
		L5_403, _FOR_, _FOR_ = L5_403(A1_399.invites)
		for _FORV_5_, _FORV_6_ in L5_403, _FOR_, _FOR_ do
			_ENV.trans_target(_FORV_6_)
		end
	end
	L5_403 = A1_399.invites
	if L5_403 then
		L5_403 = ipairs
		L8_406 = A1_399.invites
		L5_403, L8_406, _FOR_ = L5_403(L8_406)
		for _FORV_5_, _FORV_6_ in L5_403, L8_406, _FOR_ do
			_FORV_6_.org_time = _FORV_6_.time
		end
	end
	L5_403 = L20_20
	L5_403 = L5_403.update_invite_list
	L8_406 = A1_399.invites
	L5_403(L8_406)
end
function L16_16.on_team_handle_invite_s2c(A0_407, A1_408)
	local L2_409 = L2_409
	L2_409(A1_408.role_id, A0_407 == 0)
	if A0_407 ~= 0 then
		L2_409 = DataConfigs
		L2_409 = L2_409.error_code
		local L3_410 = L3_410
		L3_410 = L3_410(A0_407)
		if not L3_410 then
			L3_410 = tostring(L3_410)
		else
			L3_410 = L26_26.get_string(L3_410)
		end
		BroadcastTips.broadcast_tips(L3_410)
		local L5_412 = L5_412
		L5_412 = L16_16
		L5_412 = L5_412.team_invite_list_c2s
		L5_412()
	end
end
function L16_16.on_team_kick_s2c(A0_413, A1_414)
	if A0_413 ~= 0 then
		return
	end
end
function L16_16.on_team_handover_leader_s2c(A0_415, A1_416)
	if A0_415 ~= 0 then
		return
	end
end
function L16_16.on_team_handle_apply_leader_s2c(A0_417, A1_418)
	if A0_417 ~= 0 then
		return
	end
	if A1_418.role_id and not _ENV.is_team_captain() then
		local L2_419 = L2_419
		L2_419("\229\183\178\232\189\172\232\174\169\233\152\159\233\149\191")
		local L3_420 = L3_420
	end
end
function L16_16.on_team_dismiss_s2c(A0_421, A1_422)
	if A0_421 ~= 0 then
		return
	end
	_ENV.team_dismiss()
	local L2_423 = L2_423
end
function L16_16.on_team_request_invite_s2c(A0_424)
	if A0_424 ~= 0 then
		return
	end
	local L1_425 = L1_425
	L1_425("\229\143\145\233\128\129\230\136\144\229\138\159")
	local L2_426 = L2_426
end
function L16_16.trans_target(A0_427)
	local L1_428, L2_429
	if A0_427 then
		L1_428 = A0_427.target
		if L1_428 then
			L1_428 = A0_427.target
			L2_429 = L1_428.target
			A0_427.target = L2_429
			L2_429 = L1_428.type
			A0_427.type = L2_429
			L2_429 = L1_428.arg
			A0_427.args = L2_429
			L2_429 = L1_428.extend_type
			A0_427.extend_type = L2_429
			L2_429 = L1_428.type
			if L2_429 == 0 then
				L1_428.type = 1
				L1_428.target = 1
				A0_427.type = 1
				A0_427.target = 1
			end
		end
	end
end
function L16_16.on_team_role_info_s2c(A0_430, A1_431)
	if A0_430 ~= 0 then
		return
	end
	if not A1_431.role_info then
		return
	end
	_ENV.update_team_role_info(A1_431.role_info)
	local L3_433 = L3_433
	L3_433 = A1_431.role_info
	L3_433 = L3_433.team_id
	if L3_433 ~= 0 then
		L3_433 = L16_16
		L3_433 = L3_433.is_first_get_team_info
		if L3_433 then
			L3_433 = L16_16
			L3_433 = L3_433.team_info_c2s
			L3_433()
		end
	end
	L3_433 = L16_16
	L3_433 = L3_433.is_first_get_team_info
	if L3_433 then
		L3_433 = L16_16
		L3_433.is_first_get_team_info = false
		L3_433 = L16_16
		L3_433 = L3_433.team_invite_list_c2s
		L3_433()
		L3_433 = A1_431.role_info
		L3_433 = L3_433.team_id
		if L3_433 ~= 0 then
		else
			L3_433 = _ENV
			L3_433.has_init_request_invite = true
			L3_433 = _ENV
			L3_433.has_init_apply_leader = true
		end
	end
end
function L16_16.on_team_role_join_s2c(A0_434, A1_435)
	if A0_434 ~= 0 then
		return
	end
	local L2_436 = _ENV.get_team_info()
	local L3_437 = L3_437
	L3_437(A1_435)
	local L4_438 = L4_438
end
function L16_16.on_team_update_target_s2c(A0_439)
	local L5_444, L6_445, L7_446 = L5_444, L6_445, L7_446
	if A0_439 ~= 0 then
		return
	end
	L5_444 = _ENV
	L5_444 = L5_444.get_value
	L6_445 = "NOT_BROAD_CHANGE_TYPE_TARGET"
	L5_444 = L5_444(L6_445)
	L6_445 = _ENV
	L6_445 = L6_445.get_value
	L7_446 = "REQUEST_CHANGE_TYPE_TARGET"
	L6_445 = L6_445(L7_446)
	L7_446 = _ENV
	L7_446 = L7_446.get_value
	local L7_446, L4_443 = L7_446("is_change_daily_dragon"), L4_443
	L4_443 = nil
	if L6_445 then
		L4_443 = L6_445[1]
		local L12_451 = L12_451
		if _ENV.is_team_captain() and not L5_444 then
			_ENV.set_value("NOT_BROAD_CHANGE_TYPE_TARGET")
			_ENV.set_value("is_change_daily_dragon")
			if not L7_446 then
				local L15_454 = L15_454
				local L16_455 = L16_455
				BroadcastTips.broadcast_tips(string.format("\229\183\178\229\176\134[%s]\232\174\190\228\184\186\231\155\174\230\160\135", (L15_15.get_target_module(L4_443):get_detail_title(L27_27.get_cfg_by_type_target(L4_443, L6_445[2]), L6_445[3]))))
				break -- pseudo-goto
			end
			if L16_455 == 1 then
				BroadcastTips.broadcast_tips("\230\151\165\229\184\184\228\184\128\230\157\161\233\190\153\229\183\178\231\148\159\230\149\136")
			else
				BroadcastTips.broadcast_tips("\230\151\165\229\184\184\228\184\128\230\157\161\233\190\153\229\183\178\229\143\150\230\182\136")
			end
		end
	end
	repeat
	until true
	if _ENV.get_value("NEED_RECRUIT") then
		_ENV.set_value("NEED_RECRUIT", false)
		local L11_450 = L11_450
	end
end
function L16_16.on_team_open_recruit_s2c(A0_456)
	if A0_456 ~= 0 then
		return
	end
	if _ENV.get_value("is_click_open_room") then
		BroadcastTips.broadcast_tips("\229\188\128\229\167\139\230\139\155\229\139\159")
		local L2_458 = L2_458
		L2_458("is_click_open_room", nil)
		local L3_459 = L3_459
	end
	L2_458 = _ENV
	L2_458 = L2_458.recruiting
	L2_458()
end
function L16_16.on_team_stop_recruit_s2c(A0_460)
	if A0_460 ~= 0 then
		return
	end
	BroadcastTips.broadcast_tips("\229\129\156\230\173\162\229\143\172\233\155\134")
	local L2_462 = L2_462
	L2_462 = _ENV
	L2_462 = L2_462.stop_recruiting
	L2_462()
end
function L16_16.on_team_auto_match_s2c(A0_463)
	if A0_463 ~= 0 then
		return
	end
	_ENV.auto_match()
	local L1_464 = L1_464
end
function L16_16.on_team_stop_auto_match_s2c(A0_465)
	if A0_465 ~= 0 then
		return
	end
	_ENV.stop_auto_match()
	local L1_466 = L1_466
end
function L16_16.on_role_list_s2c(A0_467, A1_468)
	if A0_467 ~= 0 then
		return
	end
	_ENV.update_relation_role(A1_468)
	local L2_469 = L2_469
	L2_469 = L2_469("role_list_c2s_source")
	_ENV.set_value("role_list_c2s_source", nil)
	local L3_470 = L3_470
	local L4_471 = L4_471
	local L5_472 = L5_472
	local L6_473 = L6_473
	L3_470(L4_471, L5_472, L6_473, A1_468.relation)
	local L7_474 = L7_474
end
function L16_16.on_team_be_kick_s2c(A0_475, A1_476)
	if A0_475 ~= 0 then
		return
	end
	BroadcastTips.broadcast_tips("\230\130\168\229\183\178\232\162\171\232\175\183\231\166\187\233\152\159\228\188\141")
	local L3_478 = L3_478
	L3_478 = _ENV
	L3_478 = L3_478.team_be_kick
	L3_478()
end
function L16_16.on_team_refuse_apply_s2c(A0_479, A1_480)
	if A0_479 ~= 0 then
		return
	end
	local L2_481 = L2_481
	L2_481(A1_480.team_id)
	local L3_482 = L3_482
end
function L16_16.on_team_cancel_match_s2c(A0_483, A1_484)
	repeat
		if A0_483 ~= 0 then
			return
		end
		if not A1_484.role_id or A1_484.role_id == 0 then
		else
			if _ENV.is_team_captain(A1_484.role_id) then
				if _ENV.get_value("NOT_BROAD_CANCEL_MATCHING") then
					goto lbl_41
				end
				_ENV.set_value("NOT_BROAD_CANCEL_MATCHING")
				BroadcastTips.broadcast_tips("\233\152\159\233\149\191\229\183\178\229\143\150\230\182\136\229\140\185\233\133\141")
				local L4_487 = L4_487
				break -- pseudo-goto
			end
			L4_487 = _ENV
			L4_487 = L4_487.is_in_team
			L4_487 = L4_487()
			if L4_487 then
				L4_487 = BroadcastTips
				L4_487 = L4_487.broadcast_tips
				L4_487("\230\156\137\233\152\159\228\188\141\230\136\144\229\145\152\229\143\150\230\182\136\229\140\185\233\133\141")
				local L3_486 = L3_486
			end
		end
	until true
	::lbl_41::
end
function L16_16.on_team_set_condition_s2c(A0_488, A1_489)
	if A0_488 ~= 0 then
		return
	end
	_ENV.update_condition(A1_489.condition)
	local L2_490 = L2_490
	L2_490("team_condition_changed")
	local L3_491 = L3_491
end
function L16_16.on_team_set_options_s2c(A0_492, A1_493)
	if A0_492 ~= 0 then
		return
	end
	_ENV.update_options(A1_493.options)
	local L2_494 = L2_494
	L2_494("team_option_changed")
	local L3_495 = L3_495
end
function L16_16.on_team_match_team_s2c(A0_496, A1_497)
	if A0_496 ~= 0 then
		return
	end
	_ENV.update_match_team_info(A1_497.info)
	local L2_498 = _ENV.get_match_info()
	local L3_499 = L3_499
	L3_499 = L3_499(L2_498.target.type, L2_498.target.target, L2_498.target.arg)
	local L4_500 = L4_500
	L4_500 = L4_500(L2_498.target.type)
	local L5_501 = L5_501
	L5_501 = L5_501(L4_500.name)
	local L6_502 = L6_502
	local L7_503 = L7_503
	local L10_506 = L10_506
	local L6_502, L11_507 = L6_502(L7_503, L10_506, L3_499, L2_498.team_num, L2_498.team_max_num), L11_507
	L7_503 = {}
	L7_503.content = L6_502
	function L10_506()
		_ENV.team_get_team_info_c2s(L2_498.team_id)
		local L1_508 = L1_508
	end
	L7_503.sure_click = L10_506
	L10_506 = L5_5
	L10_506 = L10_506.confirm
	L11_507 = L7_503
	L10_506(L11_507)
end
function L16_16.on_team_get_team_info_s2c(A0_509, A1_510)
	if A0_509 ~= 0 then
		_ENV.team_open_match_team_c2s()
		return
	end
	L20_20.update_match_team_info(A1_510)
	local L2_511 = L20_20.get_match_info()
	if L2_511.team_num == L2_511.team_max_num then
		BroadcastTips.broadcast_tips("\232\175\165\233\152\159\228\188\141\229\183\178\230\187\161\239\188\140\230\141\162\228\184\170\229\136\171\231\154\132\232\175\149\232\175\149\229\144\167")
		_ENV.team_open_match_team_c2s()
		return
	end
	if L2_511.team_status == L21_21.team_status.matching then
		BroadcastTips.broadcast_tips("\232\175\165\233\152\159\228\188\141\229\183\178\232\191\155\229\133\165\229\140\185\233\133\141\233\152\159\229\136\151\239\188\140\230\141\162\228\184\170\229\136\171\231\154\132\232\175\149\232\175\149\229\144\167")
		_ENV.team_open_match_team_c2s()
		return
	end
	if L2_511.team_status == L21_21.team_status.fighting then
		BroadcastTips.broadcast_tips("\232\175\165\233\152\159\228\188\141\229\183\178\229\156\168\228\189\156\230\136\152\228\184\173\239\188\140\230\141\162\228\184\170\229\136\171\231\154\132\232\175\149\232\175\149\229\144\167")
		_ENV.team_open_match_team_c2s()
		return
	end
	if L2_511.options[1].v == 1 then
		({}).content = "\232\175\165\233\152\159\228\188\141\233\156\128\232\166\129\231\148\179\232\175\183\239\188\140\230\152\175\229\144\166\233\128\128\229\135\186\233\152\159\228\188\141\229\185\182\231\148\179\232\175\183\229\138\160\229\133\165\239\188\159"
		;({}).sure_click = function()
			_ENV.team_join_team_c2s(L2_511.team_id)
			local L1_515 = L1_515
		end
		;({}).cancel_click = function()
			_ENV.team_open_match_team_c2s()
		end
		;({}).close_click = function()
			_ENV.team_open_match_team_c2s()
		end
		L5_5.confirm({})
		local L5_514 = L5_514
		return
	end
	L5_514 = _ENV
	L5_514 = L5_514.team_join_team_c2s
	L5_514(L2_511.team_id)
	local L4_513 = L4_513
end
function L16_16.on_friend_action_s2c(A0_516, A1_517)
	if A0_516 ~= 0 then
		return
	end
end
function L16_16.on_friend_broadcast_action_s2c(A0_518, A1_519)
	local L5_523 = L5_523
	if A0_518 ~= 0 then
		return
	end
	L5_523 = _ENV
	L5_523 = L5_523.raw_get_player_info
	L5_523 = L5_523(A1_519.send_id)
	local L3_521 = L3_521
	local L3_521, L4_522 = L3_521(A1_519.recv_id), L4_522
	L4_522 = L5_523 or A1_519.recv_id
	if L5_523 then
		L4_522 = L5_523.name
	end
	if L3_521 then
	end
	if L4_522 and L3_521.name then
		if L4_522 == L3_521.name then
			BroadcastTips.broadcast_tips((string.format("[%s]\228\189\191\231\148\168\228\186\134%s", L4_522, L26_26.get_string(L28_28.get_cfg_by_id(A1_519.action_id).act))))
		else
			local L10_528 = L10_528
			local L11_529 = L11_529
			local L12_530 = L12_530
			L12_530 = L12_530("[%s]\229\175\185[%s]\228\189\191\231\148\168\228\186\134%s", L4_522, L3_521.name, L26_26.get_string(L28_28.get_cfg_by_id(A1_519.action_id).act))
			BroadcastTips.broadcast_tips(L12_530)
		end
	end
	L11_529 = L0_0
	L11_529 = L11_529.brocast
	L12_530 = L22_22
	L12_530 = L12_530.team_friend_broadcast_action
	L11_529(L12_530, A1_519)
end
function L16_16.on_team_switch_pos_s2c(A0_531, A1_532)
	if A0_531 ~= 0 then
		return
	end
end
function L16_16.on_team_received_switch_s2c(A0_533, A1_534)
	local L2_535
	if A0_533 ~= 0 then
		return
	end
	L2_535 = Game
	L2_535 = L2_535.module
	L2_535 = L2_535.scene_manager
	if not _ENV.view_is_opened("RaffleView") and (L2_535.the_cur_scene_tp_is("fight") or L2_535.the_cur_scene_tp_is("mini_play")) then
		return
	end
	local L3_536 = L3_536
	L3_536 = L3_536(A1_534.role_id)
	if L3_536 then
		local L4_537 = L4_537
		local L4_537, L5_538 = L4_537 .. A1_534.role_id, L5_538
		L5_538 = L16_16
		L5_538 = L5_538.exchange_confirm_key
		if not L5_538 then
			L5_538 = L16_16
			L5_538.exchange_confirm_key = {}
		end
		L5_538 = false
		_FOR_, _FOR_, _FOR_ = ipairs(L16_16.exchange_confirm_key)
		for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_10_ == L4_537 then
				L5_538 = true
			end
		end
		if not L5_538 then
			table.insert(L16_16.exchange_confirm_key, L4_537)
			local L6_539 = L6_539
			L6_539 = L6_539("game.module.common_view.manager.confirm")
			local L7_540 = L7_540
			local L8_541 = L8_541
			L7_540 = L7_540(L8_541, L3_536.name)
			L8_541 = {}
			L8_541.content = L7_540
			function L8_541.sure_click()
				L4_547 = _ENV
				L4_547 = L4_547.exchange_confirm_key
				L3_546, L4_547, _FOR_ = L3_546(L4_547)
				for _FORV_3_, _FORV_4_ in L3_546, L4_547, _FOR_ do
					L6_539.hide(_FORV_4_)
				end
				L3_546 = _ENV
				L4_547 = {}
				L3_546.exchange_confirm_key = L4_547
				L3_546 = _ENV
				L3_546 = L3_546.team_handle_switch_c2s
				L4_547 = A1_534
				L4_547 = L4_547.role_id
				L5_548 = 1
				L3_546(L4_547, L5_548)
			end
			function L8_541.cancel_click()
				local L4_554, L0_550 = _ENV, L0_550
				L4_554 = L4_554.role_id
				L0_550 = L0_550 .. L4_554
				L4_554 = ipairs
				L4_554, _FOR_, _FOR_ = L4_554(L16_16.exchange_confirm_key)
				for _FORV_4_, _FORV_5_ in L4_554, _FOR_, _FOR_ do
					if _FORV_5_ == L0_550 then
						table.remove(L16_16.exchange_confirm_key, _FORV_4_)
						break
					end
				end
				L4_554 = L16_16
				L4_554 = L4_554.team_handle_switch_c2s
				L6_555 = _ENV
				L6_555 = L6_555.role_id
				L7_556 = 0
				L4_554(L6_555, L7_556)
			end
			function L8_541.close_click()
				local L4_562, L0_558 = _ENV, L0_558
				L4_562 = L4_562.role_id
				L0_558 = L0_558 .. L4_562
				L4_562 = ipairs
				L4_562, _FOR_, _FOR_ = L4_562(L16_16.exchange_confirm_key)
				for _FORV_4_, _FORV_5_ in L4_562, _FOR_, _FOR_ do
					if _FORV_5_ == L0_558 then
						table.remove(L16_16.exchange_confirm_key, _FORV_4_)
						break
					end
				end
				L4_562 = L16_16
				L4_562 = L4_562.team_handle_switch_c2s
				L6_563 = _ENV
				L6_563 = L6_563.role_id
				L7_564 = 0
				L4_562(L6_563, L7_564)
			end
			L8_541.key = L4_537
			local L9_542 = L9_542
			L9_542(L8_541)
		end
	end
end
function L16_16.on_team_handle_switch_s2c(A0_566, A1_567)
	if A0_566 ~= 0 then
		return
	end
end
function L16_16.on_team_switch_result_s2c(A0_568, A1_569)
	if A0_568 ~= 0 then
		return
	end
	if A1_569.result == 1 then
		BroadcastTips.broadcast_tips("\229\175\185\230\150\185\229\144\140\230\132\143\228\189\141\231\189\174\228\186\164\230\141\162\232\175\183\230\177\130")
	else
		local L2_570 = L2_570
		L2_570("\229\175\185\230\150\185\230\139\146\231\187\157\228\189\141\231\189\174\228\186\164\230\141\162\232\175\183\230\177\130")
		local L3_571 = L3_571
	end
end
function L16_16.on_team_set_message_s2c(A0_572, A1_573)
	if A0_572 ~= 0 then
		return
	end
	local L2_574 = L2_574
	if not A1_573.team_message then
	end
	L2_574("")
	local L3_575 = L3_575
end
function L16_16.on_team_list_s2c(A0_576, A1_577)
	if A0_576 ~= 0 then
		return
	end
	_ENV.refresh_hall_team_list(A1_577)
	local L2_578 = L2_578
	local L3_579 = L3_579
	L2_578(L3_579, A1_577.target)
	local L4_580 = L4_580
end
function L16_16.on_team_cancel_match_quit_s2c(A0_581, A1_582)
	if A0_581 ~= 0 then
		return
	end
end
function L16_16.on_team_simple_info_s2c(A0_583, A1_584)
	if A0_583 ~= 0 then
		return
	end
	if A1_584.team_simple then
		_ENV.brocast("team_simple_info", A1_584.team_simple)
		local L4_587 = L4_587
		L4_587 = L15_15
		L4_587 = L4_587.try_handle_team_simple_info_s2c
		L4_587(A1_584.team_simple)
		local L3_586 = L3_586
	end
end
