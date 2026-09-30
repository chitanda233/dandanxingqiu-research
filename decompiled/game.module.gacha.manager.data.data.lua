local L0_0, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19 = L0_0, table, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19
L6_6 = L6_6.remove
L0_0 = L0_0(L6_6)
L6_6 = assert
L7_7 = table
L7_7 = L7_7.insert
L6_6 = L6_6(L7_7)
L7_7 = assert
L8_8 = table
L8_8 = L8_8.sort
L7_7 = L7_7(L8_8)
L8_8 = assert
L9_9 = import
L10_10 = "..head"
L9_9 = L9_9(L10_10)
L10_10 = Game
L10_10 = L10_10.events
L11_11 = DataConfigs
L12_12 = L11_11.item
L13_13 = L11_11.gacha
L14_14 = L11_11.gacha_lv
L15_15 = L11_11.gacha_wish
L16_16 = L11_11.equip
L17_17 = L11_11.gacha_storage
L18_18 = L11_11.weapon_sit
L19_19 = Game
L19_19 = L19_19.module
L19_19 = L19_19.main_weapon_develop
L19_19 = L19_19.data
local L20_20 = L20_20
local L21_21 = L21_21
local L22_22 = L22_22
L8_8(L9_9.data).init = function()
	_ENV.reset()
end
L8_8(L9_9.data).clear = function()
	_ENV.reset()
end
L8_8(L9_9.data).reset = function()
	_ENV.gacha_info_dict = {}
	_ENV.gacha_wish_info = {}
	_ENV.gacha_wish_left_num = {}
	_ENV.gacha_up_wish_trigger_count = {}
	local _ENV.gacha_preview_info, L1_24 = {}, L1_24
	L1_24 = _ENV
	L1_24.cache_selected_id = nil
	L1_24 = _ENV
	L1_24 = L1_24.reset_wish_view_cache
	L1_24()
	L1_24 = _ENV
	L1_24.spin_item_list = {}
	L1_24 = _ENV
	L1_24.weapon_info_cache = {}
	L1_24 = _ENV
	L1_24.level_up_cache = {}
	L1_24 = _ENV
	L1_24.spin_cache = {}
	L1_24 = _ENV
	L1_24.spin_gain_item_list_cache = {}
	L1_24 = _ENV
	L1_24.red_point_show_times_cacha = {}
	L1_24 = _ENV
	L1_24.daily_wish_selected_item_cid_cache = nil
	L1_24 = _ENV
	L1_24.switch_camp_selected_storage_id_cache = nil
	L1_24 = _ENV
	L1_24.up_wish_selected_item_cid_list_cache = {}
	L1_24 = _ENV
	L1_24.resolve_forbid_dic = {}
end
L8_8(L9_9.data).reset_wish_view_cache = function()
	local L0_25, L1_26
	L0_25 = _ENV
	L1_26 = {}
	L0_25.wish_view_interact = L1_26
	L0_25 = _ENV
	L1_26 = {}
	L0_25.cache_wish_info = L1_26
	L0_25 = _ENV
	L1_26 = {}
	L0_25.cache_job_selected_order = L1_26
end
L8_8(L9_9.data).get_cfg_gacha_wish_info = function(A0_27)
	local L5_32, L6_33, L7_34, L12_39 = _ENV.get_config, L6_33, L7_34, L12_39
	L6_33 = _UPVALUE1_
	L6_33 = L6_33.gacha_info_dict
	L6_33 = L6_33[A0_27]
	L6_33 = L6_33.storage_id
	L5_32 = L5_32(L6_33)
	L6_33 = {}
	if L5_32 then
		L7_34 = L5_32.wish_id
		if L7_34 then
			L7_34 = L5_32.wish_id
			if L7_34 ~= 0 then
				L7_34 = L15_15
				L7_34 = L7_34.get_config
				L8_35 = L5_32.wish_id
				L7_34 = L7_34(L8_35)
				if L7_34 then
					L8_35 = 1
					L9_36 = L7_34.profession_type
					L9_36 = #L9_36
					L10_37 = 1
					for L11_38 = L8_35, L9_36, L10_37 do
						L12_39 = {}
						if L7_34.default_wish[L11_38] then
							_FOR_ = 1
							for _FORV_12_ = _FOR_, _FOR_, _FOR_ do
								({}).pos = _FORV_12_
								;({}).item_cid = L7_34.default_wish[L11_38][_FORV_12_]
								;({}).trigger_num = 0
								L1_1(L12_39, {})
							end
						end
						L13_40 = {}
						L13_40.job = L11_38
						L13_40.is_use = 0
						L13_40.wish_list = L12_39
						L6_33[L11_38] = L13_40
					end
				end
			end
		end
	end
	return L6_33
end
L8_8(L9_9.data).get_client_gacha_wish_info = function(A0_44)
	local L1_45, L2_46
	L1_45 = _ENV
	L1_45 = L1_45.gacha_wish_info
	L1_45 = L1_45[A0_44]
	if not L1_45 then
		L2_46 = nil
		return L2_46
	end
	L2_46 = clone
	L5_49 = _ENV
	L5_49 = L5_49.get_cfg_gacha_wish_info
	L6_50 = A0_44
	L5_49, L6_50, L8_51 = L5_49(L6_50)
	L2_46 = L2_46(L5_49, L6_50, L8_51, L5_49(L6_50))
	L5_49 = pairs
	L6_50 = L2_46
	L5_49, L6_50, L8_51 = L5_49(L6_50)
	for _FORV_6_, _FORV_7_ in L5_49, L6_50, L8_51 do
		if L1_45[_FORV_6_] then
			L2_46[_FORV_6_] = L1_45[_FORV_6_]
		end
	end
	return L2_46
end
L8_8(L9_9.data).get_view_gacha_wish_info = function(A0_52)
	local L4_56 = _ENV.get_client_gacha_wish_info
	L5_57 = A0_52
	L4_56 = L4_56(L5_57)
	if not L4_56 then
		L5_57 = nil
		return L5_57
	end
	L5_57 = pairs
	L7_58 = L4_56
	L5_57, L7_58, _FOR_ = L5_57(L7_58)
	for _FORV_5_, _FORV_6_ in L5_57, L7_58, _FOR_ do
		if _ENV.cache_wish_info[_FORV_5_] then
			L4_56[_FORV_5_] = _ENV.cache_wish_info[_FORV_5_]
		end
	end
	return L4_56
end
L8_8(L9_9.data).init_cache_job_selected_order = function(A0_59)
	L4_63 = _ENV.cache_job_selected_order
	L4_63 = #L4_63
	if L4_63 ~= 0 then
		return
	end
	L4_63 = _ENV
	L4_63 = L4_63.gacha_wish_info
	L4_63 = L4_63[A0_59]
	if not L4_63 then
		return
	end
	L4_63 = pairs
	L5_64 = _ENV
	L5_64 = L5_64.gacha_wish_info
	L5_64 = L5_64[A0_59]
	L4_63, L5_64, L10_69 = L4_63(L5_64)
	for _FORV_4_, _FORV_5_ in L4_63, L5_64, L10_69 do
		if _FORV_5_.is_use == 1 and _FORV_5_.wish_list then
			_FOR_ = 1
			for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
				if _FORV_5_.wish_list[_FORV_10_].trigger_num and 0 < _FORV_5_.wish_list[_FORV_10_].trigger_num then
				end
			end
		end
		if false then
			L1_1(_ENV.cache_job_selected_order, _FORV_4_)
			local L9_68 = L9_68
		end
	end
	L4_63 = L2_2
	L5_64 = _ENV
	L5_64 = L5_64.cache_job_selected_order
	function L10_69(A0_71, A1_72)
		local L2_73
		L2_73 = A0_71 < A1_72
		return L2_73
	end
	L4_63(L5_64, L10_69)
end
L8_8(L9_9.data).get_server_choosen_wish_num = function(A0_74)
	local L1_75, L2_76
	L1_75 = _ENV
	L1_75 = L1_75.gacha_wish_info
	L1_75 = L1_75[A0_74]
	if not L1_75 then
		L1_75 = 0
		return L1_75
	end
	L1_75 = 0
	L2_76 = _ENV
	L2_76 = L2_76.gacha_wish_info
	L2_76 = L2_76[A0_74]
	L5_79 = pairs
	L6_80 = L2_76
	L5_79, L6_80, L7_81 = L5_79(L6_80)
	for L8_82, _FORV_7_ in L5_79, L6_80, L7_81 do
		if _FORV_7_.is_use == 1 and _FORV_7_.wish_list then
			L1_75 = L1_75 + #_FORV_7_.wish_list
		end
	end
	return L1_75
end
L8_8(L9_9.data).get_can_choose_max_wish_num = function(A0_83)
	local L1_84
	L1_84 = _ENV
	local L1_84, L5_88 = L1_84.gacha_info_dict, L5_88
	L1_84 = L1_84[A0_83]
	L5_88 = L17_17
	L5_88 = L5_88.get_config
	L5_88 = L5_88(L1_84.storage_id)
	local L3_86 = L3_86
	local L3_86, L4_87 = L3_86(L5_88.wish_id), L4_87
	L4_87 = L3_86.profession_num
	L4_87 = L4_87 * L3_86.select_wish_num
	if L3_86.wish_type and L3_86.wish_type == 2 then
		L4_87 = L3_86.wish_num_type1
	end
	return L4_87
end
L8_8(L9_9.data).cache_up_wish_selected_item = function(A0_89)
	L4_93 = {}
	L3_92.up_wish_selected_item_cid_list_cache = L4_93
	L3_92 = _ENV
	L3_92 = L3_92.gacha_wish_info
	L3_92 = L3_92[A0_89]
	if L3_92 then
		L3_92 = pairs
		L4_93 = _ENV
		L4_93 = L4_93.gacha_wish_info
		L4_93 = L4_93[A0_89]
		L3_92, L4_93, L5_94 = L3_92(L4_93)
		for L6_95, L7_96 in L3_92, L4_93, L5_94 do
			L8_97 = L7_96.is_use
			if L8_97 == 1 then
				L8_97 = L7_96.wish_list
				if L8_97 then
					L8_97 = 1
					L9_98 = L7_96.wish_list
					L9_98 = #L9_98
					_FOR_ = 1
					for _FORV_9_ = L8_97, L9_98, _FOR_ do
						L1_1(_ENV.up_wish_selected_item_cid_list_cache, L7_96.wish_list[_FORV_9_].item_cid)
						local L12_101 = L12_101
					end
				end
			end
		end
	end
end
L8_8(L9_9.data).clear_cache_up_wish_selected_item = function()
	local L0_102, L1_103
	L0_102 = _ENV
	L1_103 = {}
	L0_102.up_wish_selected_item_cid_list_cache = L1_103
end
L8_8(L9_9.data).update_gacha_info = function(A0_104)
	if _ENV.gacha_info_dict[A0_104.c_id] and _ENV.gacha_info_dict[A0_104.c_id].lv < A0_104.lv then
		local L1_105 = L1_105
		L1_105 = L1_105(A0_104.c_id, A0_104.lv)
		if L1_105 and L1_105.alert_type and #L1_105.alert_type > 0 then
			_ENV.level_up_cache[A0_104.c_id] = A0_104.lv
			local L2_106 = L2_106
			local L3_107 = L3_107
			L2_106(L3_107, A0_104.c_id)
			local L4_108 = L4_108
		end
	end
	L1_105 = _ENV
	L1_105 = L1_105.gacha_info_dict
	L2_106 = A0_104.c_id
	L1_105[L2_106] = A0_104
end
L8_8(L9_9.data).update_gacha_storage_info = function(A0_109, A1_110)
	local L2_111
	L2_111 = _ENV
	L2_111 = L2_111.gacha_info_dict
	L2_111 = L2_111[A0_109]
	L2_111.storage_id = A1_110
end
L8_8(L9_9.data).update_gacha_wish_info = function(A0_112, A1_113, A2_114)
	L6_118 = _ENV.gacha_wish_info
	L6_118[A0_112] = {}
	if A1_113 then
		L6_118 = 1
		_FOR_ = 1
		for _FORV_6_ = L6_118, _FOR_, _FOR_ do
			_ENV.gacha_wish_info[A0_112][A1_113[_FORV_6_].job] = A1_113[_FORV_6_]
			if not A2_114 then
			end
			_ENV.gacha_wish_left_num[A0_112] = 0
		end
	end
	L6_118 = _ENV
	L6_118 = L6_118.get_can_choose_max_wish_num
	L9_121 = A0_112
	L6_118 = L6_118(L9_121)
	L9_121 = _ENV
	L9_121 = L9_121.gacha_up_wish_trigger_count
	if not A2_114 then
	end
	L9_121[A0_112] = L6_118 - 0
end
L8_8(L9_9.data).get_gacha_wish_left_num = function(A0_122)
	local L1_123
	L1_123 = _ENV
	L1_123 = L1_123.gacha_wish_left_num
	L1_123 = L1_123[A0_122]
	if not L1_123 then
		L1_123 = 0
	end
	return L1_123
end
L8_8(L9_9.data).get_gacha_up_wish_trigger_count = function(A0_124)
	local L1_125
	L1_125 = _ENV
	L1_125 = L1_125.gacha_up_wish_trigger_count
	L1_125 = L1_125[A0_124]
	if not L1_125 then
		L1_125 = 0
	end
	return L1_125
end
L8_8(L9_9.data).update_gacha_wish_job = function(A0_126, A1_127, A2_128)
	repeat
		local L6_132 = _ENV.gacha_wish_info
		L6_132 = L6_132[A0_126]
		if L6_132 then
			if not (A1_127 ~= A2_128 and A2_128) or A2_128 == 0 then
				goto lbl_65
			end
			L6_132 = _ENV
			L6_132 = L6_132.get_gacha_wish_job_trigger_num
			L7_133 = A0_126
			L8_134 = A2_128
			L6_132 = L6_132(L7_133, L8_134)
			if L6_132 ~= 0 then
				goto lbl_65
			end
			L6_132 = false
			L7_133 = pairs
			L8_134 = _ENV
			L8_134 = L8_134.gacha_wish_info
			L8_134 = L8_134[A0_126]
			L7_133, L8_134, L9_135 = L7_133(L8_134)
			for _FORV_7_, _FORV_8_ in L7_133, L8_134, L9_135 do
				if _FORV_7_ == A2_128 then
					_ENV.gacha_wish_info[A0_126][_FORV_7_].is_use = 0
				elseif _FORV_7_ == A1_127 then
					_ENV.gacha_wish_info[A0_126][_FORV_7_].is_use = 1
					L6_132 = true
				end
			end
			if L6_132 then
				goto lbl_65
			end
			L7_133 = _ENV
			L7_133 = L7_133.gacha_wish_info
			L7_133 = L7_133[A0_126]
			L8_134 = {}
			L7_133[A1_127] = L8_134
			break -- pseudo-goto
		end
		L6_132 = _ENV
		L6_132 = L6_132.gacha_wish_info
		L7_133 = {}
		L6_132[A0_126] = L7_133
		L6_132 = _ENV
		L6_132 = L6_132.gacha_wish_info
		L6_132 = L6_132[A0_126]
		L7_133 = {}
		L7_133.job = A1_127
		L7_133.is_use = 1
		L8_134 = {}
		L7_133.wish_list = L8_134
		L6_132[A1_127] = L7_133
	until true
	::lbl_65::
end
L8_8(L9_9.data).update_gacha_wish = function(A0_136, A1_137, A2_138)
	local L3_139
	repeat
		L3_139 = true
		L6_142 = _ENV
		L6_142 = L6_142.gacha_wish_info
		L6_142 = L6_142[A0_136]
		if not L6_142 then
			L6_142 = _ENV
			L6_142 = L6_142.gacha_wish_info
			L7_143 = {}
			L6_142[A0_136] = L7_143
			L3_139 = false
		else
			L6_142 = _ENV
			L6_142 = L6_142.gacha_wish_info
			L6_142 = L6_142[A0_136]
			L6_142 = L6_142[A1_137]
			if L6_142 then
				L6_142 = _ENV
				L6_142 = L6_142.gacha_wish_info
				L6_142 = L6_142[A0_136]
				L6_142 = L6_142[A1_137]
				L6_142 = L6_142.wish_list
				if L6_142 then
					goto lbl_27
				end
			end
			L3_139 = false
		end
		::lbl_27::
		if not L3_139 then
			L6_142 = _ENV
			L6_142 = L6_142.get_client_gacha_wish_info
			L7_143 = A0_136
			L6_142 = L6_142(L7_143)
			if L6_142 then
				L7_143 = _ENV
				L7_143 = L7_143.gacha_wish_info
				L7_143 = L7_143[A0_136]
				L12_148 = L6_142[A1_137]
				L7_143[A1_137] = L12_148
			end
		end
		L6_142 = _ENV
		L6_142 = L6_142.gacha_wish_info
		L6_142 = L6_142[A0_136]
		L6_142 = L6_142[A1_137]
		if not L6_142 then
			L6_142 = _ENV
			L6_142 = L6_142.gacha_wish_info
			L6_142 = L6_142[A0_136]
			L7_143 = {}
			L7_143.job = A1_137
			L7_143.is_use = 1
			L6_142[A1_137] = L7_143
		end
		L6_142 = _ENV
		L6_142 = L6_142.gacha_wish_info
		L6_142 = L6_142[A0_136]
		L6_142 = L6_142[A1_137]
		if L6_142 then
			if not A2_138 then
				L6_142 = _ENV
				L6_142 = L6_142.gacha_wish_info
				L6_142 = L6_142[A0_136]
				L6_142 = L6_142[A1_137]
				L6_142.wish_list = nil
			else
				L6_142 = _ENV
				L6_142 = L6_142.gacha_wish_info
				L6_142 = L6_142[A0_136]
				L6_142 = L6_142[A1_137]
				L6_142 = L6_142.wish_list
				if L6_142 then
					L6_142 = _ENV
					L6_142 = L6_142.gacha_wish_info
					L6_142 = L6_142[A0_136]
					L6_142 = L6_142[A1_137]
					L6_142 = L6_142.wish_list
					L7_143 = 1
					L12_148 = #L6_142
					_FOR_ = 1
					for _FORV_8_ = L7_143, L12_148, _FOR_ do
						_FOR_ = 1
						for _FORV_12_ = _FOR_, _FOR_, _FOR_ do
							if L6_142[_FORV_8_].pos == A2_138[_FORV_12_].pos then
								L6_142[_FORV_8_].item_cid = A2_138[_FORV_12_].item_cid
								L6_142[_FORV_8_].trigger_num = 0
							end
						end
					end
					break -- pseudo-goto
				end
				L6_142 = _ENV
				L6_142 = L6_142.gacha_wish_info
				L6_142 = L6_142[A0_136]
				L6_142 = L6_142[A1_137]
				L7_143 = {}
				L6_142.wish_list = L7_143
				L6_142 = 1
				L7_143 = #A2_138
				L12_148 = 1
				for L14_150 = L6_142, L7_143, L12_148 do
					({}).pos = A2_138[L14_150].pos
					local ({}).item_cid, L11_147 = A2_138[L14_150].item_cid, L11_147
					;({}).trigger_num = 0
					L11_147(_ENV.gacha_wish_info[A0_136][A1_137].wish_list, {})
				end
			end
		end
	until true
end
L8_8(L9_9.data).update_gacha_preview_draw_info = function(A0_151, A1_152)
	local L2_153, L3_154, L4_155, L5_156, L6_157
	L2_153 = _ENV
	L2_153 = L2_153.gacha_preview_info
	L2_153 = L2_153[A0_151]
	if L2_153 then
		L2_153 = 1
		L3_154 = _ENV
		L3_154 = L3_154.gacha_preview_info
		L3_154 = L3_154[A0_151]
		L3_154 = L3_154.item_list
		L3_154 = #L3_154
		L4_155 = 1
		for L5_156 = L2_153, L3_154, L4_155 do
			L6_157 = _ENV
			L6_157 = L6_157.gacha_preview_info
			L6_157 = L6_157[A0_151]
			L6_157 = L6_157.item_list
			L6_157 = L6_157[L5_156]
			L6_157 = L6_157.index
			if L6_157 == A1_152 then
				L6_157 = _ENV
				L6_157 = L6_157.gacha_preview_info
				L6_157 = L6_157[A0_151]
				L6_157 = L6_157.item_list
				L6_157 = L6_157[L5_156]
				L6_157.is_reward = 1
				break
			end
		end
	end
end
L8_8(L9_9.data).get_gacha_wish_job_trigger_num = function(A0_158, A1_159)
	local L2_160, L3_161, L4_162, L5_163, L6_164, L8_165
	L2_160 = 0
	L3_161 = nil
	L4_162 = _ENV
	L4_162 = L4_162.gacha_wish_info
	L4_162 = L4_162[A0_158]
	if L4_162 then
		L4_162 = _ENV
		L4_162 = L4_162.gacha_wish_info
		L4_162 = L4_162[A0_158]
		L4_162 = L4_162[A1_159]
		if L4_162 then
			L4_162 = _ENV
			L4_162 = L4_162.gacha_wish_info
			L4_162 = L4_162[A0_158]
			L4_162 = L4_162[A1_159]
			L3_161 = L4_162.wish_list
			if L3_161 then
				L4_162 = 1
				L5_163 = #L3_161
				L6_164 = 1
				for L8_165 = L4_162, L5_163, L6_164 do
					if not L3_161[L8_165].triger_num then
					end
					L2_160 = L2_160 + 0
				end
			end
		end
	end
	return L2_160
end
L8_8(L9_9.data).get_gacha_wish_item_trigger_num = function(A0_166, A1_167)
	local L2_168
	L2_168 = 0
	L5_171 = _ENV
	L5_171 = L5_171.gacha_wish_info
	L5_171 = L5_171[A0_166]
	if L5_171 then
		L5_171 = pairs
		L6_172 = _ENV
		L6_172 = L6_172.gacha_wish_info
		L6_172 = L6_172[A0_166]
		L5_171, L6_172, L7_173 = L5_171(L6_172)
		for L8_174, L9_175 in L5_171, L6_172, L7_173 do
			L10_176 = 1
			L11_177 = #L9_175
			L12_178 = 1
			for _FORV_11_ = L10_176, L11_177, L12_178 do
				if L9_175[_FORV_11_].item_cid == A1_167 then
					L2_168 = L2_168 + L9_175[_FORV_11_].trigger_num
				end
			end
		end
	end
	return L2_168
end
L8_8(L9_9.data).update_gacha_preview_info = function(A0_179)
	local L1_180, L2_181
	L1_180 = _ENV
	L1_180 = L1_180.gacha_preview_info
	L2_181 = A0_179.c_id
	L1_180[L2_181] = A0_179
end
L8_8(L9_9.data).get_gacha_info_dict = function()
	local L0_182, L1_183
	L0_182 = _ENV
	L0_182 = L0_182.gacha_info_dict
	return L0_182
end
L8_8(L9_9.data).get_gacha_info = function(A0_184)
	local L1_185
	L1_185 = _ENV
	L1_185 = L1_185.gacha_info_dict
	L1_185 = L1_185[A0_184]
	return L1_185
end
L8_8(L9_9.data).get_gacha_can_choose_wish_list = function(A0_186, A1_187)
	local L2_188, L3_189
	L2_188 = _ENV
	local L2_188, L7_193, L8_194, L12_198, L13_199 = L2_188.gacha_info_dict, L7_193, L8_194, L12_198, L13_199
	L2_188 = L2_188[A0_186]
	if L2_188 then
		L3_189 = L2_188.lv
		if L3_189 then
			goto lbl_10
		end
	end
	L3_189 = 1
	::lbl_10::
	L7_193 = L17_17
	L7_193 = L7_193.get_config
	L8_194 = L2_188.storage_id
	L7_193 = L7_193(L8_194)
	if L7_193 then
		L8_194 = L7_193.wish_id
		if L8_194 then
			L8_194 = L7_193.wish_id
			if L8_194 ~= 0 then
				goto lbl_24
			end
		end
	end
	L8_194 = nil
	do return L8_194 end
	::lbl_24::
	L8_194 = L15_15
	L8_194 = L8_194.get_config
	L12_198 = L7_193.wish_id
	L8_194 = L8_194(L12_198)
	if not L8_194 then
		L12_198 = nil
		return L12_198
	end
	L12_198 = L7_193.pool_rate
	if L12_198 then
		L12_198 = L7_193.pool_rate
		L12_198 = L12_198[L3_189]
		if L12_198 then
			L12_198 = L7_193.pool_rate
			L12_198 = L12_198[L3_189]
			L12_198 = L12_198.gacha_weight
			if L12_198 then
				goto lbl_46
			end
		end
	end
	L12_198 = nil
	do return L12_198 end
	::lbl_46::
	L12_198 = L8_194.wish_quality
	L13_199 = L7_193.pool_rate
	L13_199 = L13_199[L3_189]
	L13_199 = L13_199.gacha_weight
	_FOR_, _FOR_, _FOR_ = pairs(L13_199)
	for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
		if L12_198 == _FORV_13_.quality then
			_FOR_ = 1
			local L16_202 = L16_202
			for _FORV_17_ = _FOR_, _FOR_, _FOR_ do
				if L12_12.get_item(_FORV_13_.weight_list[_FORV_17_][1][1]).profession == A1_187 then
					L1_1(L16_202, _FORV_13_.weight_list[_FORV_17_][1][1])
				end
			end
		end
	end
	L22_208 = 1
	_FOR_ = 1
	for _FORV_12_ = L22_208, _FOR_, _FOR_ do
		_FOR_ = -1
		for _FORV_16_ = _FOR_, _FOR_, _FOR_ do
			if L16_202[_FORV_16_] == L16_202[_FORV_12_] then
				L0_0(L16_202, _FORV_16_)
			end
		end
	end
	L22_208 = _ENV
	L22_208 = L22_208.get_view_gacha_wish_info
	L17_203 = A0_186
	L22_208 = L22_208(L17_203)
	L17_203 = L22_208[A1_187]
	L17_203 = L17_203.wish_list
	L18_204 = #L16_202
	_FOR_ = -1
	for _FORV_14_ = L18_204, _FOR_, _FOR_ do
		_FOR_ = 1
		for _FORV_18_ = _FOR_, _FOR_, _FOR_ do
			if L16_202[_FORV_14_] == L17_203[_FORV_18_].item_cid then
				L0_0(L16_202, _FORV_14_)
				break
			end
		end
	end
	return L16_202
end
L8_8(L9_9.data).get_all_reward_cid_list = function(A0_209, A1_210)
	local L2_211
	L2_211 = {}
	local L7_216, L8_217 = _ENV, L8_217
	L7_216 = L7_216.get_config
	L8_217 = _UPVALUE1_
	L8_217 = L8_217.gacha_info_dict
	L8_217 = L8_217[A0_209]
	L8_217 = L8_217.storage_id
	L7_216 = L7_216(L8_217)
	if L7_216 then
		L8_217 = L7_216.pool_rate
		if L8_217 then
			L8_217 = L7_216.pool_rate
			L8_217 = L8_217[A1_210]
			if L8_217 then
				L8_217 = L7_216.pool_rate
				L8_217 = L8_217[A1_210]
				L8_217 = L8_217.gacha_weight
				if L8_217 then
					L8_217 = L7_216.pool_rate
					L8_217 = L8_217[A1_210]
					L8_217 = L8_217.gacha_weight
					L9_218 = pairs
					L10_219 = L8_217
					L9_218, L10_219, L11_220 = L9_218(L10_219)
					for L12_221, L13_222 in L9_218, L10_219, L11_220 do
						if L13_222.weight_list then
							_FOR_ = 1
							for _FORV_13_ = _FOR_, _FOR_, _FOR_ do
								L1_1(L2_211, L13_222.weight_list[_FORV_13_][1][1])
							end
						end
					end
				end
			end
		end
	end
	return L2_211
end
L8_8(L9_9.data).get_gacha_preview_info = function(A0_226)
	local L1_227
	L1_227 = _ENV
	L1_227 = L1_227.gacha_preview_info
	L1_227 = L1_227[A0_226]
	return L1_227
end
L8_8(L9_9.data).cache_spin_gacha_item = function(A0_228)
	local L1_229
	L1_229 = _ENV
	L1_229.spin_item_list = A0_228
end
L8_8(L9_9.data).get_cache_spin_gacha_item = function(A0_230)
	local L1_231
	local L3_233 = _ENV.gacha_item_type
	L3_233 = L3_233.weapon
	if A0_230 == L3_233 then
		L3_233 = _UPVALUE1_
		L3_233 = L3_233.get_cache_spin_gacha_weapon_item
		L3_233 = L3_233()
		L1_231 = L3_233
	else
		L3_233 = _ENV
		L3_233 = L3_233.gacha_item_type
		L3_233 = L3_233.equip
		if A0_230 == L3_233 then
			L3_233 = _UPVALUE1_
			L3_233 = L3_233.get_cache_spin_gacha_equip_item
			L3_233 = L3_233()
			repeat
				L1_231 = L3_233
				do break end -- pseudo-goto
				L3_233 = _UPVALUE1_
				L1_231 = L3_233.spin_item_list
			until true
		end
	end
	L3_233 = _UPVALUE1_
	L3_233.spin_gain_item_list_cache = {}
	L3_233 = L1_231 or L3_233
	if not L1_231 then
		L3_233 = {}
	end
	return L3_233
end
L8_8(L9_9.data).get_cache_spin_gacha_weapon_item = function()
	local L0_234, L1_235, L2_236, L3_237, L4_238, L5_239, L6_240
	L0_234 = {}
	local L1_235, L9_243 = {}, L9_243
	L2_236 = 1
	L3_237 = _ENV
	L3_237 = L3_237.spin_item_list
	L3_237 = #L3_237
	L4_238 = 1
	for L5_239 = L2_236, L3_237, L4_238 do
		L6_240 = _ENV
		L6_240 = L6_240.spin_item_list
		L6_240 = L6_240[L5_239]
		L6_240 = L6_240.c_id
		L9_243 = _ENV
		L9_243 = L9_243.is_show_piece_by_item_id
		local L9_243, L8_242 = L9_243(L6_240), L8_242
		if L9_243 then
			L9_243 = L1_235[L6_240]
			if not L9_243 then
				L9_243 = 0
			end
			L9_243 = L9_243 + 1
			L1_235[L6_240] = L9_243
		end
	end
	L2_236 = {}
	L3_237 = 1
	L4_238 = _ENV
	L4_238 = L4_238.spin_item_list
	L4_238 = #L4_238
	L5_239 = 1
	for L6_240 = L3_237, L4_238, L5_239 do
		L9_243 = _ENV
		L9_243 = L9_243.spin_item_list
		L9_243 = L9_243[L6_240]
		L9_243 = L9_243.c_id
		L8_242 = false
		if _ENV.is_show_piece_by_item_id(L9_243) then
			if not L2_236[L9_243] then
			end
			L2_236[L9_243] = 0 + 1
			local L10_244 = L10_244
			L8_242, L10_244 = _ENV.get_weapon_show_piece_info(_ENV.spin_item_list[L6_240], L2_236[L9_243], L1_235[L9_243])
		end
		;({}).c_id = L9_243
		;({}).num = _ENV.spin_item_list[L6_240].num
		;({}).is_ultra = _ENV.spin_item_list[L6_240].is_ultra
		;({}).is_first = _ENV.spin_item_list[L6_240].is_first
		;({}).piece_info = L8_242
		;({}).is_new = L10_244
		local L11_245 = L11_245
		local L12_246 = L12_246
		L12_246(L0_234, L11_245)
		local L13_247 = L13_247
	end
	return L0_234
end
L8_8(L9_9.data).get_cache_spin_gacha_equip_item = function()
	local L0_248, L1_249, L2_250, L3_251, L4_252, L5_253, L6_254, L7_255, L8_256, L9_257
	L0_248 = {}
	local L1_249, L15_263 = 0, L15_263
	L2_250 = false
	L3_251 = 0
	L4_252 = {}
	L5_253 = 1
	L6_254 = _ENV
	L6_254 = L6_254.spin_item_list
	L6_254 = #L6_254
	L7_255 = 1
	for L8_256 = L5_253, L6_254, L7_255 do
		L2_250 = false
		L3_251 = 0
		L9_257 = _ENV
		L9_257 = L9_257.spin_item_list
		L9_257 = L9_257[L8_256]
		L9_257 = L9_257.c_id
		L15_263 = L16_16
		L15_263 = L15_263.get_equip_cfg
		L15_263 = L15_263(L9_257)
		if L15_263 then
			L2_250 = true
			L3_251 = L15_263.lv
			local L11_259 = L11_259
			L11_259 = L11_259(L15_263.part)
			if L11_259 then
				L1_249 = 0
				_FOR_ = 1
				for _FORV_15_ = _FOR_, _FOR_, _FOR_ do
					if _ENV.spin_gain_item_list_cache[_FORV_15_].item_cid == L9_257 then
						L1_249 = _ENV.spin_gain_item_list_cache[_FORV_15_].item_id
						L0_0(_ENV.spin_gain_item_list_cache, _FORV_15_)
						break
					end
				end
				if L1_249 ~= 0 then
					L16_264 = _UPVALUE2_
					L16_264 = L16_264.get_equip_rating
					L17_265 = L1_249
					L16_264 = L16_264(L17_265)
					L17_265 = _UPVALUE2_
					L17_265 = L17_265.get_equip_rating
					L18_266 = L11_259.id
					L17_265 = L17_265(L18_266)
					L2_250 = L16_264 > L17_265
				else
					L2_250 = false
				end
			end
		end
		L11_259 = {}
		L16_264 = _ENV
		L16_264 = L16_264.spin_item_list
		L16_264 = L16_264[L8_256]
		L16_264 = L16_264.id
		L11_259.id = L16_264
		L11_259.c_id = L9_257
		L16_264 = _ENV
		L16_264 = L16_264.spin_item_list
		L16_264 = L16_264[L8_256]
		L16_264 = L16_264.num
		L11_259.num = L16_264
		L16_264 = _ENV
		L16_264 = L16_264.spin_item_list
		L16_264 = L16_264[L8_256]
		L16_264 = L16_264.is_ultra
		L11_259.is_ultra = L16_264
		L16_264 = L22_22
		L16_264 = L16_264.is_best_sub_attr_equip
		L17_265 = _ENV
		L17_265 = L17_265.spin_item_list
		L17_265 = L17_265[L8_256]
		L16_264 = L16_264(L17_265)
		L16_264 = L4_4
		L16_264 = L16_264.check_equip_auto_resolve
		L17_265 = _ENV
		L17_265 = L17_265.spin_item_list
		L17_265 = L17_265[L8_256]
		L17_265 = L17_265.id
		L16_264 = not L16_264 and L16_264
		L11_259.need_resolve = L16_264
		L11_259.is_better = L2_250
		L11_259.level = L3_251
		L16_264 = L1_1
		L17_265 = L0_248
		L18_266 = L11_259
		L16_264(L17_265, L18_266)
	end
	return L0_248
end
L8_8(L9_9.data).get_gacha_reward_quality_interval = function(A0_267)
	local L1_268, L2_269
	L1_268 = _ENV
	local L1_268, L10_277 = L1_268.gacha_info_dict, L10_277
	L1_268 = L1_268[A0_267]
	if L1_268 then
		L2_269 = L1_268.lv
		if L2_269 then
			goto lbl_10
		end
	end
	L2_269 = 1
	::lbl_10::
	L10_277 = L17_17
	L10_277 = L10_277.get_config
	local L10_277, L4_271 = L10_277(L1_268.storage_id), L4_271
	if L10_277 then
		L4_271 = L10_277.pool_rate
		if L4_271 then
			L4_271 = L10_277.pool_rate
			L4_271 = L4_271[L2_269]
			if L4_271 then
				L4_271 = L10_277.pool_rate
				L4_271 = L4_271[L2_269]
				L4_271 = L4_271.gacha_weight
				if L4_271 then
					goto lbl_36
				end
			end
		end
	end
	L4_271 = {}
	local L5_272 = L5_272
	L5_272[1] = 2
	L5_272[2] = 1
	L5_272[3] = 10000
	L4_271[1] = L5_272
	do return L4_271 end
	::lbl_36::
	L4_271 = {}
	L5_272 = L10_277.pool_rate
	L5_272 = L5_272[L2_269]
	L5_272 = L5_272.gacha_weight
	L6_273, L7_274, _FOR_ = L6_273(L5_272)
	for _FORV_9_, _FORV_10_ in L6_273, L7_274, _FOR_ do
		if not L4_271[_FORV_10_.quality] then
			L4_271[_FORV_10_.quality] = _FORV_10_.weight
		else
			L4_271[_FORV_10_.quality] = L4_271[_FORV_10_.quality] + _FORV_10_.weight
		end
	end
	L6_273 = {}
	L7_274 = 0
	L11_278 = pairs
	L12_279 = L4_271
	L11_278, L12_279, _FOR_ = L11_278(L12_279)
	for _FORV_11_, _FORV_12_ in L11_278, L12_279, _FOR_ do
		local L16_283 = L16_283
		local L17_284 = L17_284
		;({})[1] = _FORV_11_
		;({})[2] = L7_274 + 1
		local ({})[3], L18_285 = L7_274 + _FORV_12_, L18_285
		L16_283(L17_284, L18_285)
		L7_274 = L7_274 + _FORV_12_
	end
	return L6_273
end
L8_8(L9_9.data).clear_cache = function()
	local L0_286, L1_287
	L0_286 = _ENV
	L1_287 = {}
	L0_286.spin_item_list = L1_287
	L0_286 = _ENV
	L1_287 = {}
	L0_286.weapon_info_cache = L1_287
end
L8_8(L9_9.data).cache_weapon_info = function()
	local L4_292, L3_291 = {}, L3_291
	L3_291.weapon_info_cache = L4_292
	L3_291 = L20_20
	L3_291 = L3_291.get_sorted_items
	L4_292 = L21_21
	L4_292 = L4_292.bag_type
	L4_292 = L4_292.main_weapon
	L5_293 = _UPVALUE3_
	L3_291 = L3_291(L4_292, L5_293)
	L4_292 = ipairs
	L5_293 = L3_291
	L4_292, L5_293, L6_294 = L4_292(L5_293)
	for L7_295, L8_296 in L4_292, L5_293, L6_294 do
		_ENV.weapon_info_cache[L8_296.cfg_id] = L8_296.number
	end
end
L8_8(L9_9.data).is_show_piece_by_item_id = function(A0_297)
	local L3_300 = _ENV.get_item
	local L3_300, L2_299 = L3_300(A0_297), L2_299
	if L3_300 then
		L2_299 = L3_300.bag_type
		if L2_299 == L21_21.bag_type.main_weapon then
			L2_299 = L3_300.item_type
			if L2_299 == _UPVALUE2_ then
				L2_299 = true
				return L2_299
			end
		end
	end
	L2_299 = false
	return L2_299
end
L8_8(L9_9.data).get_weapon_show_piece_info = function(A0_301, A1_302, A2_303)
	local L3_304
	local L7_308 = L7_308
	if not A2_303 or A2_303 < 1 then
		L3_304 = false
		L7_308 = false
		return L3_304, L7_308
	end
	L3_304 = A0_301.c_id
	if not L3_304 then
		L3_304 = A0_301.cfg_id
		if not L3_304 then
			L3_304 = A0_301.item_cid
			if not L3_304 then
				L3_304 = A0_301[1]
			end
		end
	end
	L7_308 = _ENV
	L7_308 = L7_308.get_item
	L7_308 = L7_308(L3_304)
	local L5_306 = L5_306
	local L5_306, L6_307 = L5_306(L3_304), L6_307
	if not L5_306 then
		L5_306 = false
		L6_307 = false
		return L5_306, L6_307
	end
	L5_306 = L7_308.dec_effect
	if L5_306 then
		L5_306 = L7_308.dec_effect
		L5_306 = L5_306[1]
		if L5_306 then
			goto lbl_39
		end
	end
	L5_306 = nil
	::lbl_39::
	if L5_306 then
		L6_307 = L5_306[1]
		if L6_307 then
			goto lbl_47
		end
	end
	L6_307 = false
	do return L6_307, false end
	::lbl_47::
	if 1 < A1_302 then
		L6_307 = L5_306
		return L6_307, false
	else
		L6_307 = _UPVALUE1_
		L6_307 = L6_307.weapon_info_cache
		L6_307 = L6_307[L3_304]
		if L6_307 then
			L6_307 = L5_306
			return L6_307, false
		else
			L6_307 = false
			return L6_307, true
		end
	end
end
L8_8(L9_9.data).get_pool_all_quality_weight = function(A0_309, A1_310)
	local L5_314, L6_315, L11_320, L12_321, L17_326 = _ENV.get_config, L6_315, L11_320, L12_321, L17_326
	L6_315 = A0_309
	L5_314 = L5_314(L6_315)
	L6_315 = L17_17
	L6_315 = L6_315.get_config
	L11_320 = _UPVALUE2_
	L11_320 = L11_320.gacha_info_dict
	L11_320 = L11_320[A0_309]
	L11_320 = L11_320.storage_id
	L6_315 = L6_315(L11_320)
	L11_320 = A1_310 or L11_320
	if not A1_310 then
		L11_320 = 1
	end
	L12_321 = 0
	L17_326 = {}
	if L5_314 and L6_315 then
		L18_327 = L6_315.pool_rate
		if L18_327 then
			L18_327 = L6_315.pool_rate
			L18_327 = L18_327[L11_320]
			if L18_327.gacha_weight then
				_FOR_, _FOR_, _FOR_ = pairs(L18_327.gacha_weight)
				for _FORV_11_, _FORV_12_ in _FOR_, _FOR_, _FOR_ do
					if 0 < _FORV_12_.weight then
						_FOR_, _FOR_, _FOR_ = pairs(L17_326)
						for _FORV_17_, _FORV_18_ in _FOR_, _FOR_, _FOR_ do
							if _FORV_17_ == _FORV_12_.quality then
								L17_326[_FORV_17_].weight = L17_326[_FORV_17_].weight + _FORV_12_.weight
								break
							end
						end
						if not true then
							({}).quality = _FORV_12_.quality
							;({}).weight = _FORV_12_.weight
							L17_326[_FORV_12_.quality], ({}).item_type = {}, L5_314.item_type
						end
						L12_321 = L12_321 + _FORV_12_.weight
					end
				end
			end
		end
	end
	L18_327 = pairs
	L21_330 = L17_326
	L18_327, L21_330, _FOR_ = L18_327(L21_330)
	for _FORV_10_, _FORV_11_ in L18_327, L21_330, _FOR_ do
		L17_326[_FORV_10_].weight_precent = L17_326[_FORV_10_].weight * 100 / L12_321
	end
	return L17_326
end
L8_8(L9_9.data).get_pool_hightest_quality = function(A0_331)
	local L3_334, L4_335, L7_338, L8_339 = _ENV.get_config, L4_335, L7_338, L8_339
	L4_335 = _UPVALUE1_
	L4_335 = L4_335.gacha_info_dict
	L4_335 = L4_335[A0_331]
	L4_335 = L4_335.storage_id
	L3_334 = L3_334(L4_335)
	L4_335 = _UPVALUE1_
	L4_335 = L4_335.gacha_info_dict
	L4_335 = L4_335[A0_331]
	if L4_335 then
		L4_335 = _UPVALUE1_
		L4_335 = L4_335.gacha_info_dict
		L4_335 = L4_335[A0_331]
		L4_335 = L4_335.lv
		if L4_335 then
			goto lbl_20
		end
	end
	L4_335 = 1
	::lbl_20::
	L7_338 = 0
	if L3_334 then
		L8_339 = L3_334.pool_rate
		if L8_339 then
			L8_339 = L3_334.pool_rate
			L8_339 = L8_339[L4_335]
			L9_340 = L8_339.gacha_weight
			if L9_340 then
				L9_340 = pairs
				L10_341 = L8_339.gacha_weight
				L9_340, L10_341, _FOR_ = L9_340(L10_341)
				for _FORV_8_, _FORV_9_ in L9_340, L10_341, _FOR_ do
					if 0 < _FORV_9_.weight and L7_338 < _FORV_9_.quality then
						L7_338 = _FORV_9_.quality
					end
				end
			end
		end
	end
	return L7_338
end
L8_8(L9_9.data).get_daily_wish_items = function(A0_342)
	local L1_343, L2_344
	L1_343 = _ENV
	local L1_343, L6_348, L7_349, L8_350 = L1_343.gacha_info_dict, L6_348, L7_349, L8_350
	L1_343 = L1_343[A0_342]
	if L1_343 then
		L2_344 = L1_343.lv
		if L2_344 then
			goto lbl_10
		end
	end
	L2_344 = 1
	::lbl_10::
	L6_348 = L17_17
	L6_348 = L6_348.get_config
	L7_349 = L1_343.storage_id
	L6_348 = L6_348(L7_349)
	if L6_348 then
		L7_349 = L6_348.wish_id
		if L7_349 then
			L7_349 = L6_348.wish_id
			if L7_349 ~= 0 then
				goto lbl_24
			end
		end
	end
	L7_349 = nil
	do return L7_349 end
	::lbl_24::
	L7_349 = L15_15
	L7_349 = L7_349.get_config
	L8_350 = L6_348.wish_id
	L7_349 = L7_349(L8_350)
	if not L7_349 then
		L8_350 = nil
		return L8_350
	end
	L8_350 = L7_349.unlock
	if L8_350 then
		L8_350 = L7_349.unlock
		L8_350 = L8_350[1]
		if L8_350 then
			L8_350 = L7_349.unlock
			L8_350 = L8_350[1]
			L8_350 = L8_350[1]
			if L8_350 == 1 then
				L8_350 = L7_349.unlock
				L8_350 = L8_350[1]
				L8_350 = L8_350[2]
				if L2_344 < L8_350 then
					L8_350 = nil
					return L8_350
				end
			end
		end
	end
	L8_350 = {}
	L9_351 = L7_349.profession_type
	if L9_351 then
		L9_351 = 1
		L10_352 = L7_349.profession_type
		L10_352 = #L10_352
		L11_353 = 1
		for L27_369 = L9_351, L10_352, L11_353 do
			L8_350[L7_349.profession_type[L27_369]] = {}
		end
	end
	L9_351 = L7_349.wish_quality
	L10_352 = L6_348.pool_rate
	L10_352 = L10_352[L2_344]
	L10_352 = L10_352.gacha_weight
	L11_353 = nil
	L27_369 = nil
	local _FOR_, _FOR_, _FOR_, L13_355 = pairs(L10_352)
	for _FORV_15_, _FORV_16_ in _FOR_, _FOR_, _FOR_ do
		if L9_351 == _FORV_16_.quality then
			local L18_360 = L18_360
			_FOR_ = 1
			for _FORV_20_ = _FOR_, _FOR_, _FOR_ do
				L11_353 = _FORV_16_.weight_list[_FORV_20_][1][1]
				L27_369 = L12_12.get_item(L11_353)
				if L27_369 and L27_369.item_type == GlobalConst.item_type.equ and L27_369.item_sub_type == GlobalConst.equ_pos.main_weapon then
					L18_360 = L19_19.weapon_cfg_dic[L11_353]
					if L18_360 and L8_350[L18_360.job_type] then
						({}).item_cid = L11_353
						;({}).locked = false
						L1_1(L8_350[L18_360.job_type], {})
					end
				end
			end
		end
	end
	_FOR_, _FOR_, _FOR_ = pairs(L6_348.pool_rate)
	for _FORV_17_, _FORV_18_ in _FOR_, _FOR_, _FOR_ do
		local L19_361 = L19_361
		if 1 < _FORV_18_.lv then
			L19_361 = _FORV_18_.lv
		end
	end
	if L19_361 ~= L2_344 then
		_FOR_, _FOR_, _FOR_ = pairs(L6_348.pool_rate[L19_361].gacha_weight)
		for _FORV_18_, _FORV_19_ in _FOR_, _FOR_, _FOR_ do
			if L9_351 == _FORV_19_.quality then
				_FOR_ = 1
				for _FORV_23_ = _FOR_, _FOR_, _FOR_ do
					L11_353 = _FORV_19_.weight_list[_FORV_23_][1][1]
					L27_369 = L12_12.get_item(L11_353)
					if L27_369.item_type == GlobalConst.item_type.equ and L27_369.item_sub_type == GlobalConst.equ_pos.main_weapon then
						L18_360 = L19_19.weapon_cfg_dic[L11_353]
						if L18_360 and L8_350[L18_360.job_type] then
							_FOR_ = 1
							for _FORV_27_ = _FOR_, _FOR_, _FOR_ do
								if L8_350[L18_360.job_type][_FORV_27_].item_cid == L11_353 then
								end
							end
							if not true then
								({}).item_cid = L11_353
								;({}).locked = true
								L1_1(L8_350[L18_360.job_type], {})
							end
						end
					end
				end
			end
		end
	end
	local _FOR_, _FOR_, _FOR_, L16_358 = pairs(L8_350)
	for _FORV_18_, _FORV_19_ in _FOR_, _FOR_, _FOR_ do
		if #_FORV_19_ ~= 0 then
			_FOR_ = 1
			for _FORV_23_ = _FOR_, _FOR_, _FOR_ do
				local _FOR_, L25_367 = -1, L25_367
				for _FORV_27_ = _FOR_, _FOR_, _FOR_ do
					if _FORV_19_[_FORV_27_] == _FORV_19_[_FORV_23_] then
						L0_0(_FORV_19_, _FORV_27_)
					end
				end
			end
			if not L18_18.get_cfg_by_id(_FORV_18_) or not L18_18.get_cfg_by_id(_FORV_18_).weapon_camp then
			end
			;({}).weapon_camp, ({}).job = 1, _FORV_18_
			;({}).item_list = _FORV_19_
			L1_1(L25_367, {})
		end
	end
	return L25_367
end
L8_8(L9_9.data).get_up_wish_items = function(A0_373, A1_374)
	local L2_375, L3_376
	L2_375 = _ENV
	local L2_375, L7_380, L8_381, L9_382 = L2_375.gacha_info_dict, L7_380, L8_381, L9_382
	L2_375 = L2_375[A0_373]
	if L2_375 then
		L3_376 = L2_375.lv
		if L3_376 then
			goto lbl_10
		end
	end
	L3_376 = 1
	::lbl_10::
	L7_380 = L17_17
	L7_380 = L7_380.get_config
	L8_381 = A1_374
	L7_380 = L7_380(L8_381)
	if L7_380 then
		L8_381 = L7_380.wish_id
		if L8_381 then
			L8_381 = L7_380.wish_id
			if L8_381 ~= 0 then
				goto lbl_24
			end
		end
	end
	L8_381 = nil
	do return L8_381 end
	::lbl_24::
	L8_381 = L15_15
	L8_381 = L8_381.get_config
	L9_382 = L7_380.wish_id
	L8_381 = L8_381(L9_382)
	if not L8_381 then
		L9_382 = nil
		return L9_382
	end
	L9_382 = L8_381.unlock
	if L9_382 then
		L9_382 = L8_381.unlock
		L9_382 = L9_382[1]
		if L9_382 then
			L9_382 = L8_381.unlock
			L9_382 = L9_382[1]
			L9_382 = L9_382[1]
			if L9_382 == 1 then
				L9_382 = L8_381.unlock
				L9_382 = L9_382[1]
				L9_382 = L9_382[2]
				if L3_376 < L9_382 then
					L9_382 = nil
					return L9_382
				end
			end
		end
	end
	L9_382 = {}
	L10_383 = L8_381.profession_type
	if L10_383 then
		L10_383 = 1
		L11_384 = L8_381.profession_type
		L11_384 = #L11_384
		L12_385 = 1
		for L28_401 = L10_383, L11_384, L12_385 do
			L9_382[L8_381.profession_type[L28_401]] = {}
		end
	end
	L10_383 = L8_381.wish_quality
	L11_384 = L7_380.pool_rate
	L11_384 = L11_384[L3_376]
	L11_384 = L11_384.gacha_weight
	L12_385 = nil
	L28_401 = nil
	local _FOR_, _FOR_, _FOR_, L14_387 = pairs(L11_384)
	for _FORV_16_, _FORV_17_ in _FOR_, _FOR_, _FOR_ do
		if L10_383 == _FORV_17_.quality then
			local L19_392 = L19_392
			_FOR_ = 1
			for _FORV_21_ = _FOR_, _FOR_, _FOR_ do
				L12_385 = _FORV_17_.weight_list[_FORV_21_][1][1]
				L28_401 = L12_12.get_item(L12_385)
				if L28_401 and L28_401.item_type == GlobalConst.item_type.equ and L28_401.item_sub_type == GlobalConst.equ_pos.main_weapon then
					L19_392 = L19_19.weapon_cfg_dic[L12_385]
					if L19_392 and L9_382[L19_392.job_type] then
						({}).item_cid = L12_385
						;({}).locked = false
						L1_1(L9_382[L19_392.job_type], {})
					end
				end
			end
		end
	end
	_FOR_, _FOR_, _FOR_ = pairs(L7_380.pool_rate)
	for _FORV_18_, _FORV_19_ in _FOR_, _FOR_, _FOR_ do
		local L20_393 = L20_393
		if 1 < _FORV_19_.lv then
			L20_393 = _FORV_19_.lv
		end
	end
	if L20_393 ~= L3_376 then
		_FOR_, _FOR_, _FOR_ = pairs(L7_380.pool_rate[L20_393].gacha_weight)
		for _FORV_19_, _FORV_20_ in _FOR_, _FOR_, _FOR_ do
			if L10_383 == _FORV_20_.quality then
				_FOR_ = 1
				for _FORV_24_ = _FOR_, _FOR_, _FOR_ do
					L12_385 = _FORV_20_.weight_list[_FORV_24_][1][1]
					L28_401 = L12_12.get_item(L12_385)
					if L28_401.item_type == GlobalConst.item_type.equ and L28_401.item_sub_type == GlobalConst.equ_pos.main_weapon then
						L19_392 = L19_19.weapon_cfg_dic[L12_385]
						if L19_392 and L9_382[L19_392.job_type] then
							_FOR_ = 1
							for _FORV_28_ = _FOR_, _FOR_, _FOR_ do
								if L9_382[L19_392.job_type][_FORV_28_].item_cid == L12_385 then
								end
							end
							if not true then
								({}).item_cid = L12_385
								;({}).locked = true
								L1_1(L9_382[L19_392.job_type], {})
							end
						end
					end
				end
			end
		end
	end
	local _FOR_, _FOR_, _FOR_, L17_390 = pairs(L9_382)
	for _FORV_19_, _FORV_20_ in _FOR_, _FOR_, _FOR_ do
		if #_FORV_20_ ~= 0 then
			_FOR_ = 1
			for _FORV_24_ = _FOR_, _FOR_, _FOR_ do
				local _FOR_, L26_399 = -1, L26_399
				for _FORV_28_ = _FOR_, _FOR_, _FOR_ do
					if _FORV_20_[_FORV_28_] == _FORV_20_[_FORV_24_] then
						L0_0(_FORV_20_, _FORV_28_)
					end
				end
			end
			if not L18_18.get_cfg_by_id(_FORV_19_) or not L18_18.get_cfg_by_id(_FORV_19_).weapon_camp then
			end
			;({}).weapon_camp, ({}).job = 1, _FORV_19_
			;({}).item_list = _FORV_20_
			L1_1(L26_399, {})
		end
	end
	return L26_399
end
return (L8_8(L9_9.data))
