local L0_0, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9 = L0_0, "..head", L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
L0_0 = L0_0(L2_2)
L2_2 = L0_0.data
L3_3 = DataConfigs
L3_3 = L3_3.shop
L4_4 = DataConfigs
L4_4 = L4_4.item
L5_5 = Game
L5_5 = L5_5.module
L5_5 = L5_5.dress_up
L6_6 = L5_5.data
L7_7 = Game
L7_7 = L7_7.module
L7_7 = L7_7.data
L8_8 = nil
function L9_9()
	_ENV = Game.module.bag.utils
	L1_1.reset()
end
L2_2.init = L9_9
function L9_9()
	_ENV.reset()
end
L2_2.clear = L9_9
function L9_9()
	_ENV.shop_list = {}
	_ENV.shop_dict = {}
	_ENV.collect_list = {}
	_ENV.cache_shop_list = nil
	_ENV.cache_shop_dict = {}
	_ENV.cache_shop_red_point = {}
	_ENV.cache_season_id = nil
	_ENV.recharge_time = 0
	_ENV.need_check_player_lv = nil
	_ENV.need_check_task_id = nil
	_ENV.need_check_group_lv = nil
	local _ENV.shop_car_list, L1_11 = {}, L1_11
	L1_11 = _ENV
	L1_11.shop_car_suit = nil
	L1_11 = _ENV
	L1_11.shop_buy_check_info = nil
	L1_11 = _ENV
	L1_11 = L1_11.init_item_shop_dic
	L1_11()
end
L2_2.reset = L9_9
function L9_9()
	local L0_12
	L0_12 = _ENV
	local L2_14, L6_18, L7_19 = {}, L6_18, L7_19
	L0_12.item_id_to_shop_id_dic = L2_14
	L0_12 = pairs
	L2_14 = L3_3
	L2_14 = L2_14.get_all_configs
	L2_14, L3_15, L4_16, L5_17, L6_18, L7_19 = L2_14()
	L0_12, L2_14, L3_15 = L0_12(L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L2_14())
	for L4_16, L5_17 in L0_12, L2_14, L3_15 do
		L6_18 = L5_17.item_id
		if L6_18 then
			L6_18 = _ENV
			L6_18 = L6_18.item_id_to_shop_id_dic
			L7_19 = L5_17.item_id
			L6_18 = L6_18[L7_19]
			if not L6_18 then
				L6_18 = _ENV
				L6_18 = L6_18.item_id_to_shop_id_dic
				L7_19 = L5_17.item_id
				L6_18[L7_19] = {}
			end
			L6_18 = _ENV
			L6_18 = L6_18.item_id_to_shop_id_dic
			L7_19 = L5_17.item_id
			L6_18 = L6_18[L7_19]
			L7_19 = L5_17.id
			L6_18[L7_19] = true
		end
	end
end
L2_2.init_item_shop_dic = L9_9
function L9_9(A0_20)
	L4_24 = {}
	L3_23.shop_dict = L4_24
	L3_23 = A0_20.shop_list
	if not L3_23 then
		return
	end
	L3_23 = ipairs
	L4_24 = A0_20.shop_list
	L3_23, L4_24, L5_25 = L3_23(L4_24)
	for L6_26, L7_27 in L3_23, L4_24, L5_25 do
		_ENV.shop_dict[L7_27.shop_id] = L7_27
	end
end
L2_2.init_shop_list = L9_9
function L9_9(A0_28)
	if not A0_28 then
		return
	end
	L3_31 = ipairs
	L4_32 = A0_28
	L3_31, L4_32, L5_33 = L3_31(L4_32)
	for L6_34, L7_35 in L3_31, L4_32, L5_33 do
		_ENV.shop_dict[L7_35.shop_id] = L7_35
	end
end
L2_2.update_shop_list = L9_9
function L9_9(A0_36)
	if not A0_36 then
		return
	end
	L3_39 = ipairs
	L4_40 = A0_36
	L3_39, L4_40, L5_41 = L3_39(L4_40)
	for L6_42, _FORV_5_ in L3_39, L4_40, L5_41 do
		_ENV.shop_dict[_FORV_5_] = nil
	end
end
L2_2.delete_shop_list = L9_9
function L9_9(A0_43, A1_44)
	local L2_45, L3_46
	if A1_44 == nil then
		L2_45 = _ENV
		L2_45 = L2_45.shop_buy_check_info
		if L2_45 then
			L2_45 = _ENV
			L2_45 = L2_45.shop_buy_check_info
			L2_45 = L2_45[A0_43]
			if L2_45 then
				L2_45 = _ENV
				L2_45 = L2_45.shop_buy_check_info
				L2_45[A0_43] = nil
			end
		end
	else
		L2_45 = _ENV
		L2_45 = L2_45.shop_buy_check_info
		if not L2_45 then
			L2_45 = _ENV
			L3_46 = {}
			L2_45.shop_buy_check_info = L3_46
		end
		L2_45 = _ENV
		L2_45 = L2_45.shop_buy_check_info
		L2_45[A0_43] = A1_44
	end
end
L2_2.set_shop_buy_check_info = L9_9
function L9_9(A0_47)
	local L3_50, L7_54 = _ENV, L7_54
	L3_50 = L3_50.shop_car_list
	L1_48, L3_50, L4_51 = L1_48(L3_50)
	for L5_52, L6_53 in L1_48, L3_50, L4_51 do
		L7_54 = L6_53.shop_id
		if L7_54 == A0_47.shop_id then
			L7_54 = true
			return L7_54
		end
	end
	L1_48 = _ENV
	L1_48 = L1_48.shop_car_suit
	L1_48 = L1_48 == A0_47
	return L1_48
end
L2_2.is_in_shop_car = L9_9
function L9_9(A0_55)
	local L1_56 = L1_56
	L1_56 = L1_56(A0_55)
	local L2_57 = L2_57
	L2_57 = L2_57(L1_56.item_id)
	local L3_58 = L3_58
	do return L3_58(L2_57) end
	local L4_59 = L4_59
end
L2_2.is_gift_shop = L9_9
function L9_9(A0_60)
	local L7_67, L14_74, L15_75 = _ENV.is_in_shop_car, L14_74, L15_75
	L14_74 = A0_60
	L7_67 = L7_67(L14_74)
	if L7_67 then
		return
	end
	L7_67 = _ENV
	L7_67 = L7_67.is_gift_shop
	L14_74 = A0_60.shop_id
	L7_67 = L7_67(L14_74)
	if L7_67 then
		L14_74 = _ENV
		L14_74.shop_car_suit = A0_60
		return
	end
	L14_74 = {}
	L15_75 = _ENV
	L15_75 = L15_75.get_looks
	L15_75 = L15_75(A0_60.shop_id)
	_FOR_, _FOR_, _FOR_ = ipairs(L15_75)
	for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
		L14_74[_FORV_8_.type] = true
	end
	_FOR_ = -1
	for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
		_FOR_, _FOR_, _FOR_ = ipairs((_ENV.get_looks(_ENV.shop_car_list[_FORV_7_].shop_id)))
		for _FORV_14_, _FORV_15_ in _FOR_, _FOR_, _FOR_ do
			if L14_74[_FORV_15_.type] then
				break
			end
		end
		if true then
			local L12_72 = L12_72
			table.remove(_ENV.shop_car_list, _FORV_7_)
			local L13_73 = L13_73
		end
	end
	L8_68 = table
	L8_68 = L8_68.insert
	L9_69 = _ENV
	L9_69 = L9_69.shop_car_list
	L16_76 = A0_60
	L8_68(L9_69, L16_76)
end
L2_2.add_to_shop_car = L9_9
function L9_9(A0_77)
	if not A0_77 then
		return
	end
	L3_80 = _ENV
	L3_80 = L3_80.shop_car_suit
	if L3_80 then
		L3_80 = _ENV
		L3_80 = L3_80.shop_car_suit
		L3_80 = L3_80.shop_id
		L4_81 = A0_77.shop_id
		if L3_80 == L4_81 then
			L3_80 = _ENV
			L3_80.shop_car_suit = nil
			return
		end
	end
	L3_80 = ipairs
	L4_81 = _ENV
	L4_81 = L4_81.shop_car_list
	L3_80, L4_81, _FOR_ = L3_80(L4_81)
	for _FORV_4_, _FORV_5_ in L3_80, L4_81, _FOR_ do
		if _FORV_5_.shop_id == A0_77.shop_id then
			table.remove(_ENV.shop_car_list, _FORV_4_)
			break
		end
	end
end
L2_2.remove_from_shop_car = L9_9
function L9_9()
	_ENV.shop_car_suit = nil
	local L0_85 = L0_85
	L0_85(_ENV.shop_car_list)
	local L1_86 = L1_86
end
L2_2.clear_shop_car = L9_9
L9_9 = {}
function L2_2.get_shop_car(A0_87)
	table.clear(_ENV)
	if A0_87 then
		_FOR_, _FOR_, _FOR_ = ipairs(L1_1.shop_car_list)
		for _FORV_4_, _FORV_5_ in _FOR_, _FOR_, _FOR_ do
			table.insert(_ENV, _FORV_5_)
		end
		if L1_1.shop_car_suit then
			table.insert(_ENV, 1, L1_1.shop_car_suit)
		end
	else
		_FOR_, _FOR_, _FOR_ = ipairs(L1_1.shop_car_list)
		for _FORV_4_, _FORV_5_ in _FOR_, _FOR_, _FOR_ do
			if L3_3.get_config(_FORV_5_.shop_id).is_preview ~= 1 and not L0_0.is_sold_out(_FORV_5_.shop_id) then
				table.insert(_ENV, _FORV_5_)
			end
		end
		L7_94 = L1_1
		L7_94 = L7_94.shop_car_suit
		if L7_94 then
			L7_94 = L0_0
			L7_94 = L7_94.is_sold_out
			L8_95 = L1_1
			L8_95 = L8_95.shop_car_suit
			L8_95 = L8_95.shop_id
			L7_94 = L7_94(L8_95)
			L8_95 = L3_3
			L8_95 = L8_95.get_config
			L9_96 = L1_1
			L9_96 = L9_96.shop_car_suit
			L9_96 = L9_96.shop_id
			L8_95 = L8_95(L9_96)
			L9_96 = L8_95.is_preview
			if L9_96 ~= 1 and not L7_94 then
				L9_96 = table
				L9_96 = L9_96.insert
				L10_97 = _ENV
				local L5_92 = L5_92
				L9_96(L10_97, L5_92, L1_1.shop_car_suit)
				local L6_93 = L6_93
			end
		end
	end
	L7_94 = _ENV
	L8_95 = L1_1
	L8_95 = L8_95.shop_car_suit
	return L7_94, L8_95
end
function L2_2.get_shop_car_looks()
	local L3_101, L7_105, L8_106, L15_113 = _ENV.get_shop_car, L7_105, L8_106, L15_113
	L7_105 = true
	L3_101 = L3_101(L7_105)
	L7_105 = {}
	L8_106 = L6_6
	L8_106 = L8_106.get_preview_fashion_list_by_show_list
	L8_106 = L8_106()
	L15_113 = {}
	L16_114 = ipairs
	L16_114, _FOR_, _FOR_ = L16_114(L8_106)
	for _FORV_7_, _FORV_8_ in L16_114, _FOR_, _FOR_ do
		L15_113[_FORV_8_.type] = _FORV_8_
	end
	L16_114 = ipairs
	L16_114, _FOR_, _FOR_ = L16_114(L3_101)
	for _FORV_7_, _FORV_8_ in L16_114, _FOR_, _FOR_ do
		_FOR_, _FOR_, _FOR_ = ipairs(_ENV.get_looks(_FORV_8_.shop_id))
		for _FORV_15_, _FORV_16_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_16_.val > 0 and L5_5.is_gender_limit(_FORV_16_.val) then
				break
			end
		end
		if true then
		else
			_FOR_, _FOR_, _FOR_ = ipairs(_ENV.get_looks(_FORV_8_.shop_id))
			for _FORV_15_, _FORV_16_ in _FOR_, _FOR_, _FOR_ do
				if _FORV_16_.val > 0 then
					local L19_117 = L19_117
					if 0 < #L5_5.check_lock_limit(_FORV_16_.val, L15_113) then
						_FOR_, _FOR_, _FOR_ = ipairs(L5_5.check_lock_limit(_FORV_16_.val, L15_113))
						for _FORV_23_, _FORV_24_ in _FOR_, _FOR_, _FOR_ do
							({}).type = L6_6.get_fashion_by_item_id(_FORV_24_).show_part
							L15_113[L6_6.get_fashion_by_item_id(_FORV_24_).show_part], ({}).val = {}, _FORV_24_
						end
						_FOR_, _FOR_, _FOR_ = ipairs(L5_5.check_lock_limit(_FORV_16_.val, L15_113))
						for _FORV_23_, _FORV_24_ in _FOR_, _FOR_, _FOR_ do
							local L26_124 = L26_124
							;({}).type = L6_6.get_fashion_by_item_id(_FORV_24_).show_part
							L15_113[L6_6.get_fashion_by_item_id(_FORV_24_).show_part], ({}).val = {}, _FORV_24_
							local L27_125 = L27_125
						end
					end
					if 0 < #L5_5.check_other_lock_limit(_FORV_16_.val, L15_113) then
						_FOR_, _FOR_, _FOR_ = ipairs(L5_5.check_other_lock_limit(_FORV_16_.val, L15_113))
						for _FORV_26_, _FORV_27_ in _FOR_, _FOR_, _FOR_ do
							L15_113[L6_6.get_fashion_by_item_id(_FORV_27_).show_part] = nil
						end
						_FOR_, _FOR_, _FOR_ = ipairs(L5_5.check_other_lock_limit(_FORV_16_.val, L15_113))
						for _FORV_26_, _FORV_27_ in _FOR_, _FOR_, _FOR_ do
							local ({}).type, L31_129 = L6_6.get_fashion_by_item_id(_FORV_27_).show_part, L31_129
							L15_113[L6_6.get_fashion_by_item_id(_FORV_27_).show_part], ({}).val = {}, _FORV_27_
						end
					end
					L15_113[_FORV_16_.type] = _FORV_16_
				end
			end
			L22_120 = pairs
			L24_122 = L26_124
			L22_120, L24_122, L25_123 = L22_120(L24_122)
			for L28_126, L29_127 in L22_120, L24_122, L25_123 do
				L7_105[L28_126] = L29_127
			end
		end
	end
	L16_114 = table
	L16_114 = L16_114.dict2arr
	L10_108 = L15_113
	L16_114 = L16_114(L10_108)
	L15_113 = L16_114
	L16_114 = L15_113
	L10_108 = L7_105
	return L16_114, L10_108
end
function L2_2.get_looks(A0_130, A1_131, A2_132)
	local L5_135, L6_136, L11_141, L12_142 = L5_135, L6_136, L11_141, L12_142
	if not A2_132 then
		L5_135 = _ENV
		L5_135 = L5_135.get_player_sex
		L5_135 = L5_135()
		A2_132 = L5_135
	end
	L5_135 = L3_3
	L5_135 = L5_135.get_config
	L6_136 = A0_130
	L5_135 = L5_135(L6_136)
	L6_136 = L5_135.avatar_show
	if not L6_136 then
		L6_136 = {}
	end
	L11_141 = A1_131 or L11_141
	if not A1_131 then
		L11_141 = {}
	end
	L12_142 = {}
	L20_150 = #L6_136
	if L20_150 == 0 then
		L20_150 = L6_6
		L20_150 = L20_150.get_item_fashion_id_list
		L20_150 = L20_150(L5_135.item_id, A2_132)
		_FOR_, _FOR_, _FOR_ = pairs(L20_150)
		for _FORV_11_, _FORV_12_ in _FOR_, _FOR_, _FOR_ do
			table.insert(L11_141, (L6_6.create_template_fashion(_FORV_12_)))
		end
		break -- pseudo-goto
	end
	L20_150 = pairs
	L14_144 = L6_136
	L20_150, L14_144, _FOR_ = L20_150(L14_144)
	for _FORV_10_, _FORV_11_ in L20_150, L14_144, _FOR_ do
		if _FORV_11_[2] == 0 then
			if L6_6.get_default_fashion_by_show_part(_FORV_11_[1], A2_132) and (not L6_6.get_item_by_fashion_id((L6_6.get_default_fashion_by_show_part(_FORV_11_[1], A2_132))) or not L6_6.get_item_by_fashion_id((L6_6.get_default_fashion_by_show_part(_FORV_11_[1], A2_132))).id) then
			end
			if not false then
			end
			L12_142[_FORV_11_[1]] = true
			table.insert(L11_141, (L6_6.create_template_fashion(false or 0)))
			break -- pseudo-goto
		end
		_FOR_, _FOR_, _FOR_ = pairs((L6_6.get_item_fashion_id_list(_FORV_11_[2], A2_132)))
		for _FORV_19_, _FORV_20_ in _FOR_, _FOR_, _FOR_ do
			local L21_151 = L21_151
			local L22_152 = L22_152
			local L23_153 = L23_153
			table.insert(L11_141, (L6_6.create_template_fashion(_FORV_20_)))
			local L24_154 = L24_154
			repeat
				repeat
				until true
			until true
		end
	end
	L20_150 = L11_141
	L14_144 = L12_142
	return L20_150, L14_144
end
function L2_2.get_collect_item_num(A0_155)
	local L1_156
	L1_156 = _ENV
	L1_156 = L1_156.collect_list
	if not L1_156 then
		L1_156 = 0
		return L1_156
	end
	L1_156 = _ENV
	L1_156 = L1_156.collect_list
	L1_156 = L1_156[A0_155]
	if not L1_156 then
		L1_156 = 0
	end
	return L1_156
end
function L2_2.get_item_cid_shop_cfg_dict_by_type(A0_157)
	local L1_158, L2_159
	L1_158 = {}
	L2_159 = pairs
	L4_161 = _ENV
	L4_161 = L4_161.get_all_configs
	L4_161, L5_162, L6_163, L7_164 = L4_161()
	L2_159, L4_161, L5_162 = L2_159(L4_161, L5_162, L6_163, L7_164, L4_161())
	for L6_163, L7_164 in L2_159, L4_161, L5_162 do
		if L7_164.type == A0_157 then
			L1_158[L7_164.item_id] = L7_164
		end
	end
	return L1_158
end
