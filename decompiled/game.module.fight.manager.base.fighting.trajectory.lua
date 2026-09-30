local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23
L0_0 = math
L0_0 = L0_0.abs
L1_1 = math
L1_1 = L1_1.floor
L2_2 = table
L2_2 = L2_2.insert
L3_3 = GameFunctions
L4_4 = math
L4_4 = L4_4.turn_to_three_decimal_places
L5_5 = Game
L6_6 = L5_5.module
L6_6 = L6_6.fight
L7_7 = L6_6.ways
L7_7 = L7_7.base
function L8_8(A0_24, A1_25)
	local L2_26, L3_27
	L2_26 = A1_25.last_pos
	if L2_26 then
		L2_26 = A1_25.last_pos
		L3_27 = A1_25.pos
		L3_27 = L3_27.x
		L2_26.x = L3_27
		L2_26 = A1_25.last_pos
		L3_27 = A1_25.pos
		L3_27 = L3_27.y
		L2_26.y = L3_27
	end
	L2_26 = A1_25.last_world_pos
	if L2_26 then
		L2_26 = A1_25.last_world_pos
		L3_27 = A1_25.world_pos
		L3_27 = L3_27.x
		L2_26.x = L3_27
		L2_26 = A1_25.last_world_pos
		L3_27 = A1_25.world_pos
		L3_27 = L3_27.y
		L2_26.y = L3_27
	end
end
function L9_9(A0_28, A1_29, A2_30)
	if not A1_29.fly_time then
		A1_29.fly_time = 0
	end
	A1_29.fly_time = A1_29.fly_time + A2_30
	local L4_31 = A0_28:is_physics_env()
	if L4_31 then
		L4_31 = A1_29.free_fall
		if not L4_31 then
			L4_31 = A1_29.fly_time_no_free_fall
			if not L4_31 then
				L4_31 = 0
			end
			L4_31 = L4_31 + A2_30
			A1_29.fly_time_no_free_fall = L4_31
		end
	end
end
function L10_10(A0_32, A1_33, A2_34)
	_ENV(A0_32, A1_33, A2_34)
	local L6_37 = L6_37
	L6_37 = L8_8
	L6_37(A0_32, A1_33)
	local L5_36 = L5_36
end
function L11_11(A0_38, A1_39, A2_40)
	_ENV(A0_38, A1_39, A2_40)
	A1_39.pos.x = L1_1(A1_39.from_pos.x + A1_39.v0_x * A1_39.fly_time + 0.5 * A1_39.a_x * A1_39.fly_time ^ 2)
	A1_39.pos.y = L1_1(A1_39.from_pos.y + A1_39.v0_y * A1_39.fly_time + 0.5 * A1_39.a_y * A1_39.fly_time ^ 2)
	local L3_41, L4_42 = L3_41, L4_42
	local L5_43 = L5_43
	local L6_44 = L6_44
	L3_41(L4_42, L5_43, L6_44, A1_39.world_pos)
	local L7_45 = L7_45
	A1_39.need_rsync_world_pos = true
end
L7_7.move_target_along_normal_parabola = L11_11
function L11_11(A0_46, A1_47, A2_48, A3_49)
	_ENV(A0_46, A1_47, A2_48)
	A1_47.pos.x = L4_4(A1_47.pos.x + A1_47.v_x * A2_48)
	A1_47.pos.y = L4_4(A1_47.pos.y + A1_47.v_y * A2_48)
	A0_46.land_data:land_to_world_pos(A1_47.pos.x, A1_47.pos.y, A1_47.world_pos)
	local L8_54 = L8_54
	L8_54 = L4_4
	L8_54 = L8_54(A1_47.v_x + A1_47.a_x * A2_48)
	A1_47.v_x = L8_54
	L8_54 = L4_4
	L8_54 = L8_54(A1_47.v_y + A1_47.a_y * A2_48)
	A1_47.v_y = L8_54
	L8_54 = L4_4
	L8_54 = L8_54((A3_49 - A1_47.resistance * A1_47.v_x) / A1_47.mass)
	A1_47.a_x = L8_54
	L8_54 = L4_4
	local L7_53 = L7_53
	L7_53 = L7_53 - A1_47.resistance * A1_47.v_y
	L7_53 = L7_53 / A1_47.mass
	L8_54 = L8_54(L7_53)
	A1_47.a_y = L8_54
	A1_47.need_rsync_world_pos = true
end
L7_7.move_target_along_parabola = L11_11
function L11_11(A0_55, A1_56, A2_57)
	_ENV(A0_55, A1_56, A2_57)
	A1_56.pos.x = L4_4(A1_56.pos.x + A1_56.v_x * A2_57)
	A1_56.pos.y = L4_4(A1_56.pos.y + A1_56.v_y * A2_57)
	local L3_58, L4_59 = L3_58, L4_59
	local L5_60 = L5_60
	local L6_61 = L6_61
	L3_58(L4_59, L5_60, L6_61, A1_56.world_pos)
	local L7_62 = L7_62
	A1_56.need_rsync_world_pos = true
end
L7_7.move_target_along_line = L11_11
function L11_11(A0_63, A1_64, A2_65)
	local L3_66 = L3_66
	L3_66(A0_63, A1_64, A2_65)
	L3_66 = A1_64.fly_time
	L3_66 = L3_66 * 1000
	L3_66 = L3_66 / A1_64.bezier_total_time
	local L9_72 = L9_72
	L9_72(A1_64.pos, L3_66, A1_64.bezier_start_pos, A1_64.bezier_ctrl_pos_1, A1_64.bezier_ctrl_pos_2, A1_64.bezier_end_pos)
	local L10_73 = L10_73
	L9_72 = A0_63.land_data
	L10_73 = L9_72
	L9_72 = L9_72.land_to_world_pos
	local L6_69 = L6_69
	local L7_70 = L7_70
	L9_72(L10_73, L6_69, L7_70, A1_64.world_pos)
	local L8_71 = L8_71
	L9_72 = A1_64.world_pos
	L9_72 = L9_72.x
	L10_73 = A1_64.last_world_pos
	L10_73 = L10_73.x
	L9_72 = L9_72 - L10_73
	L9_72 = L9_72 / A2_65
	A1_64.v_x = L9_72
	L9_72 = A1_64.world_pos
	L9_72 = L9_72.y
	L10_73 = A1_64.last_world_pos
	L10_73 = L10_73.y
	L9_72 = L9_72 - L10_73
	L9_72 = L9_72 / A2_65
	A1_64.v_y = L9_72
	A1_64.need_rsync_world_pos = true
end
L7_7.move_target_along_bezier_curve = L11_11
function L11_11(A0_74)
	local L1_75
	L1_75 = A0_74.x
	if L1_75 == -9999 then
		L1_75 = A0_74.y
		if L1_75 == -9999 then
			L1_75 = false
			return L1_75
		end
	end
	L1_75 = true
	return L1_75
end
function L12_12(A0_76, A1_77, A2_78)
	A1_77.pos.y = A1_77.pos.y + _ENV(A1_77.v_y * A2_78)
	local L3_79, L4_80 = L3_79, L4_80
	local L5_81 = L5_81
	L3_79, L4_80, L5_81 = L3_79(L4_80, L5_81, A1_77.last_pos.y, A1_77.pos.x, A1_77.pos.y, 3)
	if L3_79 then
		A1_77.free_fall = false
		if L11_11((A0_76.land_data:get_touch(L4_80, L5_81))) then
			L4_80 = A0_76.land_data:get_touch(L4_80, L5_81).x
			L5_81 = A0_76.land_data:get_touch(L4_80, L5_81).y
		end
		A1_77.pos.x = L4_80
		A1_77.pos.y = L5_81
	end
	local L9_85 = L9_85
	L9_85(A0_76.land_data, A1_77.pos.x, A1_77.pos.y, A1_77.world_pos)
	local L10_86 = L10_86
	L9_85 = L4_4
	L10_86 = A1_77.v_y
	L10_86 = L10_86 + A1_77.a_y * A2_78
	L9_85 = L9_85(L10_86)
	A1_77.v_y = L9_85
	A1_77.need_rsync_world_pos = true
end
function L13_13(A0_87, A1_88, A2_89)
	_ENV(A0_87, A1_88, A2_89)
	local L4_90 = L4_90
	local L5_91 = L5_91
	L4_90(L5_91, A1_88, A2_89)
	local L6_92 = L6_92
end
L7_7.move_target_along_free_fall_by_step = L13_13
function L13_13(A0_93, A1_94, A2_95)
	local L3_96 = A0_93:is_physics_env()
	if L3_96 then
		L3_96 = A1_94.pos
		L3_96 = L3_96.x
		if L3_96 < A2_95.x then
			L3_96 = _ENV
			L3_96 = L3_96.role_directions
			L3_96 = L3_96.right
			if L3_96 then
				goto lbl_18
			end
		end
		L3_96 = _ENV
		L3_96 = L3_96.role_directions
		L3_96 = L3_96.left
		::lbl_18::
		local L4_97, L5_98 = L4_97, L5_98
		local L6_99 = L6_99
		local L7_100 = L7_100
		local L4_97, L8_101 = L4_97(L5_98, L6_99, L7_100, L3_96), L8_101
		if L4_97 then
			L4_97 = true
			return L4_97
		end
	end
	L3_96 = false
	return L3_96
end
function L14_14(A0_102, A1_103, A2_104)
	local L3_105 = L3_105
	local L4_106 = L4_106
	local L5_107 = L5_107
	local L3_105, L6_108 = L3_105(L4_106, L5_107, A2_104), L6_108
	if L3_105 then
		L3_105 = false
		return L3_105
	end
	L3_105 = A1_103.pos
	L4_106 = A2_104.x
	L3_105.x = L4_106
	L3_105 = A1_103.pos
	L4_106 = A2_104.y
	L3_105.y = L4_106
	L3_105 = true
	return L3_105
end
function L15_15(A0_109, A1_110, A2_111)
	if true then
		if A1_110.fly_time <= 0 and not _ENV((A0_109.land_data:get_touch(A1_110.pos.x, A1_110.pos.y))) then
			A1_110.free_fall = true
		end
		L10_10(A0_109, A1_110, A2_111)
		if A1_110.free_fall then
			local L3_112 = L3_112
			L3_112(A0_109, A1_110, A2_111)
		end
	else
		L3_112 = A1_110.pos
		L3_112 = L3_112.x
		L3_112 = L3_112 + L1_1(A1_110.v_x * A2_111)
		local L4_113 = L4_113
		L4_113 = L4_113(A0_109.land_data, L3_112, A1_110.pos.y)
		if not _ENV(L4_113) then
			if not (0 < A1_110.v_x) or not 1 then
			end
			while true do
				if 0 < -1 and L3_112 <= A1_110.pos.x or 0 > -1 and L3_112 >= A1_110.pos.x then
					break
				end
				if not (0 < -1) or not math.min(A1_110.pos.x + 4 * -1, L3_112) then
				end
				L4_113 = A0_109.land_data:get_touch(math.max(math.min(A1_110.pos.x + 4 * -1, L3_112) or A1_110.pos.x + 4 * -1, L3_112), A1_110.pos.y)
				if _ENV(L4_113) then
					if not L14_14(A0_109, A1_110, L4_113) then
						break
					end
				else
					local L10_119 = L10_119
					if true then
						if not A0_109.land_data:is_land_pos_empty(math.max(math.min(A1_110.pos.x + 4 * -1, L3_112) or A1_110.pos.x + 4 * -1, L3_112), A1_110.pos.y) then
							break
						end
						A1_110.v_y = 0
						A1_110.pos.x = math.max(math.min(A1_110.pos.x + 4 * -1, L3_112) or A1_110.pos.x + 4 * -1, L3_112)
						A1_110.free_fall = true
						break
				end
			end
		end
		else
			L10_119 = L14_14
			L10_119 = L10_119(A0_109, A1_110, L4_113)
			if not L10_119 then
				return
			end
		end
		L10_119 = A0_109.land_data
		L10_119 = L10_119.land_to_world_pos
		local L6_115 = L6_115
		local L7_116 = L7_116
		local L8_117 = L8_117
		L10_119(L6_115, L7_116, L8_117, A1_110.world_pos)
		local L9_118 = L9_118
		A1_110.need_rsync_world_pos = true
	end
end
L7_7.move_target_along_ground_rolling = L15_15
L15_15 = {}
L15_15.x = 0
L15_15.y = 1
L16_16 = {}
L16_16.x = 0
L16_16.y = -1
L17_17 = {}
L17_17.x = 1
L17_17.y = 0
L18_18 = {}
L18_18.x = -1
L18_18.y = 0
function L19_19(A0_120, A1_121, A2_122)
	local L3_123
	L3_123 = {}
	L3_123.x = A0_120.x
	L3_123.y = A0_120.y
	if _ENV(A1_121.x) > 0 and _ENV(A2_122.y) > 0 then
		if A0_120.y == 1 then
			if A2_122.y < 0 then
				L3_123.y = 0
				L3_123.x = A1_121.x
			else
				L3_123.y = 0
				L3_123.x = A1_121.x * -1
			end
		elseif A0_120.y == -1 then
			if A2_122.y > 0 then
				L3_123.y = 0
				L3_123.x = A1_121.x
			else
				L3_123.y = 0
				L3_123.x = A1_121.x * -1
			end
		end
	end
	if _ENV(A1_121.y) > 0 then
		local L4_124 = L4_124
		local L4_124, L5_125 = L4_124(A2_122.x), L5_125
		if 0 < L4_124 then
			L4_124 = A0_120.x
			if L4_124 == 1 then
				L4_124 = A2_122.x
				if L4_124 < 0 then
					L3_123.x = 0
					L4_124 = A1_121.y
					L3_123.y = L4_124
				else
					L3_123.x = 0
					L4_124 = A1_121.y
					L4_124 = L4_124 * -1
					L3_123.y = L4_124
				end
			else
				L4_124 = A0_120.x
				if L4_124 == -1 then
					L4_124 = A2_122.x
					if 0 < L4_124 then
						L3_123.x = 0
						L4_124 = A1_121.y
						L3_123.y = L4_124
					else
						L3_123.x = 0
						L4_124 = A1_121.y
						L4_124 = L4_124 * -1
						L3_123.y = L4_124
					end
				end
			end
		end
	end
	return L3_123
end
function L20_20(A0_126, A1_127, A2_128, A3_129)
	local L4_130, L5_131 = L4_130, L5_131
	local L6_132 = L6_132
	local L4_130, L7_133 = L4_130(L5_131, L6_132, A3_129), L7_133
	if L4_130 then
		L4_130 = {}
		L5_131 = A1_127.x
		L5_131 = -L5_131
		L4_130.x = L5_131
		L5_131 = A1_127.y
		L5_131 = -L5_131
		L4_130.y = L5_131
		return L4_130
	else
		L4_130 = {}
		L5_131 = A1_127.x
		L4_130.x = L5_131
		L5_131 = A1_127.y
		L4_130.y = L5_131
		return L4_130
	end
end
function L21_21(A0_134, A1_135, A2_136, A3_137, A4_138)
	local L5_139
	L5_139 = A1_135.pos
	L5_139 = L5_139.x
	local L6_140 = L6_140
	L6_140 = L6_140(A2_136.dir.x * A3_137)
	L5_139 = L5_139 + L6_140
	L6_140 = A1_135.pos
	L6_140 = L6_140.y
	L6_140 = L6_140 + _ENV(A2_136.dir.y * A3_137)
	local L7_141 = L7_141
	L7_141 = L7_141(A0_134, A2_136.new_edge, L5_139, L6_140)
	local L8_142 = L8_142
	local L11_145 = L11_145
	local L12_146 = L12_146
	local L13_147 = L13_147
	if not A4_138 then
	end
	local L8_142, L14_148 = L8_142(L11_145, L12_146, L13_147, L7_141.x, L7_141.y, A3_137), L14_148
	L11_145 = L11_11
	L12_146 = L8_142
	L11_145 = L11_145(L12_146)
	if L11_145 then
		L11_145 = true
		L12_146 = L8_142
		return L11_145, L12_146
	end
	L11_145 = false
	L12_146 = L8_142
	return L11_145, L12_146
end
function L22_22(A0_149, A1_150, A2_151, A3_152, A4_153)
	local L5_154
	L5_154 = {}
	L5_154.x = A1_150.pos.x - A1_150.last_pos.x
	L5_154.y = A1_150.pos.y - A1_150.last_pos.y
	local L8_157 = L8_157
	L8_157(A0_149, A1_150, A2_151)
	L8_157 = A1_150.edge
	if not L8_157 then
		L8_157 = {}
		L8_157.x = 0
		L8_157.y = 1
		A1_150.edge = L8_157
	end
	L8_157 = L0_0
	L8_157 = L8_157(A1_150.v_x)
	if 0 < L8_157 then
		L8_157 = L0_0
		L8_157 = L8_157(A1_150.v_x)
		if L8_157 then
			goto lbl_39
		end
	end
	L8_157 = L0_0
	local L8_157, L7_156 = L8_157(A1_150.v_y), L7_156
	::lbl_39::
	L7_156 = {}
	L7_156.x = 0
	L7_156.y = 0
	if 0 < A1_150.v_x then
		L7_156.x = 1
	elseif 0 > A1_150.v_x then
		L7_156.x = -1
	end
	if 0 < A1_150.v_y then
		L7_156.y = 1
	elseif 0 > A1_150.v_y then
		L7_156.y = -1
	end
	;({}).x = L7_156.x
	;({}).dir, ({}).y = {}, L7_156.y
	;({}).new_edge = A1_150.edge
	L2_2({}, {})
	if L0_0(L7_156.x) > 0 then
		if L5_154.y > 0 then
			({}).new_edge, ({}).dir = L19_19(A1_150.edge, L7_156, L15_15), L15_15
			L2_2({}, {})
			;({}).new_edge, ({}).dir = L19_19(A1_150.edge, L7_156, L16_16), L16_16
			L2_2({}, {})
		else
			({}).new_edge, ({}).dir = L19_19(A1_150.edge, L7_156, L16_16), L16_16
			L2_2({}, {})
			;({}).new_edge, ({}).dir = L19_19(A1_150.edge, L7_156, L15_15), L15_15
			L2_2({}, {})
		end
	else
		local L9_158 = L9_158
		local L10_159 = L10_159
		if L5_154.x > 0 then
			({}).dir = L17_17
			;({}).new_edge = L10_159
			L2_2(L9_158, {})
			;({}).new_edge, ({}).dir = L19_19(A1_150.edge, L7_156, L18_18), L18_18
			L2_2(L9_158, {})
		else
			({}).new_edge, ({}).dir = L19_19(A1_150.edge, L7_156, L18_18), L18_18
			L2_2(L9_158, {})
			local L11_160 = L11_160
			local L12_161 = L12_161
			;({}).dir = L17_17
			;({}).new_edge = L10_159
			L12_161(L9_158, {})
			local L13_162 = L13_162
		end
	end
	L10_159 = nil
	L11_160 = {}
	L11_160.x = -9999
	L11_160.y = -9999
	L12_161 = L7_156
	L13_162 = nil
	_FOR_, _FOR_, _FOR_ = ipairs(L9_158)
	for _FORV_17_, _FORV_18_ in _FOR_, _FOR_, _FOR_ do
		local L21_170 = L21_170
		if not A3_152 then
		end
		L10_159, L11_160 = L21_21(A0_149, A1_150, _FORV_18_, L21_170, L21_170)
		if L10_159 then
			L13_162 = _FORV_18_
			break
		end
	end
	if not L13_162 then
		L22_171 = {}
		L23_172 = {}
		L24_173 = L7_156.x
		L24_173 = -L24_173
		L23_172.x = L24_173
		L24_173 = L7_156.y
		L24_173 = -L24_173
		L23_172.y = L24_173
		L22_171.dir = L23_172
		L23_172 = {}
		L24_173 = A1_150.edge
		L24_173 = L24_173.x
		L24_173 = -L24_173
		L23_172.x = L24_173
		L24_173 = A1_150.edge
		L24_173 = L24_173.y
		L24_173 = -L24_173
		L23_172.y = L24_173
		L22_171.new_edge = L23_172
		L23_172 = L21_21
		L24_173 = A0_149
		if not A3_152 then
		end
		L23_172, L24_173 = L23_172(L24_173, A1_150, L22_171, L21_170, L21_170)
		L11_160 = L24_173
		L10_159 = L23_172
		if L10_159 then
			L13_162 = L22_171
		end
	end
	L22_171 = L11_11
	L23_172 = L11_160
	L22_171 = L22_171(L23_172)
	if not L22_171 then
		L22_171 = false
		return L22_171
	end
	L22_171 = L13_162.dir
	L22_171 = L22_171.x
	L22_171 = L22_171 * L8_157
	A1_150.v_x = L22_171
	L22_171 = L13_162.dir
	L22_171 = L22_171.y
	L22_171 = L22_171 * L8_157
	A1_150.v_y = L22_171
	L22_171 = L13_162.new_edge
	A1_150.edge = L22_171
	if not A4_153 then
		L22_171 = L8_8
		L23_172 = A0_149
		L24_173 = A1_150
		L22_171(L23_172, L24_173)
		L22_171 = A1_150.pos
		L23_172 = L11_160.x
		L22_171.x = L23_172
		L22_171 = A1_150.pos
		L23_172 = L11_160.y
		L22_171.y = L23_172
		L22_171 = A0_149.land_data
		L23_172 = L22_171
		L22_171 = L22_171.land_to_world_pos
		L24_173 = A1_150.pos
		L24_173 = L24_173.x
		L22_171(L23_172, L24_173, A1_150.pos.y, A1_150.world_pos)
		local L18_167 = L18_167
		A1_150.need_rsync_world_pos = true
	end
	L22_171 = true
	L23_172 = L11_160.x
	L24_173 = L11_160.y
	return L22_171, L23_172, L24_173
end
L7_7.move_target_along_ground_paste = L22_22
function L22_22(A0_174, A1_175)
	local L2_176, L3_177
	L2_176 = 0
	L3_177 = A1_175.x
	if 0 < L3_177 then
		L2_176 = -90
	else
		L3_177 = A1_175.x
		if L3_177 < 0 then
			L2_176 = 90
		else
			L3_177 = A1_175.y
			if 0 < L3_177 then
				L2_176 = 0
			else
				L3_177 = A1_175.y
				if L3_177 < 0 then
					L2_176 = 180
				end
			end
		end
	end
	return L2_176
end
L7_7.get_angle_by_edge = L22_22
L22_22 = L6_6.role_directions
L22_22 = L22_22.left
function L23_23(A0_178, A1_179, A2_180)
	local L3_181, L4_182
	L3_181 = 0
	L4_182 = A1_179.x
	if 0 < L4_182 then
		L4_182 = _ENV
		if A2_180 == L4_182 then
			L3_181 = 90
		else
			L3_181 = -90
		end
	else
		L4_182 = A1_179.x
		if L4_182 < 0 then
			L4_182 = _ENV
			if A2_180 == L4_182 then
				L3_181 = -90
			else
				L3_181 = 90
			end
		else
			L4_182 = A1_179.y
			if 0 < L4_182 then
				L4_182 = _ENV
				if A2_180 == L4_182 then
					L3_181 = 180
				else
					L3_181 = 0
				end
			else
				L4_182 = A1_179.y
				if L4_182 < 0 then
					L4_182 = _ENV
					if A2_180 == L4_182 then
						L3_181 = 0
					else
						L3_181 = 180
					end
				end
			end
		end
	end
	return L3_181
end
L7_7.get_unit_angle_by_edge = L23_23
