local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = table
local L0_0, L10_10, L11_11, L12_12, L15_15, L16_16, L17_17, L18_18, L19_19, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30 = L0_0.insert, L10_10, L11_11, L12_12, L15_15, L16_16, L17_17, L18_18, L19_19, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30
L1_1 = table
L1_1 = L1_1.sort
L2_2 = ipairs
L3_3 = pairs
L4_4 = assert
L10_10 = import
L11_11 = "..head"
L10_10 = L10_10(L11_11)
L11_11 = L4_4
L12_12 = L10_10.const
L11_11 = L11_11(L12_12)
L12_12 = L4_4
L15_15 = L10_10.data
L12_12 = L12_12(L15_15)
L15_15 = L4_4
L16_16 = L10_10.event
L15_15 = L15_15(L16_16)
L16_16 = DataConfigs
L16_16 = L16_16.tasks
L17_17 = DataConfigs
L17_17 = L17_17.item
L18_18 = DataConfigs
L18_18 = L18_18.task_order
L19_19 = DataConfigs
L19_19 = L19_19.misc
L22_22 = require
L23_23 = "game.utils.events"
L22_22 = L22_22(L23_23)
L23_23 = Game
L23_23 = L23_23.module
L23_23 = L23_23.guide_system
L24_24 = Game
L24_24 = L24_24.module
L24_24 = L24_24.jump_to
L25_25 = Game
L25_25 = L25_25.module
L25_25 = L25_25.marriage
L26_26 = Game
L26_26 = L26_26.module
L26_26 = L26_26.open_func
L27_27 = L26_26.const
L28_28 = Game
L28_28 = L28_28.module
L28_28 = L28_28.cloud_data
L29_29 = require
L30_30 = "game.other.server_time"
L29_29 = L29_29(L30_30)
L30_30 = DataConfigs
L30_30 = L30_30.main_stage_reward
function L12_12.init()
	_ENV.reset()
end
function L12_12.clear()
	_ENV.reset()
end
function L12_12.set_value(A0_31, A1_32)
	local L2_33
	L2_33 = _ENV
	L2_33 = L2_33.k_v
	L2_33[A0_31] = A1_32
end
function L12_12.get_value(A0_34)
	local L1_35
	L1_35 = _ENV
	L1_35 = L1_35.k_v
	L1_35 = L1_35[A0_34]
	return L1_35
end
function L12_12.reset()
	_ENV.k_v = {}
	_ENV.task_data = {}
	_ENV.task_tips_info = nil
	_ENV.role_equip_be_task = {}
	_ENV.strength_rand_red_info = {}
	_ENV.strength_rand_is_red = false
	_ENV.alliance_invite_red_info = {}
	_ENV.set_value("show_task_type_index", 1)
	local L2_38 = L2_38
	L2_38 = _ENV
	L2_38.task_career_info = {}
	L2_38 = _ENV
	L2_38.main_task_tips_cache = {}
	L2_38 = _ENV
	L2_38.recent_finish_main_task_list = {}
	L2_38 = _ENV
	L2_38._looked_weap_redpack_task_id = nil
	L2_38 = _ENV
	L2_38 = L2_38.reset_daily_task
	L2_38()
end
function L12_12.init_task_data(A0_39)
	local L1_40
	L1_40 = _ENV
	L1_40 = L1_40.task_data
	L5_44 = A0_39.type
	L1_40 = L1_40[L5_44]
	if not L1_40 then
		L1_40 = _ENV
		L1_40 = L1_40.task_data
		L5_44 = A0_39.type
		L6_45 = {}
		L1_40[L5_44] = L6_45
	end
	L1_40 = _ENV
	L1_40 = L1_40.task_data
	L5_44 = A0_39.type
	L1_40 = L1_40[L5_44]
	L5_44 = L1_40.done_dic
	if not L5_44 then
		L5_44 = {}
		L1_40.done_dic = L5_44
	else
		L5_44 = table
		L5_44 = L5_44.clear
		L6_45 = L1_40.done_dic
		L5_44(L6_45)
	end
	L5_44 = L1_40.doing_dic
	if not L5_44 then
		L5_44 = {}
		L1_40.doing_dic = L5_44
	else
		L5_44 = table
		L5_44 = L5_44.clear
		L6_45 = L1_40.doing_dic
		L5_44(L6_45)
	end
	L5_44 = A0_39.doing_info
	if L5_44 then
		L5_44 = L2_2
		L6_45 = A0_39.doing_info
		L5_44, L6_45, L9_48 = L5_44(L6_45)
		for L10_49, _FORV_6_ in L5_44, L6_45, L9_48 do
			L1_40.doing_dic[_FORV_6_.task_id] = _FORV_6_
		end
	end
	L5_44 = A0_39.done_list
	if L5_44 then
		L5_44 = L2_2
		L6_45 = A0_39.done_list
		L5_44, L6_45, L9_48 = L5_44(L6_45)
		for L10_49, _FORV_6_ in L5_44, L6_45, L9_48 do
			if L9_9.get_task_cfg(_FORV_6_) then
				({}).task_id = _FORV_6_
				;({}).progress = L9_9.get_task_cfg(_FORV_6_).target_num
				;({}).max_progress = L9_9.get_task_cfg(_FORV_6_).target_num
				L1_40.done_dic[_FORV_6_], ({}).status = {}, L6_6.task_status.finish
			end
		end
	end
end
function L12_12.accept_task(A0_50)
	local L1_51
	L1_51 = A0_50.task_id
	local L2_52 = L2_52
	L2_52 = L2_52(L1_51)
	if not L2_52 then
		return nil
	end
	local L3_53 = L3_53
	L3_53 = L3_53(L1_51)
	if not L3_53 then
		if not L7_7.task_data[L2_52.task_tp] then
			L7_7.task_data[L2_52.task_tp] = {}
		end
		if not L7_7.task_data[L2_52.task_tp].doing_dic then
			L7_7.task_data[L2_52.task_tp].doing_dic = {}
		end
		;({}).task_id = L2_52.id
		;({}).progress = 0
		;({}).max_progress = L2_52.target_num
		;({}).status = L6_6.task_status.is_accepted
		local L7_7.task_data[L2_52.task_tp].doing_dic[L2_52.id], ({}).npc_id, L8_58 = {}, A0_50.npc_id, L8_58
	end
	L8_58 = L21_21
	L8_58 = L8_58.trigger
	local L5_55 = L5_55
	local L6_56 = L6_56
	local L6_56[1], L7_57 = A0_50.task_id, L7_57
	L8_58(L5_55, L6_56)
end
function L12_12.update_task_data(A0_59)
	local L1_60, L2_61, L3_62
	L1_60 = A0_59.task_info
	if not L1_60 then
		return
	end
	L1_60 = _ENV
	L1_60 = L1_60.task_data
	L2_61 = A0_59.type
	L1_60 = L1_60[L2_61]
	if not L1_60 then
		L2_61 = _ENV
		L2_61 = L2_61.task_data
		L3_62 = A0_59.type
		L7_66 = {}
		L2_61[L3_62] = L7_66
		L2_61 = _ENV
		L2_61 = L2_61.task_data
		L3_62 = A0_59.type
		L1_60 = L2_61[L3_62]
	end
	L2_61 = L1_60.doing_dic
	if not L2_61 then
		L2_61 = {}
		L1_60.doing_dic = L2_61
	end
	L2_61 = L1_60.done_dic
	if not L2_61 then
		L2_61 = {}
		L1_60.done_dic = L2_61
	end
	L2_61 = A0_59.task_info
	L3_62 = {}
	L7_66 = L2_2
	L8_67 = L2_61
	L7_66, L8_67, _FOR_ = L7_66(L8_67)
	for _FORV_7_, _FORV_8_ in L7_66, L8_67, _FOR_ do
		if L9_9.get_task_cfg(_FORV_8_.task_id) then
			({}).id = _FORV_8_.task_id
			L3_62[_FORV_8_.task_id], ({}).cur_status = {}, _FORV_8_.status
			if _FORV_8_.status == L6_6.task_status.finish then
				if L1_60.doing_dic[_FORV_8_.task_id] then
					L3_62[_FORV_8_.task_id].pre_status = L1_60.doing_dic[_FORV_8_.task_id].status
				end
				L1_60.doing_dic[_FORV_8_.task_id] = nil
				;({}).task_id = _FORV_8_.task_id
				;({}).progress = L9_9.get_task_cfg(_FORV_8_.task_id).target_num
				;({}).max_progress = L9_9.get_task_cfg(_FORV_8_.task_id).target_num
				L1_60.done_dic[_FORV_8_.task_id], ({}).status = {}, L6_6.task_status.finish
			else
				if L1_60.doing_dic[_FORV_8_.task_id] then
					L3_62[_FORV_8_.task_id].pre_status = L1_60.doing_dic[_FORV_8_.task_id].status
				end
				L1_60.doing_dic[_FORV_8_.task_id] = _FORV_8_
				if _UPVALUE4_((L9_9.get_task_cfg(_FORV_8_.task_id))) then
					L1_60.done_dic[_FORV_8_.task_id] = nil
				end
			end
		end
	end
	L7_66 = L20_20
	L7_66 = L7_66.brocast
	L8_67 = L8_8
	L8_67 = L8_67.update_task_info
	L13_72 = L3_62
	L7_66(L8_67, L13_72)
	L7_66 = L3_3
	L8_67 = L3_62
	L7_66, L8_67, L13_72 = L7_66(L8_67)
	for _FORV_7_, _FORV_8_ in L7_66, L8_67, L13_72 do
		local ({})[1], L12_71 = _FORV_7_, L12_71
		L12_71(L21_21.const.trigger_type.task_change_status, {})
	end
end
function L12_12.delete_task_data(A0_73)
	local L1_74
	L1_74 = A0_73.task_list
	if not L1_74 then
		return
	end
	L1_74 = _ENV
	L1_74 = L1_74.task_data
	L6_79 = A0_73.type
	L1_74 = L1_74[L6_79]
	if not L1_74 then
		L1_74 = _ENV
		L1_74 = L1_74.task_data
		L6_79 = A0_73.type
		L1_74[L6_79] = {}
	end
	L1_74 = {}
	L6_79 = L2_2
	L6_79, _FOR_, _FOR_ = L6_79(A0_73.task_list)
	for _FORV_5_, _FORV_6_ in L6_79, _FOR_, _FOR_ do
		({}).id = _FORV_6_
		if _ENV.get_task_data_by_id(_FORV_6_) then
		end
		;({}).pre_status = _ENV.get_task_data_by_id(_FORV_6_).status
		L1_74[_FORV_6_], ({}).cur_status = {}, nil
	end
	L6_79 = _ENV
	L6_79 = L6_79.task_data
	L7_80 = A0_73.type
	L6_79 = L6_79[L7_80]
	L7_80 = L6_79.doing_dic
	if L7_80 then
		L7_80 = L2_2
		L7_80, _FOR_, _FOR_ = L7_80(A0_73.task_list)
		for _FORV_6_, _FORV_7_ in L7_80, _FOR_, _FOR_ do
			L6_79.doing_dic[_FORV_7_] = nil
		end
	end
	L7_80 = L6_79.done_dic
	if L7_80 then
		L7_80 = L2_2
		L7_80, _FOR_, _FOR_ = L7_80(A0_73.task_list)
		for _FORV_6_, _FORV_7_ in L7_80, _FOR_, _FOR_ do
			L6_79.done_dic[_FORV_7_] = nil
		end
	end
	L7_80 = L20_20
	L7_80 = L7_80.brocast
	L7_80(L8_8.update_task_info, L1_74)
	L7_80 = L3_3
	L7_80, L4_77, _FOR_ = L7_80(L1_74)
	for _FORV_6_, _FORV_7_ in L7_80, L4_77, _FOR_ do
		local ({})[1], L11_84 = _FORV_6_, L11_84
		L11_84(L21_21.const.trigger_type.task_change_status, {})
	end
end
function L12_12.finish_task(A0_85)
	local L8_93, L9_94 = _ENV.get_task_cfg, L9_94
	L9_94 = A0_85
	L8_93 = L8_93(L9_94)
	if not L8_93 then
		return
	end
	L9_94 = {}
	local L3_88 = L3_88
	local L3_88, L4_89 = L3_88(A0_85), L4_89
	if L3_88 then
		L4_89 = {}
		L4_89.id = A0_85
		L4_89.pre_status = L3_88.status
		L4_89.cur_status = L6_6.task_status.finish
		L9_94[A0_85] = L4_89
	end
	L4_89 = L7_7
	L4_89 = L4_89.task_data
	L4_89 = L4_89[L8_93.task_tp]
	if not L4_89 then
		L4_89 = L7_7
		L4_89 = L4_89.task_data
		L4_89[L8_93.task_tp] = {}
	end
	L4_89 = L7_7
	L4_89 = L4_89.task_data
	L4_89 = L4_89[L8_93.task_tp]
	if not L4_89.doing_dic then
		L4_89.doing_dic = {}
	end
	if not L4_89.done_dic then
		L4_89.done_dic = {}
	end
	L4_89.doing_dic[A0_85] = nil
	;({}).task_id = A0_85
	;({}).progress = L8_93.target_num
	;({}).max_progress = L8_93.target_num
	L4_89.done_dic[A0_85], ({}).status = {}, L6_6.task_status.finish
	L20_20.brocast(L8_8.update_task_info, L9_94)
	L20_20.brocast(L8_8.update_daily_liveness_info)
	_FOR_, _FOR_, _FOR_ = L3_3(L9_94)
	for _FORV_8_, _FORV_9_ in _FOR_, _FOR_, _FOR_ do
		({})[1] = _FORV_8_
		L21_21.trigger(L21_21.const.trigger_type.task_change_status, {})
	end
	L10_95 = _ENV
	L10_95 = L10_95.get_task_cfg
	L11_96 = A0_85
	L10_95 = L10_95(L11_96)
	if L10_95 then
		L11_96 = L10_95.get_jump
		if L11_96 then
			L11_96 = L24_24
			L11_96 = L11_96.jump_to
			L12_97 = L10_95.get_jump
			L11_96(L12_97)
		end
	end
end
function L12_12.finish_batch_task(A0_99)
	local L1_100
	L1_100 = {}
	L5_104 = _ENV
	L6_105 = A0_99
	L5_104, L6_105, _FOR_ = L5_104(L6_105)
	for _FORV_5_, _FORV_6_ in L5_104, L6_105, _FOR_ do
		if not L9_9.get_task_cfg(_FORV_6_) then
			return
		end
		if L7_7.get_task_data_by_id(_FORV_6_) then
			({}).id = _FORV_6_
			;({}).pre_status = L7_7.get_task_data_by_id(_FORV_6_).status
			L1_100[_FORV_6_], ({}).cur_status = {}, L6_6.task_status.finish
		end
		if not L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp] then
			L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp] = {}
		end
		if not L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp].doing_dic then
			L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp].doing_dic = {}
		end
		if not L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp].done_dic then
			L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp].done_dic = {}
		end
		L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp].doing_dic[_FORV_6_] = nil
		;({}).task_id = _FORV_6_
		;({}).progress = L9_9.get_task_cfg(_FORV_6_).target_num
		;({}).max_progress = L9_9.get_task_cfg(_FORV_6_).target_num
		L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp].done_dic[_FORV_6_], ({}).status = {}, L6_6.task_status.finish
	end
	L5_104 = _ENV
	L6_105 = L1_100
	L5_104, L6_105, L12_111 = L5_104(L6_105)
	for _FORV_5_, _FORV_6_ in L5_104, L6_105, L12_111 do
		local ({})[1], L10_109 = _FORV_5_, L10_109
		L10_109(L21_21.const.trigger_type.task_change_status, {})
	end
	L5_104 = L20_20
	L5_104 = L5_104.brocast
	L6_105 = L8_8
	L6_105 = L6_105.update_task_info
	L12_111 = L1_100
	L5_104(L6_105, L12_111)
	L5_104 = L20_20
	L5_104 = L5_104.brocast
	L6_105 = L8_8
	L6_105 = L6_105.update_daily_liveness_info
	L5_104(L6_105)
end
function L12_12.get_task_data_by_type(A0_112, A1_113)
	local L2_114, L3_115
	L2_114 = {}
	L3_115 = _ENV
	L3_115 = L3_115.task_data
	L3_115 = L3_115[A0_112]
	if not L3_115 then
		return L2_114
	end
	L7_119 = L3_115.doing_dic
	if L7_119 then
		L7_119 = L3_3
		L7_119, _FOR_, _FOR_ = L7_119(L3_115.doing_dic)
		for _FORV_7_, _FORV_8_ in L7_119, _FOR_, _FOR_ do
			if _FORV_8_.status ~= L6_6.task_status.failed and (not L6_6.daily_task_setting[A0_112] or L5_5.is_show_daily_task(A0_112, _FORV_8_.task_id)) then
				_FORV_8_.can_get = _FORV_8_.status == L6_6.task_status.can_get
				L0_0(L2_114, _FORV_8_)
			end
		end
		if A1_113 then
			L7_119 = L3_115.done_dic
			if L7_119 then
				L7_119 = L3_3
				L8_120 = L3_115.done_dic
				L7_119, L8_120, _FOR_ = L7_119(L8_120)
				for _FORV_7_, _FORV_8_ in L7_119, L8_120, _FOR_ do
					if not L6_6.daily_task_setting[A0_112] or L5_5.is_show_daily_task(A0_112, _FORV_8_.task_id) then
						L0_0(L2_114, _FORV_8_)
					end
				end
			end
		end
	end
	return L2_114
end
function L12_12.get_done_task_data_by_type(A0_124)
	local L1_125, L2_126
	L1_125 = _ENV
	L1_125 = L1_125.task_data
	L1_125 = L1_125[A0_124]
	if L1_125 then
		L2_126 = L1_125.done_dic
		if not L2_126 then
			L2_126 = _UPVALUE1_
		end
		return L2_126
	end
end
function L12_12.current_has_one_task_by_type_and_condition(A0_127, A1_128)
	local L2_129, L3_130
	L2_129 = _ENV
	L2_129 = L2_129.task_data
	if not L2_129 then
		L2_129 = false
		return L2_129
	end
	L2_129 = _ENV
	L2_129 = L2_129.task_data
	L2_129 = L2_129[A0_127]
	if not L2_129 then
		L3_130 = false
		return L3_130
	end
	L3_130 = nil
	L7_134 = L2_129.done_dic
	if L7_134 then
		L7_134 = L3_3
		L8_135 = L2_129.done_dic
		L7_134, L8_135, _FOR_ = L7_134(L8_135)
		for _FORV_7_, _FORV_8_ in L7_134, L8_135, _FOR_ do
			L3_130 = L9_9.get_task_cfg(_FORV_8_.task_id)
			if L3_130 and L3_130.conditon == A1_128 then
				return true
			end
		end
	end
	L7_134 = L2_129.doing_dic
	if L7_134 then
		L7_134 = L3_3
		L8_135 = L2_129.doing_dic
		L7_134, L8_135, _FOR_ = L7_134(L8_135)
		for _FORV_7_, _FORV_8_ in L7_134, L8_135, _FOR_ do
			L3_130 = L9_9.get_task_cfg(_FORV_8_.task_id)
			if L3_130 and L3_130.conditon == A1_128 then
				return true
			end
		end
	end
	L7_134 = false
	return L7_134
end
function L12_12.get_task_data_by_id(A0_138)
	local L3_141 = _ENV.get_task_cfg
	local L3_141, L2_140 = L3_141(A0_138), L2_140
	if not L3_141 then
		L2_140 = nil
		return L2_140
	end
	L2_140 = L7_7
	L2_140 = L2_140.task_data
	L2_140 = L2_140[L3_141.task_tp]
	if L2_140 then
		if L2_140.done_dic and L2_140.done_dic[A0_138] then
			return L2_140.done_dic[A0_138]
		elseif L2_140.doing_dic and L2_140.doing_dic[A0_138] then
			return L2_140.doing_dic[A0_138]
		end
	end
end
function L12_12.get_task_data_by_id_list(A0_142)
	local L1_143
	L1_143 = {}
	L4_146 = _ENV
	L5_147 = A0_142
	L4_146, L5_147, L6_148 = L4_146(L5_147)
	for _FORV_5_, _FORV_6_ in L4_146, L5_147, L6_148 do
		if L9_9.get_task_cfg(_FORV_6_) and L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp] then
			if L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp].done_dic and L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp].done_dic[_FORV_6_] then
				L0_0(L1_143, L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp].done_dic[_FORV_6_])
			elseif L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp].doing_dic and L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp].doing_dic[_FORV_6_] then
				local L9_151 = L9_151
				local L10_152 = L10_152
				L0_0(L1_143, L7_7.task_data[L9_9.get_task_cfg(_FORV_6_).task_tp].doing_dic[_FORV_6_])
				local L11_153 = L11_153
			end
		end
	end
	return L1_143
end
function L12_12.sort_task_list(A0_154)
	local L1_155, L3_157 = L1_155, A0_154
	L1_155(L3_157, function(A0_158, A1_159)
		local L5_163, L6_164, L7_165, L8_166, L9_167 = _ENV.get_task_cfg, L6_164, L7_165, L8_166, L9_167
		L6_164 = A0_158.task_id
		L5_163 = L5_163(L6_164)
		L6_164 = _ENV
		L6_164 = L6_164.get_task_cfg
		L7_165 = A1_159.task_id
		L6_164 = L6_164(L7_165)
		L7_165 = A0_158.status
		L8_166 = L6_6
		L8_166 = L8_166.task_status
		L8_166 = L8_166.finish
		L7_165 = L7_165 == L8_166
		L8_166 = A1_159.status
		L9_167 = L6_6
		L9_167 = L9_167.task_status
		L9_167 = L9_167.finish
		L8_166 = L8_166 == L9_167
		if L7_165 ~= L8_166 then
			L9_167 = not L7_165
			return L9_167
		end
		L9_167 = A0_158.status
		L9_167 = L9_167 == L6_6.task_status.can_get
		if L5_163 and L5_163.open_func and not L26_26.is_open(L5_163.open_func) then
		end
		if L6_164 and L6_164.open_func and not L26_26.is_open(L6_164.open_func) then
		end
		if true ~= true then
			return true
		end
		if L9_167 ~= (A1_159.status == L6_6.task_status.can_get) then
			return L9_167
		end
		if L5_163 and L6_164 and L5_163.sub_task_tp ~= L6_164.sub_task_tp then
			local L10_168 = L10_168
			local L11_169 = L11_169
			local L12_170 = L12_170
			if L7_7.compare_task_tp(L5_163, L6_164) ~= nil then
				return (L7_7.compare_task_tp(L5_163, L6_164))
			end
		end
		return A0_158.task_id < A1_159.task_id
	end)
end
function L12_12.sort_zhixian_task_list(A0_171)
	local L1_172, L3_174 = L1_172, A0_171
	L1_172(L3_174, function(A0_175, A1_176)
		local L2_177, L3_178, L4_179, L5_180, L6_181, L7_182
		L2_177 = A0_175.task_id
		if L2_177 ~= 0 then
			L2_177 = A1_176.task_id
			if L2_177 ~= 0 then
				goto lbl_13
			end
		end
		L2_177 = A0_175.task_id
		L2_177 = L2_177 == 0
		do return L2_177 end
		::lbl_13::
		L2_177 = A0_175.status
		L3_178 = _ENV
		L3_178 = L3_178.task_status
		L3_178 = L3_178.finish
		L2_177 = L2_177 == L3_178
		L3_178 = A1_176.status
		L4_179 = _ENV
		L4_179 = L4_179.task_status
		L4_179 = L4_179.finish
		L3_178 = L3_178 == L4_179
		L4_179 = A0_175.status
		L5_180 = _ENV
		L5_180 = L5_180.task_status
		L5_180 = L5_180.can_get
		L4_179 = L4_179 == L5_180
		L5_180 = A1_176.status
		L6_181 = _ENV
		L6_181 = L6_181.task_status
		L6_181 = L6_181.can_get
		L5_180 = L5_180 == L6_181
		L6_181 = false
		L7_182 = false
		local L8_183 = L8_183
		L8_183 = L8_183(A0_175.task_id)
		local L9_184 = L9_184
		L9_184 = L9_184(A1_176.task_id)
		if L8_183 and L8_183.open_func and not L26_26.is_open(L8_183.open_func) then
			L6_181 = true
		end
		if L9_184 and L9_184.open_func and not L26_26.is_open(L9_184.open_func) then
			L7_182 = true
		end
		if L6_181 ~= L7_182 then
			return L7_182
		end
		if L4_179 ~= L5_180 then
			return L4_179
		end
		if L2_177 ~= L3_178 then
			return not L2_177
		end
		if L8_183 and L9_184 and L8_183.sub_task_tp ~= L9_184.sub_task_tp then
			local L10_185 = L10_185
			local L11_186 = L11_186
			local L10_185, L12_187 = L10_185(L11_186, L9_184), L12_187
			if L10_185 ~= nil then
				return L10_185
			end
		end
		L10_185 = A0_175.task_id
		L11_186 = A1_176.task_id
		L10_185 = L10_185 > L11_186
		return L10_185
	end)
end
function L12_12.update_main_info(A0_188)
	local L1_189
	L1_189 = _ENV
	L1_189.main_info = A0_188
end
function L12_12.get_main_stage()
	local L0_190, L1_191
	L0_190 = _ENV
	L0_190 = L0_190.main_info
	if L0_190 then
		L0_190 = _ENV
		L0_190 = L0_190.main_info
		L0_190 = L0_190.num
		if L0_190 then
			goto lbl_11
		end
	end
	L0_190 = 0
	::lbl_11::
	return L0_190
end
function L12_12.is_get_main_stage_reward(A0_192)
	L3_195 = _ENV.main_info
	if L3_195 then
		L3_195 = _ENV
		L3_195 = L3_195.main_info
		L3_195 = L3_195.list
		if L3_195 then
			L3_195 = L2_2
			L4_196 = _ENV
			L4_196 = L4_196.main_info
			L4_196 = L4_196.list
			L3_195, L4_196, L5_197 = L3_195(L4_196)
			for L6_198, _FORV_5_ in L3_195, L4_196, L5_197 do
				if _FORV_5_ == A0_192 then
					return true
				end
			end
		end
	end
	L3_195 = false
	return L3_195
end
function L12_12.can_get_main_stage_reward(A0_199)
	local L3_202 = _ENV.is_get_main_stage_reward
	L3_202 = L3_202(A0_199)
	if not L3_202 then
		L3_202 = L30_30
		L3_202 = L3_202.get_cfg_by_id
		local L3_202, L2_201 = L3_202(A0_199), L2_201
		L2_201 = _ENV
		L2_201 = L2_201.main_info
		if L2_201 then
			L2_201 = _ENV
			L2_201 = L2_201.main_info
			L2_201 = L2_201.num
			if L2_201 then
				L2_201 = _ENV
				L2_201 = L2_201.main_info
				L2_201 = L2_201.num
				L2_201 = L2_201 >= L3_202.finish_num
				return L2_201
			end
		end
	end
	L3_202 = false
	return L3_202
end
function L12_12.finish_main_task(A0_203)
	local L3_206, L4_207 = _ENV.main_info, L4_207
	if L3_206 then
		L3_206 = _ENV
		L3_206 = L3_206.main_info
		L3_206 = L3_206.num
		if not L3_206 then
			L3_206 = _ENV
			L3_206 = L3_206.main_info
			L3_206.num = 0
		end
		L3_206 = L9_9
		L3_206 = L3_206.get_task_cfg
		L4_207 = A0_203
		L3_206 = L3_206(L4_207)
		if L3_206 then
			L4_207 = L3_206.liveness
			if L4_207 then
				goto lbl_23
			end
		end
		L4_207 = 1
		::lbl_23::
		_ENV.main_info.num = _ENV.main_info.num + L4_207
	end
end
function L12_12.get_main_stage_reward(A0_208)
	local L1_209 = L1_209
	L1_209 = L1_209(A0_208)
	if L7_7.main_info then
		if not L7_7.main_info.list then
			L7_7.main_info.list = {}
		end
		local L2_210 = L2_210
		local L3_211 = L3_211
		L2_210(L3_211, A0_208)
		local L4_212 = L4_212
	end
end
function L12_12.get_task_career_reward(A0_213)
	local L1_214 = L1_214
	L1_214 = L1_214(A0_213)
	if L7_7.task_career_info then
		if not L7_7.task_career_info.list then
			L7_7.task_career_info.list = {}
		end
		local L2_215 = L2_215
		local L3_216 = L3_216
		L2_215(L3_216, A0_213)
		local L4_217 = L4_217
	end
end
function L12_12.get_show_main_task(A0_218)
	local L1_219 = L1_219
	L1_219 = L1_219(L27_27.type.show_task_node)
	if not L1_219 then
		L1_219 = nil
		return L1_219
	end
	L1_219 = L7_7
	L1_219 = L1_219.get_task_data_by_id
	L1_219 = L1_219(L25_25.get_date_stage_task_id())
	if L1_219 and L1_219.status ~= L6_6.task_status.finish then
		return L1_219
	end
	local L2_220 = L2_220
	local L2_220, L3_221 = L2_220(A0_218)
	if L2_220 then
		return L2_220, L3_221
	end
	local L4_222 = L4_222
	L4_222 = L4_222(L6_6.task_type.zhixian)
	if next(L4_222) then
		return L4_222[1]
	end
	local L5_223 = L5_223
	L5_223 = L5_223(L6_6.task_type.daily)
	local L6_224 = L6_224
	local L6_224, L7_225 = L6_224(L5_223), L7_225
	if L6_224 then
		L6_224 = L5_223[1]
		return L6_224
	end
	L6_224 = {}
	L6_224.is_all_done = true
	return L6_224
end
function L12_12.get_main_task(A0_226, A1_227, A2_228)
	local L10_236 = _ENV.get_task_data_by_type
	L10_236 = L10_236(L6_6.task_type.main)
	_ENV.sort_task_list(L10_236)
	local L4_230 = L4_230
	L4_230 = L4_230("show_task_type")
	if 0 < #L10_236 then
		local L5_231 = L5_231
		L5_231 = L5_231(L6_6.task_type.main)
		table.clear(_UPVALUE2_)
		table.clear(_UPVALUE3_)
		L1_1(L10_236, function(A0_240, A1_241)
			local L2_242, L3_243
			L2_242 = A0_240.status
			local L3_243, L9_249, L10_250, L11_251, L12_252 = _ENV, L9_249, L10_250, L11_251, L12_252
			L3_243 = L3_243.task_status
			L3_243 = L3_243.can_get
			L2_242 = L2_242 == L3_243
			L3_243 = A1_241.status
			L9_249 = _ENV
			L9_249 = L9_249.task_status
			L9_249 = L9_249.can_get
			L3_243 = L3_243 == L9_249
			if L2_242 ~= L3_243 then
				return L2_242
			end
			L9_249 = L9_9
			L9_249 = L9_249.get_task_cfg
			L10_250 = A0_240.task_id
			L9_249 = L9_249(L10_250)
			L10_250 = L9_9
			L10_250 = L10_250.get_task_cfg
			L11_251 = A1_241.task_id
			L10_250 = L10_250(L11_251)
			if L9_249 then
				L11_251 = type
				L12_252 = L9_249.task_priority
				L11_251 = L11_251(L12_252)
				if L11_251 == "number" then
					L11_251 = L9_249.task_priority
					if L11_251 then
						goto lbl_39
					end
				end
			end
			L11_251 = 9999
			::lbl_39::
			if L10_250 then
				L12_252 = type
				local L12_252, L8_248 = L12_252(L10_250.task_priority), L8_248
				if L12_252 == "number" then
					L12_252 = L10_250.task_priority
					if L12_252 then
						goto lbl_50
					end
				end
			end
			L12_252 = 9999
			::lbl_50::
			if L11_251 ~= L12_252 then
				L8_248 = L11_251 < L12_252
				return L8_248
			end
			L8_248 = _ENV
			L8_248 = L8_248.main_task_priority
			L8_248 = L11_251 == L8_248
			if L8_248 and L12_252 == _ENV.main_task_priority then
				return A0_240.task_id < A1_241.task_id
			end
			if _UPVALUE2_ and (L9_249 and L9_249.sub_task_tp == _UPVALUE2_) ~= (L10_250 and L10_250.sub_task_tp == _UPVALUE2_) then
				return L9_249 and L9_249.sub_task_tp == _UPVALUE2_
			end
			if L4_230 and (L9_249 and L9_249.task_tp == L4_230) ~= (L10_250 and L10_250.task_tp == L4_230) then
				return L9_249 and L9_249.task_tp == L4_230
			end
			return A0_240.task_id < A1_241.task_id
		end)
	end
	if not A0_226 then
		A0_226 = 1
	end
	L5_231 = false
	L9_235 = L2_2
	L9_235, _FOR_, _FOR_ = L9_235(L10_236)
	for _FORV_9_, _FORV_10_ in L9_235, _FOR_, _FOR_ do
		if L9_9.get_task_cfg(_FORV_10_.task_id).task_priority == L6_6.main_task_priority then
			L5_231 = true
			A0_226 = 1
			break
		end
		if _FORV_10_.status == L6_6.task_status.can_get then
			L5_231 = true
			A0_226 = 1
			break
		end
	end
	if not L5_231 and A1_227 then
		L9_235 = L2_2
		L13_239 = L10_236
		L9_235, L13_239, _FOR_ = L9_235(L13_239)
		for _FORV_9_, _FORV_10_ in L9_235, L13_239, _FOR_ do
			if _FORV_10_.task_id == A1_227 then
				A0_226 = _FORV_9_
				break
			end
		end
	end
	L9_235 = #L10_236
	if A0_226 > L9_235 then
		A0_226 = 1
	end
	L9_235 = _ENV
	L9_235 = L9_235.set_value
	L13_239 = "show_task_type_index"
	L9_235(L13_239, A0_226)
	local L8_234 = L8_234
	L9_235 = #L10_236
	if 0 < L9_235 then
		L9_235 = L10_236[A0_226]
		if L9_235 then
			goto lbl_111
		end
	end
	L9_235 = nil
	::lbl_111::
	L13_239 = #L10_236
	L13_239 = 1 < L13_239
	return L9_235, L13_239
end
function L12_12.get_main_recommend_task()
	local L6_259 = _ENV.get_task_data_by_type
	local L6_259, L1_254 = L6_259(L6_6.task_type.main), L1_254
	L1_254 = 9999999
	L2_255, _FOR_, _FOR_ = L2_255(L6_259)
	for _FORV_5_, _FORV_6_ in L2_255, _FOR_, _FOR_ do
		if L9_9.get_task_cfg(_FORV_6_.task_id) and L9_9.get_task_cfg(_FORV_6_.task_id).task_priority and type(L9_9.get_task_cfg(_FORV_6_.task_id).task_priority) == "number" and L9_9.get_task_cfg(_FORV_6_.task_id).task_priority ~= 1 then
			L1_254 = math.min(L1_254, L9_9.get_task_cfg(_FORV_6_.task_id).task_priority)
		end
	end
	L2_255 = 0
	L7_260 = L2_2
	L10_263 = L6_259
	L7_260, L10_263, _FOR_ = L7_260(L10_263)
	for _FORV_6_, _FORV_7_ in L7_260, L10_263, _FOR_ do
		if L9_9.get_task_cfg(_FORV_7_.task_id) and L9_9.get_task_cfg(_FORV_7_.task_id).task_priority == L1_254 then
			L2_255 = L2_255 + 1
		end
	end
	if L2_255 == 1 then
		L7_260 = L2_2
		L10_263 = L6_259
		L7_260, L10_263, _FOR_ = L7_260(L10_263)
		for _FORV_6_, _FORV_7_ in L7_260, L10_263, _FOR_ do
			if L9_9.get_task_cfg(_FORV_7_.task_id) and L9_9.get_task_cfg(_FORV_7_.task_id).task_priority == L1_254 then
				return _FORV_7_, L1_254
			end
		end
	end
end
function L12_12.get_main_other_task()
	local L0_264
	L0_264 = {}
	local L9_273, L10_274, L11_275, L14_278, L15_279, L16_280 = _ENV, L10_274, L11_275, L14_278, L15_279, L16_280
	L9_273 = L9_273.get_task_data_by_type
	L10_274 = L6_6
	L10_274 = L10_274.task_type
	L10_274 = L10_274.daily
	L9_273 = L9_273(L10_274)
	L10_274 = _ENV
	L10_274 = L10_274.sort_task_list
	L11_275 = L9_273
	L10_274(L11_275)
	L10_274 = L0_0
	L11_275 = L0_264
	L14_278 = L9_273
	L10_274(L11_275, L14_278)
	L10_274 = _ENV
	L10_274 = L10_274.get_task_data_by_type
	L11_275 = L6_6
	L11_275 = L11_275.task_type
	L11_275 = L11_275.strength_rand
	L10_274 = L10_274(L11_275)
	L11_275 = _ENV
	L11_275 = L11_275.sort_task_list
	L14_278 = L10_274
	L11_275(L14_278)
	L11_275 = L0_0
	L14_278 = L0_264
	L15_279 = L10_274
	L11_275(L14_278, L15_279)
	L11_275 = _ENV
	L11_275 = L11_275.get_task_data_by_type
	L14_278 = L6_6
	L14_278 = L14_278.task_type
	L14_278 = L14_278.alliance_invite
	L11_275 = L11_275(L14_278)
	L14_278 = _ENV
	L14_278 = L14_278.sort_task_list
	L15_279 = L11_275
	L14_278(L15_279)
	L14_278 = L0_0
	L15_279 = L0_264
	L16_280 = L11_275
	L14_278(L15_279, L16_280)
	L14_278 = _ENV
	L14_278 = L14_278.get_task_data_by_type
	L15_279 = L6_6
	L15_279 = L15_279.task_type
	L15_279 = L15_279.zhixian
	L14_278 = L14_278(L15_279)
	L15_279 = _ENV
	L15_279 = L15_279.sort_zhixian_task_list
	L16_280 = L14_278
	L15_279(L16_280)
	L15_279 = L0_0
	L16_280 = L0_264
	L18_282 = L14_278
	L15_279(L16_280, L18_282)
	L15_279 = nil
	L16_280 = nil
	L18_282 = L2_2
	L19_283 = L0_264
	L18_282, L19_283, _FOR_ = L18_282(L19_283)
	for _FORV_10_, _FORV_11_ in L18_282, L19_283, _FOR_ do
		_FOR_, _FOR_, _FOR_ = L2_2(_FORV_11_)
		for _FORV_15_, _FORV_16_ in _FOR_, _FOR_, _FOR_ do
			if not L15_279 then
				L15_279 = _FORV_16_
			end
			if _FORV_16_.over_time and _FORV_16_.over_time > 0 then
				if 0 < _FORV_16_.over_time - L29_29.get_server_time() and _FORV_16_.over_time - L29_29.get_server_time() <= 86400 then
					if L16_280 then
						if _FORV_16_.over_time - L29_29.get_server_time() < L16_280.over_time - L29_29.get_server_time() then
							L16_280 = _FORV_16_
						end
					else
						L16_280 = _FORV_16_
					end
				end
			end
		end
	end
	L18_282 = L16_280 or L18_282
	if not L16_280 then
		L18_282 = L15_279
	end
	return L18_282
end
function L12_12.compare_task_tp(A0_284, A1_285)
	local L2_286 = L2_286
	L2_286 = L2_286(A0_284.task_tp, A0_284.sub_task_tp)
	local L3_287 = L3_287
	local L4_288 = L4_288
	local L3_287, L5_289 = L3_287(L4_288, A1_285.sub_task_tp), L5_289
	if L2_286 and L3_287 then
		L4_288 = L2_286.order
		L5_289 = L3_287.order
		L4_288 = L4_288 < L5_289
		return L4_288
	end
end
function L12_12.update_role_equip_be_task(A0_290)
	if A0_290 then
		_ENV.role_equip_be_task = A0_290
	else
		local L1_291 = L1_291
		L1_291(_ENV.role_equip_be_task)
		local L2_292 = L2_292
	end
end
function L12_12.get_role_equip_be_task()
	local L0_293
	L0_293 = {}
	L3_296 = _ENV
	L4_297 = L7_7
	L4_297 = L4_297.role_equip_be_task
	L3_296, L4_297, L5_298 = L3_296(L4_297)
	for _FORV_4_, _FORV_5_ in L3_296, L4_297, L5_298 do
		_FORV_5_.name = "\229\188\186\229\140\150\232\191\148\232\191\152"
		_FORV_5_.desc = string.format("\229\174\140\230\136\144%s\228\184\170\229\188\186\229\140\150\228\187\187\229\138\161\229\144\142\230\142\165\229\143\150\228\187\187\229\138\161", _FORV_4_)
		_FORV_5_.is_custom = true
		L1_1(_FORV_5_.list, function(A0_302, A1_303)
			local L5_307 = _ENV.get_item
			L5_307 = L5_307(A0_302.item_cid)
			local L3_305 = L3_305
			local L3_305, L4_306 = L3_305(A1_303.item_cid), L4_306
			L4_306 = L5_307.quality
			L4_306 = L4_306 > L3_305.quality
			return L4_306
		end)
		L0_0(L0_293, _FORV_5_)
		local L8_301 = L8_301
	end
	return L0_293
end
function L12_12.update_task_career_info(A0_308)
	local L1_309
	if A0_308 then
		L1_309 = _ENV
		L1_309.task_career_info = A0_308
	end
end
function L12_12.get_task_career_info()
	local L0_310, L1_311
	L0_310 = _ENV
	L0_310 = L0_310.task_career_info
	return L0_310
end
function L12_12.can_task_career_get(A0_312)
	local L1_313 = L1_313
	local L1_313, L2_314 = L1_313(A0_312), L2_314
	if L1_313 then
		L1_313 = false
		return L1_313
	end
	L1_313 = _ENV
	L1_313 = L1_313.task_career_info
	L1_313 = L1_313.num
	if not L1_313 then
		L1_313 = 0
	end
	L2_314 = A0_312.finish_num
	L2_314 = L1_313 >= L2_314
	return L2_314
end
function L12_12.has_task_career_get(A0_315)
	L3_318 = _ENV.task_career_info
	L3_318 = L3_318.list
	if L3_318 then
		L3_318 = L2_2
		L4_319 = _ENV
		L4_319 = L4_319.task_career_info
		L4_319 = L4_319.list
		L3_318, L4_319, L5_320 = L3_318(L4_319)
		for L6_321, _FORV_5_ in L3_318, L4_319, L5_320 do
			if _FORV_5_ == A0_315.id then
				return true
			end
		end
	end
	L3_318 = false
	return L3_318
end
function L12_12.set_recent_finish_main_task_list(A0_322)
	if A0_322 then
		_ENV.recent_finish_main_task_list = A0_322
		_ENV.update_recent_main_task_type()
		local L1_323 = L1_323
	end
end
function L12_12.update_recent_main_task_type()
	local L5_329 = table.clear
	L5_329(_ENV)
	L5_329 = table
	L5_329 = L5_329.clear
	L5_329(_UPVALUE1_)
	L5_329 = table
	L5_329 = L5_329.clear
	L5_329(_UPVALUE2_)
	L5_329 = L7_7
	L5_329 = L5_329.get_task_data_by_type
	L5_329 = L5_329(L6_6.task_type.main)
	_FOR_, _FOR_, _FOR_ = L2_2(L5_329)
	for _FORV_4_, _FORV_5_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_5_.status == L6_6.task_status.is_accepted and L9_9.get_task_cfg(_FORV_5_.task_id).task_priority == L6_6.zixuan_task_priority then
			_UPVALUE2_[L9_9.get_task_cfg(_FORV_5_.task_id).sub_task_tp] = true
		end
	end
	L1_325, _FOR_, _FOR_ = L1_325(_UPVALUE2_)
	for _FORV_4_, _FORV_5_ in L1_325, _FOR_, _FOR_ do
		table.insert(_UPVALUE1_, _FORV_4_)
	end
	L1_325 = nil
	L6_330 = _UPVALUE1_
	L6_330 = #L6_330
	if 1 < L6_330 then
		L6_330 = math
		L6_330 = L6_330.random
		L7_331 = 1
		L8_332 = _UPVALUE1_
		L8_332 = #L8_332
		repeat
			L6_330 = L6_330(L7_331, L8_332)
			L7_331 = _UPVALUE1_
			L1_325 = L7_331[L6_330]
			do break end -- pseudo-goto
			L6_330 = _UPVALUE1_
			L1_325 = L6_330[1]
		until true
	end
	L6_330 = L7_7
	L6_330.recent_main_task_type = L1_325
end
function L12_12.get_recent_task_main_type()
	local L0_333, L1_334
	L0_333 = _ENV
	L0_333 = L0_333.recent_main_task_type
	return L0_333
end
function L12_12.get_looked_weap_redpack_task_id()
	if _ENV._looked_weap_redpack_task_id then
		return _ENV._looked_weap_redpack_task_id
	end
	local L0_335 = L0_335
	local L0_335, L1_336 = L0_335(L6_6.looked_weap_redpack_task_id_save_key), L1_336
	L1_336 = _ENV
	local L2_337 = L2_337
	if not L0_335 then
	end
	local L2_337, L3_338 = L2_337(0), L3_338
	if not L2_337 then
		L2_337 = 0
	end
	L1_336._looked_weap_redpack_task_id = L2_337
	L1_336 = _ENV
	L1_336 = L1_336._looked_weap_redpack_task_id
	return L1_336
end
function L12_12.set_looked_weap_redpack_task_id(A0_339)
	if A0_339 == nil then
		return
	end
	local L1_340 = _ENV.get_looked_weap_redpack_task_id()
	if A0_339 <= L1_340 then
		return
	end
	_ENV._looked_weap_redpack_task_id = A0_339
	local L4_343 = L4_343
	local L5_344 = L5_344
	L4_343(L5_344, tostring(A0_339))
	L4_343 = L5_5
	L4_343 = L4_343.trigger_task_red_point
	L5_344 = L6_6
	L5_344 = L5_344.task_type
	L5_344 = L5_344.zhixian
	L4_343(L5_344)
end
