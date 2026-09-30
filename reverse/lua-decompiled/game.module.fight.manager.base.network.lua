local L0_0, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9 = L0_0, "game.network.network_utils", L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
L0_0 = L0_0(L3_3)
L3_3 = require
L4_4 = "game.utils.events"
L3_3 = L3_3(L4_4)
L4_4 = string
L4_4 = L4_4.format
L5_5 = GameFunctions
L6_6 = Game
L6_6 = L6_6.server_time
L7_7 = Game
L7_7 = L7_7.module
L7_7 = L7_7.fight
L8_8 = L7_7.ways
L8_8 = L8_8.base
L9_9 = {}
L9_9.battle_pause_c2s = true
L9_9.battle_reconnect_enter_c2s = true
function L8_8.custom_loading_stop_c2s(A0_10, A1_11, A2_12)
	if A1_11 == "battle_round_finish_c2s" then
	else
		if A1_11 == "battle_loading_progress_c2s" then
			_FOR_, _FOR_, _FOR_ = pairs(A0_10.id_to_unit)
			for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
				if _FORV_7_.role then
					({}).progress = A2_12.progress
					;({}).role_id = _FORV_7_.role.role_id
					A0_10:on_msg_battle_loading_progress_s2c(0, {})
				end
			end
			L8_18 = A2_12.progress
			if 100 <= L8_18 then
				L9_19 = A0_10
				L8_18 = A0_10.on_msg_battle_enter_s2c
				L10_20 = 0
				L12_22 = {}
				L12_22.server_time = _ENV.get_mil_server_timer()
				L8_18(L9_19, L10_20, L12_22)
			end
			do return end
			break -- pseudo-goto
		end
		if A1_11 == "battle_show_force_info_c2s" then
			L9_19 = A0_10
			L8_18 = A0_10.on_msg_battle_show_force_info_c2s
			L10_20 = 0
			L12_22 = {}
			L8_18(L9_19, L10_20, L12_22)
			repeat
				return
			until true
		end
	end
	L8_18 = true
	return L8_18
end
function L8_8.send_network_msg(A0_23, A1_24, A2_25, A3_26)
	if A0_23.client_type_handler:send_network_msg(A1_24, A2_25, A3_26) then
		return
	end
	local L5_27 = L5_27
	local L6_28 = L6_28
	local L7_29 = L7_29
	L5_27(L6_28, L7_29, A2_25, A3_26)
	local L8_30 = L8_30
end
function L8_8.raw_send_network_msg(A0_31, A1_32, A2_33, A3_34)
	if A0_31.game_state == "loading" and A0_31.need_stop_fight and not A0_31:custom_loading_stop_c2s(A1_32, A2_33) then
		return
	end
	if _ENV.get_time_is_pause() and not L9_9[A1_32] then
		return
	end
	if A0_31.is_reconnecting_from_replay then
		return
	end
	local L5_35 = L5_35
	local L6_36 = L6_36
	L5_35(L6_36, A2_33, A3_34)
	local L7_37 = L7_37
end
function L8_8.setup_network(A0_38)
	local L6_44 = L6_44
	if A0_38.network_events then
		return
	end
	L6_44 = {}
	A0_38.network_events = L6_44
	L8_46 = A0_38
	L6_44 = A0_38.get_network_events
	L6_44 = L6_44(L8_46)
	L8_46 = ipairs
	L8_46, _FOR_, _FOR_ = L8_46(L6_44)
	for _FORV_5_, _FORV_6_ in L8_46, _FOR_, _FOR_ do
		A0_38.network_events[_FORV_6_] = function(A0_47, A1_48, A2_49)
			if A2_49 then
				pcall(A0_47.try_record_debug_network_msg, A0_47, _ENV, A2_49)
			end
			if (_ENV.get_time_is_pause() or A0_47.block_network_msgs) and _ENV ~= "battle_reconnect_enter_s2c" then
				A0_47:add_delay_network_msg(_ENV, A1_48, A2_49)
				return
			end
			if _ENV == "battle_reconnect_enter_s2c" and A1_48 ~= 0 then
				_UPVALUE2_(A0_47, _ENV, A1_48, A2_49)
				return
			end
			if A0_47.is_reconnecting then
				if A0_47:is_multi_player_physics_env() then
					if _ENV ~= "battle_physics_sync_history_msg_s2c" and not A0_47.is_reconnecting_from_replay then
						return
					end
				elseif _ENV ~= "battle_reconnect_enter_s2c" then
					return
				end
			end
			local L3_50 = L3_50
			local L4_51 = L4_51
			local L5_52 = L5_52
			local L6_53 = L6_53
			L3_50(L4_51, L5_52, L6_53, A2_49)
			local L7_54 = L7_54
		end
	end
	L8_46 = L0_0
	L8_46 = L8_46.listen_net_events
	L8_46(A0_38.network_events, "fight", A0_38)
	L8_46 = require
	L8_46 = L8_46("game.network.network")
	local L3_41 = L3_41
	L3_41(5)
	local L4_42 = L4_42
end
function L8_8.clear_network(A0_55)
	if not A0_55.network_events then
		return
	end
	_ENV.unlisten_net_events(A0_55.network_events)
	A0_55.network_events = nil
	require("game.network.network").reset_heartbeat_interval()
	local L2_56 = L2_56
end
function L8_8.req_battle_show_force_info_c2s(A0_57)
	local L3_58 = L3_58
	L3_58(A0_57, "battle_show_force_info_c2s", {})
	local L4_59 = L4_59
end
function L8_8.get_network_events(A0_60)
	local L1_61
	L1_61 = {}
	local L15_75 = L15_75
	local L16_76 = L16_76
	local L17_77 = L17_77
	local L18_78 = L18_78
	local L19_79 = L19_79
	local L20_80 = L20_80
	local L21_81 = L21_81
	local L22_82 = L22_82
	local L23_83 = L23_83
	local L24_84 = L24_84
	local L25_85 = L25_85
	local L26_86 = L26_86
	local L27_87 = L27_87
	local L28_88 = L28_88
	local L29_89 = L29_89
	local L30_90 = L30_90
	local L31_91 = L31_91
	local L32_92 = L32_92
	local L33_93 = L33_93
	local L34_94 = L34_94
	local L35_95 = L35_95
	local L36_96 = L36_96
	local L37_97 = L37_97
	local L38_98 = L38_98
	local L39_99 = L39_99
	local L40_100 = L40_100
	local L41_101 = L41_101
	local L42_102 = L42_102
	local L43_103 = L43_103
	local L44_104 = L44_104
	local L45_105 = L45_105
	local L46_106 = L46_106
	local L47_107 = L47_107
	local L48_108 = L48_108
	local L49_109 = L49_109
	local L50_110 = L50_110
	L1_61[1] = L15_75
	L1_61[2] = L16_76
	L1_61[3] = L17_77
	L1_61[4] = L18_78
	L1_61[5] = L19_79
	L1_61[6] = L20_80
	L1_61[7] = L21_81
	L1_61[8] = L22_82
	L1_61[9] = L23_83
	L1_61[10] = L24_84
	L1_61[11] = L25_85
	L1_61[12] = L26_86
	L1_61[13] = L27_87
	L1_61[14] = L28_88
	L1_61[15] = L29_89
	L1_61[16] = L30_90
	L1_61[17] = L31_91
	L1_61[18] = L32_92
	L1_61[19] = L33_93
	L1_61[20] = L34_94
	L1_61[21] = L35_95
	L1_61[22] = L36_96
	L1_61[23] = L37_97
	L1_61[24] = L38_98
	L1_61[25] = L39_99
	L1_61[26] = L40_100
	L1_61[27] = L41_101
	L1_61[28] = L42_102
	L1_61[29] = L43_103
	L1_61[30] = L44_104
	L1_61[31] = L45_105
	L1_61[32] = L46_106
	L1_61[33] = L47_107
	L1_61[34] = L48_108
	L1_61[35] = L49_109
	L1_61[36] = L50_110
	L1_61[37] = "battle_auto_battle_s2c"
	L1_61[38] = "battle_command_mark_apply_s2c"
	L1_61[39] = "battle_effect_mark_update_s2c"
	L1_61[40] = "battle_round_finish_s2c"
	L1_61[41] = "battle_end_s2c"
	L1_61[42] = "battle_chat_bubble_s2c"
	L1_61[43] = "battle_gain_select_info_s2c"
	L1_61[44] = "battle_gain_select_s2c"
	L1_61[45] = "battle_gain_list_s2c"
	L1_61[46] = "battle_gain_select_reset_s2c"
	L1_61[47] = "battle_gain_reset_cnt_s2c"
	L1_61[48] = "battle_tips_unlock_s2c"
	L1_61[49] = "battle_target_update_s2c"
	local L1_61[50], L51_111 = "battle_soul_pick_s2c", L51_111
	L15_75 = "battle_soul_move_s2c"
	L16_76 = "battle_physics_result_s2c"
	L17_77 = "battle_physics_update_obj_pos_s2c"
	L18_78 = "battle_physics_sync_history_msg_s2c"
	L19_79 = "battle_physics_timeline_update_s2c"
	L20_80 = "battle_physics_obstacle_destroyed_c2s"
	L21_81 = "battle_command_action_s2c"
	L22_82 = "battle_command_action_cancel_s2c"
	L23_83 = "battle_command_control_apply_s2c"
	L24_84 = "battle_command_control_resp_s2c"
	L25_85 = "battle_command_control_apply_cancel_s2c"
	L26_86 = "battle_command_control_finish_s2c"
	L27_87 = "battle_command_req_place_land_s2c"
	L1_61[51] = L15_75
	L1_61[52] = L16_76
	L1_61[53] = L17_77
	L1_61[54] = L18_78
	L1_61[55] = L19_79
	L1_61[56] = L20_80
	L1_61[57] = L21_81
	L1_61[58] = L22_82
	L1_61[59] = L23_83
	L1_61[60] = L24_84
	L1_61[61] = L25_85
	L1_61[62] = L26_86
	L1_61[63] = L27_87
	return L1_61
end
function L8_8.add_delay_network_msg(A0_112, A1_113, A2_114, A3_115)
	if not A0_112.cache_network_msgs then
	end
	A0_112.cache_network_msgs = {}
	local L4_116 = L4_116
	local L5_117 = L5_117
	;({}).event_name = A1_113
	;({}).err = A2_114
	;({}).msg = A3_115
	L4_116(L5_117, {})
	local L6_118 = L6_118
end
function L8_8.do_cache_network_msgs(A0_119)
	A0_119.block_network_msgs = nil
	L3_122 = A0_119.cache_network_msgs
	if L3_122 then
		L3_122 = next
		L4_123 = A0_119.cache_network_msgs
		L3_122 = L3_122(L4_123)
		if L3_122 then
			goto lbl_11
		end
	end
	do return end
	::lbl_11::
	L3_122 = ipairs
	L4_123 = A0_119.cache_network_msgs
	L3_122, L4_123, L5_124 = L3_122(L4_123)
	for _FORV_4_, _FORV_5_ in L3_122, L4_123, L5_124 do
		local L8_127 = L8_127
		local L9_128 = L9_128
		L8_127(L9_128, _FORV_5_.event_name, _FORV_5_.err, _FORV_5_.msg)
		local L10_129 = L10_129
	end
end
function L8_8.req_battle_auto_battle_c2s(A0_130, A1_131)
	local L2_132, L3_133 = L2_132, L3_133
	local L4_134 = L4_134
	local ({}).is_auto, L6_136 = A1_131 == true, L6_136
	L2_132(L3_133, L4_134, L6_136)
end
function L8_8.on_msg_battle_enter_s2c(A0_137, A1_138, A2_139)
	A0_137.enter_fight_time_ms = A2_139.server_time
	if not A2_139.target_list then
	end
	A0_137.target_list = {}
	local L4_140 = L4_140
	L4_140(A0_137, "fighting")
	local L5_141 = L5_141
end
function L8_8.on_msg_stop_fight(A0_142, A1_143, A2_144)
	A0_142:stop_fight()
end
function L8_8.on_msg_battle_next_round_s2c(A0_145, A1_146, A2_147)
	A0_145:change_fight_state("switch_round", A2_147)
	local L6_149 = L6_149
	L6_149 = _ENV
	L6_149 = L6_149.brocast
	L6_149("battle_next_round", A2_147.round)
end
function L8_8.on_msg_battle_pass_s2c(A0_150, A1_151, A2_152)
	local L3_153, L4_154
	L3_153 = A0_150.id_to_unit
	L4_154 = A2_152.object_id
	L3_153 = L3_153[L4_154]
	if not L3_153 then
		return
	end
	L4_154 = A2_152.round
	if not L4_154 or A0_150.round.round_count ~= L4_154 then
		local L5_155, L6_156 = L5_155, L6_156
		local L8_158 = L8_158
		local L9_159 = L9_159
		local L8_158, L10_160 = L8_158 .. L9_159 .. "," .. A0_150.round.round_count, L10_160
		L5_155(L6_156, L8_158)
		return
	end
	L5_155 = A2_152.type
	if L5_155 ~= 1 then
		return
	end
	L5_155 = Time
	L5_155 = L5_155.time
	L3_153.last_op_time = L5_155
	L3_153.oped = true
end
