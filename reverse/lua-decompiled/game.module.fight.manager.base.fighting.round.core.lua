local L0_0, L5_5, L6_6, L9_9, L10_10, L13_13, L14_14, L15_15 = L0_0, "game.utils.events", L6_6, L9_9, L10_10, L13_13, L14_14, L15_15
L0_0 = L0_0(L5_5)
L5_5 = require
L6_6 = "game.other.server_time"
L5_5 = L5_5(L6_6)
L6_6 = Game
L6_6 = L6_6.module
L6_6 = L6_6.open_func
L9_9 = require
L10_10 = "game.module.open_func.manager.const"
L9_9 = L9_9(L10_10)
L10_10 = table
L10_10 = L10_10.sort
L13_13 = table
L13_13 = L13_13.insert
L14_14 = remove_obj_from_array
L15_15 = assert
L15_15 = L15_15(DataConfigs.fight_misc)
local L12_12 = L12_12
function Game.module.fight.ways.base.init_round_data(A0_16)
	A0_16.ctrl_hit_audio = nil
	local A0_16.now_is_on_camera_guide, L3_19 = false, L3_19
	A0_16.round_damage_chat_infos = nil
	L3_19 = A0_16.get_raw_attack_time
	local L3_19, L2_18 = L3_19(A0_16), L2_18
	L2_18 = {}
	L2_18.turn = 0
	L2_18.round_count = 0
	L2_18.perform_status = nil
	L2_18.last_attacker_infos = nil
	L2_18.cur_attacker_infos = nil
	L2_18.cur_wind = 0
	L2_18.wind_factor = 0
	L2_18.timers = {}
	L2_18.unscale_timers = {}
	L2_18.timers_special = {}
	L2_18.bullet_nodes = {}
	L2_18.processings = {}
	L2_18.attack_time_limit = L3_19 ~= nil and 0 < L3_19
	L2_18.fire_actions = {}
	L2_18.id_to_fire_action_contexts = {}
	L2_18.perform_id = 0
	L2_18.cur_perform_ids = {}
	L2_18.bullet_ids_wait_notify = {}
	L2_18.is_repeat_round = false
	A0_16.round = L2_18
end
function Game.module.fight.ways.base.is_repeat_round(A0_20)
	local L1_21
	L1_21 = A0_20.round
	L1_21 = L1_21 ~= nil
	return L1_21
end
function Game.module.fight.ways.base.finish_old_round(A0_22, A1_23)
	local L12_34 = _ENV.finish_round
	L12_34(A0_22)
	A0_22.wait_obstacle_move_timestamp = nil
	L12_34 = A0_22.round
	L12_34.is_last_fire = nil
	L12_34.perform_id = 0
	L12_34.need_send_pass_msg_when_stop_move = nil
	A0_22:try_del_round_wait_support_land()
	A0_22:camera_btree_on_finish_round()
	A0_22:try_to_hide_parabola()
	A0_22:record_me_can_use_skill_prototypes()
	A0_22:set_round_perform_status(L12_12.round_perform_status.normal)
	A0_22:clear_all_round_timers()
	A0_22.sync_unit_pos_timer = nil
	A0_22:check_to_combine_hole()
	A0_22:set_unit_die_if_in_suspended_ani_when_turn_round()
	A0_22:clear_round_kill_infos()
	local L3_25 = L3_25
	L12_34.wait_bullet_timer = nil
	L3_25 = L12_34.bullet_ids_wait_notify
	L4_26, _FOR_, _FOR_ = L4_26(L3_25)
	for _FORV_7_, _FORV_8_ in L4_26, _FOR_, _FOR_ do
		L3_25[_FORV_7_] = nil
	end
	L4_26 = L12_34.cur_perform_ids
	L5_27, _FOR_, _FOR_ = L5_27(L4_26)
	for _FORV_8_, _FORV_9_ in L5_27, _FOR_, _FOR_ do
		L4_26[_FORV_8_] = nil
	end
	L5_27 = A0_22.round
	L5_27 = L5_27.cur_first_attacker
	if L5_27 then
		if L5_27.is_cur_round_attacker and not L5_27.is_quit and not L5_27.is_dead then
			({}).target = L5_27
			;({}).is_round_end = true
			A0_22:try_trigger_reply(L12_12.reply_trigger_type.no_action, {})
		end
		;({}).target = L5_27
		A0_22:try_trigger_reply(L12_12.reply_trigger_type.round_end, {})
	end
	A0_22:try_auto_collect_drop_gold()
	local L6_28 = A0_22:get_ctrl_unit()
	if L6_28 and L6_28.is_dead == true then
		L6_28.mutual_fire_skill_id = L6_28.weapon.normal_skill_id
		A0_22:update_unit_attack_info_by_mutual_skill_id(L6_28)
	end
	A0_22:camera_reset_bullet_follow_arg()
	local L7_29 = L7_29
	L7_29 = A0_22.round
	L7_29 = L7_29.cur_attacker_infos
	if L7_29 then
		_FOR_, _FOR_, _FOR_ = ipairs(L7_29)
		for _FORV_11_, _FORV_12_ in _FOR_, _FOR_, _FOR_ do
			A0_22:reset_unit_something_on_finish_round_by_obj_id(_FORV_12_.obj_id)
		end
	end
	L13_35 = A0_22.camera_follow_target
	L13_35(A0_22, nil)
	L13_35 = A0_22.deal_battle_env_on_finish_round
	L13_35(A0_22)
	L13_35 = A0_22.try_to_trigger_guide_on_round_finish
	L13_35(A0_22)
	L13_35 = A0_22.reset_units_pursuit_eff
	L13_35(A0_22)
	L13_35 = Game
	L13_35 = L13_35.events
	L13_35 = L13_35.brocast
	L13_35("fight_round_ended", L12_34)
	L13_35 = A0_22.round
	L13_35 = L13_35.round_next_actions
	if L13_35 then
		_FOR_, _FOR_, _FOR_ = pairs(L13_35)
		for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
			if A0_22:get_unit_by_id(_FORV_12_) then
				A0_22:try_to_preload_ultimate_skill_effect((A0_22:get_unit_by_id(_FORV_12_)))
			end
		end
	end
	L14_36 = A0_22
	L11_33 = A0_22.check_chat_log_finish_round
	L11_33(L14_36)
end
function Game.module.fight.ways.base.reset_unit_something_on_finish_round_by_obj_id(A0_40, A1_41)
	local L2_42 = L2_42
	L2_42 = L2_42(A0_40, A1_41, true)
	if not L2_42 then
		return
	end
	local L4_43 = L4_43
	L4_43(A0_40, L2_42)
	local L5_44 = L5_44
end
function Game.module.fight.ways.base.reset_unit_something_on_finish_round(A0_45, A1_46)
	A1_46.wait_for_fire = nil
	A1_46.last_fire_time = nil
	A1_46.is_cur_round_attacker = false
	A1_46.hide_angle_protractor = nil
	A1_46.no_recommand_force = nil
	A1_46.cur_fire_info = nil
	if A1_46.weapon then
		A1_46.mutual_fire_skill_id = A1_46.weapon.normal_skill_id
		local L2_47 = L2_47
		L2_47(A0_45, A1_46)
	end
	L2_47 = A1_46.last_round_used_skill_prototype_ids
	A1_46.last_round_used_skill_prototype_ids = A1_46.cur_round_used_skill_ids
	A1_46.cur_round_used_skill_ids = L2_47
	_FOR_, _FOR_, _FOR_ = pairs(L2_47)
	for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
		L2_47[_FORV_6_] = nil
	end
	if A0_45:is_ctrl_unit(A1_46) then
		A0_45:set_unit_holding_fire(A1_46, false, false)
	elseif A1_46.holding_fire then
		A0_45:set_unit_holding_fire(A1_46, false, false)
	end
	local L3_48 = A0_45:get_a_unit_order()
	A0_45:set_unit_temp_order(A1_46, L3_48)
	A0_45:reset_unit_attack_info(A1_46)
	A0_45:set_unit_round_status(A1_46, _ENV.unit_round_status.done)
	if A1_46.state ~= _ENV.role_status.falling then
		A0_45:set_unit_state(A1_46, _ENV.role_status.idle)
	end
	A0_45:try_to_destroy_hook_rope_by_unit_id(A1_46.id)
	if A1_46._temp_weapon_id then
		local L4_49, L5_50 = L4_49, L5_50
		L4_49(L5_50, A1_46, A1_46._temp_weapon_id)
		local L7_51 = L7_51
		A1_46._temp_weapon_id = nil
	end
end
function Game.module.fight.ways.base.enter_new_round(A0_52, A1_53)
	local L2_54, L4_56 = L2_54, A0_52.round
	L2_54 = L2_54(L4_56)
	L4_56 = A0_52.is_recovering
	L4_56 = L4_56 == true
	A0_52.is_recovering = false
	L2_54.turn = A1_53.turn
	L2_54.round_count = A1_53.round
	L2_54.oped = false
	L2_54.start_time_ms = A1_53.round_stime
	L2_54.is_repeat_round = A1_53.is_repeat_round
	A0_52:try_to_send_player_action_log(3, L2_54.round_count)
	A0_52:try_update_round_weap_angle_on_enter_new_round()
	A0_52:raw_set_round_wind(A1_53.wind, true)
	if A1_53.round_next_action_list then
		L2_54.round_next_actions = {}
		_FOR_, _FOR_, _FOR_ = pairs(A1_53.round_next_action_list)
		for _FORV_8_, _FORV_9_ in _FOR_, _FOR_, _FOR_ do
			L2_54.round_next_actions[_FORV_9_] = true
			local L10_62 = L10_62
			repeat
				do break end -- pseudo-goto
				L2_54.round_next_actions = nil
			until true
		end
	end
	A0_52:sync_server_time_on_enter_new_round(A1_53)
	L2_54.attack_time_limit = A0_52:get_raw_attack_time() and A0_52:get_raw_attack_time() > 0
	L2_54.last_attacker_infos = L2_54.cur_attacker_infos
	L2_54.last_first_attacker = L2_54.cur_first_attacker
	local L6_58 = L6_58
	L2_54.cur_attacker_infos = assert(A1_53.action_list)
	L2_54.cur_first_attacker = nil
	local L7_59 = L7_59
	local L8_60 = L8_60
	L8_60(A0_52, A1_53)
	local L9_61 = L9_61
	L8_60 = Time
	L8_60 = L8_60.time
	L9_61 = nil
	_FOR_, _FOR_, _FOR_ = ipairs(L7_59)
	for _FORV_14_, _FORV_15_ in _FOR_, _FOR_, _FOR_ do
		if A0_52:get_unit_by_id(_FORV_15_.obj_id, true) then
			A0_52:get_unit_by_id(_FORV_15_.obj_id, true).round_fired = false
			A0_52:get_unit_by_id(_FORV_15_.obj_id, true).cur_fire_info = nil
			A0_52:get_unit_by_id(_FORV_15_.obj_id, true).fire_params = nil
			if not L2_54.cur_first_attacker then
				L2_54.cur_first_attacker = A0_52:get_unit_by_id(_FORV_15_.obj_id, true)
			end
			if not A1_53.from_reconnect then
				A0_52:reset_unit_skill_cost_when_turn_round((A0_52:get_unit_by_id(_FORV_15_.obj_id, true)))
				if A0_52:get_unit_by_id(_FORV_15_.obj_id, true).weapon then
					A0_52:get_unit_by_id(_FORV_15_.obj_id, true).mutual_fire_skill_id = A0_52:get_unit_by_id(_FORV_15_.obj_id, true).weapon.normal_skill_id
					A0_52:update_unit_attack_info_by_mutual_skill_id((A0_52:get_unit_by_id(_FORV_15_.obj_id, true)))
				end
			end
			if _FORV_15_.obj_id == A0_52.ctrl_unit_id then
				L2_54.last_self_wind = L2_54.cur_self_wind
				L2_54.cur_self_wind = L2_54.cur_wind
				A0_52:get_unit_by_id(_FORV_15_.obj_id, true).holding_fire = false
			end
			A0_52:get_unit_by_id(_FORV_15_.obj_id, true).round_count = _FORV_15_.round_count
			A0_52:get_unit_by_id(_FORV_15_.obj_id, true).is_cur_round_attacker = true
			A0_52:get_unit_by_id(_FORV_15_.obj_id, true).last_op_time = L8_60
			A0_52:get_unit_by_id(_FORV_15_.obj_id, true).oped = false
			A0_52:set_unit_round_status(A0_52:get_unit_by_id(_FORV_15_.obj_id, true), _FORV_15_.state)
			if A0_52.owner_id_to_pet_unit[_FORV_15_.obj_id] then
				if not A1_53.from_reconnect then
					if not A0_52.owner_id_to_pet_unit[_FORV_15_.obj_id].round_count then
					end
					A0_52.owner_id_to_pet_unit[_FORV_15_.obj_id].round_count = 0 + 1
				end
				A0_52.owner_id_to_pet_unit[_FORV_15_.obj_id].is_cur_round_attacker = true
			end
			_FORV_15_.id, _FORV_15_.temp_order = _FORV_15_.obj_id, A0_52:get_unit_by_id(_FORV_15_.obj_id, true).temp_order
			if not L9_61 then
				L9_61 = A0_52:get_unit_by_id(_FORV_15_.obj_id, true)
			end
			if A0_52:get_unit_by_id(_FORV_15_.obj_id, true).camera_follow_pri > L9_61.camera_follow_pri then
				L9_61 = A0_52:get_unit_by_id(_FORV_15_.obj_id, true)
			end
			A0_52:try_to_active_unit_buffs((A0_52:get_unit_by_id(_FORV_15_.obj_id, true)))
		else
			if not _FORV_15_.obj_id then
			end
			if not L2_54.round_count then
			end
			local L21_73 = L21_73
			local L22_74 = L22_74
			if not A0_52.play_type then
			end
			A0_52:fight_log_error("\232\191\155\229\133\165\230\150\176\229\155\158\229\144\136\239\188\140\232\142\183\229\143\150\229\141\149\228\189\141\229\164\177\232\180\165:" .. tostring(0) .. ",round_count:" .. tostring(0) .. ",play_type:" .. tostring(0) .. "," .. table_string(L7_59, nil, 1))
		end
	end
	if L21_73 then
		L24_76 = A0_52
		L23_75 = A0_52.deal_dead_unit_on_enter_round
		L26_78 = L21_73
		L27_79 = L7_59
		L23_75(L24_76, L26_78, L27_79)
	end
	L24_76 = A0_52
	L23_75 = A0_52.sort_units_temp_order
	L26_78 = L7_59
	L23_75(L24_76, L26_78)
	L23_75 = ipairs
	L24_76 = L7_59
	L23_75, L24_76, L26_78 = L23_75(L24_76)
	for L27_79, L28_80 in L23_75, L24_76, L26_78 do
		L21_73 = A0_52:get_unit_by_id(L28_80.obj_id)
		if L21_73 then
			A0_52:set_unit_temp_order(L21_73, 500 + L27_79, true)
			A0_52:on_turn_attacker(L21_73)
			if A0_52.ctrl_unit_id == L28_80.obj_id then
				A0_52:on_turn_ctrl(L21_73)
			end
		end
	end
	L24_76 = A0_52
	L23_75 = A0_52.set_round_camera_follow_target
	L26_78 = L9_61
	L23_75(L24_76, L26_78)
	L24_76 = A0_52
	L23_75 = A0_52.change_fight_state
	L26_78 = "attack"
	L23_75(L24_76, L26_78)
	L24_76 = A0_52
	L23_75 = A0_52.reply_enter_new_round
	L23_75(L24_76)
	L23_75 = nil
	L26_78 = A0_52
	L24_76 = A0_52.get_ctrl_unit
	L24_76 = L24_76(L26_78)
	L26_78 = A0_52.round
	L26_78 = L26_78.round_count
	if L26_78 == 1 and L24_76 ~= nil then
		L26_78 = A0_52.cf_play_info
		L26_78 = L26_78.intelligent_force
		if L26_78 == 1 then
			L23_75 = L24_76.intelligent_force
		end
		L27_79 = A0_52
		L26_78 = A0_52.try_trigger_reply
		L28_80 = L12_12
		L28_80 = L28_80.reply_trigger_type
		L28_80 = L28_80.start
		;({}).target = L24_76
		L26_78(L27_79, L28_80, {})
	end
	L27_79 = A0_52
	L26_78 = A0_52.req_update_recommand_forces
	L28_80 = L23_75
	L26_78(L27_79, L28_80)
	L26_78 = L0_0
	L26_78 = L26_78.brocast
	L27_79 = "fight_next_fight_turn"
	L28_80 = L2_54
	L26_78(L27_79, L28_80)
	L26_78 = L24_76 ~= nil and L26_78
	L28_80 = A0_52
	L27_79 = A0_52.play_audio
	if not L26_78 or not "fight_yourturn" then
	end
	L27_79(L28_80, "fight_round_change", nil, true)
	L28_80 = A0_52
	L27_79 = A0_52.add_soul_points
	L27_79(L28_80, A1_53.create_wakan_list)
	L28_80 = A0_52
	L27_79 = A0_52.deal_battle_env_on_enter_round
	L27_79(L28_80, A1_53)
	if L10_62 then
		L28_80 = A0_52
		L27_79 = A0_52.on_new_turn_start
		L27_79(L28_80)
	end
	L28_80 = A0_52
	L27_79 = A0_52.try_to_trigger_guide_on_round_start
	L27_79(L28_80)
	L28_80 = A0_52
	L27_79 = A0_52.try_to_trigger_couple_effect
	L27_79(L28_80)
	L28_80 = A0_52
	L27_79 = A0_52.try_to_deal_physics_things_on_enter_new_round
	L27_79(L28_80)
	L28_80 = A0_52
	L27_79 = A0_52.try_to_preload_ultimate_skill_effect
	L27_79(L28_80, A0_52.round.cur_first_attacker)
	L28_80 = A0_52
	L27_79 = A0_52.check_chat_log_enter_new_round
	L27_79(L28_80)
	L28_80 = A0_52
	L27_79 = A0_52.check_chat_log_turn_attacker
	L27_79(L28_80)
end
function Game.module.fight.ways.base.on_new_turn_start(A0_81)
	A0_81:try_to_trigger_guide_on_turn_start()
	A0_81:check_chat_log_enter_new_turn()
end
function Game.module.fight.ways.base.raw_set_round_wind(A0_82, A1_83, A2_84)
	local L3_85
	L3_85 = A0_82.round
	if not L3_85 then
		return
	end
	if not A2_84 and L3_85 then
		local L4_86 = L4_86
		local L4_86, L5_87 = L4_86(L3_85.cur_wind * 10 + 1.0E-4), L5_87
		if L4_86 == A1_83 then
			return
		end
	end
	L4_86 = A1_83 * 0.1
	L3_85.cur_wind = L4_86
	L4_86 = L3_85.cur_wind
	L5_87 = A0_82.cf_battle
	L5_87 = L5_87.wind_power_factor
	L4_86 = L4_86 * L5_87
	L5_87 = A0_82.cf_battle
	L5_87 = L5_87.weather_factor
	L4_86 = L4_86 * L5_87
	L3_85.wind_factor = L4_86
	L4_86 = true
	return L4_86
end
function Game.module.fight.ways.base.deal_dead_unit_on_enter_round(A0_88, A1_89, A2_90)
	if not A2_90 then
		return
	end
	L5_93 = #A2_90
	if L5_93 ~= 1 then
		return
	end
	L5_93 = pairs
	L6_94 = A0_88.id_to_unit
	L5_93, L6_94, L7_95 = L5_93(L6_94)
	for _FORV_6_, _FORV_7_ in L5_93, L6_94, L7_95 do
		if _FORV_7_.hidden_units then
		elseif not _FORV_7_.is_dead then
		elseif _FORV_7_.camp ~= A1_89.camp then
		else
			_FORV_7_.round_count = _FORV_7_.round_count + 1
			A0_88:reset_unit_skill_cost_when_turn_round(_FORV_7_)
			local L10_98 = L10_98
		end
	end
end
function Game.module.fight.ways.base.set_round_camera_follow_target(A0_99, A1_100)
	if not A1_100 then
		return
	end
	A0_99.round.camera_follow_target = A1_100
	local L2_101, L3_102 = L2_101, L3_102
	L2_101(L3_102, A1_100)
	local L4_103 = L4_103
end
function Game.module.fight.ways.base.enter_ctrl_unit_round_action(A0_104, A1_105)
	repeat
		if A0_104:unit_can_do_round_action(A1_105) then
			A0_104:start_unit_wait_attack_timer(A1_105)
			if A0_104:can_vibrate(A1_105) then
				require("game.platform.fnsdk.fnsdk_interface").vibrate(300)
				local L4_106 = L4_106
				break -- pseudo-goto
			end
		end
	until true
end
function Game.module.fight.ways.base.can_vibrate(A0_107, A1_108)
	if A0_107.is_reconnecting_from_replay then
		return false
	end
	if not A1_108 then
		A1_108 = A0_107:get_ctrl_unit()
	end
	if not A1_108 or A1_108.role.is_auto_battle or A1_108.is_hook then
		return false
	end
	local L2_109 = L2_109
	L2_109 = L2_109(L3_3.type.fight_turn_shake)
	if not L2_109 then
		L2_109 = false
		return L2_109
	end
	L2_109 = Game
	L2_109 = L2_109.module
	L2_109 = L2_109.setting
	local L3_110 = L2_109.get_fight_vibrate_is_on()
	if not L3_110 then
		L3_110 = false
		return L3_110
	end
	L3_110 = true
	return L3_110
end
function Game.module.fight.ways.base.start_unit_wait_attack_timer(A0_111, A1_112, A2_113)
	local L12_123 = A0_111.round.attack_time_limit
	if not L12_123 then
		return
	end
	L12_123 = A0_111.try_to_stop_unit_wait_attack_timer
	L12_123(A0_111, A1_112)
	L12_123 = A0_111.get_raw_attack_time
	local L12_123, L4_115 = L12_123(A0_111), L4_115
	L4_115 = A0_111.round
	local L6_117 = L6_117
	if A2_113 then
		L4_115.start_time_ms = _ENV.get_mil_server_timer()
	else
		local L7_118 = L7_118
		L6_117 = L6_117 - math.floor((L7_118 - L4_115.start_time_ms) * 0.001)
	end
	L4_115.action_time = L6_117
	L0_0.brocast("fight_round_timer_update", L6_117)
	local L8_119, L9_120 = L8_119, L9_120
	local L10_121 = L10_121
	local L11_122 = L11_122
	L9_120 = L9_120(L10_121, L11_122, 100, function()
		local L3_127 = L3_127
		L3_127 = L3_127 - math.floor((_ENV.get_mil_server_timer() - L4_115.start_time_ms) * 0.001)
		_ENV = L3_127
		L3_127 = L4_115
		L3_127.action_time = _ENV
		L3_127 = L8_119
		if L3_127 ~= _ENV then
			L3_127 = _ENV
			L8_119 = L3_127
			L3_127 = L0_0
			L3_127 = L3_127.brocast
			L3_127("fight_round_timer_update", _ENV)
		end
		L3_127 = _ENV
		if 0 <= L3_127 then
			return
		end
		L3_127 = A0_111
		L3_127 = L3_127.try_to_ensatory_fire_on_round_time_out
		L3_127 = L3_127(L3_127, A1_112)
		if L3_127 then
			L3_127 = A0_111
			L3_127 = L3_127.try_to_stop_unit_wait_attack_timer
			L3_127(L3_127, A1_112)
		else
			L3_127 = A0_111
			L3_127 = L3_127.unit_can_pass_round
			L3_127 = L3_127(L3_127, A1_112)
			if not L3_127 then
				return
			end
			L3_127 = A0_111
			L3_127 = L3_127.req_pass_unit_round
			local L1_125 = L1_125
			L3_127(L1_125, A1_112)
			local L2_126 = L2_126
		end
	end)
	A1_112.attack_timer = L9_120
end
function Game.module.fight.ways.base.try_to_stop_unit_wait_attack_timer(A0_128, A1_129)
	if not A1_129.attack_timer then
		return
	end
	local L2_130, L3_131 = L2_130, L3_131
	local L4_132 = L4_132
	L2_130(L3_131, L4_132, A1_129.attack_timer)
	local L5_133 = L5_133
	A1_129.attack_timer = nil
	L2_130 = A0_128.round
	L2_130.action_time = 0
end
function Game.module.fight.ways.base.unit_can_do_round_action(A0_134, A1_135)
	L6_140, _FOR_, _FOR_ = L6_140(_ENV.forbid_round_action_buff_states)
	for _FORV_5_, _FORV_6_ in L6_140, _FOR_, _FOR_ do
		if A0_134:is_unit_has_buff_state(A1_135, _FORV_5_) then
			return false
		end
	end
	L8_142 = A0_134
	L6_140 = A0_134.is_unit_has_buff_state
	L9_143 = A1_135
	L10_144 = _ENV
	L10_144 = L10_144.buff_states
	L10_144 = L10_144.imprison
	L6_140 = L6_140(L8_142, L9_143, L10_144)
	if L6_140 then
		L6_140 = false
		return L6_140
	end
	L6_140 = true
	return L6_140
end
function Game.module.fight.ways.base.camera_focus_target_unit(A0_145, A1_146, A2_147)
	if not A1_146.model then
		return
	end
	local L3_148 = L3_148
	L3_148 = L3_148(A0_145, A1_146, _ENV.buff_states.expel)
	if L3_148 then
		return
	end
	L3_148 = L11_11
	L3_148 = L3_148.camera_follow_target_pos_offset
	L3_148 = L3_148.value
	local L4_149, L5_150 = L4_149, L5_150
	local L6_151 = L6_151
	local L7_152 = L7_152
	L4_149(L5_150, L6_151, L7_152, L3_148)
	local L8_153 = L8_153
end
function Game.module.fight.ways.base.camera_follow_target_unit(A0_154, A1_155)
	local L2_156 = L2_156
	L2_156 = L2_156(A0_154, A1_155)
	if not L2_156 then
		return
	end
	L2_156 = A1_155.model
	if not L2_156 then
		return
	end
	L2_156 = _ENV
	L2_156 = L2_156.camera_follow_target_pos_offset
	L2_156 = L2_156.value
	local L4_157 = L4_157
	local L5_158 = L5_158
	local L6_159 = L6_159
	L4_157(L5_158, L6_159, nil, L2_156)
	local L7_160 = L7_160
end
function Game.module.fight.ways.base.get_raw_attack_time(A0_161)
	local L1_162
	L1_162 = A0_161.act_time
	if not L1_162 then
		L1_162 = 0
	end
	return L1_162
end
function Game.module.fight.ways.base.add_round_bullet_msgs(A0_163, A1_164)
	local L5_168, L2_165 = A1_164, L2_165
	L2_165(L5_168)
	L2_165 = A0_163.round
	L2_165 = L2_165.bullet_nodes
	L5_168 = ipairs
	L6_169 = A1_164
	L5_168, L6_169, L7_170 = L5_168(L6_169)
	for _FORV_6_, _FORV_7_ in L5_168, L6_169, L7_170 do
		_ENV(L2_165, _FORV_7_)
		local L10_173 = L10_173
	end
end
function Game.module.fight.ways.base.del_round_bullet_msg(A0_174, A1_175)
	assert(A1_175)
	local L2_176 = L2_176
	L2_176 = L2_176(A0_174.round.bullet_nodes)
	local L3_177 = L3_177
	local L4_178 = L4_178
	L3_177(L4_178, A1_175)
	local L5_179 = L5_179
end
function Game.module.fight.ways.base.deal_round_bullet_nodes_on_finish_round(A0_180)
	local L1_181 = L1_181
	L1_181 = L1_181(A0_180.round.bullet_nodes)
	if not next(L1_181) then
		return
	end
	while next(L1_181) do
		local L2_182 = L2_182
		L2_182 = L2_182(L1_181, 1)
		local L3_183, L4_184 = L3_183, L4_184
		local L5_185 = L5_185
		L3_183(L4_184, L5_185, 1)
		local L6_186 = L6_186
	end
end
function Game.module.fight.ways.base.deal_round_obj_processing_msgs(A0_187)
	local L1_188 = L1_188
	L1_188 = L1_188(A0_187.round.processings)
	local L2_189 = L2_189
	local L2_189, L3_190 = L2_189(L1_188), L3_190
	if not L2_189 then
		return
	end
	L2_189 = nil
	L3_190 = #L1_188
	_FOR_ = -1
	for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
		L2_189 = L1_188[_FORV_7_]
		if not L2_189._dealed then
			break
		end
	end
	if not L2_189 then
		return
	end
	L8_195 = A0_187.try_to_deal_object_processing
	local L5_192 = L5_192
	local L6_193 = L6_193
	L8_195(L5_192, L6_193, true)
	local L7_194 = L7_194
end
function Game.module.fight.ways.base.push_one_round_fire_actions(A0_196, A1_197, A2_198)
	local L3_199, L5_201 = L3_199, A0_196.round
	L5_201 = L5_201.fire_actions
	L3_199 = L3_199(L5_201)
	L5_201 = A1_197.id
	L5_201 = L3_199[L5_201]
	if not L5_201 then
		L5_201 = {}
	end
	L3_199[A1_197.id] = L5_201
	L5_201[#L5_201 + 1] = A2_198
end
function Game.module.fight.ways.base.pop_one_round_fire_actions(A0_202, A1_203)
	local L2_204 = L2_204
	local L2_204, L3_205 = L2_204(A0_202.round.fire_actions), L3_205
	L3_205 = A1_203.id
	L3_205 = L2_204[L3_205]
	if not L3_205 then
		return nil
	end
	local L4_206 = L4_206
	local L5_207 = L5_207
	do return L4_206(L5_207, 1) end
	local L6_208 = L6_208
end
function Game.module.fight.ways.base.is_the_unit_has_fire_actions(A0_209, A1_210)
	local L2_211, L4_213 = L2_211, A0_209.round
	L4_213 = L4_213.fire_actions
	L2_211 = L2_211(L4_213)
	L4_213 = A1_210.id
	L4_213 = L2_211[L4_213]
	if not L4_213 then
		return false
	end
	return 0 < #L4_213
end
function Game.module.fight.ways.base.clear_round_fire_actions(A0_214)
	local L4_218, L1_215 = A0_214.round, L1_215
	L4_218 = L4_218.fire_actions
	L1_215 = L1_215(L4_218)
	L4_218 = next
	L4_218 = L4_218(L1_215)
	if not L4_218 then
		return
	end
	L4_218 = pairs
	L4_218, L3_217, _FOR_ = L4_218(L1_215)
	for _FORV_5_, _FORV_6_ in L4_218, L3_217, _FOR_ do
		L1_215[_FORV_5_] = nil
	end
end
function Game.module.fight.ways.base.record_round_fire_action_context(A0_219, A1_220, A2_221)
	local L3_222 = L3_222
	local L3_222, L4_223 = L3_222(A0_219.round.id_to_fire_action_contexts), L4_223
	L4_223 = A1_220.id
	L3_222[L4_223] = A2_221
end
function Game.module.fight.ways.base.clear_round_fire_action_context(A0_224, A1_225)
	local L2_226 = L2_226
	L2_226 = L2_226(A0_224.round.id_to_fire_action_contexts)
	local L3_227 = L3_227
	local L3_227, L4_228 = L3_227(L2_226), L4_228
	if not L3_227 then
		return
	end
	L3_227 = A1_225.id
	L2_226[L3_227] = nil
end
function Game.module.fight.ways.base.clear_round_fire_action_contexts(A0_229)
	local L4_233, L1_230 = A0_229.round, L1_230
	L4_233 = L4_233.id_to_fire_action_contexts
	L1_230 = L1_230(L4_233)
	L4_233 = next
	L5_234 = L1_230
	L4_233 = L4_233(L5_234)
	if not L4_233 then
		return
	end
	L4_233 = pairs
	L5_234 = L1_230
	L4_233, L5_234, L6_235 = L4_233(L5_234)
	for _FORV_5_, _FORV_6_ in L4_233, L5_234, L6_235 do
		A0_229:clear_fire_action_context(_FORV_6_)
		local L9_238 = L9_238
		L1_230[_FORV_5_] = nil
	end
end
function Game.module.fight.ways.base.is_unit_doing_fire_action(A0_239, A1_240)
	local L2_241 = L2_241
	local L2_241, L3_242 = L2_241(A0_239.round.id_to_fire_action_contexts), L3_242
	L3_242 = A1_240.id
	L3_242 = L2_241[L3_242]
	L3_242 = L3_242 ~= nil
	return L3_242
end
function Game.module.fight.ways.base.could_start_unit_camera_look_at_timer(A0_243, A1_244)
	local L2_245
	L2_245 = A1_244.is_cur_round_attacker
	if not L2_245 then
		L2_245 = false
		return L2_245
	end
	L2_245 = A0_243.round
	L2_245 = L2_245.camera_follow_target
	if L2_245 ~= A1_244 then
		L2_245 = false
		return L2_245
	end
	L2_245 = true
	return L2_245
end
function Game.module.fight.ways.base.try_to_start_unit_camera_look_at_timer(A0_246, A1_247)
	local L7_253 = L7_253
	L7_253(A0_246, A1_247)
	L7_253 = A0_246.could_start_unit_camera_look_at_timer
	L7_253 = L7_253(A0_246, A1_247)
	if not L7_253 then
		return
	end
	L7_253 = 0
	local L3_249, L4_250 = L3_249, L4_250
	local L5_251 = L5_251
	local L6_252 = L6_252
	L3_249 = L3_249(L4_250, L5_251, L6_252, function()
		_ENV = _ENV + 100
		if 3000 < _ENV then
			A0_246:try_to_stop_unit_camera_look_at_timer(A1_247)
			return
		end
		if not A0_246:camera_could_look_at_unit_on_look_at_timer(A1_247) then
			return
		end
		A0_246:set_round_camera_follow_target(A1_247)
		local L1_254 = L1_254
		L1_254(A0_246, A1_247)
		local L2_255 = L2_255
	end)
	A1_247.camera_look_at_timer = L3_249
end
function Game.module.fight.ways.base.try_to_stop_unit_camera_look_at_timer(A0_256, A1_257)
	if not A1_257.camera_look_at_timer then
		return
	end
	local L3_258 = L3_258
	local L4_259 = L4_259
	L3_258(L4_259, A1_257, A1_257.camera_look_at_timer)
	local L5_260 = L5_260
	A1_257.camera_look_at_timer = nil
end
function Game.module.fight.ways.base.camera_could_look_at_unit_on_look_at_timer(A0_261, A1_262)
	local L2_263 = A0_261:is_in_touching_with_delay()
	if L2_263 then
		L2_263 = false
		return L2_263
	end
	L2_263 = A0_261.now_is_on_camera_guide
	if L2_263 then
		L2_263 = false
		return L2_263
	end
	L2_263 = true
	return L2_263
end
function Game.module.fight.ways.base.set_now_is_on_camera_guide(A0_264, A1_265)
	A0_264.now_is_on_camera_guide = A1_265
end
function Game.module.fight.ways.base.unit_can_pass_round(A0_266, A1_267)
	local L4_270 = A0_266:unit_is_falling(A1_267)
	if L4_270 then
		L4_270 = false
		return L4_270
	end
	L4_270 = A1_267.is_hook
	if L4_270 then
		L4_270 = false
		return L4_270
	end
	L4_270 = A1_267.role
	if L4_270 then
		L4_270 = A1_267.role
		L4_270 = L4_270.is_auto_battle
		if L4_270 then
			L4_270 = false
			return L4_270
		end
	end
	L4_270 = A1_267.holding_fire
	if L4_270 then
		L4_270 = A0_266.is_fire_parabola
		L4_270 = L4_270(A0_266)
		if not L4_270 then
			L4_270 = false
			return L4_270
		end
	end
	L4_270 = A1_267.id
	if L4_270 == A0_266.ctrl_unit_id then
		L4_270 = A0_266.is_self_ctrled_by_commander
		L4_270 = L4_270(A0_266)
		if not L4_270 then
			goto lbl_41
		end
	end
	L4_270 = false
	do return L4_270 end
	::lbl_41::
	L4_270 = A0_266.get_my_commander_ctrl_data
	local L4_270, L3_269 = L4_270(A0_266), L3_269
	if L4_270 then
		L3_269 = L4_270.is_agree
		if L3_269 ~= true then
			L3_269 = L4_270.control_to_id
			if L3_269 == A1_267.id then
				L3_269 = false
				return L3_269
			end
		end
	end
	L3_269 = true
	return L3_269
end
function Game.module.fight.ways.base.req_pass_unit_round(A0_271, A1_272, A2_273)
	local L3_274
	if A2_273 == nil then
		L3_274 = A0_271.round
		L3_274 = L3_274.oped
		if L3_274 then
			L3_274 = _ENV
			L3_274 = L3_274.timeout
			if L3_274 then
				goto lbl_13
				A2_273 = L3_274 or A2_273
			end
		end
		L3_274 = _ENV
		A2_273 = L3_274.timeout_no_op
	end
	::lbl_13::
	L3_274 = A1_272.state
	L3_274 = L3_274 == L12_12.role_status.moving
	A0_271:set_unit_round_status(A1_272, L12_12.unit_round_status.done)
	if L3_274 and A0_271:is_multi_player_physics_env() then
		A0_271.round.need_send_pass_msg_when_stop_move = A2_273
	else
		local L4_275, L5_276 = L4_275, L5_276
		local L6_277 = L6_277
		local ({}).round, L8_279 = A0_271.round.round_count, L8_279
		L8_279.type = A2_273
		L4_275(L5_276, L6_277, L8_279)
	end
end
function Game.module.fight.ways.base.get_cur_turn(A0_280)
	local L1_281
	L1_281 = A0_280.round
	L1_281 = L1_281.turn
	return L1_281
end
function Game.module.fight.ways.base.is_show_round_count_down(A0_282)
	local L1_283, L2_284 = A0_282:get_ctrl_unit(), L2_284
	if not L1_283 then
		L2_284 = false
		return L2_284
	end
	L2_284 = L1_283.is_hook
	if L2_284 then
		L2_284 = false
		return L2_284
	end
	L2_284 = L1_283.role
	L2_284 = L2_284.is_auto_battle
	if L2_284 then
		L2_284 = false
		return L2_284
	end
	L2_284 = L1_283.is_cur_round_attacker
	return L2_284
end
function Game.module.fight.ways.base.try_to_ensatory_fire_on_round_time_out(A0_285, A1_286)
	if A0_285:is_fire_parabola() then
		return false
	end
	if A0_285.cf_play_info.guaranteed_fire ~= 1 then
		return false
	end
	local L2_287 = L2_287
	L2_287 = L2_287(L3_3.type.battle_ensatory_fire)
	if L2_287 then
		return false
	end
	if not A0_285:can_req_fire_start(A1_286) then
		return false
	end
	if A1_286.holding_fire then
		return false
	end
	if A1_286.attack_info.fire_angle ~= nil then
		return false
	end
	if not _UPVALUE2_ then
	end
	_UPVALUE2_ = {}
	L3_288, _FOR_, _FOR_ = L3_288(_UPVALUE2_)
	for _FORV_6_, _FORV_7_ in L3_288, _FOR_, _FOR_ do
		_FORV_7_.temp_distance = nil
		_UPVALUE2_[_FORV_6_] = nil
	end
	L3_288 = A1_286.pos
	L7_292 = pairs
	L7_292, _FOR_, _FOR_ = L7_292(A0_285.id_to_unit)
	for _FORV_7_, _FORV_8_ in L7_292, _FOR_, _FOR_ do
		if _FORV_8_.is_dead then
		elseif _FORV_8_.hidden_units then
		elseif _FORV_8_.pet then
		elseif _FORV_8_.camp == A1_286.camp then
		elseif A0_285:is_unit_has_buff_state(_FORV_8_, L12_12.buff_states.stealth) then
		else
			_FORV_8_.temp_distance = math.distance(_FORV_8_.pos, L3_288)
			L7_7(_UPVALUE2_, _FORV_8_)
		end
	end
	L7_292 = _UPVALUE2_
	L7_292 = #L7_292
	if L7_292 <= 0 then
		L7_292 = false
		return L7_292
	end
	L7_292 = L4_4
	L8_293 = _UPVALUE2_
	L9_294 = _UPVALUE6_
	L7_292(L8_293, L9_294)
	L7_292 = nil
	L8_293 = ipairs
	L9_294 = _UPVALUE2_
	L8_293, L9_294, _FOR_ = L8_293(L9_294)
	for _FORV_8_, _FORV_9_ in L8_293, L9_294, _FOR_ do
		L7_292 = A0_285:get_one_recommand_forces(A1_286, _FORV_9_)
		if not L7_292 then
		else
			A0_285:req_fire_ready(A1_286)
			A0_285:req_fire(L7_292 * 0.01, 0)
			A0_285:set_unit_holding_fire(A1_286, false, true)
			BroadcastTips.brocast_lan_tips("TID_FIGHT_GUARANTEED_FIRE")
			return true
		end
	end
	L8_293 = false
	return L8_293
end
function Game.module.fight.ways.base.add_to_round_kill_infos(A0_300, A1_301, A2_302, A3_303)
	local L4_304, L5_305
	L4_304 = A0_300.round
	L4_304 = L4_304.kill_infos
	if not L4_304 then
		L4_304 = {}
	end
	L5_305 = A0_300.round
	L5_305.kill_infos = L4_304
	A1_301.killed_index = A3_303
	L5_305 = {}
	L5_305.killer = A2_302
	L4_304[A1_301] = L5_305
end
function Game.module.fight.ways.base.add_to_round_fall_kill_infos(A0_306, A1_307, A2_308, A3_309)
	local L4_310, L5_311
	L4_310 = A0_306.round
	L4_310 = L4_310.kill_infos
	if not L4_310 then
		L4_310 = {}
	end
	L5_311 = A0_306.round
	L5_311.kill_infos = L4_310
	A1_307.killed_index = 1
	L5_311 = {}
	L5_311.killer = A2_308
	L5_311.is_fall_die = true
	L4_310[A1_307] = L5_311
end
function Game.module.fight.ways.base.try_to_brocast_kill_tips_by_defender(A0_312, A1_313)
	local L2_314, L3_315, L4_316, L5_317
	L2_314 = A1_313.killed_index
	if not L2_314 then
		return
	end
	L2_314 = A0_312.round
	L2_314 = L2_314.kill_infos
	if not L2_314 then
		return
	end
	L3_315 = L2_314[A1_313]
	L4_316 = L3_315.killer
	if not L4_316 then
		return
	end
	L5_317 = L3_315.is_fall_die
	L5_317 = L5_317 == true
	L2_314[A1_313] = nil
	local L6_318 = L6_318
	local L7_319 = L7_319
	local L8_320 = L8_320
	local L9_321 = L9_321
	local L10_322 = L10_322
	L6_318(L7_319, L8_320, L9_321, L10_322, L5_317)
	local L11_323 = L11_323
	A1_313.killed_index = nil
end
function Game.module.fight.ways.base.try_to_brocast_hit_tips_by_defender(A0_324, A1_325, A2_326, A3_327)
	local L4_328
	if A2_326 then
		L4_328 = A2_326.id
		if L4_328 == A0_324.ctrl_unit_id then
			L4_328 = A2_326.camp
			if L4_328 ~= A1_325.camp then
				goto lbl_12
			end
		end
	end
	do return end
	::lbl_12::
	L4_328 = A1_325.role
	if not L4_328 then
		L4_328 = A1_325.monster
		if not L4_328 then
			return
		end
	end
	if A3_327 then
		L4_328 = "fight_hit_accurate"
		if L4_328 then
			goto lbl_25
		end
	end
	L4_328 = "fight_hit_normal"
	::lbl_25::
	A0_324:play_audio(L4_328, A0_324.ctrl_hit_audio)
	local L5_329 = L5_329
	local L6_330 = L6_330
	local L7_331 = L7_331
	local L8_332 = L8_332
	L5_329(L6_330, L7_331, L8_332, A2_326)
	local L9_333 = L9_333
end
function Game.module.fight.ways.base.clear_round_kill_infos(A0_334)
	local L1_335
	L1_335 = A0_334.round
	L1_335 = L1_335.kill_infos
	if not L1_335 then
		return
	end
	L4_338 = pairs
	L4_338, L3_337, _FOR_ = L4_338(L1_335)
	for _FORV_5_, _FORV_6_ in L4_338, L3_337, _FOR_ do
		L1_335[_FORV_5_] = nil
	end
end
function Game.module.fight.ways.base.sync_server_time_on_enter_new_round(A0_339, A1_340)
	if not A1_340.from_reconnect then
		_ENV.set_server_time(A1_340.round_stime)
		local L3_341 = L3_341
	end
end
function Game.module.fight.ways.base.is_turn_action(A0_342)
	return true
end
