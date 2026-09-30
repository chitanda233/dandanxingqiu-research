local L0_0, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L34_34, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43, L44_44, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60 = L0_0, "game.utils.events", L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L34_34, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43, L44_44, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60
L0_0 = L0_0(L2_2)
L2_2 = math
L3_3 = L2_2.exp
L4_4 = L2_2.abs
L5_5 = L2_2.cos
L6_6 = L2_2.rad
L7_7 = L2_2.sin
L8_8 = L2_2.floor
L9_9 = L2_2.max
L10_10 = L2_2.min
L11_11 = L2_2.pow
L12_12 = table
L12_12 = L12_12.sort
L16_16 = table
L16_16 = L16_16.insert
L17_17 = assert
L18_18 = DataConfigs
L18_18 = L18_18.fight_misc
L17_17 = L17_17(L18_18)
L18_18 = assert
L19_19 = DataConfigs
L19_19 = L19_19.boom
L18_18 = L18_18(L19_19)
L19_19 = L17_17.bullet_r
L19_19 = L19_19.value
L20_20 = L17_17.bullet_w
L20_20 = L20_20.value
L21_21 = L17_17.bullet_g
L21_21 = L21_21.value
L22_22 = Game
L22_22 = L22_22.module
L22_22 = L22_22.fight
L23_23 = L22_22.ways
L23_23 = L23_23.base
L24_24 = L22_22.skill_effect_id
L25_25 = L22_22.role_directions
L26_26 = L22_22.command
L27_27 = L22_22.role_directions
L27_27 = L27_27.left
function L28_28(A0_61, A1_62)
	local L2_63, L3_64, L4_65, L5_66
	if A1_62 then
		L2_63 = A1_62.fire_lock_targets
		if L2_63 then
			goto lbl_7
		end
	end
	do return end
	::lbl_7::
	L2_63 = nil
	L3_64 = A1_62.fire_lock_targets
	L3_64 = #L3_64
	L4_65 = 1
	L5_66 = -1
	for _FORV_6_ = L3_64, L4_65, L5_66 do
		L2_63 = A0_61.id_to_unit[A1_62.fire_lock_targets[_FORV_6_]]
		if L2_63 then
			local L8_68 = L8_68
			local L8_68, L9_69 = L8_68(A0_61, L2_63), L9_69
			if L8_68 then
				return L2_63
			end
		end
	end
end
L23_23.get_unit_fire_lock_target = L28_28
L28_28 = {}
function L29_29(A0_70, A1_71, A2_72)
	table.clear(_ENV)
	local L3_73, L4_74 = L3_73, L4_74
	local L3_73, L5_75 = L3_73(L4_74, A1_71), L5_75
	if L3_73 then
		L4_74 = _ENV
		L5_75 = L3_73.id
		L4_74[L5_75] = L3_73
		L4_74 = _ENV
		L5_75 = true
		return L4_74, L5_75
	end
	if A2_72 then
		L4_74 = _ENV
		L5_75 = A2_72.id
		L4_74[L5_75] = A2_72
		L4_74 = _ENV
		L5_75 = false
		return L4_74, L5_75
	end
	L4_74 = A0_70.id_to_unit
	L5_75 = false
	return L4_74, L5_75
end
L23_23.get_target_unit_dic = L29_29
function L29_29(A0_76)
	return true
end
L23_23.is_open_recommand_forces = L29_29
function L29_29(A0_77, A1_78)
	if not A0_77:is_open_recommand_forces() then
		return
	end
	if not A0_77.ctrl_unit_id then
		return
	end
	local L2_79 = L2_79
	local L4_80 = L4_80
	local L2_79, L5_81 = L2_79(L4_80, A0_77.ctrl_unit_id, true), L5_81
	if not L2_79 then
		return
	end
	L4_80 = L2_79.is_cur_round_attacker
	if L4_80 then
		L4_80 = L2_79.round_status
		L5_81 = _ENV
		L5_81 = L5_81.unit_round_status
		L5_81 = L5_81.action
	end
	if L4_80 ~= L5_81 and not A1_78 then
		return
	end
	A0_77.wait_update_recommand_forces = true
end
L23_23.req_update_recommand_forces = L29_29
function L29_29(A0_82)
	if not A0_82.wait_update_recommand_forces then
		return
	end
	A0_82:try_to_calculate_need_show_recommand_force_units()
	local L2_83 = L2_83
end
L23_23.update_recommand_forces = L29_29
function L29_29(A0_84)
	if A0_84.round.round_count <= 0 then
		return
	end
	local L1_85, L2_86 = A0_84:get_ctrl_unit(), L2_86
	if L1_85 then
		L2_86 = L1_85.is_dead
		if not L2_86 then
			goto lbl_14
		end
	end
	do return end
	::lbl_14::
	L2_86 = L1_85.is_commander
	if L2_86 then
		return
	end
	A0_84.wait_update_recommand_forces = false
	L2_86 = {}
	if L1_85.is_cur_round_attacker and not L1_85.no_recommand_force then
		A0_84:calculate_need_show_recommand_forces_units(L2_86, L1_85.power_far_dest_unit)
		A0_84:calculate_command_recommand_forces()
	end
	A0_84.recommand_forces = L2_86
	_ENV.brocast("fight_update_recommend_power", L2_86)
	A0_84:try_to_hide_parabola()
	local L3_87 = L3_87
	local L3_87, L4_88 = L3_87(L2_86)
	local L5_89, L6_90 = L5_89, L6_90
	L5_89(L6_90, L3_87)
	local L7_91 = L7_91
end
L23_23.try_to_calculate_need_show_recommand_force_units = L29_29
function L29_29(A0_92, A1_93)
	local L5_97 = L5_97
	if not A0_92.recommand_forces then
		L5_97 = false
		return L5_97
	end
	L5_97 = A0_92.recommand_forces
	L5_97 = L5_97[A1_93]
	if not L5_97 then
		L5_97 = false
		return L5_97
	end
	L5_97 = A0_92.get_rec_power_style
	local L3_95 = L3_95
	local L5_97, L3_95, L4_96 = L5_97(L3_95, A1_93)
	if L5_97 then
		L4_96 = true
		return L4_96, L3_95
	end
	L4_96 = false
	return L4_96
end
L23_23.is_unit_fire_target = L29_29
function L29_29(A0_98, A1_99)
	local L2_100
	L2_100 = A0_98.recommand_forces
	if not L2_100 then
		L2_100 = nil
		return L2_100
	end
	L2_100 = A0_98.cf_battle
	L2_100 = L2_100.fix_power
	if not L2_100 or L2_100 <= 0 then
		L5_103 = nil
		return L5_103
	end
	L5_103 = pairs
	L6_104 = A0_98.recommand_forces
	L5_103, L6_104, L7_105 = L5_103(L6_104)
	for _FORV_6_, _FORV_7_ in L5_103, L6_104, L7_105 do
		if not _FORV_6_.recommend_force then
		elseif L2_100 >= _ENV(_FORV_6_.recommend_force - A1_99) then
			return _FORV_6_.recommend_force
		end
	end
	L5_103 = nil
	return L5_103
end
L23_23.try_get_nearest_recommend_force = L29_29
function L29_29(A0_108, A1_109)
	local L2_110, L3_111
	L2_110 = A0_108.cf_battle
	L2_110 = L2_110.mon_lead
	if not L2_110 then
		return
	end
	L3_111 = nil
	L6_114 = A1_109.monster
	if L6_114 then
		L6_114 = A1_109.monster
		L3_111 = L6_114.ext_id
	else
		L6_114 = A1_109.placement
		if L6_114 then
			L6_114 = A1_109.placement
			L3_111 = L6_114.ext_id
		end
	end
	if not L3_111 then
		return
	end
	L6_114 = ipairs
	L7_115 = L2_110
	L6_114, L7_115, L8_116 = L6_114(L7_115)
	for L11_119, _FORV_8_ in L6_114, L7_115, L8_116 do
		_FOR_, _FOR_, _FOR_ = ipairs(_FORV_8_)
		for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_13_ == L3_111 then
				return L11_119
			end
		end
	end
end
L23_23.get_recommend_power_pri = L29_29
function L29_29(A0_120, A1_121, A2_122)
	local L3_123 = A0_120:get_ctrl_unit()
	if not L3_123 then
		return
	end
	local L4_124, L5_125 = A0_120:get_nearest_or_farest_need()
	local L10_130 = L10_130
	local L11_131 = L11_131
	L10_130(L11_131, A1_121, L3_123, L4_124, L5_125, A2_122)
	local L12_132 = L12_132
	L11_131 = A0_120
	L10_130 = A0_120.append_other_show_forces_units
	L12_132 = A1_121
	L10_130(L11_131, L12_132, L3_123)
	L11_131 = A0_120
	L10_130 = A0_120.calculate_units_intelligent_force
	L12_132 = A1_121
	L10_130(L11_131, L12_132)
end
L23_23.calculate_need_show_recommand_forces_units = L29_29
function L29_29(A0_133, A1_134)
	local L2_135, L3_136
	L2_135 = A0_133.recommend_dis
	L3_136 = A1_134.recommend_dis
	if L2_135 ~= L3_136 then
		L2_135 = A0_133.recommend_dis
		L3_136 = A1_134.recommend_dis
		L2_135 = L2_135 < L3_136
		return L2_135
	end
	L2_135 = A0_133.id
	L3_136 = A1_134.id
	L2_135 = L2_135 < L3_136
	return L2_135
end
function L30_30(A0_137, A1_138, A2_139, A3_140, A4_141, A5_142)
	local L6_143, L7_144, L8_145, L9_146, L10_147, L11_148, L12_149, L13_150
	repeat
		L6_143 = {}
		L7_144 = nil
		L8_145 = nil
		L9_146 = nil
		L10_147 = nil
		L11_148 = A2_139.fire_pos
		L11_148 = L11_148.x
		L12_149 = A2_139.direction
		L13_150 = {}
		local L14_151, L15_152 = L14_151, L15_152
		L14_151, L15_152 = L14_151(L15_152, A2_139, A5_142)
		_FOR_, _FOR_, _FOR_ = pairs(A0_137.id_to_unit)
		for _FORV_19_, _FORV_20_ in _FOR_, _FOR_, _FOR_ do
			_FORV_20_.recommend_force = nil
			_FORV_20_.recommend_dis = nil
		end
		_FOR_, _FOR_, _FOR_ = pairs(L14_151)
		for _FORV_19_, _FORV_20_ in _FOR_, _FOR_, _FOR_ do
			if not L15_152 and not A0_137:is_unit_recommend_force_able(_FORV_20_) then
			else
				L9_146 = _FORV_20_.pos.x - L11_148
				L9_146 = _ENV.abs(L9_146)
				if _FORV_20_ == A5_142 then
					L7_144 = 1
				else
					L7_144 = A0_137:get_recommend_power_pri(_FORV_20_)
					if not A0_137:is_enemy(_FORV_20_) and not L7_144 then
				end
				else
					_FORV_20_.recommend_force = A0_137:get_one_recommand_forces(A2_139, _FORV_20_)
					if not _FORV_20_.recommend_force then
					else
						if not L7_144 and L15_152 then
							L7_144 = 1
						end
						if L7_144 then
							L6_143[_FORV_20_] = L7_144
							if not L8_145 or L8_145 > L7_144 then
								L8_145 = L7_144
							end
						else
							L6_143[_FORV_20_] = 1
						end
						_FORV_20_.recommend_dis = _ENV.abs(L9_146)
						table.insert(L13_150, _FORV_20_)
					end
				end
			end
		end
		if L8_145 then
			L24_161 = pairs
			L21_158 = L6_143
			L24_161, L21_158, L22_159 = L24_161(L21_158)
			for L23_160, _FORV_20_ in L24_161, L21_158, L22_159 do
				if _FORV_20_ > L8_145 then
					A1_138[L23_160] = nil
				end
			end
		end
		if L15_152 then
			L24_161 = pairs
			L21_158 = L6_143
			L24_161, L21_158, L22_159 = L24_161(L21_158)
			for L23_160, _FORV_20_ in L24_161, L21_158, L22_159 do
				A1_138[L23_160] = _FORV_20_
			end
			break -- pseudo-goto
		end
		L24_161 = #L13_150
		L21_158 = table
		L21_158 = L21_158.sort
		L22_159 = L13_150
		L23_160 = L29_29
		L21_158(L22_159, L23_160)
		L21_158 = nil
		if A5_142 then
			L22_159 = A5_142.recommend_force
			if L22_159 then
				A1_138[A5_142] = 1
			end
		else
			if A3_140 then
				L21_158 = L13_150[1]
				if L21_158 then
					A1_138[L21_158] = 1
				end
			end
			if A4_141 then
				L21_158 = L13_150[L24_161]
				if L21_158 then
					A1_138[L21_158] = 1
				end
			end
		end
	until true
end
L23_23.calculate_base_recommend_forces = L30_30
function L30_30(A0_162, A1_163, A2_164, A3_165, A4_166)
	local L10_172, L11_173, L14_176, L15_177, L16_178 = L10_172, L11_173, L14_176, L15_177, L16_178
	if not A2_164 then
		return
	end
	L11_173 = A0_162
	L10_172 = A0_162.get_unit_fire_lock_target
	L14_176 = A2_164
	L10_172 = L10_172(L11_173, L14_176)
	if L10_172 then
		L14_176 = A0_162
		L11_173 = A0_162.get_one_recommand_forces
		L15_177 = A2_164
		L16_178 = L10_172
		L11_173 = L11_173(L14_176, L15_177, L16_178)
		L10_172.recommend_force = L11_173
		L11_173 = L10_172.recommend_force
		if L11_173 then
			A1_163[L10_172] = 1
		end
		return
	end
	if not A3_165 and not A4_166 then
		return
	end
	L11_173 = nil
	L14_176 = nil
	L15_177 = nil
	L16_178 = nil
	local L12_174 = L12_174
	local _FOR_, _FOR_, _FOR_, L13_175 = pairs(A0_162.id_to_unit)
	for _FORV_15_, _FORV_16_ in _FOR_, _FOR_, _FOR_ do
		_FORV_16_.recommend_force = nil
		if not A0_162:is_unit_recommend_force_able(_FORV_16_) then
		elseif not A0_162:is_enemy(_FORV_16_) then
		else
			_FORV_16_.recommend_force = A0_162:get_one_recommand_forces(A2_164, _FORV_16_)
			if not _FORV_16_.recommend_force then
			else
				L11_173 = _ENV(_FORV_16_.pos.x - L13_175.x, 2) + _ENV(_FORV_16_.pos.y - L13_175.y, 2)
				if A3_165 and (not L15_177 or L15_177 > L11_173) then
					L14_176 = _FORV_16_
					L15_177 = L11_173
				end
				if A4_166 and (not L12_174 or L12_174 < L11_173) then
					L16_178 = _FORV_16_
					L12_174 = L11_173
				end
			end
		end
	end
	if A3_165 and L14_176 then
		L17_179 = L14_176.recommend_force
		if L17_179 then
			A1_163[L14_176] = 1
		end
	end
	if A4_166 and L16_178 then
		L17_179 = L16_178.recommend_force
		if L17_179 then
			A1_163[L16_178] = 1
		end
	end
end
L23_23.calculate_need_show_recommand_forces_units_by_dis = L30_30
function L30_30(A0_183, A1_184, A2_185)
	local L3_186
	L3_186 = A0_183.show_force_by_id
	if not L3_186 then
		return
	end
	L3_186 = nil
	L6_189 = pairs
	L6_189, L5_188, _FOR_ = L6_189(A0_183.show_force_by_id)
	for _FORV_7_, _FORV_8_ in L6_189, L5_188, _FOR_ do
		L3_186 = A0_183.id_to_unit[_FORV_7_]
		if not L3_186 then
		elseif not A0_183:is_unit_recommend_force_able(L3_186) then
		else
			if not L3_186.recommand_force then
				local L12_193 = A0_183:get_one_recommand_forces(A2_185, L3_186)
				L3_186.recommend_force = L12_193
			end
			L12_193 = A1_184[L3_186]
			if not L12_193 then
				L12_193 = 0
			end
			L12_193 = L12_193 + 10
			A1_184[L3_186] = L12_193
		end
	end
end
L23_23.append_other_show_forces_units = L30_30
function L30_30(A0_194)
	local L1_195, L2_196
	L1_195 = A0_194.cf_battle
	L1_195 = L1_195.near_lead
	L1_195 = L1_195 == 1
	L2_196 = A0_194.cf_battle
	L2_196 = L2_196.far_lead
	L2_196 = L2_196 == 1
	return L1_195, L2_196
end
L23_23.get_nearest_or_farest_need = L30_30
function L30_30(A0_197, A1_198, A2_199)
	if not A1_198 then
		return false
	end
	if A1_198.is_dead then
		return false
	end
	if A1_198.hidden_units then
		return false
	end
	if A1_198.pet then
		return false
	end
	if not A2_199 then
		local L3_200, L4_201 = L3_200, L4_201
		local L3_200, L5_202 = L3_200(L4_201, A1_198), L5_202
		if not L3_200 then
			L3_200 = false
			return L3_200
		end
	end
	L3_200 = A1_198.monster
	if not L3_200 then
		L3_200 = A1_198.placement
		if not L3_200 then
			goto lbl_44
		end
	end
	L3_200 = A1_198.cf_info
	if L3_200 then
		L3_200 = A1_198.cf_info
		L3_200 = L3_200.no_aimed
		if L3_200 == 1 then
			L3_200 = false
			return L3_200
		end
	end
	::lbl_44::
	L3_200 = true
	return L3_200
end
L23_23.is_unit_recommend_force_able = L30_30
function L30_30(A0_203, A1_204)
	local L5_208 = A0_203.cf_play_info.intelligent_force
	if L5_208 ~= 1 then
		return
	end
	L6_209 = A0_203
	L5_208 = A0_203.get_ctrl_unit
	L5_208 = L5_208(L6_209)
	if not L5_208 then
		return
	end
	L6_209 = L5_208.intelligent_force
	if not L6_209 then
		return
	end
	L6_209 = pairs
	L7_210 = A0_203.id_to_unit
	L6_209, L7_210, _FOR_ = L6_209(L7_210)
	for _FORV_6_, _FORV_7_ in L6_209, L7_210, _FOR_ do
		_FORV_7_.horizontal_recommend_force = nil
		if _FORV_7_.recommend_force == nil then
		else
			local L11_214 = L11_214
			local L11_214, L12_215 = L11_214(A0_203, L5_208, _FORV_7_, true), L12_215
			_FORV_7_.horizontal_recommend_force = L11_214
		end
	end
end
L23_23.calculate_units_intelligent_force = L30_30
function L30_30(A0_216)
	local L5_221, L6_222 = A0_216.cf_play_info.intelligent_force, L6_222
	if L5_221 ~= 1 then
		return
	end
	L6_222 = A0_216
	L5_221 = A0_216.get_ctrl_unit
	L5_221 = L5_221(L6_222)
	if not L5_221 then
		return
	end
	L6_222 = A0_216.command_by_id
	if not L6_222 then
		return
	end
	L6_222 = nil
	L7_223 = pairs
	L7_223, L4_220, _FOR_ = L7_223(A0_216.command_by_id)
	for _FORV_6_, _FORV_7_ in L7_223, L4_220, _FOR_ do
		if _FORV_7_.type ~= _ENV.visible and _FORV_7_.type ~= _ENV.position then
		elseif not A0_216:get_unit_by_id(_FORV_7_.owner_id, true) or not A0_216:is_partner((A0_216:get_unit_by_id(_FORV_7_.owner_id, true))) then
		elseif not L5_221.intelligent_force and not A0_216:get_unit_by_id(_FORV_7_.owner_id, true).intelligent_force then
			_FORV_7_.horizontal_recommend_force = nil
		else
			if not L6_222 then
				L6_222 = A0_216:get_unit_fire_angle(L5_221)
			end
			local L11_227 = L11_227
			local L12_228 = L12_228
			local L13_229 = L13_229
			local L14_230 = L14_230
			local L15_231 = L15_231
			local L12_228, L16_232 = L12_228(L13_229, L14_230, L15_231, L5_221.fire_pos.y, 0, L6_222, L5_221.attack_info.fire_bullet), L16_232
			_FORV_7_.horizontal_recommend_force = L12_228
		end
	end
end
L23_23.calculate_command_recommand_forces = L30_30
function L30_30(A0_233, A1_234)
	local L5_238 = L5_238
	if not A1_234.role then
		L5_238 = A0_233.cf_play_info
		L5_238 = L5_238.power_hit_extra
		if L5_238 == 1 then
			L5_238 = A0_233.try_get_extra_hit_area_center_pos
			local L3_236 = L3_236
			local L5_238, L3_236, L4_237 = L5_238(L3_236, A1_234)
			if L5_238 then
				L4_237 = L5_238
				return L4_237, L3_236
			end
		end
	end
	L5_238 = A1_234.center_pos
	L3_236 = L5_238.x
	L4_237 = L5_238.y
	return L3_236, L4_237
end
L23_23.get_target_unit_center_pos = L30_30
function L30_30(A0_239, A1_240, A2_241, A3_242, A4_243, A5_244)
	if A1_240.id == A2_241.id then
		return
	end
	if A2_241.is_dead then
		return
	end
	if not A0_239:is_unit_recommend_force_able(A2_241) then
		return
	end
	local L6_245, L7_246 = L6_245, L7_246
	local L6_245, L7_246, L8_247 = L6_245(L7_246, A2_241)
	L8_247 = nil
	if not A5_244 then
		local L9_248, L10_249 = L9_248, L10_249
		local L9_248, L11_250 = L9_248(L10_249, A1_240), L11_250
		A5_244 = L9_248
	end
	L9_248 = A1_240.attack_info
	L9_248 = L9_248.fire_bullet
	L10_249 = nil
	L11_250 = nil
	if A3_242 then
		L10_249 = A1_240.fire_pos.y
		L11_250 = 0
	else
		L11_250 = A0_239.round.wind_factor or L11_250
		if not A4_243 or not A0_239.round.wind_factor then
			L11_250 = A0_239:get_unit_recommend_force_wind(A1_240, A2_241)
		end
		L10_249 = L7_246
	end
	local L12_251, L13_252 = L12_251, L13_252
	local L14_253 = L14_253
	local L15_254 = L15_254
	local L16_255 = L16_255
	local L17_256 = L17_256
	local L18_257 = L18_257
	local L12_251, L19_258 = L12_251(L13_252, L14_253, L15_254, L16_255, L17_256, L18_257, L9_248), L19_258
	L8_247 = L12_251
	if L8_247 then
		return L8_247
	end
	L12_251 = nil
	return L12_251
end
L23_23.get_one_recommand_forces = L30_30
function L30_30(A0_259, A1_260, A2_261)
	local L6_265 = A0_259:is_unit_has_buff_state(A1_260, _ENV.buff_states.recommend_force_no_wind)
	if L6_265 then
		L6_265 = 0
		return L6_265
	end
	L6_265 = A0_259.get_rec_power_style
	local L4_263 = L4_263
	local L6_265, L4_263, L5_264 = L6_265(L4_263, A2_261)
	if L6_265 and L4_263 then
		L5_264 = A0_259.round
		L5_264 = L5_264.wind_factor
		return L5_264
	end
	L5_264 = 0
	return L5_264
end
L23_23.get_unit_recommend_force_wind = L30_30
L30_30 = {}
L30_30.angle_start = 90
L30_30.angle_end = 70
L34_34 = {}
L34_34.angle_start = 70
L34_34.angle_end = 0
L38_38 = {}
L38_38.angle_start = 65
L38_38.angle_end = 90
L39_39 = {}
L39_39.angle_start = 65
L39_39.angle_end = 0
L40_40 = {}
L41_41 = L30_30
L42_42 = {}
L42_42.angle_start = 90
L42_42.angle_end = 110
L42_42.revert_dir = true
L43_43 = L34_34
L40_40[1] = L41_41
L40_40[2] = L42_42
L40_40[3] = L43_43
function L41_41(A0_266, A1_267, A2_268)
	if not A2_268 then
		A2_268 = A1_267.direction
	end
	if A2_268 == _ENV.role_directions.left then
		if not A0_266:is_unit_fire_skill_has_effect(A1_267, L24_24.tempest) then
			local L3_269, L4_270 = L3_269, L4_270
			local L5_271 = L5_271
			local L3_269, L6_272 = L3_269(L4_270, L5_271, L24_24.copy), L6_272
		end
		if L3_269 then
			L4_270 = L40_40
			L5_271 = L32_32
			L4_270[1] = L5_271
			L4_270 = L40_40
			L5_271 = L33_33
			L4_270[3] = L5_271
			L4_270 = L40_40
			return L4_270
		end
	end
	L3_269 = L40_40
	L4_270 = L30_30
	L3_269[1] = L4_270
	L3_269 = L40_40
	L4_270 = L31_31
	L3_269[3] = L4_270
	L3_269 = L40_40
	return L3_269
end
L23_23.get_auto_angle_ranges = L41_41
L41_41 = nil
L42_42 = nil
function L43_43(A0_273, A1_274)
	local L2_275 = L2_275
	L2_275 = L2_275(A0_273.pos.x - L41_41.pos.x)
	local L3_276 = L3_276
	local L5_278 = A1_274.pos.x - L41_41.pos.x
	L3_276 = L3_276(L5_278)
	if L2_275 ~= L3_276 then
		L5_278 = L42_42
		if L5_278 then
			L5_278 = L2_275 > L3_276
			return L5_278
		else
			L5_278 = L2_275 < L3_276
			return L5_278
		end
	end
	L5_278 = A0_273.id
	L5_278 = L5_278 < A1_274.id
	return L5_278
end
function L44_44(A0_279, A1_280, A2_281, A3_282, A4_283)
	local L5_284
	L5_284 = {}
	local L8_287, L9_288, L10_289, L15_294, L16_295 = {}, L9_288, L10_289, L15_294, L16_295
	L9_288 = {}
	L5_284[1] = L8_287
	L5_284[2] = L9_288
	L8_287 = A1_280.pos
	L8_287 = L8_287.x
	L9_288 = A2_281 or L9_288
	if not A2_281 then
		L9_288 = A1_280.direction
	end
	L10_289 = nil
	L15_294 = nil
	L16_295 = nil
	_FOR_, _FOR_, _FOR_ = pairs(A0_279.id_to_unit)
	for _FORV_15_, _FORV_16_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_16_.is_dead then
		elseif _FORV_16_.hidden_units then
		elseif _FORV_16_.pet then
		elseif not A0_279:is_enemy(_FORV_16_) then
		else
			if _FORV_16_.owner_id and _FORV_16_.owner_id > 0 then
				L16_295 = A0_279.id_to_unit[_FORV_16_.owner_id]
				if L16_295 ~= nil and L16_295.role then
			end
			elseif not A0_279:is_unit_recommend_force_able(_FORV_16_) then
			else
				L10_289 = _FORV_16_.pos.x - L8_287
				L15_294 = L9_288 or L15_294
				L15_294 = _ENV.role_directions.right or L15_294
				if (L10_289 ~= 0 or not L9_288) and (not (0 < L10_289) or not _ENV.role_directions.right) then
					L15_294 = _ENV.role_directions.left
				end
				if A4_283 then
					table.insert(L5_284[1], _FORV_16_)
					table.insert(L5_284[2], _FORV_16_)
				elseif A0_279:get_unit_transfer_direction(A1_280) and A0_279:get_unit_transfer_direction(A1_280) == L9_288 then
					table.insert(L5_284[1], _FORV_16_)
					if L15_294 ~= L9_288 then
						table.insert(L5_284[2], _FORV_16_)
					end
				elseif L9_288 == L15_294 then
					table.insert(L5_284[1], _FORV_16_)
				else
					table.insert(L5_284[2], _FORV_16_)
				end
			end
		end
	end
	L41_41 = A1_280
	L42_42 = true
	if not A3_282 and A0_279:get_nearest_or_farest_need() and not A0_279:get_nearest_or_farest_need() then
		L42_42 = false
	end
	local _FOR_, _FOR_, _FOR_, L13_292 = pairs(L5_284)
	for _FORV_15_, _FORV_16_ in _FOR_, _FOR_, _FOR_ do
		table.sort(_FORV_16_, L43_43)
	end
	L17_296 = nil
	L41_41 = L17_296
	L17_296 = true
	L42_42 = L17_296
	return L5_284
end
L23_23.get_auto_angle_enemies = L44_44
function L44_44(A0_299, A1_300)
	if not A0_299:is_unit_fire_skill_has_effect(A1_300, _ENV.laser) then
		local L2_301 = L2_301
		local L4_302 = L4_302
		local L2_301, L5_303 = L2_301(L4_302, A1_300, _ENV.thunder), L5_303
	end
	return L2_301
end
L23_23.is_unit_fire_line = L44_44
function L44_44(A0_304, A1_305, A2_306)
	local L3_307, L4_308, L13_317, L14_318, L15_319, L16_320, L17_321, L18_322, L19_323, L22_326, L23_327, L24_328 = L3_307, L4_308, A1_305, L14_318, L15_319, L16_320, L17_321, L18_322, L19_323, L22_326, L23_327, L24_328
	L3_307 = L3_307(L4_308, L13_317)
	L4_308 = not L3_307
	L13_317 = nil
	L15_319 = A0_304
	L14_318 = A0_304.is_unit_fire_line
	L16_320 = A1_305
	L14_318 = L14_318(L15_319, L16_320)
	if L3_307 then
		L15_319 = {}
		L16_320 = {}
		L17_321 = L3_307
		L16_320[1] = L17_321
		L17_321 = {}
		L18_322 = L3_307
		L17_321[1] = L18_322
		L15_319[1] = L16_320
		L15_319[2] = L17_321
		L13_317 = L15_319
	else
		L16_320 = A0_304
		L15_319 = A0_304.auto_angle_can_change_far
		L15_319 = L15_319(L16_320)
		L4_308 = L15_319
		L16_320 = A0_304
		L15_319 = A0_304.get_auto_angle_enemies
		L17_321 = A1_305
		L18_322 = A2_306
		L19_323 = L4_308
		L22_326 = L14_318
		L15_319 = L15_319(L16_320, L17_321, L18_322, L19_323, L22_326)
		L13_317 = L15_319
		L15_319 = L13_317[1]
		L15_319 = L15_319[1]
		if not L15_319 then
			L15_319 = L13_317[2]
			if L15_319 then
				L15_319 = L13_317[2]
				L15_319 = L15_319[1]
				if not L15_319 then
					return
				end
			end
		end
	end
	if L14_318 then
		L15_319 = A0_304.get_auto_recommand_angle_line
		if L15_319 then
			goto lbl_49
		end
	end
	L15_319 = A0_304.calculate_auto_angle_by_ranges
	::lbl_49::
	if L4_308 then
		L16_320 = A1_305.power_far_index
		if L16_320 then
			goto lbl_55
		end
	end
	L16_320 = 1
	::lbl_55::
	L17_321 = nil
	L18_322 = nil
	L19_323 = nil
	L22_326 = nil
	L23_327 = nil
	L24_328 = nil
	_FOR_, _FOR_, _FOR_ = ipairs(L13_317)
	for _FORV_23_, _FORV_24_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_23_ == 1 then
			L18_322 = A2_306
		else
			L18_322 = _ENV.right or L18_322
			if A2_306 ~= _ENV.left or not _ENV.right then
				L18_322 = _ENV.left
			end
			L16_320 = L16_320 - #L13_317[1]
		end
		if not L14_318 then
			local L25_329, L26_330 = L25_329, L26_330
			local L27_331 = L27_331
			local L28_332 = L28_332
			repeat
				L25_329 = A0_304:get_auto_angle_ranges(A1_305, L18_322)
				do break end -- pseudo-goto
				L25_329 = nil
			until true
		end
		L17_321 = #_FORV_24_
		_FOR_ = 1
		for _FORV_28_ = _FOR_, _FOR_, _FOR_ do
			L19_323 = (L16_320 + _FORV_28_ - 1) % L17_321 + 1
			L22_326 = _FORV_24_[L19_323]
			local L29_333 = L29_333
			L23_327, L24_328, L26_330, L27_331, L28_332 = L15_319(A0_304, A1_305, L18_322, L22_326, L25_329)
			if L23_327 then
				if L27_331 == A1_305.direction then
					L27_331 = nil
				end
				L29_333 = _FORV_23_ ~= 1 and L29_333
				L22_326.recommend_force = L24_328
				return L23_327, L24_328, L22_326, L27_331, L29_333, L19_323
			end
		end
	end
end
L23_23.get_auto_recommand_fire_angle = L44_44
function L44_44(A0_339)
	local L1_340
	if A0_339 < 0 then
		L1_340 = A0_339 + 360
		return L1_340
	elseif 360 <= A0_339 then
		L1_340 = A0_339 - 360
		return L1_340
	else
		return A0_339
	end
end
function L45_45(A0_341, A1_342, A2_343, A3_344)
	local L4_345, L5_346
	L4_345 = A3_344.pos
	local L4_345, L17_358 = L4_345.x, L17_358
	L5_346 = A1_342.pos
	L5_346 = L5_346.x
	L4_345 = L4_345 - L5_346
	L5_346 = A3_344.pos
	L5_346 = L5_346.y
	L17_358 = A1_342.pos
	L17_358 = L17_358.y
	L5_346 = L5_346 - L17_358
	L17_358 = _ENV
	L17_358 = L17_358.atan2
	local L7_348 = L7_348
	L17_358 = L17_358(L7_348, L4_345)
	L7_348 = _ENV
	L7_348 = L7_348.round
	L7_348 = L7_348(_ENV.deg(L17_358))
	local L8_349, L9_350 = L8_349, L9_350
	L8_349, L9_350 = L8_349(L9_350, A1_342)
	local L10_351 = L10_351
	L10_351 = L10_351(A0_341.land_data, A1_342.pos.x, A1_342.pos.y, A2_343)
	local L11_352 = L11_352
	L11_352 = L11_352(A0_341, A2_343, L10_351, L8_349)
	local L12_353, L13_354 = L12_353, L13_354
	local L14_355 = L14_355
	L12_353 = L12_353(L13_354, L14_355, L10_351, L9_350)
	L13_354 = L7_348
	L14_355 = L25_25
	L14_355 = L14_355.left
	if A2_343 == L14_355 then
		L14_355 = L11_352
		L11_352 = L44_44(L12_353)
		L12_353 = L44_44(L14_355)
		local L15_356 = L15_356
		local L15_356, L16_357 = L15_356(L7_348), L16_357
		L13_354 = L15_356
	end
	if L11_352 <= L13_354 and L12_353 >= L13_354 then
		L14_355 = L7_348
		L15_356 = 10
		L16_357 = A3_344
		return L14_355, L15_356, L16_357, A2_343
	end
end
L23_23.get_auto_recommand_angle_line = L45_45
function L45_45(A0_359, A1_360, A2_361, A3_362, A4_363)
	local L5_364, L6_365, L7_366
	local L8_367, L9_368, L11_370, L12_371, L13_372, L14_373, L15_374, L16_375, L17_376, L18_377, L19_378, L20_379, L21_380, L24_383 = L8_367, L9_368, A1_360, L12_371, L13_372, L14_373, L15_374, L16_375, L17_376, L18_377, L19_378, L20_379, L21_380, L24_383
	L8_367, L9_368 = L8_367(L9_368, L11_370)
	L11_370 = nil
	L12_371 = nil
	L13_372 = nil
	L14_373 = nil
	L15_374 = nil
	L16_375 = nil
	L17_376 = nil
	L18_377 = nil
	L19_378 = nil
	L20_379 = nil
	L21_380 = nil
	L24_383 = nil
	L25_384 = pairs
	L26_385 = A4_363
	L25_384, L26_385, _FOR_ = L25_384(L26_385)
	for _FORV_25_, _FORV_26_ in L25_384, L26_385, _FOR_ do
		L21_380 = A2_361
		L21_380 = _ENV.right or L21_380
		if _FORV_26_.revert_dir and (L21_380 ~= _ENV.left or not _ENV.right) then
			L21_380 = _ENV.left
		end
		L24_383 = A0_359.land_data:get_land_angle(A1_360.pos.x, A1_360.pos.y, L21_380)
		L11_370 = A0_359:convert_weapon_angle_to_fire_angle(L21_380, L24_383, L8_367)
		L12_371 = A0_359:convert_weapon_angle_to_fire_angle(L21_380, L24_383, L9_368)
		L13_372 = A0_359:fire_angle_to_show_angle(L11_370, L21_380)
		L14_373 = A0_359:fire_angle_to_show_angle(L12_371, L21_380)
		if L13_372 > L1_1.max(_FORV_26_.angle_start, _FORV_26_.angle_end) or L14_373 < L1_1.min(_FORV_26_.angle_start, _FORV_26_.angle_end) then
		else
			L6_365 = L1_1.max(L13_372, L1_1.min(_FORV_26_.angle_start, L14_373))
			L7_366 = L1_1.min(L14_373, L1_1.max(_FORV_26_.angle_end, L13_372))
			L5_364 = A0_359:show_angle_to_fire_angle(L6_365, L21_380) <= A0_359:show_angle_to_fire_angle(L7_366, L21_380)
			local L30_389 = L30_389
			local L31_390 = L31_390
			if A0_359:calculate_auto_angle_by_angle_limit_high(A1_360, L21_380, L24_383, A3_362, L30_389, L31_390, L5_364) then
				local L32_391, L33_392 = L32_391, L33_392
				local L34_393 = L34_393
				local L35_394 = L35_394
				local L36_395 = L36_395
				local L35_394, L37_396 = L35_394(L36_395, A1_360, L14_14.fire_will_hit_land_range.value, L21_380, L32_391), L37_396
				if not L35_394 then
					L35_394 = L32_391
					L36_395 = L33_392
					L37_396 = A4_363
					return L35_394, L36_395, L37_396, L21_380, _FORV_26_.revert_dir
				elseif not L15_374 then
					L15_374 = L32_391
					L16_375 = L33_392
					L17_376 = A3_362
					L18_377 = A4_363
					L19_378 = L21_380
					L20_379 = _FORV_26_.revert_dir
				end
			end
		end
	end
	if L15_374 then
		L25_384 = L15_374
		L26_385 = L16_375
		L27_386 = L18_377
		L28_387 = L19_378
		L29_388 = L20_379
		return L25_384, L26_385, L27_386, L28_387, L29_388
	end
end
L23_23.calculate_auto_angle_by_ranges = L45_45
L45_45 = Vector2
L45_45 = L45_45.New
L46_46 = 0
L47_47 = 0
L45_45 = L45_45(L46_46, L47_47)
function L46_46(A0_397, A1_398, A2_399, A3_400, A4_401, A5_402, A6_403, A7_404)
	local L20_417 = L20_417
	if not A2_399 then
		A2_399 = A1_398.direction
	end
	if not A3_400 then
		A3_400 = A1_398.angle
	end
	L20_417 = A0_397.calculate_fire_pos
	local L9_406 = L9_406
	L20_417, L9_406 = L20_417(L9_406, A1_398, A2_399, A3_400)
	local L10_407, L11_408 = L10_407, L11_408
	local L12_409 = L12_409
	L10_407(L11_408, L12_409, L9_406)
	L10_407 = nil
	L11_408 = nil
	L12_409 = nil
	if A7_404 then
		L10_407 = L10_10(A5_402, A6_403)
		L11_408 = L9_9(A5_402, A6_403)
		L12_409 = 1
	else
		L10_407 = L9_9(A5_402, A6_403)
		local L13_410 = L13_410
		L13_410 = L13_410(A5_402, A6_403)
		L11_408 = L13_410
		L12_409 = -1
	end
	L13_410 = nil
	local L14_411, L15_412 = L14_411, L15_412
	L14_411, L15_412 = L14_411(L15_412, A4_401)
	local L16_413 = L16_413
	L16_413 = L16_413(L17_414, L18_415, A4_401)
	L17_414 = L10_407
	L18_415 = L11_408
	L19_416 = L12_409
	for _FORV_20_ = L17_414, L18_415, L19_416 do
		local L22_419 = L22_419
		local L23_420 = L23_420
		local L24_421 = L24_421
		local L25_422 = L25_422
		local L26_423 = L26_423
		local L27_424 = L27_424
		local L22_419, L28_425 = L22_419(L23_420, L24_421, L25_422, L26_423, L27_424, _FORV_20_, A1_398.attack_info.fire_bullet), L28_425
		L13_410 = L22_419
		if L13_410 then
			L22_419 = _FORV_20_
			L23_420 = L13_410
			L24_421 = A4_401
			return L22_419, L23_420, L24_421
		end
	end
end
L23_23.calculate_auto_angle_by_angle_limit_high = L46_46
L46_46 = nil
L47_47 = nil
L48_48 = nil
L49_49 = nil
L50_50 = nil
L51_51 = 0
L52_52 = 0
L53_53 = 0
L54_54 = 0
L55_55 = 0
L56_56 = 0
L57_57 = 0
L58_58 = 0
L59_59 = 0
L60_60 = 0
function L23_23.recommand_force(A0_426, A1_427, A2_428, A3_429, A4_430, A5_431, A6_432)
	local L7_433 = L7_433
	local L8_434 = L8_434
	L7_433 = L7_433(L8_434, A6_432)
	L8_434 = L7_433.mass
	local L9_435, L10_436 = L9_435, L10_436
	L9_435 = L9_435(L10_436, L7_433)
	L10_436 = A0_426.cf_battle
	L10_436 = L10_436.gravity
	L10_436 = L10_436 * L7_433.gravity_factor
	L10_436 = L10_436 * L8_434
	A5_431 = L6_6(A5_431)
	L58_58 = L5_5(A5_431)
	L59_59 = L7_7(A5_431)
	local L11_437 = L11_437
	L11_437 = L11_437(A0_426, A1_427.x, A1_427.y, A2_428, A3_429, A4_430, L10_436, L9_435, L8_434)
	if L11_437 then
		return L11_437
	end
	if A0_426.transfer_from_id and A0_426.transfer_to_id then
		local L12_438 = L12_438
		L12_438 = L12_438(A0_426, A0_426.transfer_from_id, true)
		local L13_439, L14_440 = L13_439, L14_440
		L13_439 = L13_439(L14_440, A0_426.transfer_to_id, true)
		if L12_438 and L13_439 then
			L14_440 = A1_427.x
			L14_440 = L14_440 - L12_438.pos.x
			L14_440 = L14_440 + L13_439.pos.x
			local L15_441, L16_442 = L15_441, L16_442
			local L17_443 = L17_443
			local L18_444 = L18_444
			local L19_445 = L19_445
			local L20_446 = L20_446
			local L21_447 = L21_447
			local L22_448 = L22_448
			local L23_449 = L23_449
			local L15_441, L24_450 = L15_441(L16_442, L17_443, L18_444, L19_445, L20_446, L21_447, L22_448, L23_449, L8_434), L24_450
			L11_437 = L15_441
			if L11_437 then
				return L11_437
			end
		end
	end
end
function L23_23.raw_recommand_force(A0_451, A1_452, A2_453, A3_454, A4_455, A5_456, A6_457, A7_458, A8_459)
	local L9_460, L10_461, L11_462
	L9_460 = 0
	L10_461 = 100
	L11_462 = A0_451.cur_fixed_deltatime
	_ENV = A1_452
	L47_47 = A2_453
	L48_48 = A3_454
	L49_49 = A4_455
	local L12_463 = L12_463
	local L13_464 = L13_464
	L12_463, L13_464 = L12_463(L13_464, A6_457, A5_456, A7_458, A8_459, L11_462)
	local L14_465 = L14_465
	local L15_466 = L15_466
	L14_465, L15_466 = L14_465(L15_466, A6_457, A5_456, A7_458, A8_459, L11_462)
	local L16_467 = L16_467
	local L17_468 = L17_468
	local L18_469 = L18_469
	local L19_470 = L19_470
	local L16_467, L17_468, L20_471 = L16_467(L17_468, L18_469, L19_470, L15_466)
	if not L16_467 then
		return
	end
	L18_469 = nil
	L19_470 = nil
	L20_471 = nil
	while L10_461 - L9_460 > 2 * _UPVALUE6_ do
		L20_471 = L9_460 + L8_8(L10_461 - L9_460) / 2 + _UPVALUE6_
		local L26_477 = L26_477
		local L26_477, L27_478 = L26_477(L20_471, A6_457, A5_456, A7_458, A8_459, L11_462)
		L19_470 = L27_478
		L18_469 = L26_477
		L26_477 = _UPVALUE5_
		L27_478 = L12_463
		local L23_474 = L23_474
		local L24_475 = L24_475
		local L26_477, L25_476 = L26_477(L27_478, L23_474, L24_475, L19_470), L25_476
		if L26_477 then
			L10_461 = L20_471
			L14_465 = L18_469
			L15_466 = L19_470
		else
			L9_460 = L20_471
			L12_463 = L18_469
			L13_464 = L19_470
		end
	end
	return L20_471
end
