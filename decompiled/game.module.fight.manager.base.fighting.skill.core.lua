local L0_0, L2_2, L3_3, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L19_19, L20_20, L21_21, L22_22 = L0_0, "game.utils.events", L3_3, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L19_19, L20_20, L21_21, L22_22
L0_0 = L0_0(L2_2)
L2_2 = math
L2_2 = L2_2.max
L3_3 = string
L3_3 = L3_3.len
L7_7 = table
L7_7 = L7_7.insert
L8_8 = assert
L9_9 = BroadcastTips
L8_8 = L8_8(L9_9)
L9_9 = assert
L10_10 = DataConfigs
L9_9 = L9_9(L10_10)
L10_10 = L9_9.language_define
L11_11 = L9_9.skill
L12_12 = L9_9.fight_misc
L13_13 = L9_9.fight_effect
L14_14 = L12_12.default_skill
L14_14 = L14_14.value
L15_15 = L14_14[3]
L16_16 = L11_11.const
L16_16 = L16_16.prototype
L19_19 = L12_12.soul_skill_ids
L19_19 = L19_19.value
L20_20 = L12_12.soul_skill_round_max
L20_20 = L20_20.value
L21_21 = L12_12.fix_cd_skill_prototype
L21_21 = L21_21.value
L22_22 = {}
if L19_19 then
	L23_23 = ipairs
	L24_24 = L19_19
	L23_23, L24_24, L25_25 = L23_23(L24_24)
	for L26_26, L27_27 in L23_23, L24_24, L25_25 do
		L22_22[L27_27[1]] = true
	end
end
L23_23 = Game
L23_23 = L23_23.module
L23_23 = L23_23.fight
L24_24 = L23_23.ways
L24_24 = L24_24.base
L25_25 = L23_23.const_attr_str
L26_26 = L23_23.attr_str_belong_soul
function L27_27(A0_28)
	if A0_28.fight_state ~= "attack" then
		return false
	end
	local L1_29 = A0_28:get_ctrl_unit()
	if not L1_29 then
		return false
	end
	if not L1_29.is_cur_round_attacker then
		return false, "not_round_attacker"
	end
	if L1_29.round_status ~= _ENV.unit_round_status.action then
		return false
	end
	local L2_30 = L2_30
	L2_30 = L2_30(A0_28, L1_29)
	if not L2_30 then
		L2_30 = false
		return L2_30
	end
	L2_30 = L1_29.role
	if L2_30 then
		L2_30 = L1_29.role
		L2_30 = L2_30.is_auto_battle
		if L2_30 then
			L2_30 = false
			return L2_30
		end
	end
	L2_30 = L1_29.mutual_fire_skill_id
	if not L2_30 or L2_30 == L1_29.weapon.normal_skill_id then
		return false
	end
	local L3_31, L4_32 = L3_31, L4_32
	local L5_33 = L5_33
	local ({}).round, L7_35 = A0_28.round.round_count, L7_35
	L7_35.cf_skill_id = L2_30
	L3_31(L4_32, L5_33, L7_35)
	L3_31 = true
	return L3_31
end
L24_24.try_to_req_revocation_skill = L27_27
function L27_27(A0_36, A1_37)
	local L2_38 = A0_36:get_ctrl_unit()
	if not L2_38 then
		return false, "no unit"
	end
	local L3_39 = L3_39
	L3_39 = L3_39(_ENV[A1_37], A1_37)
	local L4_40, L5_41 = L4_40, L5_41
	L4_40, L5_41 = L4_40(L5_41, L2_38, L3_39, true)
	if not L4_40 then
		return false, L5_41
	end
	local L6_42, L7_43 = L6_42, L7_43
	L6_42(L7_43, A1_37)
	local L8_44 = L8_44
	L6_42 = true
	return L6_42
end
L24_24.try_to_req_use_skill = L27_27
function L27_27(A0_45, A1_46)
	local L2_47
	L2_47 = A1_46.cost
	if L2_47 then
		local L3_48 = L3_48
		local L3_48, L4_49 = L3_48(L2_47), L4_49
		if L3_48 then
			goto lbl_11
		end
	end
	L3_48 = nil
	do return L3_48 end
	::lbl_11::
	L3_48 = L2_47.normal_round
	if L3_48 then
		L3_48 = A0_45.round
		L3_48 = L3_48.is_repeat_round
		if L3_48 then
			L3_48 = L2_47.repeat_round
			return L3_48
		else
			L3_48 = L2_47.normal_round
			return L3_48
		end
	end
	return L2_47
end
function L24_24.is_soul_skill(A0_50, A1_51)
	local L2_52
	L2_52 = _ENV
	L2_52 = L2_52[A1_51]
	L2_52 = L2_52 == true
	return L2_52
end
function L24_24.get_cur_soul_skill_target(A0_53, A1_54)
	local L2_55, L3_56
	L2_55 = A0_53.round
	L2_55 = L2_55.cur_attacker_infos
	if not L2_55 then
		L3_56 = nil
		return L3_56
	end
	L3_56 = nil
	L6_59 = ipairs
	L7_60 = L2_55
	L6_59, L7_60, L8_61 = L6_59(L7_60)
	for _FORV_7_, _FORV_8_ in L6_59, L7_60, L8_61 do
		L3_56 = A0_53:get_unit_by_id(_FORV_8_.obj_id, true)
		if not L3_56 then
		elseif L3_56.id == A1_54.id then
		elseif L3_56.camp ~= A1_54.camp then
		elseif L3_56.round_status ~= _ENV.unit_round_status.action then
		else
			local L11_64 = A0_53:unit_can_do_round_action(L3_56)
			if not L11_64 then
			else
				return L3_56
			end
		end
	end
	L6_59 = nil
	return L6_59
end
function L24_24.unit_can_use_skill(A0_66, A1_67, A2_68, A3_69, A4_70)
	local L5_71, L6_72
	A3_69 = false
	if not A4_70 then
		L5_71 = A0_66.fight_state
		if L5_71 ~= "attack" then
			L5_71 = false
			L6_72 = "state"
			return L5_71, L6_72
		end
	end
	L5_71 = A2_68.id
	L6_72 = A1_67.skill_cf_id_to_info
	if L6_72 then
		L6_72 = A1_67.skill_cf_id_to_info
		L6_72 = L6_72[L5_71]
		if L6_72 then
			goto lbl_19
		end
	end
	L6_72 = nil
	::lbl_19::
	if not L6_72 then
		return false, "skill not exist"
	end
	if _ENV(A2_68) then
		if not A0_66:get_cur_soul_skill_target(A1_67) then
			return false, "no_target_attacker"
		end
		if _UPVALUE1_(A1_67, A2_68) then
			return false, "round_max"
		end
	else
		if not A1_67.is_cur_round_attacker then
			return false, "not_round_attacker"
		end
		if not A4_70 and A1_67.round_status ~= L23_23.unit_round_status.action then
			return false, "fired"
		end
		if not A0_66:unit_can_do_round_action(A1_67) then
			return false, "action"
		end
		if A0_66:is_unit_buff_ban_skill(A1_67, A2_68, L6_72) then
			return false, "silent"
		end
		if A1_67.role and A1_67.role.is_auto_battle then
			return false, "auto_battle"
		end
		if A2_68.prototype_id == 1005 and A0_66:is_unit_has_buff_state(A1_67, L23_23.buff_states.immobilized) then
			return false, "move_lock"
		end
		if A2_68.prototype_id == 1015 and A1_67.holding_fire == true then
			return false, "holding_fire"
		end
	end
	if A0_66:is_repeat_round() and A2_68.prototype_id == L23_23.skill_proto_type.freeze then
		return false, "repeat_ban_freeze"
	end
	if A0_66:is_unit_skill_forbid(A1_67, A2_68.prototype_id) then
		return false, "prototype_id_forbid"
	end
	if A2_68.turn_max and A2_68.turn_max > 0 and L6_72.round_count >= A2_68.turn_max then
		return false, "turn max"
	end
	local L7_73, L8_74 = L7_73, L8_74
	L7_73 = L7_73(L8_74, A2_68)
	if L7_73 ~= nil and 0 < L7_73 then
		L8_74 = L6_72.all_count
		if L7_73 <= L8_74 then
			L8_74 = false
			return L8_74, "match max"
		end
	end
	if L6_72 then
		L8_74 = L6_72.cd
		if not (0 < L8_74) then
			goto lbl_171
		end
	end
	L8_74 = false
	do return L8_74, "cd" end
	::lbl_171::
	L8_74 = A1_67.forbidden_skill_types
	if L8_74 then
		L8_74 = A1_67.forbidden_skill_types
		L8_74 = L8_74[A2_68.forbid_type]
	end
	if L8_74 and 0 < L8_74 then
		return false, "ban1"
	end
	if not A3_69 and A1_67.mutual_fire_skill_id and 0 < A1_67.mutual_fire_skill_id and A2_68.id ~= A1_67.mutual_fire_skill_id and L11_11[A1_67.mutual_fire_skill_id].forbid_list then
		_FOR_, _FOR_, _FOR_ = ipairs(L11_11[A1_67.mutual_fire_skill_id].forbid_list)
		for _FORV_13_, _FORV_14_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_14_ == A2_68.forbid_type then
				return false, "ban"
			end
		end
	end
	local L9_75 = L9_75
	local L10_76 = L10_76
	L9_75, L10_76 = L9_75(L10_76, A1_67, A2_68, A3_69)
	if not L9_75 then
		return L9_75, L10_76
	end
	if A2_68.effect and A2_68.effect[1] then
	end
	if L5_71 == L15_15 and A2_68.effect[1][3] and A2_68.effect[1][3][#A2_68.effect[1][3]] and 0 < A2_68.effect[1][3][#A2_68.effect[1][3]] then
		local L16_82 = L16_82
		local L17_83 = L17_83
		local L18_84 = L18_84
		L9_75, L10_76 = _UPVALUE4_(A0_66, A1_67, L11_11[A2_68.effect[1][3][#A2_68.effect[1][3]]], A3_69)
		if not L9_75 then
			return L9_75, L10_76
		end
	end
	L17_83 = A0_66
	L16_82 = A0_66.is_unit_has_buff_state
	L18_84 = A1_67
	local L16_82, L14_80 = L16_82(L17_83, L18_84, L23_23.buff_states.immobilized), L14_80
	if L16_82 then
		L16_82 = L6_72.prototype
		L17_83 = L16_16
		L17_83 = L17_83.fly
		if L16_82 ~= L17_83 then
			L16_82 = L6_72.prototype
			L17_83 = L16_16
			L17_83 = L17_83.soul_fly
			if L16_82 ~= L17_83 then
				L16_82 = L6_72.pos
				L17_83 = L23_23
				L17_83 = L17_83.skill_pos
				L17_83 = L17_83.fly
				if L16_82 ~= L17_83 then
					goto lbl_288
				end
			end
		end
		L16_82 = false
		L17_83 = "forbid_fly"
		return L16_82, L17_83
	end
	::lbl_288::
	L16_82 = true
	return L16_82
end
function L24_24.is_skill_cost_ok(A0_85, A1_86, A2_87, A3_88)
	local L4_89
	if A3_88 then
		L4_89 = A1_86.skill_cf_id_to_info
		L4_89 = L4_89[A2_87]
		if not L4_89 then
			return false, 0
		end
	end
	L4_89 = _ENV
	L4_89 = L4_89[A2_87]
	local L5_90 = L5_90
	local L6_91 = L6_91
	local L7_92 = L7_92
	local L8_93 = L8_93
	local L5_90, L9_94 = L5_90(L6_91, L7_92, L8_93, false), L9_94
	L6_91 = L5_90
	L7_92 = 1
	return L6_91, L7_92
end
function L24_24.can_unit_use_soul_skill(A0_95, A1_96, A2_97)
	local L3_98, L4_99
	L3_98 = A0_95.fight_state
	if L3_98 ~= "attack" then
		L3_98 = false
		L4_99 = "state"
		return L3_98, L4_99
	end
	L3_98 = A1_96.is_dead
	if L3_98 ~= true then
		L3_98 = false
		L4_99 = "alive"
		return L3_98, L4_99
	end
end
function L24_24.reset_unit_forbidden_skills(A0_100, A1_101)
	local L5_105, L2_102 = A1_101, L2_102
	L2_102(L5_105)
	L2_102 = A1_101.forbidden_skill_types
	L5_105 = pairs
	L5_105, L4_104, _FOR_ = L5_105(L2_102)
	for _FORV_6_, _FORV_7_ in L5_105, L4_104, _FOR_ do
		L2_102[_FORV_6_] = nil
	end
end
function L24_24.forbidden_to_switch_ultimate_skill(A0_106)
	return false
end
function L24_24.on_msg_battle_revocation_skill_s2c(A0_107, A1_108, A2_109)
	if A2_109.round ~= A0_107.round.round_count then
		A0_107:fight_log_error("use skill, round_count not match! local:{0},server:{1}", A0_107.round.round_count, A2_109.round)
	end
	local L3_110 = L3_110
	L3_110 = L3_110(A2_109.object_id)
	local L4_111, L5_112 = L4_111, L5_112
	L4_111 = L4_111(L5_112, L3_110)
	L5_112 = A2_109.cf_skill_id
	A0_107:try_revocation_unit_mutual_skill(L4_111, L5_112)
	local L6_113, L7_114 = L6_113, L7_114
	local L8_115 = L8_115
	L6_113(L7_114, L8_115, L4_111.weapon.normal_skill_id)
	local L9_116 = L9_116
end
function L24_24.try_revocation_unit_mutual_skill(A0_117, A1_118, A2_119)
	local L3_120
	L3_120 = A1_118.weapon
	L3_120 = L3_120.normal_skill_id
	if L3_120 == A2_119 then
		L3_120 = false
		return L3_120
	end
	if A2_119 and 0 < A2_119 then
		L3_120 = _ENV
		L3_120 = L3_120[A2_119]
		local L4_121, L5_122 = L4_121, L5_122
		local L6_123 = L6_123
		L4_121(L5_122, L6_123, L3_120)
		local L7_124 = L7_124
	end
	L3_120 = Time
	L3_120 = L3_120.time
	A1_118.last_op_time = L3_120
	A1_118.oped = true
	L3_120 = true
	return L3_120
end
function L24_24.try_set_unit_mutual_skill(A0_125, A1_126, A2_127)
	if not A0_125:set_unit_fire_mutual_skill(A1_126, A2_127) then
		return false
	end
	if A0_125:ctrl_unit_can_see_this_unit(A1_126) then
		_ENV.brocast("fight_unit_show_use_skill_icon", A1_126, A1_126.mutual_fire_skill_id)
	end
	_ENV.brocast("fight_round_show_use_skill", A1_126, A1_126.mutual_fire_skill_id)
	_ENV.brocast("fight_unit_use_skill", A1_126, A1_126.mutual_fire_skill_id)
	local L3_128 = L3_128
	local L5_129 = L5_129
	L3_128(L5_129, "fight_attack", A1_126)
	local L6_130 = L6_130
	L3_128 = true
	return L3_128
end
function L24_24.on_manual_use_skill(A0_131, A1_132)
	if A1_132.round ~= A0_131.round.round_count then
		A0_131:fight_log_error("use skill, round_count not match! local:{0},server:{1}", A0_131.round.round_count, A1_132.round)
		local L6_137 = L6_137
	end
	L6_137 = assert
	L6_137 = L6_137(A1_132.object_id)
	local L3_134, L4_135 = L3_134, L4_135
	local L3_134, L5_136 = L3_134(L4_135, L6_137), L5_136
	if L3_134 then
		L4_135 = L3_134.skill_cf_id_to_info
		if L4_135 then
			goto lbl_24
		end
	end
	do return end
	::lbl_24::
	L4_135 = A1_132.skill_info
	L4_135 = L4_135.skill_info
	L4_135 = L4_135.cfg_id
	L5_136 = L3_134.skill_cf_id_to_info
	L5_136 = L5_136[L4_135]
	if not L5_136 then
		return
	end
	if _ENV.is_mutual(_ENV[L4_135].fire_bullet_type) then
		if L3_134.mutual_fire_skill_id and L3_134.mutual_fire_skill_id > 0 then
			A0_131:revert_skill_effects(L3_134, _ENV[L3_134.mutual_fire_skill_id])
			local L12_143 = L12_143
		end
		A0_131:set_unit_fire_mutual_skill(L3_134, L4_135)
	end
	A0_131:update_skill_cost(L3_134, A1_132.skill_info.skill_info)
	L0_0.brocast("fight_unit_use_skill", L3_134, L4_135)
	if L3_134.is_dead then
		local L8_139 = L8_139
		local L9_140 = L9_140
		L8_139(L9_140, L3_134, L4_135)
		local L10_141 = L10_141
	end
end
function L24_24.use_skill(A0_144, A1_145)
	local L2_146 = L2_146
	L2_146 = L2_146(A1_145.object_id)
	local L3_147 = L3_147
	L3_147 = L3_147(A0_144, L2_146, true)
	if not L3_147 then
		if A1_145.processings and next(A1_145.processings) then
			A0_144:try_to_execute_processings_until_target(A1_145.processings[1])
		end
		L3_147 = A0_144:get_unit_by_id(L2_146)
	end
	if L3_147.attack_info and L3_147.attack_info.fire_behavior ~= nil then
		local L4_148, L5_149 = L4_148, L5_149
		L4_148(L5_149, L3_147, false, true)
	end
	L4_148 = A1_145.skill_node
	L4_148 = L4_148.cfg_id
	L5_149 = _ENV
	L5_149 = L5_149[L4_148]
	if _ENV.is_mutual(L5_149.fire_bullet_type) then
		A0_144:set_unit_fire_mutual_skill(L3_147, L4_148)
	end
	if L5_149.fire_bullet_type == 2 then
		if A1_145.skill_node.type == 2 then
			A0_144:set_unit_round_status(L3_147, L23_23.unit_round_status.watch)
		else
			if A1_145.processings then
				_FOR_, _FOR_, _FOR_ = ipairs(A1_145.processings)
				for _FORV_10_, _FORV_11_ in _FOR_, _FOR_, _FOR_ do
					xpcall(A0_144.try_to_deal_object_processing, A0_144:fight_traceback(), A0_144, _FORV_11_, true)
				end
			end
			A0_144:mark_node_done(A1_145)
			return
		end
	end
	L4_4(L3_147.cur_round_used_skill_ids, L5_149.prototype_id)
	if L5_149.action and not L3_147.holding_fire and not L3_147.is_dead then
		A0_144:set_unit_ani_trigger(L3_147, L5_149.action)
	end
	local L6_150, L7_151 = L6_150, L7_151
	L6_150(L7_151, L3_147, L5_149)
	L6_150 = 0
	L7_151 = L5_149.begin_fx_args
	if L7_151 and next(L7_151) then
		_FOR_, _FOR_, _FOR_ = ipairs(L7_151)
		for _FORV_14_, _FORV_15_ in _FOR_, _FOR_, _FOR_ do
			if A0_144:ctrl_unit_can_see_this_unit(L3_147) then
				if not _FORV_15_.delay then
				end
				A0_144:add_run_after_to_unit(L3_147, 0 * A0_144:get_skill_speed_factor_for_time(L3_147), function()
					local L1_167 = L1_167
					local L2_168 = L2_168
					L1_167(L2_168, L3_147, _UPVALUE2_)
					local L3_169 = L3_169
				end)
			end
			if _FORV_15_.play_time then
				if not _FORV_15_.delay then
				end
			else
				if not assert(L13_13[_FORV_15_.eff_id], _FORV_15_.eff_id).play_time then
				end
				if not _FORV_15_.delay then
				end
			end
			if L6_150 < (0 + 0) * A0_144:get_skill_speed_factor_for_time(L3_147) then
				L6_150 = (0 + 0) * A0_144:get_skill_speed_factor_for_time(L3_147)
			end
		end
	end
	local L8_152 = L8_152
	L8_152(A0_144, L3_147, L5_149)
	if 0 < L6_150 then
		L8_152 = 2
		if L8_152 then
			goto lbl_191
		end
	end
	L8_152 = 1
	::lbl_191::
	local L9_153, L10_154 = A0_144:add_perform(), L10_154
	function L10_154()
		_ENV = _ENV - 1
		if 0 < _ENV then
			return
		end
		A0_144:del_perform(L9_153)
		local L1_170 = L1_170
		L1_170(A0_144, A1_145)
		local L2_171 = L2_171
	end
	A0_144:do_skill_effects(L3_147, L5_149, A1_145, L10_154)
	if 0 < L6_150 then
		A0_144:run_after_in_this_round(L6_150, L10_154, true)
	end
	if L3_147.role and L4_148 ~= Game.module.skill.const.skill_id_fight_exchange_pet and A0_144.cf_battle.op_tip == 1 and not A0_144.client_type_handler:is_rebuilding() and L3_147.skill_cf_id_to_info[L4_148] and L3_147.skill_cf_id_to_info[L4_148].quality and 1 <= L3_147.skill_cf_id_to_info[L4_148].quality then
		if L3_147.id == A0_144.ctrl_unit_id then
			BroadcastTips.broadcast_tips((string.format("\228\189\191\231\148\168\228\186\134<color=%s>[%s]</color>!", GlobalConst.item_quality_color_deep[L3_147.skill_cf_id_to_info[L4_148].quality], (L10_10.get_string(L5_149.name)))))
		else
			local L16_160 = L16_160
			local L19_163 = L19_163
			local L20_164 = L20_164
			local L21_165 = L21_165
			local L22_166 = L22_166
			L21_165 = string.format("<color=#%s>%s</color>\228\189\191\231\148\168\228\186\134<color=%s>[%s]</color>!", A0_144:get_name_color(L3_147), L3_147.name, GlobalConst.item_quality_color_deep[L3_147.skill_cf_id_to_info[L4_148].quality], L19_163)
			BroadcastTips.broadcast_tips(L21_165)
		end
	end
	L19_163 = A0_144
	L16_160 = A0_144.try_to_trigger_guide_on_use_skill
	L20_164 = L4_148
	L16_160(L19_163, L20_164)
end
function L24_24.play_skill_use_eff(A0_172, A1_173, A2_174)
	local L3_175
	if A2_174.bone_path then
		L3_175 = A0_172:play_unit_effect(A1_173, A2_174.eff_id, true, A2_174.bone_path, nil, nil, true, nil, nil, nil, true)
	else
		local L4_176 = L4_176
		L4_176 = L4_176(A0_172, A1_173)
		A0_172.land_data:land_to_world_pos(A1_173.pos.x, A1_173.pos.y, A0_172.table_pools[2])
		local L9_181 = L9_181
		local L10_182 = L10_182
		local L11_183 = L11_183
		local L12_184 = L12_184
		local L13_185 = L13_185
		local L10_182, L14_186, L15_187, L16_188, L17_189, L18_190 = L10_182(L11_183, L12_184, L13_185, A0_172.table_pools[2], nil, L4_176, true, nil, nil, nil, nil, nil), L14_186, L15_187, L16_188, L17_189, L18_190
		L3_175 = L10_182
	end
	if L3_175 then
		L4_176 = A1_173.pet
		if L4_176 ~= nil then
			L4_176 = 2
			if L4_176 then
				goto lbl_48
			end
		end
		L4_176 = 1
		::lbl_48::
		L10_182 = A0_172
		L9_181 = A0_172.set_effect_extra_play_speed_factor
		L11_183 = L3_175
		L12_184 = L4_176
		L9_181(L10_182, L11_183, L12_184)
	end
end
function L24_24.is_show_use_skill_icon(A0_191, A1_192, A2_193)
	repeat
		if A0_191.is_group_action then
			local L3_194, L4_195 = L3_194, L4_195
			do return L3_194(L4_195, A1_192) end
			local L5_196 = L5_196
			break -- pseudo-goto
		end
		L3_194 = true
		return L3_194
	until true
end
function L24_24.play_use_skill_audio(A0_197, A1_198, A2_199)
	local L6_203 = L6_203
	if A2_199.begin_sound then
		L6_203 = _ENV
		L6_203 = L6_203(A2_199.begin_sound)
		if L6_203 ~= 0 then
			goto lbl_10
		end
	end
	do return end
	::lbl_10::
	L6_203 = A0_197.run_after_in_this_round
	local L4_201 = L4_201
	if not A2_199.begin_sound_delay then
	end
	local L5_202 = L5_202
	L6_203(L4_201, L5_202, function()
		local L1_204 = L1_204
		local L2_205 = L2_205
		L1_204(L2_205, A2_199.begin_sound, A1_198)
		local L3_206 = L3_206
	end)
end
function L24_24.add_unit_one_skill(A0_207, A1_208, A2_209)
	A0_207:raw_add_unit_one_skill(A1_208, A2_209)
	L6_213 = 1
	_FOR_ = 1
	for _FORV_6_ = L6_213, _FOR_, _FOR_ do
		A0_207:add_unit_forbidden_skills(A1_208, A2_209.cf_info)
		local L10_217 = L10_217
	end
	L6_213 = A2_209.round_count
	if 0 < L6_213 then
		L6_213 = _ENV
		L6_213 = L6_213.is_mutual
		L7_214 = A2_209.cf_info
		L7_214 = L7_214.fire_bullet_type
		L6_213 = L6_213(L7_214)
		if L6_213 then
			L6_213 = A2_209.cfg_id
			A1_208.mutual_fire_skill_id = L6_213
			L7_214 = A0_207
			L6_213 = A0_207.update_unit_attack_info_by_mutual_skill_id
			L8_215 = A1_208
			L6_213(L7_214, L8_215)
		end
	end
end
function L24_24.raw_add_unit_one_skill(A0_218, A1_219, A2_220)
	local L3_221, L4_222
	L3_221 = A2_220.cfg_id
	L4_222 = A1_219.source_to_skills
	L4_222 = L4_222[A2_220.source]
	if not L4_222 then
		L4_222 = {}
	end
	A1_219.source_to_skills[A2_220.source] = L4_222
	_ENV(L4_222, A2_220)
	A2_220.cf_info = assert(L11_11[L3_221], L3_221)
	local L5_223 = L5_223
	local L6_224 = L6_224
	local L5_223, L7_225 = L5_223(L6_224, 0), L7_225
	A2_220.cd = L5_223
	L5_223 = A1_219.skill_cf_id_to_info
	L5_223[L3_221] = A2_220
end
function L24_24.del_unit_one_skill(A0_226, A1_227, A2_228)
	local L3_229
	L3_229 = A1_227.skill_cf_id_to_info
	L3_229 = L3_229[A2_228]
	if not L3_229 then
		return
	end
	A0_226:del_unit_forbidden_skills(A1_227, L3_229.cf_info)
	local L4_230, L5_231 = L4_230, L5_231
	local L6_232 = L6_232
	L4_230(L5_231, L6_232, A2_228)
	local L7_233 = L7_233
end
function L24_24.raw_del_unit_one_skill(A0_234, A1_235, A2_236)
	local L3_237, L4_238
	L3_237 = A1_235.skill_cf_id_to_info
	L3_237 = L3_237[A2_236]
	if not L3_237 then
		return
	end
	L4_238 = A1_235.skill_cf_id_to_info
	L4_238[A2_236] = nil
	L4_238 = A1_235.source_to_skills
	L7_241 = L3_237.source
	L4_238 = L4_238[L7_241]
	if not L4_238 then
		return
	end
	L7_241 = ipairs
	L8_242 = L4_238
	L7_241, L8_242, _FOR_ = L7_241(L8_242)
	for _FORV_8_, _FORV_9_ in L7_241, L8_242, _FOR_ do
		if _FORV_9_.cfg_id == A2_236 then
			table.remove(L4_238, _FORV_8_)
			break
		end
	end
end
function L24_24.update_skill_cost(A0_246, A1_247, A2_248)
	local L3_249, L4_250, L5_251, L6_252
	L3_249 = A2_248.cfg_id
	L4_250 = A1_247.skill_cf_id_to_info
	L4_250 = L4_250[L3_249]
	if not L4_250 then
		return
	end
	L5_251 = L4_250.cf_info
	L6_252 = 1
	_FOR_ = 1
	for _FORV_9_ = L6_252, _FOR_, _FOR_ do
		A0_246:del_unit_forbidden_skills(A1_247, L5_251)
	end
	L6_252 = A2_248.round_count
	L6_252 = L6_252 - L4_250.round_count
	L4_250.round_count = A2_248.round_count
	_FOR_ = 1
	for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
		A0_246:add_unit_forbidden_skills(A1_247, L5_251)
	end
	L4_250.all_count = A2_248.all_count
	L4_250.cd = _ENV(A2_248.use_round - A1_247.round_count, 0)
	local L7_253 = L7_253
	L7_253 = L7_253(A0_246, L5_251)
	if L7_253 and L26_26[assert(L25_25[L7_253[1]], L7_253[1])] and A0_246.id_to_soul[A1_247.id] then
		local L13_259 = L13_259
		if not L7_253[2] then
		end
		A0_246:del_soul_wakan(A0_246.id_to_soul[A1_247.id], 0)
		local L14_260 = L14_260
	end
	L14_260 = A0_246
	L13_259 = A0_246.is_ctrl_unit
	L13_259 = L13_259(L14_260, A1_247)
	if L13_259 then
		L13_259 = L0_0
		L13_259 = L13_259.brocast
		L14_260 = "fight_skill_update"
		L13_259(L14_260, L4_250)
	else
		L14_260 = A0_246
		L13_259 = A0_246.is_self_commander
		L13_259 = L13_259(L14_260)
		if L13_259 then
			L14_260 = A0_246
			L13_259 = A0_246.is_partner
			L13_259 = L13_259(L14_260, A1_247)
			if L13_259 then
				L13_259 = L0_0
				L13_259 = L13_259.brocast
				L14_260 = "fight_commander_skill_update"
				L13_259(L14_260, A1_247, L4_250)
			end
		end
	end
	if 0 < L6_252 then
		L14_260 = A0_246
		L13_259 = A0_246.is_show_use_skill_icon
		L13_259 = L13_259(L14_260, A1_247, L5_251)
		if L13_259 then
			L13_259 = L0_0
			L13_259 = L13_259.brocast
			L14_260 = "fight_round_show_use_skill"
			L13_259(L14_260, A1_247, L3_249, L6_252)
		end
		L14_260 = A0_246
		L13_259 = A0_246.check_show_use_skill_tip
		local L10_256 = L10_256
		L13_259(L14_260, L10_256, L5_251)
		local L11_257 = L11_257
	end
end
function L24_24.check_show_use_skill_tip(A0_261, A1_262, A2_263)
	if A0_261:is_partner(A1_262) then
		return
	end
	local L3_264 = L3_264
	local L3_264, L4_265 = L3_264(A2_263.id), L4_265
	L4_265 = nil
	if L3_264.prototype_id == L16_16.invisible_one then
		L4_265 = "\230\149\140\230\150\185\233\154\144\232\186\171"
	elseif L3_264.prototype_id == L16_16.invisible_all then
		L4_265 = "\230\149\140\230\150\185\231\190\164\233\154\144"
	end
	if not L4_265 then
		return
	end
	local L5_266 = L5_266
	L5_266(L4_265)
	local L6_267 = L6_267
end
function L24_24.add_unit_forbidden_skills(A0_268, A1_269, A2_270)
	local L3_271, L7_275 = L3_271, A1_269.forbidden_skill_types
	L8_276 = A1_269.id
	L3_271 = L3_271(L7_275, L8_276)
	L7_275 = A2_270.forbid_list
	L8_276 = pairs
	L9_277 = L7_275
	L8_276, L9_277, L10_278 = L8_276(L9_277)
	for _FORV_8_, _FORV_9_ in L8_276, L9_277, L10_278 do
		if not L3_271[_FORV_9_] then
		end
		L3_271[_FORV_9_] = 0 + 1
	end
end
function L24_24.del_unit_forbidden_skills(A0_279, A1_280, A2_281)
	local L3_282, L7_286 = L3_282, A1_280.forbidden_skill_types
	L8_287 = A1_280.id
	L3_282 = L3_282(L7_286, L8_287)
	L7_286 = A2_281.forbid_list
	L8_287 = pairs
	L9_288 = L7_286
	L8_287, L9_288, _FOR_ = L8_287(L9_288)
	for _FORV_8_, _FORV_9_ in L8_287, L9_288, _FOR_ do
		if not L3_282[_FORV_9_] then
		end
		L3_282[_FORV_9_] = _ENV(0 - 1, 0)
	end
end
function L24_24.reset_unit_skill_cost_when_turn_round(A0_292, A1_293)
	L5_297(L6_298, A1_293)
	L5_297 = pairs
	L6_298 = A1_293.skill_cf_id_to_info
	L5_297, L6_298, _FOR_ = L5_297(L6_298)
	for _FORV_5_, _FORV_6_ in L5_297, L6_298, _FOR_ do
		_FORV_6_.round_count = 0
		if not _ENV[_FORV_6_.cf_info.prototype_id] then
			_FORV_6_.cd = L1_1(_FORV_6_.cd - 1, 0)
		end
	end
end
function L24_24.get_the_skill_prototype_use_count(A0_302, A1_303)
	local L2_304
	L2_304 = A0_302.record
	L2_304 = L2_304.skill_prototype_id_to_count
	L2_304 = L2_304[A1_303]
	if not L2_304 then
		L2_304 = 0
	end
	return L2_304
end
function L24_24.is_skill_banned(A0_305, A1_306)
	local L2_307, L3_308, L4_309
	L2_307 = A0_305.cf_battle
	L2_307 = L2_307.ban_skill_list
	if L2_307 then
		L3_308 = #L2_307
		if L3_308 ~= 0 then
			goto lbl_10
		end
	end
	L3_308 = false
	do return L3_308 end
	::lbl_10::
	L3_308 = _ENV
	L3_308 = L3_308[A1_306]
	L4_309 = L3_308.prototype_id
	L7_312 = ipairs
	L8_313 = L2_307
	L7_312, L8_313, L9_314 = L7_312(L8_313)
	for L10_315, _FORV_9_ in L7_312, L8_313, L9_314 do
		if L4_309 == _FORV_9_ then
			return true
		end
		if _FORV_9_ == A1_306 then
			return true
		end
	end
	L7_312 = false
	return L7_312
end
function L24_24.init_unit_used_skill_record(A0_316, A1_317)
	local L2_318, L4_320, L5_321, L8_324 = L2_318, A1_317, L5_321, L8_324
	L2_318(L4_320)
	L2_318 = A1_317.hidden_units
	if L2_318 then
		L2_318 = A1_317.is_commander
		if not L2_318 then
			return
		end
	end
	L2_318 = {}
	A1_317.cur_round_used_skill_ids = L2_318
	L4_320 = {}
	A1_317.last_round_used_skill_prototype_ids = L4_320
	L5_321 = A1_317.round_count
	L8_324 = A1_317.skill_cf_id_to_info
	L9_325 = pairs
	L10_326 = L8_324
	L9_325, L10_326, _FOR_ = L9_325(L10_326)
	for _FORV_9_, _FORV_10_ in L9_325, L10_326, _FOR_ do
		if _FORV_10_.all_count <= 0 then
		elseif 0 >= _FORV_10_.last_used_round then
		elseif _FORV_10_.round_count > 0 then
			_ENV(L2_318, _FORV_10_.cf_info.prototype_id)
		elseif L5_321 - _FORV_10_.last_used_round > 1 then
		else
			_ENV(L4_320, _FORV_10_.cf_info.prototype_id)
		end
	end
end
function L24_24.get_unit_last_used_skill_prototype_ids(A0_330, A1_331)
	return A1_331.last_round_used_skill_prototype_ids
end
function L24_24.get_skill_match_max(A0_332, A1_333)
	local L2_334, L3_335 = A0_332:is_dungeon_play(), L3_335
	if L2_334 then
		L2_334 = "pve_match_max"
		if L2_334 then
			goto lbl_9
		end
	end
	L2_334 = "match_max"
	::lbl_9::
	L3_335 = A1_333[L2_334]
	return L3_335
end
function L24_24.is_perform_ultimate_skill(A0_336, A1_337)
	if A0_336.is_reconnecting_from_replay then
		return
	end
	if A0_336.is_group_action then
		local L2_338, L3_339 = L2_338, L3_339
		local L2_338, L4_340 = L2_338(L3_339, A1_337), L4_340
		if not L2_338 then
			L2_338 = false
			return L2_338
		end
	end
	L2_338 = A1_337.type
	L2_338 = L2_338 == "role"
	return L2_338
end
function L24_24.is_unit_equip_skill_energy_enough(A0_341, A1_342)
	local L2_343, L3_344, L4_345, L5_346, L6_347, L7_348
	L2_343 = A1_342.source_to_skills
	if not L2_343 then
		L2_343 = false
		return L2_343
	end
	L2_343 = A1_342.source_to_skills
	L3_344 = _ENV
	L3_344 = L3_344.skill_source
	L3_344 = L3_344.equip
	L2_343 = L2_343[L3_344]
	if not L2_343 then
		L3_344 = false
		return L3_344
	end
	L3_344 = L2_343[1]
	if not L3_344 then
		L4_345 = false
		return L4_345
	end
	L4_345 = L11_11
	L5_346 = L3_344.cfg_id
	L4_345 = L4_345[L5_346]
	L5_346 = L4_345.cost
	if not L5_346 then
		L6_347 = false
		return L6_347
	end
	L6_347 = A1_342.attrs
	L6_347 = L6_347.energy
	if not L6_347 then
		L6_347 = 0
	end
	L7_348 = L5_346[1]
	if L7_348 == 2 then
		L7_348 = L5_346[2]
		if L6_347 >= L7_348 then
			L7_348 = true
			return L7_348
		end
	end
	L7_348 = false
	return L7_348
end
