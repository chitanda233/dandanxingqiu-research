local L0_0, L1_1, L2_2, L3_3
L0_0 = PrintSwitcher
local L1_1, L6_6, L7_7, L8_8, L9_9, L13_13, L14_14, L15_15, L16_16, L17_17 = math, L6_6, L7_7, L8_8, L9_9, L13_13, L14_14, L15_15, L16_16, L17_17
L1_1 = L1_1.ceil
L2_2 = table
L2_2 = L2_2.sort
L3_3 = table
L3_3 = L3_3.insert
L6_6 = assert
L7_7 = GameLogger
L7_7 = L7_7.WarningNoStack
L6_6 = L6_6(L7_7)
L7_7 = GameFunctions
L8_8 = TransformUtils
L9_9 = DataConfigs
L13_13 = L9_9.avatar_boom
L14_14 = L9_9.fight_misc
L15_15 = require
L16_16 = "game.utils.events"
L15_15 = L15_15(L16_16)
L16_16 = require
L17_17 = "game.utils.layer_type_helper"
L16_16 = L16_16(L17_17)
L17_17 = Game
L17_17 = L17_17.module
L17_17 = L17_17.fight
function L17_17.ways.base.on_msg_battle_fire_ready_s2c(A0_18, A1_19, A2_20)
	local L3_21
	if not A2_20 then
		return
	end
	L3_21 = A2_20.round
	if L3_21 then
		L3_21 = A0_18.round
		if L3_21 then
			L3_21 = A0_18.round
			L3_21 = L3_21.round_count
			if L3_21 == A2_20.round then
				goto lbl_16
			end
		end
		return
	end
	::lbl_16::
	L3_21 = A2_20.obj_id
	if L3_21 then
		if L3_21 ~= A0_18.ctrl_unit_id then
			goto lbl_27
		end
		local L4_22 = A0_18:is_self_ctrled_by_commander()
		if L4_22 then
			goto lbl_27
		end
	end
	do return end
	::lbl_27::
	L4_22 = A0_18.id_to_unit
	L4_22 = L4_22[L3_21]
	if not L4_22 or not L4_22.role then
		return
	end
	if not A2_20.is_cancel then
		A0_18:try_commander_cancel_self_ctrl(L4_22)
	end
	if A0_18:is_unit_has_buff_state(L4_22, _ENV.buff_states.move_lift) then
		return
	end
	if A2_20.is_cancel then
		A0_18:cancel_fire_ready_action(L4_22, A2_20)
	else
		local L5_23, L6_24 = L5_23, L6_24
		local L7_25 = L7_25
		L5_23(L6_24, L7_25, A2_20)
		local L8_26 = L8_26
	end
end
function L17_17.ways.base.req_fire_ready(A0_27, A1_28, A2_29)
	if not A0_27:can_req_fire_start(A1_28) then
		return false
	end
	A0_27:try_to_req_stop_move_unit(A1_28)
	A0_27.round.oped = true
	A0_27:set_unit_holding_fire(A1_28, true)
	if not A2_29 then
		local L3_30, L4_31 = L3_30, L4_31
		local L5_32 = L5_32
		;({}).round = A0_27.round.round_count
		local L9_36 = L9_36
		L9_36.force_speed = math.round(A0_27:get_ctrl_power_add_speed() * 10000)
		L9_36.is_cancel = false
		L3_30(L4_31, L5_32, L9_36)
	end
	L3_30 = true
	return L3_30
end
function L17_17.ways.base.req_cancel_fire_ready(A0_37, A1_38, A2_39)
	if not A1_38 or not A1_38.holding_fire then
		return false
	end
	A0_37:try_to_req_stop_move_unit(A1_38)
	A0_37.round.oped = true
	A0_37:set_unit_holding_fire(A1_38, false)
	if not A2_39 then
		local L3_40, L4_41 = L3_40, L4_41
		local L5_42 = L5_42
		;({}).round = A0_37.round.round_count
		local L9_46 = L9_46
		L9_46.force_speed = math.round(A0_37:get_ctrl_power_add_speed() * 10000)
		L9_46.is_cancel = true
		L3_40(L4_41, L5_42, L9_46)
	end
	L3_40 = true
	return L3_40
end
function L17_17.ways.base.get_unit_fire_butterfly_buff_pos(A0_47, A1_48)
	if not A1_48 or not A1_48.id_to_buff then
		return nil
	end
	local L2_49 = L2_49
	L2_49 = L2_49(A0_47, A1_48, _ENV.buff_states.butterfly)
	if not L2_49 then
		L2_49 = nil
		return L2_49
	end
	L2_49 = nil
	L3_50, _FOR_, _FOR_ = L3_50(A1_48.id_to_buff)
	for _FORV_6_, _FORV_7_ in L3_50, _FOR_, _FOR_ do
		if _FORV_7_.cf_info.args and _FORV_7_.cf_info.args.buff_state == _ENV.buff_states.butterfly and _FORV_7_.is_active and _FORV_7_.butterfly_world_pos then
			L2_49 = _FORV_7_
			break
		end
	end
	if not L2_49 then
		L3_50 = nil
		return L3_50
	end
	L3_50 = A0_47.table_pools
	L3_50 = L3_50[2]
	L10_57 = A0_47.land_data
	L10_57 = L10_57.world_to_land_pos
	local L5_52 = L5_52
	local L6_53 = L6_53
	local L7_54 = L7_54
	L10_57(L5_52, L6_53, L7_54, L3_50)
	local L8_55 = L8_55
	L10_57 = {}
	L5_52 = L2_49.id
	L10_57.id = L5_52
	L5_52 = {}
	L6_53 = L3_50.x
	L5_52.x = L6_53
	L6_53 = L3_50.y
	L5_52.y = L6_53
	L10_57.buff_pos = L5_52
	return L10_57
end
function L17_17.ways.base.is_unit_has_fire_times(A0_58, A1_59)
	return false
end
function L17_17.ways.base.req_fire(A0_60, A1_61, A2_62, A3_63)
	local L4_64 = A0_60:get_ctrl_unit()
	if not L4_64 or not A0_60:can_req_fire_start(L4_64) then
		return false
	end
	A0_60.round.oped = true
	local L5_65 = L5_65
	L5_65 = L5_65(A0_60, A1_61 * 100)
	if L5_65 then
		A1_61 = L5_65 * 0.01
	end
	A0_60:try_to_sync_ctrl_unit_pos_to_server()
	A0_60:trigger_buff_event("before_send_fire_cmd", L4_64)
	A0_60:try_req_sound_wave_trigger_obj(L4_64, A1_61 * 100)
	local L6_66 = L6_66
	L6_66 = L6_66(A0_60, L4_64)
	local L7_67 = L7_67
	L7_67 = L7_67(A0_60, L4_64)
	local L8_68 = L8_68
	local L13_73 = L13_73
	local L14_74 = L14_74
	local L15_75 = L15_75
	local L16_76 = L16_76
	local L17_77 = L17_77
	L8_68(L13_73, L14_74, L15_75, L16_76, L17_77, L4_64.direction, A2_62, L4_64.angle, L6_66, A3_63)
	local L18_78 = L18_78
	L4_64.round_fired = true
	L8_68 = L4_64.attack_info
	L8_68.fire_angle = L7_67
	L13_73 = L4_64.direction
	L8_68.fire_direction = L13_73
	L8_68.all_fire_msg_received = false
	L14_74 = A0_60
	L13_73 = A0_60.is_unit_has_fire_times
	L15_75 = L4_64
	L13_73 = L13_73(L14_74, L15_75)
	if not L13_73 then
		L14_74 = A0_60
		L13_73 = A0_60.try_to_stop_unit_wait_attack_timer
		L15_75 = L4_64
		L13_73(L14_74, L15_75)
	end
	L13_73 = Game
	L13_73 = L13_73.module
	L13_73 = L13_73.guide_system
	L14_74 = L13_73.set_action_processing_data
	L15_75 = "has_on_fired"
	L16_76 = true
	L14_74(L15_75, L16_76)
	L14_74 = true
	return L14_74
end
function L17_17.ways.base.req_fire_failed(A0_79)
	local L1_80, L2_81, L3_82 = A0_79:get_ctrl_unit(), L2_81, L3_82
	if not L1_80 then
		return
	end
	L2_81 = A0_79.round
	L2_81.oped = false
	L1_80.round_fired = false
	L2_81 = L1_80.attack_info
	L2_81.fire_angle = nil
	L2_81.fire_direction = nil
	L3_82 = Game
	L3_82 = L3_82.module
	L3_82 = L3_82.guide_system
	L3_82.set_action_processing_data("has_on_fired", false)
	A0_79:cancel_holding_fire_action(L1_80)
	A0_79:start_unit_wait_attack_timer(L1_80)
	local L4_83, L5_84 = L4_83, L5_84
	local L6_85 = L6_85
	;({}).round = A0_79.round.round_count
	local L10_89 = L10_89
	L10_89.force_speed = math.round(A0_79:get_ctrl_power_add_speed() * 10000)
	L10_89.is_cancel = true
	L4_83(L5_84, L6_85, L10_89)
end
;({})[L17_17.bullet_ext_type.spring] = true
;({})[L17_17.bullet_ext_type.bouncing] = true
;({})[L17_17.bullet_ext_type.chain] = true
;({})[L17_17.bullet_ext_type.ball] = true
;({})[L17_17.bullet_ext_type.ground_rolling] = true
;({})[L17_17.bullet_ext_type.spider] = true
;({})[L17_17.bullet_ext_type.refraction] = true
function L17_17.ways.base.calculate_bullet_is_need_follow(A0_90, A1_91)
	local L2_92, L3_93
	L2_92 = A1_91.bullets
	L3_93 = #L2_92
	if L3_93 == 1 then
		L3_93 = L2_92[1]
		L3_93._follow = true
		return
	end
	L3_93 = {}
	L7_97 = ipairs
	L8_98 = L2_92
	L7_97, L8_98, L12_102 = L7_97(L8_98)
	for _FORV_7_, _FORV_8_ in L7_97, L8_98, L12_102 do
		if A0_90:is_the_bullet_that_need_to_be_hidden_first(_FORV_8_) then
		else
			_ENV(L3_93, _FORV_8_)
		end
	end
	L7_97 = L2_2
	L8_98 = L3_93
	L12_102 = _UPVALUE2_
	L7_97(L8_98, L12_102)
	L7_97 = L1_1
	L8_98 = #L3_93
	L8_98 = L8_98 * 0.5
	L7_97 = L7_97(L8_98)
	L8_98 = L3_93[L7_97]
	L8_98._follow = true
	L12_102 = L8_98.bullet_node
	L12_102 = L12_102.id
	_FOR_, _FOR_, _FOR_ = ipairs(L2_92)
	for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
		if _UPVALUE4_[_FORV_13_.bullet_node.bullet_type] then
			if _FORV_13_.bullet_node.ext_arg and _FORV_13_.bullet_node.ext_arg.belong_id == L12_102 then
				_FORV_13_._follow = true
			end
		else
			if _FORV_13_.bullet_node.bullet_type == _UPVALUE5_.trident then
				if not nil then
				end
				_ENV({}, _FORV_13_)
				local L16_106 = L16_106
				break -- pseudo-goto
			end
			if _FORV_13_.bullet_node.bullet_type == _UPVALUE5_.tempest then
				_FORV_13_._follow = true
			else
				local L15_105 = L15_105
				repeat
					if _FORV_13_.bullet_node.bullet_type == _UPVALUE5_.transfer_gate then
						_FORV_13_._follow = true
						_FORV_13_._transfer_gate_follow = true
					end
				until true
			end
		end
	end
	if not L16_106 then
		return
	end
	L2_2(L16_106, _UPVALUE2_)
	L7_97 = L1_1(#L16_106 * 0.5)
	L16_106[L7_97]._follow = true
end
function L17_17.ways.base.fire(A0_107, A1_108)
	if A0_107.round.round_count ~= A1_108.round then
		A0_107:fight_log_error("fire bullet, round_count not match, local:{0}, msg:{1}", A0_107.round.round_count, A1_108.round)
		return
	end
	local L2_109 = L2_109
	L2_109 = L2_109(A0_107, A1_108.object_id)
	if not L2_109.is_cur_round_attacker then
		local L8_115 = L8_115
		local L9_116 = L9_116
		L8_115(L9_116, "fire bullet, attacker not match, local:{0}, msg:{1}", table_string(A0_107.round.cur_attacker_infos, "", 20), A1_108.object_id)
		return
	end
	L9_116 = A0_107
	L8_115 = A0_107.try_to_reset_unit_on_fire
	L8_115(L9_116, L2_109)
	L9_116 = A0_107
	L8_115 = A0_107.set_unit_holding_fire
	L8_115(L9_116, L2_109, false, true)
	L8_115 = A1_108.fire_info
	L9_116 = A0_107.round
	L9_116 = L9_116.camera_follow_target
	if L2_109 == L9_116 then
		L9_116 = A0_107.calculate_bullet_is_need_follow
		L9_116(A0_107, A1_108)
	end
	L9_116 = Time
	L9_116 = L9_116.time
	L2_109.last_op_time = L9_116
	L2_109.oped = true
	L9_116 = L2_109.attack_info
	L9_116.all_fire_msg_received = L8_115.cur_count == L8_115.all_count
	L9_116 = L2_109.attack_info
	if not L2_109.attack_info.fire_bullet_count then
	end
	L9_116.fire_bullet_count = 0 + #A1_108.bullets
	L9_116 = A0_107.add_round_bullet_msgs
	L9_116(A0_107, A1_108.bullets)
	L9_116 = L2_109.state
	if L9_116 ~= _ENV.role_status.falling then
		L9_116 = A0_107.set_unit_state
		L9_116(A0_107, L2_109, _ENV.role_status.idle)
	end
	L9_116 = A0_107.try_to_turn_unit_face
	L9_116(A0_107, L2_109, L8_115.direction)
	L9_116 = A0_107.do_fire_action
	L9_116(A0_107, L2_109, A1_108)
	L9_116 = L8_115.cur_count
	if L9_116 ~= L8_115.all_count then
		L9_116 = A0_107.can_unit_multi_fire
		L9_116 = L9_116(A0_107, L2_109)
		if L9_116 then
			goto lbl_106
		end
	end
	L9_116 = A0_107.set_unit_round_status
	L9_116(A0_107, L2_109, _ENV.unit_round_status.watch)
	::lbl_106::
	L9_116 = L12_12
	L9_116 = L9_116.brocast
	L9_116("fight_current_round_fired", L2_109)
	L9_116 = L8_115.cur_count
	if L9_116 < L8_115.all_count then
		L9_116 = L2_109.weapon
		L9_116 = L9_116.cf_weapon
		L9_116 = L9_116.change_angle
		if L9_116 ~= 1 then
			L9_116 = A0_107.try_to_start_timing_to_check_fire_angle_direction
			L9_116(A0_107, L2_109)
	end
	else
		L9_116 = A0_107.try_to_stop_timing_to_check_fire_angle_direction
		L9_116(A0_107)
	end
	L9_116 = L8_115.add_dmg_rate
	if L9_116 then
		L9_116 = L8_115.add_dmg_rate
		if 0 < L9_116 then
			L9_116 = L8_115.cur_count
			if L9_116 == 1 then
				L9_116 = A0_107.is_ctrl_unit
				L9_116 = L9_116(A0_107, L2_109)
				if L9_116 then
					L9_116 = BroadcastTips
					L9_116 = L9_116.brocast_lan_tips
					local L5_112 = L5_112
					;({}).time = L8_115.add_dmg_time
					;({}).harm_rate = L8_115.add_dmg_rate * 0.01
					local ({}).dig_rate, L7_114 = L8_115.add_boom_pct * 0.01, L7_114
					L9_116(L5_112, L7_114)
				end
			end
		end
	end
end
function L17_17.ways.base.can_req_fire_start(A0_117, A1_118)
	if not A1_118.is_cur_round_attacker then
		L5_122 = GameDefine
		L5_122 = L5_122.UNITY_EDITOR
		if L5_122 then
			L5_122 = _ENV
			L6_123 = "cannot fire because is not your turn!"
			L5_122(L6_123)
		end
		L5_122 = false
		return L5_122
	end
	L5_122 = A1_118.role
	if L5_122 then
		L5_122 = A1_118.role
		L5_122 = L5_122.is_auto_battle
		if L5_122 then
			L5_122 = false
			return L5_122
		end
	end
	L5_122 = A0_117.fight_state
	if L5_122 ~= "attack" then
		L5_122 = GameDefine
		L5_122 = L5_122.UNITY_EDITOR
		if L5_122 then
			L5_122 = _ENV
			L6_123 = "cannot fire because state not attack!"
			L5_122(L6_123)
		end
		L5_122 = false
		return L5_122
	end
	L6_123 = A0_117
	L5_122 = A0_117.unit_is_falling
	L5_122 = L5_122(L6_123, A1_118)
	if L5_122 then
		L5_122 = GameDefine
		L5_122 = L5_122.UNITY_EDITOR
		if L5_122 then
			L5_122 = _ENV
			L6_123 = "unit_is_falling"
			L5_122(L6_123)
		end
		L5_122 = false
		return L5_122
	end
	L5_122 = pairs
	L6_123 = L17_17
	L6_123 = L6_123.forbid_round_action_buff_states
	L5_122, L6_123, _FOR_ = L5_122(L6_123)
	for _FORV_5_, _FORV_6_ in L5_122, L6_123, _FOR_ do
		if A0_117:is_unit_has_buff_state(A1_118, _FORV_5_) then
			if GameDefine.UNITY_EDITOR then
				_ENV("cannot fire because you are " .. _FORV_5_)
			end
			return false
		end
	end
	L5_122 = true
	return L5_122
end
function L17_17.ways.base.is_open_holding_fire_action(A0_128)
	return true
end
function L17_17.ways.base.set_unit_holding_fire(A0_129, A1_130, A2_131, A3_132)
	if A0_129:is_unit_has_buff_state(A1_130, _ENV.buff_states.move_lift) then
		return
	end
	if A1_130.holding_fire == A2_131 then
		return
	end
	A1_130.holding_fire = A2_131
	if not A2_131 and A1_130.holding_fire_effect then
		A0_129:del_unit_effect(A1_130, A1_130.holding_fire_effect)
		local L7_134 = L7_134
		A1_130.holding_fire_effect = nil
	end
	L7_134 = L12_12
	L7_134 = L7_134.brocast
	L7_134("fight_unit_holding_fire_changed", A1_130)
	L7_134 = A0_129.is_open_holding_fire_action
	L7_134 = L7_134(A0_129)
	if not L7_134 then
		return
	end
	if not A2_131 then
		if A3_132 then
			L7_134 = A1_130.attack_info
			L7_134 = L7_134.fire_behavior
		end
		if L7_134 ~= nil then
			L7_134 = A0_129.cancel_holding_fire_action
			L7_134(A0_129, A1_130)
		end
	else
		L7_134 = A0_129.try_to_add_holding_fire_bullet
		L7_134(A0_129, A1_130)
	end
end
function L17_17.ways.base.do_holding_fire_action(A0_135, A1_136, A2_137)
	if not A1_136.holding_fire then
		return
	end
	if A1_136.role and A1_136.role.cf_monster then
		return
	end
	A0_135:try_to_add_unit_weapon_attack_eff(A1_136)
	local L3_138 = L3_138
	L3_138 = L3_138(A0_135, A1_136)
	local L4_139 = L4_139
	L4_139 = L4_139(_ENV.fire_ani[L3_138], L3_138)
	if A1_136.ani_trigger == L4_139.ready and A2_137 then
		A0_135:set_unit_ani_frame_by_percent(A1_136, A2_137)
		return
	end
	if A1_136.ani_trigger == L4_139.fire then
		return
	end
	if A1_136.holding_fire_effect then
		local L5_140 = L5_140
		L5_140(A0_135, A1_136, A1_136.holding_fire_effect)
		A1_136.holding_fire_effect = nil
	end
	L5_140 = A1_136.cf_weapon_skin
	if L5_140 then
		L5_140 = A1_136.cf_weapon_skin
		L5_140 = L5_140.power_action_eff
		if L5_140 then
			goto lbl_57
		end
	end
	L5_140 = nil
	::lbl_57::
	if L5_140 and 0 < L5_140 then
		local L10_145 = L10_145
		local L11_146 = L11_146
		local L12_147 = L12_147
		local L13_148, L14_149 = L13_148, L14_149
		local L15_150 = L15_150
		local L16_151, L17_152 = L16_151, L17_152
		local L18_153 = L18_153
		local L11_146, L19_154 = L11_146(L12_147, L13_148, L14_149, L15_150, L16_151, L17_152, L18_153, false, nil, nil, true, false), L19_154
		A1_136.holding_fire_effect = L11_146
	end
	L11_146 = A0_135
	L10_145 = A0_135.set_unit_ani_trigger
	L12_147 = A1_136
	L13_148 = L4_139.ready
	L10_145(L11_146, L12_147, L13_148)
end
function L17_17.ways.base.cancel_holding_fire_action(A0_155, A1_156)
	local L2_157 = L2_157
	L2_157 = L2_157(A0_155, A1_156)
	if A1_156.holding_fire_effect then
		A0_155:del_unit_effect(A1_156, A1_156.holding_fire_effect)
		A1_156.holding_fire_effect = nil
	end
	local L3_158 = L3_158
	local L4_159 = L4_159
	L3_158 = L3_158(L4_159, L2_157)
	L4_159 = A1_156.role
	if L4_159 then
		L4_159 = A1_156.role
		L4_159 = L4_159.cf_monster
		if L4_159 then
			L4_159 = "idle"
			if L4_159 then
				goto lbl_29
			end
		end
	end
	L4_159 = L3_158.done
	::lbl_29::
	A0_155:set_unit_ani_trigger(A1_156, L4_159)
	local L8_163 = L8_163
	L8_163 = A0_155.try_to_remove_unit_weapon_attack_eff
	L8_163(A0_155, A1_156)
	L8_163 = A0_155.try_to_del_holding_fire_bullet
	local L6_161 = L6_161
	L8_163(L6_161, A1_156)
	local L7_162 = L7_162
end
function L17_17.ways.base.try_to_add_unit_weapon_attack_eff(A0_164, A1_165)
	local L2_166, L18_182 = L2_166, A1_165
	L2_166(L18_182)
	L2_166 = A1_165.eff_weapon_attack
	if L2_166 then
		return
	end
	L2_166 = A1_165.cf_weapon_skin
	if L2_166 then
		L18_182 = L2_166.attack_eff
		if L18_182 then
			goto lbl_15
		end
	end
	do return end
	::lbl_15::
	L18_182 = A0_164.play_unit_effect
	local L7_171 = L7_171
	local L8_172 = L8_172
	local L9_173, L10_174 = L9_173, L10_174
	local L11_175 = L11_175
	local L12_176, L13_177 = L12_176, L13_177
	local L14_178 = L14_178
	local L15_179 = L15_179
	local L16_180, L17_181 = L16_180, L17_181
	L18_182 = L18_182(L7_171, L8_172, L9_173, L10_174, L11_175, L12_176, L13_177, L14_178, L15_179, L16_180, L17_181, false, nil, nil, function()
		local L1_183 = L1_183
		L1_183(_ENV, A1_165)
		local L2_184 = L2_184
	end)
	A1_165.eff_weapon_attack = L18_182
	L7_171 = A0_164
	L18_182 = A0_164.set_unit_weapon_attack_eff_stealth_state
	L8_172 = A1_165
	L18_182(L7_171, L8_172)
end
function L17_17.ways.base.set_unit_weapon_attack_eff_stealth_state(A0_185, A1_186)
	local L2_187, L3_188
	L2_187 = A1_186.eff_weapon_attack
	local L8_193, L9_194, L12_197, L13_198, L14_199, L15_200 = L8_193, L9_194, L12_197, L13_198, L14_199, L15_200
	if not L2_187 then
		return
	end
	L2_187 = A1_186.eff_weapon_attack
	L2_187 = L2_187.gameObject
	if not L2_187 then
		return
	end
	L3_188 = A1_186.half_transparent_count
	L3_188 = 0 < L3_188
	if not L3_188 then
		return
	end
	L8_193 = _ENV
	L8_193 = L8_193.get_layer_int
	if L3_188 then
		L9_194 = _ENV
		L9_194 = L9_194.LAYER_ROLE_TRANSPARENT
		if L9_194 then
			goto lbl_28
		end
	end
	L9_194 = _ENV
	L9_194 = L9_194.LAYER_DEFAULT
	::lbl_28::
	L8_193 = L8_193(L9_194)
	L12_197 = L2_187
	L9_194 = L2_187.SetLayerRecursively
	L13_198 = L8_193
	L9_194(L12_197, L13_198)
	L9_194 = L5_5
	L9_194 = L9_194.get_all_renderers
	L12_197 = L2_187
	L9_194 = L9_194(L12_197)
	if L9_194 then
		if L3_188 then
			L12_197 = 0.5
			if L12_197 then
				goto lbl_44
			end
		end
		L12_197 = 1
		::lbl_44::
		L13_198 = nil
		L14_199 = nil
		L15_200 = nil
		L16_201 = ipairs
		L17_202 = L9_194
		L16_201, L17_202, _FOR_ = L16_201(L17_202)
		for _FORV_13_, _FORV_14_ in L16_201, L17_202, _FOR_ do
			L14_199 = _FORV_14_.materials
			L15_200 = L14_199.Length - 1
			_FOR_ = 1
			for _FORV_18_ = _FOR_, _FOR_, _FOR_ do
				L13_198 = L14_199[_FORV_18_]
				if not (L12_197 < 1) or not 3000 then
				end
				L13_198.renderQueue = 2050
				L13_198:SetFloat("_FinalAlpha", L12_197)
			end
		end
	end
end
function L17_17.ways.base.try_to_remove_unit_weapon_attack_eff(A0_207, A1_208)
	local L2_209, L11_218, L12_219 = L2_209, A1_208, L12_219
	L2_209(L11_218)
	L2_209 = A1_208.eff_weapon_attack
	if not L2_209 then
		return
	end
	L2_209 = A1_208.eff_weapon_attack
	L2_209 = L2_209.gameObject
	if L2_209 then
		L11_218 = _ENV
		L11_218 = L11_218.get_layer_int
		L12_219 = _ENV
		L12_219 = L12_219.LAYER_DEFAULT
		L11_218 = L11_218(L12_219)
		L12_219 = L2_209.SetLayerRecursively
		L12_219(L2_209, L11_218)
		L12_219 = L5_5
		L12_219 = L12_219.get_all_renderers
		L12_219 = L12_219(L2_209)
		if L12_219 then
			_FOR_, _FOR_, _FOR_ = ipairs(L12_219)
			local L10_217 = L10_217
			for _FORV_11_, _FORV_12_ in _FOR_, _FOR_, _FOR_ do
				local L13_220 = L13_220
				local _FOR_, L14_221 = 1, L14_221
				for _FORV_16_ = _FOR_, _FOR_, _FOR_ do
					L10_217 = L13_220[_FORV_16_]
					L10_217.renderQueue = 2050
					L10_217:SetFloat("_FinalAlpha", 1)
				end
			end
		end
	end
	L12_219 = A0_207
	L11_218 = A0_207.del_unit_effect
	L10_217 = A1_208
	L13_220 = A1_208.eff_weapon_attack
	L11_218(L12_219, L10_217, L13_220)
	A1_208.eff_weapon_attack = nil
end
function L17_17.ways.base.try_to_add_holding_fire_bullet(A0_227, A1_228)
	local L2_229, L3_230 = L2_229, L3_230
	local L2_229, L4_231 = L2_229(L3_230, A1_228), L4_231
	L3_230 = _ENV
	L3_230 = L3_230.fire_action_type
	L3_230 = L3_230.throw
	if L2_229 ~= L3_230 then
		return
	end
	L3_230 = A1_228.attack_info
	if not L3_230 then
		return
	end
	L3_230 = A1_228.attack_info
	L3_230 = L3_230.fire_behavior
	if L3_230 ~= nil then
		return
	end
	L3_230 = A1_228.attack_info
	L3_230 = L3_230.fire_bullet
	if not L3_230 then
		return
	end
	L4_231 = L10_10
	L4_231 = L4_231[L3_230]
	if not L4_231 then
		A0_227:fight_log_error("try_to_add_bullet_to_unit_when_holding_fire,cf_bullet_id:{0}", L3_230)
	end
	if A1_228.holding_fire_bullet_load_info then
		if A1_228.holding_fire_bullet_load_info.go then
			local L5_232 = L5_232
			L5_232(A1_228.holding_fire_bullet_load_info.go, true)
		end
		return
	end
	L5_232 = {}
	L5_232.res_path = A0_227:get_bullet_res_path(L4_231)
	function L5_232.cb(A0_236)
		local L1_237, L2_238
		L2_238 = _ENV
		L2_238 = L2_238.role
		if L2_238 then
			L2_238 = L11_11
			L2_238 = L2_238.throw_boom_path
			L2_238 = L2_238.value
			L1_237 = A0_227:get_unit_bone_node(_ENV, L2_238)
		end
		if not L1_237 then
			L2_238 = _ENV
			L2_238 = L2_238.model
			L1_237 = L2_238.transform
		end
		L2_238 = A0_236.transform
		local L3_239, L4_240 = L3_239, L4_240
		L3_239(L4_240, L1_237)
		L3_239 = 1
		L4_240 = _ENV
		L4_240 = L4_240.model
		L4_240 = L4_240.skin
		if L4_240 and L1_237 ~= nil then
			L4_240 = _ENV
			L4_240 = L4_240.model
			L4_240 = L4_240.transform
			if L1_237 ~= L4_240 then
				L4_240 = _ENV
				L4_240 = L4_240.model
				L4_240 = L4_240.t_skin_root
				if L1_237 ~= L4_240 then
					L4_240 = _ENV
					L4_240 = L4_240.model
					L4_240 = L4_240.skin
					if L4_240 then
						L4_240 = _ENV
						L4_240 = L4_240.model
						L4_240 = L4_240.skin
						L4_240 = L4_240.scale
						L3_239 = L4_240 or L3_239
						if not L4_240 then
							L3_239 = 1
						end
					end
				end
			end
		end
		L4_240 = L4_231
		L4_240 = L4_240.scale
		L4_240 = L4_240 * 0.01
		L4_240 = L4_240 / L3_239
		local L9_245 = L9_245
		local L10_246 = L10_246
		local L11_247 = L11_247
		L9_245(L10_246, L11_247, 0, 0, L4_240, L4_240, L4_240)
		local L12_248 = L12_248
		L9_245 = L5_5
		L9_245 = L9_245.replay_particlesystem
		L10_246 = A0_236
		L9_245(L10_246)
		L9_245 = L5_5
		L9_245 = L9_245.get_all_renderers
		L10_246 = A0_236
		L9_245 = L9_245(L10_246)
		L10_246 = L5_5
		L10_246 = L10_246.set_renderer_sorting_order
		L11_247 = L9_245
		L12_248 = _ENV
		L12_248 = L12_248.sorting_order
		if not L12_248 then
			L12_248 = 0
		end
		L12_248 = L12_248 + 1
		L10_246(L11_247, L12_248)
		L10_246 = A0_227
		L11_247 = L10_246
		L10_246 = L10_246.is_partner
		L12_248 = _ENV
		L10_246 = L10_246(L11_247, L12_248)
		if not L10_246 then
			L10_246 = A0_227
			L11_247 = L10_246
			L10_246 = L10_246.try_to_set_go_war_fog_layer
			L12_248 = A0_236
			L10_246(L11_247, L12_248)
		end
	end
	A1_228.holding_fire_bullet_load_info = L5_232
	local L6_233, L7_234 = L6_233, L7_234
	L6_233(L7_234, L5_232)
	local L8_235 = L8_235
end
function L17_17.ways.base.try_to_del_holding_fire_bullet(A0_249, A1_250)
	if not A1_250.holding_fire_bullet_load_info then
		return
	end
	if A1_250.holding_fire_bullet_load_info.go then
		A0_249:try_to_reset_go_war_fog_layer(A1_250.holding_fire_bullet_load_info.go)
	end
	local L3_251 = L3_251
	L3_251(A0_249, A1_250.holding_fire_bullet_load_info)
	local L4_252 = L4_252
	A1_250.holding_fire_bullet_load_info = nil
end
function L17_17.ways.base.try_to_start_timing_to_check_fire_angle_direction(A0_253, A1_254)
	local L2_255, L3_256, L7_260 = A0_253:is_fire_parabola(), L3_256, L7_260
	if L2_255 then
		return
	end
	L2_255 = A1_254.id
	L3_256 = A0_253.ctrl_unit_id
	if L2_255 ~= L3_256 then
		return
	end
	L2_255 = A1_254.role
	L2_255 = L2_255.is_auto_battle
	if L2_255 then
		return
	end
	L2_255 = A1_254.attack_info
	L3_256 = A0_253.round
	L7_260 = A0_253.run_every_in_this_round
	local L5_258 = L5_258
	local L6_259 = L6_259
	L7_260 = L7_260(L5_258, L6_259, function()
		local L0_261 = L0_261
		L0_261 = L0_261(_ENV, A1_254)
		if L2_255.fire_angle ~= L0_261 or L2_255.fire_direction ~= A1_254.direction then
			L2_255.fire_angle = L0_261
			L2_255.fire_direction = A1_254.direction
			local L1_262, L2_263 = L1_262, L2_263
			local L3_264 = L3_264
			local ({}).direction, L5_266 = A1_254.direction, L5_266
			L5_266.angle = L0_261
			L1_262(L2_263, L3_264, L5_266)
		end
	end)
	L3_256.check_fire_timer = L7_260
end
function L17_17.ways.base.try_to_stop_timing_to_check_fire_angle_direction(A0_267)
	if not A0_267.round.check_fire_timer then
		return
	end
	local L1_268, L2_269 = L1_268, L2_269
	L1_268(L2_269, A0_267.round.check_fire_timer)
	local L3_270 = L3_270
	L1_268 = A0_267.round
	L1_268.check_fire_timer = nil
end
function L17_17.ways.base.init_unit_attack_info(A0_271, A1_272)
	if A1_272.hidden_units then
		return
	end
	if not A1_272.attack_info then
	end
	A1_272.attack_info = {}
	local L3_273 = L3_273
	local L4_274 = L4_274
	L3_273(L4_274, A1_272, true)
	local L5_275 = L5_275
end
function L17_17.ways.base.reset_unit_attack_info(A0_276, A1_277, A2_278)
	local L3_279
	L3_279 = A1_277.attack_info
	if not L3_279 then
		return
	end
	L3_279.fire_angle = nil
	L3_279.fire_direction = nil
	L3_279.fire_bullet_count = 0
	L3_279.all_fire_msg_received = false
	L3_279.fire_behavior = nil
	L3_279.show_parabola = nil
	L3_279.parabola_len = nil
	L3_279.parabola_percent = nil
	L3_279.parabola_line_type = nil
	L3_279.refraction_bullet_speed = nil
	if A1_277.weapon then
		L3_279.fire_action_type = A1_277.cf_weapon_skin.fire_action_type
		L3_279.fire_bullet = A1_277.cf_weapon_skin.normal_bullet
		local L4_280, L5_281 = L4_280, L5_281
		local L6_282 = L6_282
		local L8_284 = clone(A1_277.weapon_angle_limit)
		L4_280(L5_281, L6_282, L8_284, not A2_278)
	end
end
function L17_17.ways.base.try_update_round_weap_angle_on_enter_new_round(A0_285)
	local L1_286
	L1_286 = A0_285.round
	local L1_286, L5_290 = L1_286.round_weap_angle_limit, L5_290
	L6_291 = A0_285
	L5_290 = A0_285.try_get_round_weap_angle_limit
	L7_292 = A0_285.round
	L7_292 = L7_292.round_count
	L5_290 = L5_290(L6_291, L7_292)
	if L1_286 == L5_290 then
		return
	end
	if L1_286 and L5_290 then
		L6_291 = L1_286.min
		L7_292 = L5_290.min
		if L6_291 == L7_292 then
			L6_291 = L1_286.max
			L7_292 = L5_290.max
			if L6_291 == L7_292 then
				return
			end
		end
	end
	L6_291 = A0_285.round
	L6_291.round_weap_angle_limit = L5_290
	L6_291 = pairs
	L7_292 = A0_285.id_to_unit
	L6_291, L7_292, _FOR_ = L6_291(L7_292)
	for _FORV_6_, _FORV_7_ in L6_291, L7_292, _FOR_ do
		if _FORV_7_.weapon and _FORV_7_.weapon_angle_limit then
			A0_285:reset_unit_weanpon_angle(_FORV_7_, true)
			local L11_296 = L11_296
		end
	end
end
function L17_17.ways.base.reset_unit_weanpon_angle(A0_297, A1_298, A2_299)
	local L3_300
	L3_300 = A1_298.attack_info
	if not L3_300 then
		return
	end
	local L4_301, L5_302 = L4_301, L5_302
	local L4_301, L5_302, L6_303 = L4_301(L5_302, A1_298)
	L6_303 = A1_298.weapon_angle
	local L11_308 = L11_308
	L11_308 = L11_308(L4_301, math.min(A1_298.weapon_angle, L5_302))
	A1_298.weapon_angle = L11_308
	if A2_299 then
		L11_308 = A1_298.id
		if L11_308 == A0_297.ctrl_unit_id then
			L11_308 = A0_297.req_update_recommand_forces
			L11_308(A0_297)
			L11_308 = _ENV
			L11_308 = L11_308.brocast
			L11_308("fight_ctrl_angle_limit_changed", A1_298, L3_300.weapon_angle_limit)
			L11_308 = A1_298.weapon_angle
			if L6_303 ~= L11_308 then
				L11_308 = _ENV
				L11_308 = L11_308.brocast
				local L8_305 = L8_305
				local L9_306 = L9_306
				L11_308(L8_305, L9_306, A1_298.weapon_angle)
				local L10_307 = L10_307
			end
		end
	end
end
function L17_17.ways.base.set_unit_weapon_angle_limit(A0_309, A1_310, A2_311, A3_312)
	local L4_313, L5_314
	L4_313 = A1_310.attack_info
	L5_314 = L4_313.weapon_angle_limit
	L4_313.weapon_angle_limit = A2_311
	local L6_315, L7_316 = L6_315, L7_316
	local L6_315, L7_316, L8_317 = L6_315(L7_316, A1_310)
	L8_317 = A1_310.weapon_angle
	local L13_322 = L13_322
	L13_322 = L13_322(L6_315, math.min(A1_310.weapon_angle, L7_316))
	A1_310.weapon_angle = L13_322
	if A3_312 then
		L13_322 = A1_310.id
		if L13_322 == A0_309.ctrl_unit_id then
			L13_322 = A0_309.req_update_recommand_forces
			L13_322(A0_309)
			L13_322 = L5_314.min
			if L13_322 == A2_311.min then
				L13_322 = L5_314.max
				if L13_322 == A2_311.max then
					goto lbl_40
				end
			end
			L13_322 = _ENV
			L13_322 = L13_322.brocast
			L13_322("fight_ctrl_angle_limit_changed", A1_310, L4_313.weapon_angle_limit)
			::lbl_40::
			L13_322 = A1_310.weapon_angle
			if L8_317 ~= L13_322 then
				L13_322 = _ENV
				L13_322 = L13_322.brocast
				local L10_319 = L10_319
				local L11_320 = L11_320
				L13_322(L10_319, L11_320, A1_310.weapon_angle)
				local L12_321 = L12_321
			end
		end
	end
end
function L17_17.ways.base.set_unit_weapon_angle(A0_323, A1_324, A2_325, A3_326)
	local L4_327, L5_328 = L4_327, L5_328
	L4_327, L5_328 = L4_327(L5_328, A1_324)
	if A2_325 > L5_328 or A2_325 < L4_327 then
		return false
	end
	if (A3_326 or A0_323.round.round_count > 0) and A1_324.weapon_angle ~= A2_325 then
		A1_324.weapon_angle = A2_325
		if A1_324.id == A0_323.ctrl_unit_id then
			A0_323:req_update_recommand_forces()
			local L6_329 = L6_329
			local L7_330 = L7_330
			local L8_331 = L8_331
			L6_329(L7_330, L8_331, A1_324.weapon_angle)
			local L9_332 = L9_332
		end
		L6_329 = true
		return L6_329
	end
	L6_329 = true
	return L6_329
end
function L17_17.ways.base.convert_fire_angle_to_weapon_angle(A0_333, A1_334, A2_335, A3_336, A4_337)
	local L5_338
	if A1_334 == _ENV.role_directions.right then
		L5_338 = A3_336 - A2_335
	else
		L5_338 = A2_335 - A3_336
	end
	if A4_337 then
		local L6_339 = L6_339
		return L6_339(A0_333, L5_338)
	end
	L6_339 = math
	L6_339 = L6_339.round
	local L7_340, L8_341 = L7_340, L8_341
	L7_340, L8_341 = L7_340(L8_341, L5_338)
	return L6_339(L7_340, L8_341, L7_340(L8_341, L5_338))
end
function L17_17.ways.base.convert_weapon_angle_to_fire_angle(A0_342, A1_343, A2_344, A3_345, A4_346)
	local L5_347
	if A1_343 == _ENV.role_directions.right then
		L5_347 = A2_344 + A3_345
	else
		L5_347 = A2_344 - A3_345
	end
	if A4_346 then
		local L6_348 = L6_348
		return L6_348(A0_342, L5_347)
	end
	L6_348 = math
	L6_348 = L6_348.round
	local L7_349, L8_350 = L7_349, L8_350
	L7_349, L8_350 = L7_349(L8_350, L5_347)
	return L6_348(L7_349, L8_350, L7_349(L8_350, L5_347))
end
function L17_17.ways.base.format_angle(A0_351, A1_352)
	local L2_353
	if A1_352 <= -180 then
		L2_353 = A1_352 + 360
		return L2_353
	elseif 180 < A1_352 then
		L2_353 = A1_352 - 360
		return L2_353
	else
		return A1_352
	end
end
function L17_17.ways.base.get_unit_fire_angle(A0_354, A1_355, A2_356)
	local L3_357 = L3_357
	L3_357 = L3_357(A0_354, A1_355.direction, A1_355.angle, A1_355.weapon_angle, A2_356)
	if _ENV.fight_frame then
		local L6_359 = L6_359
		local L7_360 = L7_360
		local L8_361 = L8_361
		local L9_362 = L9_362
		L6_359(L7_360, L8_361, L9_362, A1_355.angle, A1_355.weapon_angle, L3_357)
		local L10_363 = L10_363
	end
	if A2_356 then
		return L3_357
	end
	L6_359 = math
	L6_359 = L6_359.round
	L7_360 = L3_357
	return L6_359(L7_360)
end
function L17_17.ways.base.get_unit_rec_fire_angle(A0_364, A1_365)
	local L2_366, L3_367, L4_368
	L2_366 = A1_365.weapon
	if L2_366 then
		L2_366 = A1_365.weapon
		L2_366 = L2_366.cf_weapon
	end
	if not L2_366 then
		L3_367 = 0
		L4_368 = 0
		return L3_367, L4_368
	end
	L3_367 = L2_366.min_rec_fire_angle
	if not L3_367 then
		L3_367 = 0
	end
	L4_368 = L2_366.max_rec_fire_angle
	if not L4_368 then
		L4_368 = 0
	end
	return L3_367, L4_368
end
function L17_17.ways.base.get_unit_fire_angle_limit(A0_369, A1_370)
	local L2_371, L3_372 = L2_371, L3_372
	L2_371, L3_372 = L2_371(L3_372, A1_370)
	local L4_373 = L4_373
	L4_373 = L4_373(A0_369, A1_370.direction, A1_370.angle, L2_371)
	local L5_374, L6_375 = L5_374, L6_375
	local L7_376 = L7_376
	local L8_377 = L8_377
	local L5_374, L9_378 = L5_374(L6_375, L7_376, L8_377, L3_372), L9_378
	L6_375 = L4_373
	L7_376 = L5_374
	return L6_375, L7_376
end
function L17_17.ways.base.get_unit_fire_action_type(A0_379, A1_380)
	local L2_381
	L2_381 = A1_380.attack_info
	L2_381 = L2_381.fire_action_type
	if not L2_381 then
		L2_381 = A1_380.cf_weapon_skin
		L2_381 = L2_381.fire_action_type
	end
	return L2_381
end
function L17_17.ways.base.is_unit_in_firing(A0_382, A1_383)
	if not A1_383.is_cur_round_attacker then
		return false
	end
	if A1_383.round_status == _ENV.unit_round_status.action then
		return false
	end
	if A1_383.attack_info and A1_383.attack_info.all_fire_msg_received == false then
		return true
	end
	if A0_382:is_unit_doing_fire_action(A1_383) then
		return true
	end
	local L2_384, L3_385 = L2_384, L3_385
	local L2_384, L4_386 = L2_384(L3_385, A1_383), L4_386
	if L2_384 then
		L2_384 = true
		return L2_384
	end
	L2_384 = false
	return L2_384
end
function L17_17.ways.base.try_get_round_weap_angle_limit(A0_387, A1_388)
	local L2_389
	L2_389 = A0_387.cf_battle
	if L2_389 then
		L2_389 = A0_387.cf_battle
		L2_389 = L2_389.angle_interval
	end
	if L2_389 then
		L5_392 = next
		L6_393 = L2_389
		L5_392 = L5_392(L6_393)
		if L5_392 then
			goto lbl_15
		end
	end
	L5_392 = nil
	do return L5_392 end
	::lbl_15::
	L5_392 = pairs
	L6_393 = L2_389
	L5_392, L6_393, L7_394 = L5_392(L6_393)
	for L8_395, L9_396 in L5_392, L6_393, L7_394 do
		if A1_388 == L9_396[1] then
			if L9_396[2] and L9_396[3] then
				({}).min = L9_396[2]
				;({}).max = L9_396[3]
				return {}
			end
			break
		end
	end
	L5_392 = nil
	return L5_392
end
function L17_17.ways.base.change_unit_hold_fire_weapon_effect(A0_397, A1_398, A2_399)
	if A1_398.holding_fire_effect then
		local L3_400, L4_401 = L3_400, L4_401
		L3_400(L4_401, A1_398, A1_398.holding_fire_effect)
		A1_398.holding_fire_effect = nil
	end
	L3_400 = A2_399
	if not A2_399 then
		L4_401 = A1_398.cf_weapon_skin
		if L4_401 then
			L4_401 = A1_398.cf_weapon_skin
			L4_401 = L4_401.power_action_eff
			if L4_401 then
				goto lbl_20
				L3_400 = L4_401 or L3_400
			end
		end
		L3_400 = nil
	end
	::lbl_20::
	if not L3_400 or L3_400 <= 0 then
		return
	end
	L4_401 = A1_398.cf_weapon_skin
	if L4_401 then
		L4_401 = A1_398.cf_weapon_skin
		L4_401 = L4_401.power_action_eff_bone
		if L4_401 then
			goto lbl_33
		end
	end
	L4_401 = nil
	::lbl_33::
	local L5_402, L6_403 = L5_402, L6_403
	local L7_404 = L7_404
	local L8_405 = L8_405
	local L9_406 = L9_406
	local L10_407 = L10_407
	local L11_408, L12_409 = L11_408, L12_409
	local L13_410 = L13_410
	local L14_411, L15_412 = L14_411, L15_412
	local L16_413 = L16_413
	local L5_402, L17_414 = L5_402(L6_403, L7_404, L8_405, L9_406, L10_407, L11_408, L12_409, L13_410, L14_411, L15_412, L16_413, false), L17_414
	A1_398.holding_fire_effect = L5_402
end
function L17_17.ways.base.evaluate_to_server_aim_type(A0_415, A1_416, A2_417)
	local L3_418
	if A1_416 == 0 then
		L3_418 = 3
		return L3_418
	elseif A1_416 == 1 then
		L3_418 = 2
		return L3_418
	elseif A1_416 == 2 then
		if A2_417 then
			L3_418 = 0
			return L3_418
		else
			L3_418 = 1
			return L3_418
		end
	else
		L3_418 = 0
		return L3_418
	end
end
