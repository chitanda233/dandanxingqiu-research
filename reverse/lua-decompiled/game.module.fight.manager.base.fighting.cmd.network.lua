local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
L0_0 = ipairs
local L1_1, L8_8, L9_9 = table, L8_8, L9_9
L1_1 = L1_1.insert
L2_2 = Game
L2_2 = L2_2.module
L2_2 = L2_2.fight
L3_3 = L2_2.ways
L3_3 = L3_3.base
L4_4 = L2_2.node_type
L5_5 = L2_2.bullet_ext_type
L8_8 = require
L9_9 = "game.module.fight.manager.base.fighting.hit_rate_logger"
L8_8 = L8_8(L9_9)
function L9_9(A0_10, A1_11, A2_12, A3_13, A4_14, A5_15, A6_16, A7_17, A8_18, A9_19)
	local L10_20, L11_21 = L10_20, L11_21
	local L12_22 = L12_22
	;({}).round = A0_10.round.round_count
	;({}).type = 1
	;({}).angle = A1_11
	;({}).force = A2_12
	;({}).pos = A3_13
	;({}).from_pos = A4_14
	;({}).direction = A5_15
	;({}).force_type = A6_16
	;({}).land_angle = A7_17
	;({}).fire_buff_pos = A8_18
	if not A9_19 then
	end
	local L15_25.ask_fire, ({}).force_aim_type, L15_25 = {}, 0, L15_25
	L10_20(L11_21, L12_22, L15_25)
end
L3_3.send_fire_cmd = L9_9
function L9_9(A0_26, A1_27)
	({}).round = A0_26.round.round_count
	;({}).type = 2
	;({}).ask_skill, ({}).cf_skill_id = {}, A1_27
	local L6_32 = L6_32
	L6_32(A0_26, "battle_seq_cmd_c2s", {})
	L6_32 = A0_26.try_to_send_player_action_log
	local L3_29 = L3_29
	local L4_30 = L4_30
	L6_32(L3_29, L4_30, A1_27)
	local L5_31 = L5_31
end
L3_3.send_use_skill_cmd = L9_9
function L9_9(A0_33, A1_34, A2_35)
	local L8_41, L9_42 = L8_41, L9_42
	if A1_34 ~= 0 then
		if A1_34 == 512 or A1_34 == 509 then
			L9_42 = A0_33
			L8_41 = A0_33.req_fire_failed
			L8_41(L9_42)
		end
		return
	end
	L8_41 = A2_35.batch_total
	if L8_41 then
		L8_41 = A2_35.batch_index
		L9_42 = A2_35.batch_total
		if L8_41 <= L9_42 then
			L8_41 = A0_33.wait_deal_cmd_msg
			if not L8_41 then
				A0_33.wait_deal_cmd_msg = A2_35
			else
				L8_41 = A0_33.wait_deal_cmd_msg
				L8_41 = L8_41.node_list
				L9_42 = A2_35.node_list
				_FOR_, _FOR_, _FOR_ = _ENV(L9_42)
				for _FORV_8_, _FORV_9_ in _FOR_, _FOR_, _FOR_ do
					L1_1(L8_41, _FORV_9_)
				end
			end
			L8_41 = A2_35.batch_index
			L9_42 = A2_35.batch_total
			if L8_41 < L9_42 then
				return
			end
			A2_35 = A0_33.wait_deal_cmd_msg
			A0_33.wait_deal_cmd_msg = nil
		end
	end
	L9_42 = A0_33
	L8_41 = A0_33.deal_battle_seq_cmd_s2c
	L10_43 = A2_35
	L8_41(L9_42, L10_43)
end
L3_3.on_msg_battle_seq_cmd_s2c = L9_9
function L9_9(A0_46, A1_47)
	_ENV.on_nodes(A0_46, A1_47)
	if A1_47.round == A0_46.round.round_count and A0_46.id_to_unit[A1_47.object_id] then
		A0_46.id_to_unit[A1_47.object_id].last_op_time = Time.time
		A0_46.id_to_unit[A1_47.object_id].oped = true
	end
	if A1_47.type == 1 then
		A0_46:parse_fire_cmd(A1_47)
	elseif A1_47.type == 2 then
		A0_46:parse_use_skill_cmd(A1_47)
	elseif A1_47.type == 3 then
		A0_46:parse_special_bullet_cmd(A1_47)
	elseif A1_47.type == 100 then
		A0_46:parse_other_cmd(A1_47)
	elseif A1_47.type == 101 then
		A0_46:parse_fire_wheel_bullet_remove_cmd(A1_47)
		local L4_50 = L4_50
	end
	L4_50 = A0_46.try_to_excute_nodes
	L4_50(A0_46)
	local L3_49 = L3_49
end
L3_3.deal_battle_seq_cmd_s2c = L9_9
function L9_9(A0_51, A1_52)
	local L2_53, L3_54
	L2_53 = A0_51._bullet_ext_tp
	if not L2_53 then
		L2_53 = A1_52._bullet_ext_tp
		if L2_53 ~= nil then
			L2_53 = true
			return L2_53
		end
	end
	L2_53 = A0_51._bullet_ext_tp
	if L2_53 ~= nil then
		L2_53 = A1_52._bullet_ext_tp
		if not L2_53 then
			L2_53 = false
			return L2_53
		end
	end
	L2_53 = A0_51.bullet_fly_time
	if L2_53 then
		L2_53 = A1_52.bullet_fly_time
		if L2_53 then
			L2_53 = A0_51.bullet_fly_time
			L3_54 = A1_52.bullet_fly_time
			L2_53 = L2_53 < L3_54
			return L2_53
		end
	end
	L2_53 = A0_51.bullet_fly_time
	if L2_53 then
		L2_53 = true
		return L2_53
	end
	L2_53 = A1_52.bullet_fly_time
	if L2_53 then
		L2_53 = false
		return L2_53
	end
	L2_53 = A0_51._order
	L3_54 = A1_52._order
	L2_53 = L2_53 < L3_54
	return L2_53
end
function L3_3.parse_fire_cmd(A0_55, A1_56)
	local L2_57, L3_58
	L2_57 = {}
	local L3_58, L16_71 = {}, L16_71
	L16_71 = A1_56.object_id
	L3_58.object_id = L16_71
	L16_71 = A1_56.round
	L3_58.round = L16_71
	L16_71 = _ENV
	L16_71 = L16_71.fire
	L3_58.type = L16_71
	L16_71 = A1_56.reply_fire
	L3_58.fire_info = L16_71
	L3_58.bullets = L2_57
	L16_71 = L6_6
	L16_71 = L16_71.on_fire_ack
	local L5_60 = L5_60
	L16_71(L5_60, A1_56)
	local L6_61 = L6_61
	L16_71 = nil
	L5_60 = A1_56.reply_fire
	L5_60 = L5_60.fire_type
	L6_61 = A1_56.node_list
	_FOR_, _FOR_, _FOR_ = L0_0(L6_61)
	for _FORV_10_, _FORV_11_ in _FOR_, _FOR_, _FOR_ do
		_FORV_11_.round = A1_56.round
		if _FORV_11_.type == _ENV.bullet then
			if _FORV_11_.pre_id and not L3_58.pre_id then
				L3_58.pre_id = _FORV_11_.pre_id
			end
			_FORV_11_.bullet_node.force = _FORV_11_.bullet_node.force * 0.01
			_FORV_11_.fire_type = L5_60
			L1_1(L2_57, _FORV_11_)
		end
		if A0_55.bullet_corss_unit_count <= 0 then
			A0_55:try_to_add_round_processing_by_node(_FORV_11_)
		else
			if not L16_71 then
				L16_71 = {}
			end
			if _FORV_11_.processings and next(_FORV_11_.processings) then
				_FOR_, _FOR_, _FOR_ = L0_0(_FORV_11_.processings)
				for _FORV_16_, _FORV_17_ in _FOR_, _FOR_, _FOR_ do
					_FORV_17_._order = _FORV_10_ * 100 + _FORV_16_
					_FORV_17_._node = _FORV_11_
					L1_1(L16_71, _FORV_17_)
					if _FORV_11_.type == _ENV.bullet then
						if not _FORV_11_.bullet_node.ext_arg or not _FORV_11_.bullet_node.ext_arg.type then
						end
						_FORV_17_._bullet_ext_tp = nil
					end
				end
			end
		end
	end
	L11_66 = A0_55.bullet_corss_unit_count
	if 0 < L11_66 and L16_71 then
		L11_66 = table
		L11_66 = L11_66.sort
		L15_70 = L16_71
		L20_75 = L7_7
		L11_66(L15_70, L20_75)
		L15_70 = A0_55
		L11_66 = A0_55.add_processings_to_round
		L20_75 = L16_71
		L11_66(L15_70, L20_75)
	end
	L15_70 = A0_55
	L11_66 = A0_55.on_fire_success
	L20_75 = L3_58
	L11_66(L15_70, L20_75, L6_61)
	L15_70 = A0_55
	L11_66 = A0_55.add_node
	L20_75 = L3_58
	L11_66(L15_70, L20_75)
	L11_66 = L0_0
	L15_70 = L6_61
	L11_66, L15_70, L20_75 = L11_66(L15_70)
	for _FORV_10_, _FORV_11_ in L11_66, L15_70, L20_75 do
		if _FORV_11_.type ~= _ENV.bullet then
			A0_55:add_node(_FORV_11_)
		end
	end
end
function L3_3.parse_use_skill_cmd(A0_76, A1_77)
	local L2_78, L3_79
	L2_78 = A1_77.node_list
	L3_79 = {}
	L7_83 = A1_77.object_id
	L3_79.object_id = L7_83
	L7_83 = A1_77.round
	L3_79.round = L7_83
	L7_83 = _ENV
	L7_83 = L7_83.use_skill_cost
	L3_79.type = L7_83
	L7_83 = A1_77.reply_skill
	L3_79.skill_info = L7_83
	L8_84 = A0_76
	L7_83 = A0_76.add_node
	L7_83(L8_84, L3_79)
	L7_83 = L0_0
	L8_84 = L2_78
	L7_83, L8_84, _FOR_ = L7_83(L8_84)
	for _FORV_7_, _FORV_8_ in L7_83, L8_84, _FOR_ do
		_FORV_8_.round = A1_77.round
		if _FORV_8_.pre_id and not L3_79.pre_id then
			L3_79.pre_id = _FORV_8_.pre_id
		end
		A0_76:add_node(_FORV_8_)
		A0_76:try_to_add_round_processing_by_node(_FORV_8_)
	end
end
;({})[L4_4.bullet] = true
;({})[L4_4.skill] = true
function L3_3.calculate_cur_cmd_pre_id(A0_88, A1_89)
	local L6_94, L7_95 = A0_88:is_physics_env(), L7_95
	if L6_94 then
		L7_95 = A0_88
		L6_94 = A0_88.calculate_cur_cmd_pre_id_on_physics_env
		return L6_94(L7_95)
	end
	L6_94 = nil
	L7_95 = nil
	L8_96 = _ENV
	L9_97 = A0_88.node_list
	L8_96, L9_97, L10_98 = L8_96(L9_97)
	for _FORV_7_, _FORV_8_ in L8_96, L9_97, L10_98 do
		if _UPVALUE1_[_FORV_8_.type] then
			L6_94 = _FORV_8_.id
		end
		if _FORV_8_.type == L4_4.bullet then
			L7_95 = _FORV_8_.id
		end
		if _FORV_8_.type == L4_4.fire then
			L6_94 = _FORV_8_.bullets[#_FORV_8_.bullets].id
			L7_95 = _FORV_8_.bullets[#_FORV_8_.bullets].id
		end
	end
	if A1_89 and L7_95 then
		L6_94 = L7_95
	end
	if L6_94 == nil then
		L8_96 = A0_88.last_bullet_or_skill_node_id
		if L8_96 then
			L8_96 = A0_88.id_to_done
			L9_97 = A0_88.last_bullet_or_skill_node_id
			L8_96 = L8_96[L9_97]
			if not L8_96 then
				L6_94 = A0_88.last_bullet_or_skill_node_id
			end
		end
	end
	return L6_94
end
function L3_3.calculate_cur_cmd_pre_id_on_physics_env(A0_99)
	local L1_100
	local L4_103, L8_107 = A0_99.node_list, L8_107
	L2_101, L4_103, L5_104 = L2_101(L4_103)
	for L6_105, L7_106 in L2_101, L4_103, L5_104 do
		L8_107 = L7_106.type
		if L8_107 == L4_4.skill then
			L1_100 = L7_106.id
		end
	end
	if L1_100 == nil then
		L2_101 = A0_99.last_bullet_or_skill_node_id
		if L2_101 then
			L2_101 = A0_99.id_to_done
			L4_103 = A0_99.last_bullet_or_skill_node_id
			L2_101 = L2_101[L4_103]
			if not L2_101 then
				L1_100 = A0_99.last_bullet_or_skill_node_id
			end
		end
	end
	return L1_100
end
function L3_3.parse_other_cmd(A0_108, A1_109)
	local L2_110, L3_111 = A0_108:calculate_cur_cmd_pre_id(), L3_111
	L3_111 = A1_109.node_list
	L6_114 = _ENV
	L7_115 = L3_111
	L6_114, L7_115, L8_116 = L6_114(L7_115)
	for _FORV_7_, _FORV_8_ in L6_114, L7_115, L8_116 do
		_FORV_8_.round = A1_109.round
		if not _UPVALUE1_[_FORV_8_.type] and not _FORV_8_.pre_id then
			_FORV_8_.pre_id = L2_110
		end
		A0_108:add_node(_FORV_8_)
		A0_108:try_to_add_round_processing_by_node(_FORV_8_)
		local L11_119 = L11_119
	end
end
function L3_3.parse_special_bullet_nodes(A0_120, A1_121, A2_122, A3_123)
	local L6_126, L9_129, L10_130 = L6_126, L9_129, L10_130
	if not A2_122 then
		L9_129 = A0_120
		L6_126 = A0_120.calculate_cur_cmd_pre_id
		L6_126 = L6_126(L9_129)
	end
	L9_129 = nil
	L10_130 = A1_121.node_list
	L11_131 = _ENV
	L11_131, _FOR_, _FOR_ = L11_131(L10_130)
	for _FORV_10_, _FORV_11_ in L11_131, _FOR_, _FOR_ do
		_FORV_11_.round = A1_121.round
		if _FORV_11_.type == L4_4.bullet then
			_FORV_11_.special_fire = true
			_FORV_11_.bullet_node.force = _FORV_11_.bullet_node.force * 0.01
			if not _FORV_11_.pre_id then
				L9_129 = _FORV_11_.bullet_node.ext_arg.tag or L9_129
				if not _FORV_11_.bullet_node.ext_arg or not _FORV_11_.bullet_node.ext_arg.tag then
					L9_129 = nil
				end
				if L9_129 == 2 then
				else
					_FORV_11_.pre_id = L6_126
				end
			end
			_FORV_11_._follow = true
			if _FORV_11_.bullet_node.v_x then
				goto lbl_65
			end
			local L19_139 = L19_139
			local L20_140 = L20_140
			repeat
				L19_139(L20_140, string.format("node.bullet_node.v_x is nil,battle_id:%s,msg:%s", A0_120.cf_battle_id, table_string(A1_121, "", 4)))
				do break end -- pseudo-goto
				if A3_123 then
					L19_139 = _FORV_11_.pre_id
					if not L19_139 then
						_FORV_11_.pre_id = L6_126
					end
				end
			until true
		end
		::lbl_65::
		L20_140 = A0_120
		L19_139 = A0_120.add_node
		L19_139(L20_140, _FORV_11_)
		L20_140 = A0_120
		L19_139 = A0_120.try_to_add_round_processing_by_node
		L19_139(L20_140, _FORV_11_)
	end
end
function L3_3.parse_special_bullet_cmd(A0_141, A1_142)
	A0_141:parse_special_bullet_nodes(A1_142)
	local L4_143 = L4_143
end
function L3_3.parse_fire_wheel_bullet_remove_cmd(A0_144, A1_145)
	local L2_146 = L2_146
	if not A1_145.round then
	end
	if not A1_145.object_id then
	end
	L2_146 = L2_146("fire_wheel_wait_%s_%s", 0, 0)
	local L3_147 = L3_147
	local L4_148 = L4_148
	if not A1_145.round then
	end
	if not A1_145.object_id then
	end
	L3_147 = L3_147(L4_148, 0, 0)
	L4_148 = {}
	L4_148.id = L2_146
	L4_148.type = _ENV.other
	L4_148.round = A1_145.round
	L4_148.pre_id = L3_147
	L4_148.is_fire_wheel_wait = true
	L4_148.processings = {}
	A0_144:add_node(L4_148)
	local L8_152 = L8_152
	L8_152(A0_144, A1_145, L2_146, true)
	local L9_153 = L9_153
	L9_153 = A0_144
	L8_152 = A0_144.check_all_fire_wheel_bullets_landed
	L8_152 = L8_152(L9_153)
	if L8_152 then
		L9_153 = A0_144
		L8_152 = A0_144.try_to_complete_fire_wheel_wait_nodes
		L8_152(L9_153)
		L9_153 = A0_144
		L8_152 = A0_144.mark_node_done
		L8_152(L9_153, L4_148)
		L8_152 = remove_obj_from_array
		L9_153 = A0_144.node_list
		L8_152(L9_153, L4_148)
		local L7_151 = L7_151
	end
end
function L3_3.check_all_fire_wheel_bullets_landed(A0_154)
	L3_157 = A0_154.bullets
	L1_155, L3_157, L4_158 = L1_155(L3_157)
	for L5_159, _FORV_5_ in L1_155, L3_157, L4_158 do
		if _FORV_5_.is_destroy then
		elseif _FORV_5_.should_remove then
		elseif not _FORV_5_.battle_node then
		else
			local L7_161 = L7_161
			local L7_161, L8_162 = L7_161(A0_154, _FORV_5_), L8_162
			if not L7_161 then
			else
				L7_161 = _FORV_5_.has_passed_falling
				if not L7_161 then
					L7_161 = false
					return L7_161
				end
				L7_161 = _FORV_5_.state
				L8_162 = L2_2
				L8_162 = L8_162.bullet_state
				L8_162 = L8_162.idle
				if L7_161 ~= L8_162 then
					L7_161 = false
					return L7_161
				end
			end
		end
	end
	L1_155 = true
	return L1_155
end
function L3_3.try_to_complete_fire_wheel_wait_nodes(A0_163)
	if not A0_163.node_list then
		return
	end
	L4_167 = A0_163
	L3_166 = A0_163.try_to_set_fire_wheel_bullet_should_remove
	L3_166(L4_167)
	L3_166 = _ENV
	L4_167 = A0_163.node_list
	L3_166, L4_167, L5_168 = L3_166(L4_167)
	for _FORV_4_, _FORV_5_ in L3_166, L4_167, L5_168 do
		if _FORV_5_.is_fire_wheel_wait and not A0_163.id_to_done[_FORV_5_.id] then
			_FORV_5_.pre_id = nil
			A0_163:mark_node_done(_FORV_5_)
			local L8_171 = L8_171
		end
	end
end
function L3_3.try_to_set_fire_wheel_bullet_should_remove(A0_172)
	L3_175 = A0_172.bullets
	L1_173, L3_175, L4_176 = L1_173(L3_175)
	for L5_177, _FORV_5_ in L1_173, L3_175, L4_176 do
		if _FORV_5_.is_destroy then
		elseif _FORV_5_.should_remove then
		elseif not _FORV_5_.battle_node then
		else
			local L7_179 = L7_179
			local L7_179, L8_180 = L7_179(A0_172, _FORV_5_), L8_180
			if not L7_179 then
			else
				L7_179 = _FORV_5_.attacker
				if L7_179 then
					L7_179 = _FORV_5_.attacker
					L7_179 = L7_179.attack_info
				end
				if L7_179 then
					L8_180 = L7_179.all_fire_msg_received
					if not L8_180 then
					else
						_FORV_5_.should_remove = true
					end
				end
			end
		end
	end
end
