local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
L0_0 = ipairs
local L1_1, L11_11, L12_12, L13_13, L14_14 = Time, L11_11, L12_12, L13_13, L14_14
L2_2 = BroadcastTips
L3_3 = DataConfigs
L4_4 = L3_3.language_define
L5_5 = L3_3.like
L6_6 = L3_3.rank_system
L7_7 = Game
L7_7 = L7_7.events
L11_11 = require
L12_12 = "game.network.network_utils"
L11_11 = L11_11(L12_12)
L12_12 = import
L13_13 = "..head"
L12_12 = L12_12(L13_13)
L13_13 = L12_12.data
L14_14 = L12_12.network
function L14_14.init()
	({}).rank_info_s2c = _ENV.on_rank_info_s2c
	;({}).rank_size_s2c = _ENV.on_rank_size_s2c
	;({}).like_info_s2c = _ENV.on_like_info_s2c
	;({}).like_do_s2c = _ENV.on_like_do_s2c
	;({}).like_received_s2c = _ENV.on_like_received_s2c
	;({}).like_offline_num_s2c = _ENV.on_like_offline_num_s2c
	;({}).rank_role_s2c = _ENV.on_rank_role_s2c
	;({}).rank_get_barrage_info_s2c = _ENV.on_rank_get_barrage_info_s2c
	;({}).rank_send_barrage_s2c = _ENV.on_rank_send_barrage_s2c
	_ENV.net_event_names, ({}).rank_get_role_index_s2c = {}, _ENV.on_rank_get_role_index_s2c
	local L0_15 = L0_15
	local L1_16 = L1_16
	L0_15(L1_16, "rank")
	local L2_17 = L2_17
end
function L14_14.clear()
	local L0_18 = L0_18
	L0_18(L14_14.net_event_names)
	local L1_19 = L1_19
	L0_18 = L14_14
	L0_18.net_event_names = nil
end
function L14_14.rank_get_role_index_c2s(A0_20)
	local L1_21 = L1_21
	local L2_22 = L2_22
	;({}).rank_type = A0_20
	L1_21(L2_22, {})
	local L3_23 = L3_23
end
function L14_14.req_rank_info_c2s(A0_24, A1_25, A2_26, A3_27)
	local L4_28
	L4_28 = _ENV
	L4_28 = L4_28.cd_time
	L4_28 = L4_28[A0_24]
	if not L4_28 then
		L4_28 = 0
	end
	if L4_28 > L1_1.time then
		return
	end
	_ENV.cd_time[A0_24] = L1_1.time + 1
	local L5_29 = L5_29
	local L5_29, L6_30 = L5_29(A0_24), L6_30
	if L5_29 then
		L6_30 = L5_29.scope_group_type
		if L6_30 == _UPVALUE3_.scope_group_type.alliance and (not A3_27 or A3_27 == 0) then
			return
		end
	end
	L6_30 = {}
	L6_30.rank_type = A0_24
	L6_30.time_type = A1_25
	L6_30.size = A2_26
	if not A3_27 then
	end
	L6_30.group_id = 0
	local L7_31 = L7_31
	local L8_32 = L8_32
	L7_31(L8_32, L6_30)
	local L9_33 = L9_33
end
function L14_14.req_rank_info_c2s_by_page(A0_34, A1_35, A2_36, A3_37, A4_38, A5_39)
	local L6_40
	L6_40 = _ENV
	L6_40 = L6_40.cd_time
	L6_40 = L6_40[A0_34]
	if not L6_40 then
		L6_40 = 0
	end
	if L6_40 > L1_1.time then
		return false
	end
	_ENV.cd_time[A0_34] = L1_1.time + 1
	local L7_41 = L7_41
	local L7_41, L8_42 = L7_41(A0_34), L8_42
	if L7_41 then
		L8_42 = L7_41.scope_group_type
		if L8_42 == _UPVALUE3_.scope_group_type.alliance and (not A5_39 or A5_39 == 0) then
			L8_42 = false
			return L8_42
		end
	end
	L8_42 = {}
	L8_42.rank_type = A0_34
	L8_42.time_type = A1_35
	L8_42.size = A2_36
	L8_42.page = A3_37
	L8_42.rank_tag = A4_38
	if not A5_39 then
	end
	L8_42.group_id = 0
	_ENV.set_value("req_rank_info_param", L8_42)
	local L9_43 = L9_43
	local L10_44 = L10_44
	L9_43(L10_44, L8_42)
	local L11_45 = L11_45
	L9_43 = true
	return L9_43
end
function L14_14.on_rank_info_s2c(A0_46, A1_47)
	if A0_46 ~= 0 then
		return
	end
	_ENV.update_rank_info(A1_47)
	local L2_48 = L2_48
	local L3_49 = L3_49
	L2_48(L3_49, A1_47.rank_type, A1_47)
	L2_48 = A1_47.rank_type
	L3_49 = A1_47.rank_info
	if not L3_49 then
		L3_49 = {}
	end
	if _ENV.rank_size[L2_48] then
		_ENV.rank_size[L2_48] = #L3_49
		local L4_50 = L4_50
		L4_50(_UPVALUE2_.update_size)
		local L5_51 = L5_51
	end
end
function L14_14.req_rank_size_c2s(A0_52)
	local L1_53
	L1_53 = {}
	L1_53.rank_type = A0_52
	local L2_54 = L2_54
	local L3_55 = L3_55
	L2_54(L3_55, L1_53)
	local L4_56 = L4_56
end
function L14_14.on_rank_size_s2c(A0_57, A1_58)
	if A0_57 ~= 0 then
		return
	end
	L5_62 = _ENV
	L6_63 = A1_58.rank_data
	if not L6_63 then
		L6_63 = {}
	end
	L5_62, L6_63, _FOR_ = L5_62(L6_63)
	for _FORV_5_, _FORV_6_ in L5_62, L6_63, _FOR_ do
		L10_10.rank_size[_FORV_6_.rank_type] = _FORV_6_.size
	end
	L5_62 = L7_7
	L5_62 = L5_62.brocast
	L6_63 = _UPVALUE3_
	L6_63 = L6_63.update_size
	L5_62(L6_63)
end
function L14_14.req_like_info_c2s()
	local L1_67 = L1_67
	L1_67("like_info_c2s", {})
	local L2_68 = L2_68
end
function L14_14.on_like_info_s2c(A0_69, A1_70)
	if A0_69 ~= 0 then
		return
	end
	_ENV.init_like_info(A1_70)
	local L2_71 = L2_71
	L2_71(_UPVALUE2_.update_like)
	local L3_72 = L3_72
end
function L14_14.req_like_do_c2s(A0_73, A1_74)
	if not A1_74 or A1_74 == 0 then
		local L2_75 = L2_75
		L2_75("req_like_do_c2s role_id error, type:{0}, role_id:{1}", A0_73, A1_74)
		return
	end
	L2_75 = {}
	L2_75.type = A0_73
	L2_75.role_id = A1_74
	local L3_76 = L3_76
	local L4_77 = L4_77
	L3_76(L4_77, L2_75)
	local L5_78 = L5_78
end
function L14_14.on_like_do_s2c(A0_79, A1_80)
	if A0_79 ~= 0 then
		return
	end
	_ENV.update_like_info(A1_80)
	local L2_81 = L2_81
	L2_81(_UPVALUE2_.update_like, A1_80)
	L2_81 = L2_2
	L2_81 = L2_81.broadcast_tips
	local L3_82 = L3_82
	local L4_83 = L4_83
	local L3_82, L4_83, L5_84 = L3_82(L4_83, A1_80.role_name)
	L2_81(L3_82, L4_83, L5_84)
end
function L14_14.on_like_received_s2c(A0_85, A1_86)
	if A0_85 ~= 0 then
		return
	end
	local L2_87 = L2_87
	local L2_87, L3_88 = L2_87(A1_86.type), L3_88
	if L2_87 then
		L3_88 = L2_2
		L3_88 = L3_88.broadcast_tips
		L3_88(string.format(L4_4.get_string(L2_87.format), A1_86.role_name))
	else
		L3_88 = L2_2
		L3_88 = L3_88.broadcast_tips
		local L4_89 = L4_89
		local L5_90 = L5_90
		local L4_89, L5_90, L6_91 = L4_89(L5_90, A1_86.role_name)
		L3_88(L4_89, L5_90, L6_91)
	end
end
function L14_14.req_like_offline_num_c2s()
	local L1_92 = L1_92
	L1_92("like_offline_num_c2s", {})
	local L2_93 = L2_93
end
function L14_14.on_like_offline_num_s2c(A0_94, A1_95)
	local L2_96
	if A0_94 ~= 0 then
		return
	end
	L2_96 = A1_95.offline_num
	if L2_96 then
		L2_96 = A1_95.offline_num
		if 0 < L2_96 then
			L2_96 = _ENV
			L2_96 = L2_96.broadcast_tips
			local L3_97 = L3_97
			local L4_98 = L4_98
			local L3_97, L4_98, L5_99 = L3_97(L4_98, A1_95.offline_num)
			L2_96(L3_97, L4_98, L5_99)
		end
	end
end
function L14_14.req_rank_role_c2s()
	local L1_100 = L1_100
	L1_100("rank_role_c2s", {})
	local L2_101 = L2_101
end
function L14_14.on_rank_role_s2c(A0_102, A1_103)
	if A0_102 ~= 0 then
		return
	end
	_ENV.init_dividend_info(A1_103)
	local L2_104 = L2_104
	L2_104(_UPVALUE2_.update_dividend)
	local L3_105 = L3_105
end
function L14_14.req_rank_receive_dividend_c2s(A0_106)
	local L1_107
	L1_107 = {}
	L1_107.id = A0_106
	local L2_108 = L2_108
	local L3_109 = L3_109
	L2_108(L3_109, L1_107)
	local L4_110 = L4_110
end
function L14_14.on_rank_receive_dividend_s2c(A0_111, A1_112)
	if A0_111 ~= 0 then
		return
	end
	_ENV.update_dividend_info(A1_112)
	local L2_113 = L2_113
	L2_113(_UPVALUE2_.update_dividend)
	local L3_114 = L3_114
end
function L14_14.req_rank_get_barrage_info_c2s(A0_115)
	local L1_116
	L1_116 = {}
	L1_116.rank_type = A0_115
	local L2_117 = L2_117
	local L3_118 = L3_118
	L2_117(L3_118, L1_116)
	local L4_119 = L4_119
end
function L14_14.on_rank_get_barrage_info_s2c(A0_120, A1_121)
	local L2_122, L3_123
	L2_122 = A1_121.rank_type
	L3_123 = A1_121.barrage_list
	if not L3_123 then
		L3_123 = {}
	end
	if _ENV.init_barrage_info(L2_122, A1_121.barrage_list) then
		local L4_124 = L4_124
		local L5_125 = L5_125
		local L6_126 = L6_126
		L4_124(L5_125, L6_126, L3_123)
		local L7_127 = L7_127
	end
end
function L14_14.req_rank_send_barrage_c2s(A0_128, A1_129)
	local L2_130
	L2_130 = {}
	L2_130.rank_type = A0_128
	L2_130.barrage = A1_129
	local L3_131 = L3_131
	local L4_132 = L4_132
	L3_131(L4_132, L2_130)
	local L5_133 = L5_133
end
function L14_14.on_rank_send_barrage_s2c(A0_134, A1_135)
	local L2_136, L3_137
	L2_136 = A1_135.rank_type
	L3_137 = A1_135.barrage
	if _ENV.update_barrage_info(L2_136, L3_137) then
		local L4_138 = L4_138
		local L5_139 = L5_139
		local L6_140 = L6_140
		L4_138(L5_139, L6_140, L3_137)
		local L7_141 = L7_141
	end
end
function L14_14.on_rank_get_role_index_s2c(A0_142, A1_143)
	_ENV.update_role_index(A1_143)
	local L3_144 = L3_144
	local L4_145 = L4_145
	L3_144(L4_145, A1_143.index, A1_143.rank_type)
	local L5_146 = L5_146
end
