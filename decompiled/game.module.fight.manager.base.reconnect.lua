local L0_0, L2_2, L3_3, L4_4 = L0_0, "game.network.network_utils", L3_3, L4_4
L0_0 = L0_0(L2_2)
L2_2 = Game
L2_2 = L2_2.module
L2_2 = L2_2.fight
L3_3 = L2_2.ways
L3_3 = L3_3.base
function L4_4(A0_5)
	print("on_network_disconnect")
	local L2_6 = L2_6
	A0_5.is_reconnecting = true
end
L3_3.on_network_disconnect = L4_4
function L4_4(A0_7)
	if A0_7.game_state == "loading" then
		A0_7:update_cur_load_progress()
	elseif A0_7.game_state == "fighting" then
		local L1_8, L2_9 = L1_8, L2_9
		local L3_10 = L3_10
		;({}).physics_seq_id = A0_7.cur_seq_id
		local L6_13 = L6_13
		L6_13.watch_seq_id = A0_7.client_type_handler:get_has_watch_seq_id()
		L1_8(L2_9, L3_10, L6_13)
		A0_7.is_reconnecting = true
	end
end
L3_3.on_network_reconnect_succ = L4_4
function L4_4(A0_14, A1_15)
	A0_14:clear_mark()
	local L5_19 = L5_19
	L6_20 = A0_14
	L5_19 = A0_14.clear_drop
	L5_19(L6_20)
	L5_19 = Game
	L5_19 = L5_19.ui_manager
	L5_19 = L5_19.close_view
	L6_20 = Game
	L6_20 = L6_20.ui_const
	L6_20 = L6_20.FightCommandUI
	L6_20 = L6_20.name
	L5_19(L6_20)
	A0_14.cache_network_msgs = nil
	L5_19 = A0_14.round
	if not L5_19 then
		return
	end
	L5_19 = A0_14.round
	L6_20 = {}
	L5_19.bullet_nodes = L6_20
	L6_20 = A0_14
	L5_19 = A0_14.del_all_bullets
	L5_19(L6_20)
	L5_19 = A0_14.round
	L6_20 = {}
	L5_19.processings = L6_20
	L6_20 = A0_14
	L5_19 = A0_14.clear_round_fire_actions
	L5_19(L6_20)
	L6_20 = A0_14
	L5_19 = A0_14.reset_cmd
	L5_19(L6_20)
	L5_19 = A0_14.round
	L6_20 = {}
	L5_19.cur_perform_ids = L6_20
	L6_20 = A0_14
	L5_19 = A0_14.set_round_perform_status
	L7_21 = _ENV
	L7_21 = L7_21.round_perform_status
	L7_21 = L7_21.normal
	L5_19(L6_20, L7_21)
	L5_19 = A1_15.round
	if 0 < L5_19 then
		L5_19 = A1_15.round
		L6_20 = A0_14.round
		L6_20 = L6_20.round_count
		if L5_19 ~= L6_20 then
			L5_19 = A0_14.round
			L6_20 = {}
			L5_19.timers_special = L6_20
			L6_20 = A0_14
			L5_19 = A0_14.clear_all_round_timers
			L5_19(L6_20)
			L5_19 = A0_14.round
			L5_19.last_attacker_infos = nil
			L5_19 = A0_14.round
			L5_19 = L5_19.cur_attacker_infos
			if L5_19 then
				L6_20 = ipairs
				L7_21 = L5_19
				L6_20, L7_21, _FOR_ = L6_20(L7_21)
				for _FORV_6_, _FORV_7_ in L6_20, L7_21, _FOR_ do
					A0_14:reset_unit_something_on_finish_round_by_obj_id(_FORV_7_.obj_id)
				end
			end
			L6_20 = A0_14.round
			L6_20.cur_attacker_infos = nil
		end
	end
end
L3_3.reconnect_clear_data = L4_4
function L4_4(A0_25)
	local L1_26 = L1_26
	L1_26 = L1_26("game.ui.manager.ui_const")
	local L2_27 = L2_27
	L2_27 = L2_27("game.module.common_view.manager.confirm")
	local L3_28 = L3_28
	;({}).hide_cancel = true
	;({}).hide_close = true
	local ({}).layer, L5_30 = L1_26.sorting_layer_type.GuideView, L5_30
	L5_30.content = "\230\136\152\230\150\151\233\135\141\232\191\158\229\188\130\229\184\184\239\188\129"
	function L5_30.sure_click()
		_ENV:exit_fight()
		local L1_31 = L1_31
	end
	L3_28(L5_30)
end
function L3_3.on_msg_battle_reconnect_enter_s2c(A0_32, A1_33, A2_34)
	if A1_33 ~= 0 then
		_ENV(A0_32)
		return
	end
	local L3_35 = L3_35
	local L4_36 = L4_36
	local L5_37 = L5_37
	local L6_38 = L6_38
	L3_35(L4_36, L5_37, L6_38, A2_34)
	local L7_39 = L7_39
end
function L3_3.snapshot_reconnect(A0_40, A1_41)
	repeat
		local L2_42, L3_43 = L2_42, L3_43
		L2_42(L3_43, A1_41)
		A0_40.block_network_msgs = true
		L2_42 = A1_41.server_time
		A0_40.enter_fight_time_ms = L2_42
		L2_42 = 2
		function L3_43()
			_ENV = _ENV - 1
			if _ENV == 0 then
				A0_40:snapshot_reconnect_on_prepare_land_finish(A1_41)
				local L2_49 = L2_49
				L2_49 = A0_40
				L2_49 = L2_49.do_cache_network_msgs
				L2_49(L2_49)
			end
		end
		A0_40:init_block_list(A1_41.block_list, L3_43)
		if A1_41.holes then
			local L5_45 = L5_45
			local L6_46 = L6_46
			L5_45(L6_46, A1_41.holes, L3_43)
			local L7_47 = L7_47
			break -- pseudo-goto
		end
		L5_45 = L3_43
		L5_45()
	until true
end
function L3_3.snapshot_reconnect_on_prepare_land_finish(A0_50, A1_51)
	if not A1_51.target_list then
	end
	A0_50.target_list = {}
	A0_50.round_fix_action_list = A1_51.round_fix_action_list
	if A0_50.game_state ~= "fighting" then
		A0_50:change_game_state("fighting", A1_51.play_speed)
	end
	A0_50:update_units_on_reconnect(A1_51)
	A0_50:update_souls_on_reconnect(A1_51)
	A0_50:update_soul_points_on_reconnect(A1_51)
	A0_50:init_skill_use_record_by_unit_skill_infos()
	A0_50:init_unit_command_infos(A1_51.command_mark_list)
	A0_50:init_score_list(A1_51.score_list)
	A0_50:init_gain_data(A1_51)
	A0_50:init_commander_data(A1_51.battle_command_camp_list)
	if A1_51.round > 0 and A1_51.round ~= A0_50.round.round_count and A1_51.action_list then
		({}).turn = A1_51.turn
		;({}).round = A1_51.round
		;({}).wind = A1_51.wind
		;({}).round_stime = A1_51.round_stime
		;({}).action_list = A1_51.action_list
		;({}).round_next_action_list = A1_51.round_next_action_list
		;({}).from_reconnect = true
		;({}).is_repeat_round = A1_51.is_repeat_round
		A0_50:change_fight_state("switch_round", {})
	end
	local L2_52 = L2_52
	L2_52(A0_50, A1_51.reply_stat)
	L2_52 = A1_51.mark_list
	if L2_52 then
		L3_53, _FOR_, _FOR_ = L3_53(L2_52)
		for _FORV_6_, _FORV_7_ in L3_53, _FOR_, _FOR_ do
			A0_50:add_mark(_FORV_7_)
		end
	end
	L3_53 = A1_51.drop_list
	if L3_53 then
		_FOR_, _FOR_, _FOR_ = ipairs(L3_53)
		for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
			A0_50:add_drop(_FORV_8_, true)
		end
	end
	L11_61 = A0_50
	L10_60 = A0_50.get_ctrl_unit
	L10_60 = L10_60(L11_61)
	if L10_60 then
		L11_61 = L10_60.is_cur_round_attacker
		if L11_61 then
			L11_61 = L10_60.mutual_fire_skill_id
			if L11_61 then
				L11_61 = require
				L12_62 = "game.utils.events"
				L11_61 = L11_61(L12_62)
				L12_62 = L11_61.brocast
				L12_62("fight_ctrl_mutual_skill_changed", L10_60.mutual_fire_skill_id)
			end
		end
	end
	L12_62 = A0_50
	L11_61 = A0_50.recover_skill_effects_on_reconnect
	L11_61(L12_62)
	L12_62 = A0_50
	L11_61 = A0_50.init_show_forces
	L11_61(L12_62, A1_51.show_force_obj_list)
	L11_61 = A1_51.camera_offset
	if L11_61 then
		L12_62 = A0_50.set_camera_focus_offset
		L12_62(A0_50, L11_61.offset_x, L11_61.offset_y)
	end
	L12_62 = A0_50.init_round_wait_support_lands
	L12_62(A0_50, A1_51.wait_support_lands)
	L12_62 = A0_50.raw_set_is_pause
	L12_62(A0_50, A1_51.is_pause)
	L12_62 = A1_51.is_wait_round_finish
	if L12_62 == true then
		L12_62 = A0_50.set_round_perform_status
		local L7_57 = L7_57
		L12_62(L7_57, _ENV.round_perform_status.wait_done)
		local L8_58 = L8_58
	end
	A0_50.is_reconnecting = nil
end
function L3_3.update_units_on_reconnect(A0_63, A1_64)
	local L2_65, L3_66
	L3_66 = A1_64.objects
	L9_72 = A0_63
	local L8_71 = A0_63.sort_object_msgs
	L8_71(L9_72, L3_66, true)
	L8_71 = {}
	L9_72 = ipairs
	L9_72, _FOR_, _FOR_ = L9_72(L3_66)
	for _FORV_8_, _FORV_9_ in L9_72, _FOR_, _FOR_ do
		L8_71[_FORV_9_.object_id] = true
		L2_65 = A0_63:get_unit_by_id(_FORV_9_.object_id, true)
		if L2_65 then
			A0_63:refresh_unit_by_obj(L2_65, _FORV_9_)
			repeat
				do break end -- pseudo-goto
				A0_63:dynamic_add_unit(_FORV_9_)
			until true
		end
	end
	L9_72 = pairs
	L13_76 = A0_63.id_to_unit
	L9_72, L13_76, _FOR_ = L9_72(L13_76)
	for _FORV_8_, _FORV_9_ in L9_72, L13_76, _FOR_ do
		if not L8_71[_FORV_8_] then
			A0_63:destroy_unit(_FORV_9_)
		end
	end
end
function L3_3.refresh_unit_by_obj(A0_77, A1_78, A2_79)
	A0_77:try_to_req_stop_move_unit(A1_78)
	A0_77:clear_unit_extra_hit_area(A1_78)
	A0_77:try_to_del_unit_buffs_by_now_list(A1_78, A2_79.buff_list)
	A0_77:set_unit_state(A1_78, _ENV.role_status.idle)
	A1_78.round_count = A2_79.round_count
	if not A1_78.pet and not A1_78.hidden_units then
		if A0_77:is_physics_env() then
			L10_87(A0_77, A1_78, A2_79.pos, true, true, nil, nil, true)
			repeat
				do break end -- pseudo-goto
				L11_88 = A0_77
				L10_87 = A0_77.set_unit_land_pos
				L10_87(L11_88, A1_78, A2_79.pos, true)
			until true
		end
		L11_88 = A0_77
		L10_87 = A0_77.try_to_turn_unit_face
		L10_87(L11_88, A1_78, A2_79.direction, true)
	end
	L11_88 = A0_77
	L10_87 = A0_77.on_msg_battle_update_attr_s2c
	;({}).object_id = A2_79.object_id
	;({}).attr = A2_79.attrs
	L10_87(L11_88, 0, {})
	L10_87 = clone_to
	L11_88 = A1_78.type
	L11_88 = A2_79[L11_88]
	L10_87(L11_88, A1_78[A1_78.type])
	L10_87 = A2_79.ps_list
	A1_78.ps_list = L10_87
	L10_87 = A2_79.skill_list
	A1_78.skill_list = L10_87
	L11_88 = A0_77
	L10_87 = A0_77.init_unit_skill_info
	L10_87(L11_88, A1_78)
	L11_88 = A0_77
	L10_87 = A0_77.init_unit_used_skill_record
	L10_87(L11_88, A1_78)
	L11_88 = A0_77
	L10_87 = A0_77.try_to_add_or_update_unit_buffs
	L10_87(L11_88, A1_78, A2_79.buff_list, nil, true)
	L10_87 = A2_79.ext_hit_area_list
	A1_78.ext_hit_area_list = L10_87
	L11_88 = A0_77
	L10_87 = A0_77.init_unit_extra_hit_area
	L10_87(L11_88, A1_78)
	L10_87 = A2_79.shield_list
	A1_78.shield_list = L10_87
	L11_88 = A0_77
	L10_87 = A0_77.init_unit_shield_info
	L10_87(L11_88, A1_78)
	L11_88 = A0_77
	L10_87 = A0_77.set_unit_fly_type
	L10_87(L11_88, A1_78, A2_79.fly_type, true)
	L11_88 = A0_77
	L10_87 = A0_77.set_unit_hook
	L10_87(L11_88, A1_78, A2_79.is_hook)
	L10_87 = A1_78.role
	if L10_87 then
		L11_88 = A0_77
		L10_87 = A0_77.set_unit_auto_battle
		L10_87(L11_88, A1_78, A2_79.role.is_auto_battle, true)
		L10_87 = A1_78.cf_weapon_id_to_info
		if not L10_87 then
			L10_87 = {}
		end
		A1_78.cf_weapon_id_to_info = L10_87
		L10_87 = table
		L10_87 = L10_87.clear
		L11_88 = A1_78.cf_weapon_id_to_info
		L10_87(L11_88)
		L10_87 = pairs
		L11_88 = A1_78.role
		L11_88 = L11_88.weapon_list
		L10_87, L11_88, _FOR_ = L10_87(L11_88)
		for _FORV_6_, _FORV_7_ in L10_87, L11_88, _FOR_ do
			A1_78.cf_weapon_id_to_info[_FORV_7_.cfg_weapon_id] = _FORV_7_
		end
		L10_87 = A1_78.role
		L10_87 = L10_87.cfg_weapon_id
		L11_88 = A1_78.cf_weapon_id
		if L10_87 ~= L11_88 then
			L11_88 = A0_77
			L10_87 = A0_77.update_unit_weapon
			L10_87(L11_88, A1_78, A1_78.role.cfg_weapon_id)
		end
	end
	L10_87 = A1_78.camp
	L11_88 = A2_79.camp
	if L10_87 ~= L11_88 then
		L11_88 = A0_77
		L10_87 = A0_77.update_unit_camp
		L10_87(L11_88, A1_78, A2_79.camp)
	end
	L11_88 = A0_77
	L10_87 = A0_77.is_unit_has_buff_state
	L10_87 = L10_87(L11_88, A1_78, _ENV.buff_states.move_ground_paste)
	if L10_87 then
		L11_88 = A0_77
		L10_87 = A0_77.calculate_unit_edge
		L10_87(L11_88, A1_78)
		L11_88 = A0_77
		L10_87 = A0_77.fix_unit_angle
		L10_87(L11_88, A1_78)
		local L5_82 = L5_82
	end
end
function L3_3.update_souls_on_reconnect(A0_89, A1_90)
	local L2_91, L3_92
	L2_91 = {}
	L3_92 = A1_90.soul_list
	if L3_92 then
		_FOR_, _FOR_, _FOR_ = ipairs(L3_92)
		for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
			L2_91[_FORV_10_.object_id] = true
			L7_96 = A0_89.id_to_soul[_FORV_10_.object_id]
			if L7_96 then
				A0_89:update_soul_wakan(L7_96, _FORV_10_.wakan)
				if _FORV_10_.move_info then
					A0_89:set_soul_move_target(L7_96, _FORV_10_.move_info.start_pos, _FORV_10_.move_info.end_pos, _FORV_10_.move_info.start_time, _FORV_10_.move_info.end_time)
					break -- pseudo-goto
				end
				A0_89:set_soul_land_pos(L7_96, _FORV_10_.pos.x, _FORV_10_.pos.y)
				break -- pseudo-goto
			end
			A0_89:add_soul(_FORV_10_)
			repeat
			until true
		end
	end
	L6_95 = pairs
	L7_96 = A0_89.id_to_soul
	L6_95, L7_96, L8_97 = L6_95(L7_96)
	for L16_105, L17_106 in L6_95, L7_96, L8_97 do
		if not L2_91[L16_105] then
			A0_89:destroy_soul(L17_106)
			local L11_100 = L11_100
		end
	end
end
function L3_3.update_soul_points_on_reconnect(A0_107, A1_108)
	local L2_109, L3_110
	L2_109 = {}
	L3_110 = A1_108.wakan_list
	if L3_110 then
		L8_115 = nil
		_FOR_, _FOR_, _FOR_ = ipairs(L3_110)
		for _FORV_8_, _FORV_9_ in _FOR_, _FOR_, _FOR_ do
			L2_109[_FORV_9_.id] = true
			L8_115 = A0_107.id_to_soul_point[_FORV_9_.id]
			if not L8_115 then
				A0_107:add_soul_point(_FORV_9_)
			end
		end
	end
	L8_115 = pairs
	L7_114 = A0_107.id_to_soul_point
	L8_115, L7_114, L12_119 = L8_115(L7_114)
	for _FORV_7_, _FORV_8_ in L8_115, L7_114, L12_119 do
		if not L2_109[_FORV_7_] then
			A0_107:destroy_soul_point(_FORV_8_)
		end
	end
end
function L3_3.recover_skill_effects_on_reconnect(A0_120)
	local L1_121
	L4_124 = A0_120.id_to_unit
	L2_122, L4_124, L5_125 = L2_122(L4_124)
	for L6_126, L9_129 in L2_122, L4_124, L5_125 do
		L10_130 = L9_129.is_cur_round_attacker
		if not L10_130 then
		else
			L1_121 = L9_129.skill_cf_id_to_info
			if not L1_121 then
			else
				L10_130 = pairs
				L11_131 = L1_121
				L10_130, L11_131, L12_132 = L10_130(L11_131)
				for L13_133, L14_134 in L10_130, L11_131, L12_132 do
					_FOR_ = 1
					for _FORV_15_ = _FOR_, _FOR_, _FOR_ do
						A0_120:do_skill_effects_on_reconnect(L9_129, L14_134.cf_info)
					end
				end
			end
		end
	end
end
function L3_3.on_msg_battle_physics_sync_history_msg_s2c(A0_139, A1_140, A2_141)
	A0_139:replay_reconnect_begin()
	A0_139:simulate_msg_from_history_list(A2_141.s2c_bin_list)
	local L5_142 = L5_142
end
function L3_3.simulate_msg_from_history_list(A0_143, A1_144)
	local L4_147, L5_148, L6_149, L7_150, L8_151, L9_152, L10_153, L11_154, L12_155, L13_156, L14_157, L19_162 = L4_147, L5_148, L6_149, L7_150, L8_151, L9_152, L10_153, L11_154, L12_155, L13_156, L14_157, L19_162
	if not A1_144 then
		L5_148 = A0_143
		L4_147 = A0_143.replay_reconnect_end
		L4_147(L5_148)
		return
	end
	L4_147 = 0
	L5_148 = 0
	L6_149 = 0
	L7_150 = ""
	L8_151 = 0
	L9_152 = nil
	L10_153 = nil
	L11_154 = nil
	L12_155 = string
	L12_155 = L12_155.byte
	L13_156 = 0
	L14_157 = #A1_144
	L19_162 = {}
	_FOR_, _FOR_, _FOR_ = ipairs(A1_144)
	for _FORV_18_, _FORV_19_ in _FOR_, _FOR_, _FOR_ do
		if #_FORV_19_ < 8 then
			A0_143:fight_log_error("\228\186\140\232\191\155\229\136\182\230\149\176\230\141\174\233\149\191\229\186\166\228\184\141\232\182\179\239\188\140\232\135\179\229\176\145\233\156\128\232\166\1298\228\184\170\229\173\151\232\138\130")
		else
			L4_147 = L12_155(_FORV_19_, 1) * 256 + L12_155(_FORV_19_, 2)
			L5_148 = L12_155(_FORV_19_, 3) * 16777216 + L12_155(_FORV_19_, 4) * 65536 + L12_155(_FORV_19_, 5) * 256 + L12_155(_FORV_19_, 6)
			L6_149 = L12_155(_FORV_19_, 7) * 256 + L12_155(_FORV_19_, 8)
			L9_152 = _ENV.get_proto_by_proto_id(L5_148)
			if not L9_152 then
				A0_143:fight_log_error("\230\156\170\230\137\190\229\136\176\229\141\143\232\174\174ID\229\175\185\229\186\148\231\154\132\229\141\143\232\174\174\229\144\141\231\167\176: " .. L5_148)
			else
				L7_150 = string.sub(_FORV_19_, 9)
				L8_151 = #L7_150
				L10_153, L11_154 = _ENV.decode_s2c_bin(L9_152, L7_150, L8_151)
				if not L10_153 or L11_154 then
					local L26_169 = L26_169
					if not L11_154 then
					end
					A0_143:fight_log_error("~~~~\230\136\152\230\138\165\229\155\158\230\148\190\239\188\140\229\141\143\232\174\174\229\134\133\229\174\185\232\167\163\230\158\144\229\164\177\232\180\165\239\188\154" .. L9_152 .. "\239\188\140\229\173\151\232\138\130\230\149\176:" .. L8_151 .. ",err:" .. "unknown")
					break -- pseudo-goto
				end
				if L9_152 == "battle_start_s2c" or L9_152 == "battle_loading_progress_s2c" then
				else
					L10_153.from_reconnect = true
					if not L10_153.battle_run_time then
						L10_153.battle_run_time = L13_156
					else
						L13_156 = L10_153.battle_run_time
					end
					repeat
						({}).proto = L9_152
						;({}).err_code = L6_149
						;({}).msg = L10_153
						;({}).err = L11_154
						L26_169(L19_162, {})
					until true
				end
			end
		end
	end
	L27_170 = #L19_162
	_FOR_, _FOR_, _FOR_ = ipairs(L19_162)
	for _FORV_19_, _FORV_20_ in _FOR_, _FOR_, _FOR_ do
		_FORV_20_.msg.last_one = _FORV_19_ == L27_170
		_ENV.handle_s2c(_FORV_20_.proto, _FORV_20_.err_code, _FORV_20_.msg, _FORV_20_.err)
	end
	if L27_170 <= 0 then
		L23_166 = A0_143
		L22_165 = A0_143.replay_reconnect_end
		L22_165(L23_166)
	end
end
function L3_3.replay_reconnect_begin(A0_171)
	A0_171.is_reconnecting = true
	A0_171.is_reconnecting_from_replay = true
	local L1_172 = L1_172
	L1_172(false)
	local L2_173 = L2_173
end
function L3_3.replay_reconnect_end(A0_174)
	A0_174.is_reconnecting = nil
	A0_174.is_reconnecting_from_replay = nil
	A0_174:open_fight_uis()
	print("------------------replay_reconnect_end-------")
	Game.camera.set_camera_update_able(true)
	A0_174:check_unit_skin_on_reconnect()
	A0_174:check_bullet_skin_on_reconnect()
	local L1_175, L2_176 = L1_175, L2_176
end
function L3_3.check_unit_skin_on_reconnect(A0_177)
	L3_180 = A0_177.id_to_unit
	L1_178, L3_180, L4_181 = L1_178(L3_180)
	for L5_182, _FORV_5_ in L1_178, L3_180, L4_181 do
		if _FORV_5_.model and not _FORV_5_.model.skin then
			A0_177:new_unit_skin(_FORV_5_)
			local L7_184 = L7_184
			L7_184(A0_177, _FORV_5_)
		end
		L7_184 = _FORV_5_.temp_ani_trigger
		if L7_184 then
			L7_184 = _FORV_5_.temp_play_cb
			_FORV_5_.temp_ani_trigger = nil
			_FORV_5_.temp_play_cb = nil
			local L8_185, L9_186 = L8_185, L9_186
			local L10_187 = L10_187
			local L11_188 = L11_188
			L9_186(L10_187, L11_188, L8_185, L7_184)
			local L12_189 = L12_189
		end
	end
end
function L3_3.check_bullet_skin_on_reconnect(A0_190)
	L3_193 = A0_190.id_to_bullet
	L1_191, L3_193, L4_194 = L1_191(L3_193)
	for L5_195, _FORV_5_ in L1_191, L3_193, L4_194 do
		if _FORV_5_.is_destroy then
		elseif _FORV_5_.should_remove then
		elseif _FORV_5_.load_info then
		elseif not _FORV_5_.is_show then
		else
			local L7_197 = L7_197
			L7_197(A0_190, _FORV_5_)
			local L8_198 = L8_198
		end
	end
end
