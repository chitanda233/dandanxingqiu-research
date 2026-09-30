local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
L0_0 = pairs
local L1_1, L10_10, L11_11, L12_12 = ipairs, L10_10, L11_11, L12_12
L2_2 = DataConfigs
L3_3 = L2_2.rank_system
L4_4 = L2_2.like
L5_5 = L2_2.rank_dividend_reward
L6_6 = L2_2.rank_settlement
L7_7 = L2_2.rank_settle_reward
L10_10 = import
L11_11 = "..head"
L10_10 = L10_10(L11_11)
L11_11 = L10_10.data
L12_12 = L10_10.const
function L11_11.init()
	_ENV.reset()
end
function L11_11.clear()
	_ENV.reset()
end
function L11_11.reset()
	local L0_13, L1_14
	L0_13 = _ENV
	L1_14 = {}
	L0_13.cd_time = L1_14
	L0_13 = _ENV
	L1_14 = {}
	L0_13.rank_info = L1_14
	L0_13 = _ENV
	L1_14 = {}
	L0_13.like_info = L1_14
	L0_13 = _ENV
	L1_14 = {}
	L0_13.dividend_info = L1_14
	L0_13 = _ENV
	L1_14 = {}
	L0_13.dividend_red = L1_14
	L0_13 = _ENV
	L1_14 = {}
	L0_13.rank_size = L1_14
	L0_13 = _ENV
	L1_14 = {}
	L0_13.rank_index = L1_14
	L0_13 = _ENV
	L1_14 = {}
	L0_13.k_v = L1_14
end
function L11_11.update_rank_info(A0_15)
	local L1_16, L2_17, L3_18
	L1_16 = A0_15.rank_type
	local L2_17, L7_22, L10_25, L11_26, L13_27 = A0_15.my_rank, L7_22, L10_25, L11_26, L13_27
	L3_18 = A0_15.rank_info
	if L3_18 then
		L7_22 = table
		L7_22 = L7_22.sort
		L10_25 = L3_18
		function L11_26(A0_28, A1_29)
			local L2_30, L3_31
			L2_30 = A0_28.rank_index
			L3_31 = A1_29.rank_index
			L2_30 = L2_30 < L3_31
			return L2_30
		end
		L7_22(L10_25, L11_26)
	end
	L7_22 = A0_15.page
	L7_22 = L7_22 == 1
	if not L7_22 then
		L10_25 = _ENV
		L10_25 = L10_25.rank_info
		L11_26 = A0_15.rank_type
		L10_25 = L10_25[L11_26]
		if L10_25 then
			goto lbl_34
		end
	end
	L10_25 = _ENV
	L10_25 = L10_25.rank_info
	L11_26 = A0_15.rank_type
	L10_25[L11_26] = A0_15
	goto lbl_80
	::lbl_34::
	if L3_18 then
		L10_25 = next
		L11_26 = L3_18
		L10_25 = L10_25(L11_26)
		if L10_25 then
			L10_25 = _ENV
			L10_25 = L10_25.rank_info
			L11_26 = A0_15.rank_type
			L10_25 = L10_25[L11_26]
			L10_25 = L10_25.rank_info
			if not L10_25 then
				L10_25 = {}
			end
			L11_26 = L3_18[1]
			L11_26 = L11_26.rank_index
			L13_27 = #L10_25
			L13_27 = L13_27 + 1
			L9_24, _FOR_, _FOR_ = L1_1(L10_25)
			for _FORV_11_, _FORV_12_ in L9_24, _FOR_, _FOR_ do
				if _FORV_12_.rank_index == L11_26 then
					L13_27 = _FORV_11_
					break
				end
			end
			L9_24 = L13_27
			_FOR_ = 1
			for _FORV_11_ = L9_24, _FOR_, _FOR_ do
				L10_25[_FORV_11_] = L3_18[_FORV_11_ + 1 - L13_27]
			end
			L9_24 = _ENV
			L9_24 = L9_24.rank_info
			L9_24 = L9_24[A0_15.rank_type]
			L9_24.rank_info = L10_25
		end
	end
	::lbl_80::
	L10_25 = _ENV
	L10_25 = L10_25.rank_info
	L11_26 = A0_15.rank_type
	L10_25 = L10_25[L11_26]
	L10_25.my_rank = L2_17
end
function L11_11.get_my_info(A0_32)
	local L1_33
	L1_33 = _ENV
	L1_33 = L1_33.rank_info
	L1_33 = L1_33[A0_32]
	if L1_33 then
		L1_33 = _ENV
		L1_33 = L1_33.rank_info
		L1_33 = L1_33[A0_32]
		L1_33 = L1_33.my_rank
	end
	return L1_33
end
function L11_11.get_rank_info(A0_34)
	local L1_35
	L1_35 = _ENV
	L1_35 = L1_35.rank_info
	L1_35 = L1_35[A0_34]
	if L1_35 then
		L1_35 = _ENV
		L1_35 = L1_35.rank_info
		L1_35 = L1_35[A0_34]
		L1_35 = L1_35.rank_info
	end
	return L1_35
end
function L11_11.clear_rank_info()
	local L0_36, L1_37
	L0_36 = _ENV
	L1_37 = {}
	L0_36.cd_time = L1_37
	L0_36 = _ENV
	L1_37 = {}
	L0_36.rank_info = L1_37
end
function L11_11.clear_rank_info_by_type(A0_38)
	if not _ENV.rank_info[A0_38] then
		return
	end
	local L1_39 = L1_39
	L1_39(_ENV.rank_info[A0_38])
	local L2_40 = L2_40
	L1_39 = _ENV
	L1_39 = L1_39.cd_time
	L1_39[A0_38] = nil
end
function L11_11.init_like_info(A0_41)
	L4_45 = {}
	L3_44.like_info = L4_45
	L3_44 = L0_0
	L4_45 = A0_41.info
	if not L4_45 then
		L4_45 = {}
	end
	L3_44, L4_45, L5_46 = L3_44(L4_45)
	for L9_50, L10_51 in L3_44, L4_45, L5_46 do
		L11_52 = _ENV
		L11_52 = L11_52.like_info
		L12_53 = L10_51.type
		L11_52[L12_53] = {}
		L11_52 = L0_0
		L12_53 = L10_51.role_list
		if not L12_53 then
			L12_53 = {}
		end
		L11_52, L12_53, _FOR_ = L11_52(L12_53)
		for _FORV_9_, _FORV_10_ in L11_52, L12_53, _FOR_ do
			_ENV.like_info[L10_51.type][_FORV_10_] = true
		end
	end
end
function L11_11.update_like_info(A0_54)
	local L1_55, L2_56, L3_57
	L1_55 = _ENV
	L1_55 = L1_55.like_info
	L2_56 = A0_54.type
	L1_55 = L1_55[L2_56]
	if not L1_55 then
		L1_55 = _ENV
		L1_55 = L1_55.like_info
		L2_56 = A0_54.type
		L3_57 = {}
		L1_55[L2_56] = L3_57
	end
	L1_55 = _ENV
	L1_55 = L1_55.like_info
	L2_56 = A0_54.type
	L1_55 = L1_55[L2_56]
	L2_56 = A0_54.role_id
	L1_55[L2_56] = true
end
function L11_11.get_like_info_by_type(A0_58)
	local L1_59
	L1_59 = _ENV
	L1_59 = L1_59.like_info
	L1_59 = L1_59[A0_58]
	if not L1_59 then
		L1_59 = {}
	end
	return L1_59
end
function L11_11.get_can_like(A0_60)
	local L1_61 = L1_61
	L1_61 = L1_61(A0_60)
	local L2_62 = L2_62
	local L2_62, L3_63 = L2_62(L1_61), L3_63
	if not L2_62 then
		L2_62 = false
		return L2_62
	end
	L2_62 = true
	return L2_62
end
function L11_11.get_is_like(A0_64, A1_65, A2_66)
	if not A2_66 then
		local L3_67 = L3_67
		local L3_67, L4_68 = L3_67(A0_64), L4_68
	end
	L4_68 = _ENV
	L4_68 = L4_68.like_info
	L4_68 = L4_68[L3_67]
	if L4_68 then
		L4_68 = _ENV
		L4_68 = L4_68.like_info
		L4_68 = L4_68[L3_67]
		L4_68 = L4_68[A1_65]
	end
	return L4_68
end
function L11_11.trans_like_type(A0_69)
	local L1_70
	L1_70 = 0
	local L2_71 = L2_71
	local L2_71, L3_72 = L2_71(A0_69), L3_72
	if L2_71 then
		L3_72 = L2_71.like_type
		if L3_72 then
			L3_72 = L2_71.like_type
			if 0 < L3_72 then
				L1_70 = L2_71.like_type
			end
		end
	end
	return L1_70
end
function L11_11.init_dividend_info(A0_73)
	L4_77 = {}
	L3_76.dividend_info = L4_77
	L3_76 = L1_1
	L4_77 = A0_73.dividend_list
	if not L4_77 then
		L4_77 = {}
	end
	L3_76, L4_77, L5_78 = L3_76(L4_77)
	for L6_79, _FORV_5_ in L3_76, L4_77, L5_78 do
		_ENV.dividend_info[_FORV_5_] = true
	end
end
function L11_11.update_dividend_info(A0_80)
	local L1_81, L2_82
	L1_81 = _ENV
	L1_81 = L1_81.dividend_info
	L2_82 = A0_80.id
	L1_81[L2_82] = true
end
function L11_11.is_finish_dividend(A0_83)
	local L1_84
	L1_84 = _ENV
	L4_87 = L5_5
	L4_87 = L4_87.get_configs_by_rank_id
	L5_88 = A0_83
	L4_87, L5_88, L6_89, L7_90 = L4_87(L5_88)
	L1_84, L4_87, L5_88 = L1_84(L4_87, L5_88, L6_89, L7_90, L4_87(L5_88))
	for L6_89, L7_90 in L1_84, L4_87, L5_88 do
		if not L9_9.dividend_info[L7_90.id] and not L9_9.dividend_red[L7_90.id] then
			return false
		end
	end
	L1_84 = true
	return L1_84
end
function L11_11.get_barrage_list(A0_91)
	local L1_92 = L1_92
	local L1_92, L2_93 = L1_92(A0_91), L2_93
	if L1_92 then
		L2_93 = L1_92[1]
		if L2_93 then
			goto lbl_11
		end
	end
	do return end
	::lbl_11::
	L2_93 = L1_92[1]
	L2_93 = L2_93.barrage_list
	return L2_93
end
function L11_11.init_barrage_info(A0_94, A1_95)
	local L2_96 = L2_96
	local L2_96, L3_97 = L2_96(A0_94), L3_97
	if L2_96 then
		L3_97 = L2_96[1]
		if L3_97 then
			goto lbl_12
		end
	end
	L3_97 = false
	do return L3_97 end
	::lbl_12::
	L3_97 = L2_96[1]
	L3_97.barrage_list = A1_95
	L3_97 = true
	return L3_97
end
function L11_11.update_barrage_info(A0_98, A1_99)
	local L2_100 = L2_100
	local L2_100, L3_101 = L2_100(A0_98), L3_101
	if not L2_100 then
		L3_101 = false
		return L3_101
	end
	L3_101 = L2_100[1]
	if not L3_101 then
		return false
	end
	if not L3_101.barrage_list then
		L3_101.barrage_list, ({})[1] = {}, A1_99
	else
		local L4_102 = L4_102
		local L5_103 = L5_103
		local L6_104 = L6_104
		L4_102(L5_103, L6_104, A1_99)
		local L7_105 = L7_105
	end
	L4_102 = true
	return L4_102
end
function L11_11.has_settle_reward(A0_106, A1_107)
	local L5_111, L14_120 = _ENV.get_config, L14_120
	L6_112 = A0_106
	L5_111 = L5_111(L6_112)
	L6_112 = L0_0
	L7_113 = L5_111.settlement_ids
	L6_112, L7_113, L11_117 = L6_112(L7_113)
	for L12_118, L13_119 in L6_112, L7_113, L11_117 do
		L14_120 = L6_6
		L14_120 = L14_120.get_config
		L15_121 = L13_119
		L14_120 = L14_120(L15_121)
		L15_121 = L14_120.settlement
		if L15_121 == A1_107 then
			L15_121 = L0_0
			L15_121, _FOR_, _FOR_ = L15_121(L7_7.get_all_config())
			for _FORV_12_, _FORV_13_ in L15_121, _FOR_, _FOR_ do
				if _FORV_13_.settlement_id and _FORV_13_.settlement_id == L14_120.id then
					return true
				end
			end
		end
	end
	L6_112 = false
	return L6_112
end
function L11_11.get_rank_refresh_desc(A0_122)
	repeat
		local L5_127, L6_128 = _ENV.get_config, L6_128
		L6_128 = A0_122
		L5_127 = L5_127(L6_128)
		L6_128 = L5_127 or L6_128
		if L5_127 then
			L6_128 = L5_127.settlement_ids
			if L6_128 then
				L6_128 = L5_127.settlement_ids
				L6_128 = L6_128[1]
			end
		end
		local L3_125 = L3_125
		local L3_125, L4_126 = L3_125(L6_128), L4_126
		L4_126 = ""
		if L5_127.refresh_type == 0 then
			L4_126 = "\229\141\179\230\151\182\229\136\183\230\150\176"
		elseif L5_127.refresh_type == 1 then
			L4_126 = "\230\175\143\229\176\143\230\151\182\229\136\183\230\150\176"
		elseif L5_127.refresh_type == 2 then
			L4_126 = "\230\175\143\230\151\1655\231\130\185"
		elseif L5_127.refresh_type == 3 then
			L4_126 = "\230\180\187\229\138\168\231\187\147\231\174\151\229\136\183\230\150\176"
		end
		if not L3_125 or not L3_125.settlement then
		end
		if 0 == 0 then
		elseif 0 == 1 then
		elseif 0 == 2 then
		elseif 0 == 3 then
		elseif 0 == 4 then
		end
		if "\230\175\143\230\156\136\231\187\147\231\174\151" ~= "" then
			do return string.format("\229\189\147\229\137\141\230\152\159\231\144\131\230\142\146\232\161\140,%s,%s", L4_126, "\230\175\143\230\156\136\231\187\147\231\174\151") end
			local L10_132 = L10_132
			break -- pseudo-goto
		end
		local L8_130 = L8_130
		do return string.format("\229\189\147\229\137\141\230\152\159\231\144\131\230\142\146\232\161\140,%s", L4_126) end
		local L9_131 = L9_131
	until true
end
function L11_11.set_value(A0_133, A1_134)
	local L2_135
	L2_135 = _ENV
	L2_135 = L2_135.k_v
	L2_135[A0_133] = A1_134
end
function L11_11.get_value(A0_136)
	local L1_137
	L1_137 = _ENV
	L1_137 = L1_137.k_v
	L1_137 = L1_137[A0_136]
	return L1_137
end
function L11_11.get_show_content_by_player_info(A0_138, A1_139)
	local L2_140, L3_141
	L2_140 = ""
	L3_141 = _ENV
	L3_141 = L3_141.rank_type
	L3_141 = L3_141.power
	if A0_138 == L3_141 then
		L3_141 = A1_139.power
		if L3_141 then
			L2_140 = A1_139.power
		end
	else
		L3_141 = _ENV
		L3_141 = L3_141.rank_type
		L3_141 = L3_141.achievement
		if A0_138 == L3_141 then
			L3_141 = A1_139.power
			if L3_141 then
				L2_140 = A1_139.power
			end
		else
			L3_141 = _ENV
			L3_141 = L3_141.rank_type
			L3_141 = L3_141.level
			if A0_138 == L3_141 then
				L3_141 = A1_139.level
				if L3_141 then
					L2_140 = A1_139.level
				end
			else
				L3_141 = _ENV
				L3_141 = L3_141.rank_type
				L3_141 = L3_141.label
				if A0_138 == L3_141 then
					L3_141 = A1_139.label
					if L3_141 then
						L2_140 = A1_139.label
					end
				else
					L3_141 = _ENV
					L3_141 = L3_141.rank_type
					L3_141 = L3_141.fashion_point
					if A0_138 == L3_141 then
						L3_141 = A1_139.label
						if L3_141 then
							L2_140 = A1_139.fashion_point
						end
					end
				end
			end
		end
	end
	return L2_140
end
function L11_11.update_role_index(A0_142)
	local L1_143, L2_144, L3_145
	L1_143 = _ENV
	L1_143 = L1_143.rank_index
	L2_144 = A0_142.rank_type
	L3_145 = A0_142.index
	L1_143[L2_144] = L3_145
end
function L11_11.get_role_index(A0_146)
	local L1_147, L2_148
	L1_147 = _ENV
	L1_147 = L1_147.rank_index
	L1_147 = L1_147[A0_146]
	if L1_147 and 0 < L1_147 then
		return L1_147
	end
	L2_148 = "\230\151\160"
	return L2_148
end
