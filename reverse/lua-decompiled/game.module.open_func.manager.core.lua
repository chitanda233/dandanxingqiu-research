local L0_0
L0_0 = Game
local L0_0, L3_3, L4_4, L5_5, L6_6, L7_7, L11_11, L12_12, L13_13 = L0_0.module, L3_3, L4_4, L5_5, L6_6, L7_7, L11_11, L12_12, L13_13
L0_0 = L0_0.data
L3_3 = import
L4_4 = ".head"
L3_3 = L3_3(L4_4)
L4_4 = L3_3.event
L5_5 = L3_3.data
L6_6 = L3_3.const
L7_7 = L3_3.network
L11_11 = DataConfigs
L11_11 = L11_11.open_func
L12_12 = Game
L12_12 = L12_12.redpoint_helper
L13_13 = require
L13_13 = L13_13("game.other.player_prefs")
;({}).open_func_req_func = {}
;({}).new_open_func_req_func = {}
function L3_3.init()
	_ENV.init()
	L7_7.init()
	L1_1.setup_events()
	L1_1.init_red_points()
end
function L3_3.clear()
	_ENV.clear_check_open_func_anim_timer()
	_ENV.clear_events()
	_ENV.clear_red_points()
	L7_7.clear()
	L5_5.clear()
end
function L3_3.setup_events()
	local L4_18 = L4_18
	local L5_19 = L5_19
	local L6_20 = L6_20
	L5_19[1] = L6_20
	L5_19[2] = L2_2.update_item
	L5_19[3] = "got_cloud_data"
	L5_19[4] = "update_left_up_btns"
	L5_19[5] = "update_right_up_btns"
	local L5_19[6], L7_21 = "update_pop_up_btns", L7_21
	L4_18.listen_events = L5_19
	L4_18 = _ENV
	L4_18 = L4_18.has_setup
	if L4_18 then
		return
	end
	L4_18 = _ENV
	L4_18.has_setup = true
	L4_18 = Game
	L4_18 = L4_18.events
	L4_18 = L4_18.add_listeners
	L5_19 = _ENV
	L5_19 = L5_19.listen_events
	L6_20 = _ENV
	L7_21 = false
	L4_18(L5_19, L6_20, L7_21)
end
function L3_3.clear_events()
	if not _ENV.has_setup then
		return
	end
	_ENV.has_setup = false
	local L0_22 = L0_22
	local L1_23 = L1_23
	local L2_24 = L2_24
	L0_22(L1_23, L2_24, false)
	local L3_25 = L3_25
end
function L3_3.init_red_points()
	local L0_26
	L0_26 = {}
	L0_26.id = "open_func_preview_red_point"
	L0_26.tp = 1
	local L3_29[1], ({}).cb, L3_29 = {}, _ENV.has_open_func_preview_red_point, L3_29
	L0_26.point_cb_infos = L3_29
	L3_29 = L9_9
	L3_29 = L3_29.new_red_point
	L3_29(L0_26)
	local L2_28 = L2_28
end
function L3_3.has_open_func_preview_red_point()
	local L3_33 = _ENV.get_all_highlight_list
	L3_33 = L3_33()
	if L3_33 == nil then
		L4_34 = 0
		return L4_34
	end
	L4_34 = ipairs
	L5_35 = L3_33
	L4_34, L5_35, L8_38 = L4_34(L5_35)
	for _FORV_4_, _FORV_5_ in L4_34, L5_35, L8_38 do
		if not L5_5.reward_list[_FORV_5_] or not true then
		end
		if L1_1.is_open(_FORV_5_) and not false then
			return 1
		end
	end
	L4_34 = 0
	return L4_34
end
function L3_3.clear_red_points()
	local L1_39 = L1_39
	L1_39("open_func_preview_red_point", true)
	local L2_40 = L2_40
end
function L3_3.init_req()
	local L4_45 = _ENV.open_func_all_c2s
	L4_45()
	L4_45 = Game
	L4_45 = L4_45.module
	L4_45 = L4_45.gm_panel
	local L1_42 = L1_42
	local L2_43 = L2_43
	;({}).name = "\230\152\175\229\144\166\232\183\179\232\191\135\229\138\159\232\131\189\229\188\128\229\144\175\229\138\168\231\148\187"
	;({}).get_init_state = function()
		return _ENV.get_gm_show_open_func_anim_state()
	end
	;({}).change_state = function(A0_46)
		local L2_47 = L2_47
		if not A0_46 or not "1" then
		end
		L2_47("gm_show_open_func_anim_state", "0")
		local L3_48 = L3_48
	end
	L1_42(L2_43, {})
	local L3_44 = L3_44
end
function L3_3.get_gm_show_open_func_anim_state()
	local L0_49 = L0_49
	local L1_50 = L1_50
	local L2_51 = L2_51
	local L0_49, L3_52 = L0_49(L1_50, L2_51, "0"), L3_52
	L0_49 = L0_49 == "1"
	return L0_49
end
function L3_3.is_open(A0_53)
	if A0_53 == nil then
		log_error("check open func with func_id is nil")
		return false
	end
	local L1_54 = L1_54
	local L1_54, L2_55 = L1_54(A0_53), L2_55
	if not L1_54 then
		L1_54 = false
		return L1_54
	end
	L1_54 = true
	return L1_54
end
function L3_3.check_is_open_by_tips(A0_56)
	local L1_57 = L1_57
	L1_57 = L1_57(A0_56)
	if not L1_57 then
		L1_57 = BroadcastTips
		L1_57 = L1_57.broadcast_tips
		local L2_58 = L2_58
		local L2_58, L3_59 = L2_58(A0_56)
		L1_57(L2_58, L3_59)
		L1_57 = false
		return L1_57
	end
	L1_57 = true
	return L1_57
end
function L3_3.is_server_day_open(A0_60)
	if A0_60 == nil then
		log_error("check open func with func_id is nil")
		return false
	end
	local L1_61 = _ENV.get_server_open_day()
	local L2_62 = L2_62
	local L2_62, L3_63 = L2_62(A0_60), L3_63
	L3_63 = L2_62.open_days
	if not L3_63 then
		L3_63 = true
		return L3_63
	end
	L3_63 = L2_62.open_days
	L3_63 = L1_61 >= L3_63
	return L3_63
end
function L3_3.get_no_open_tips(A0_64, A1_65)
	local L2_66 = L2_66
	local L2_66, L4_68 = L2_66(A0_64, A1_65), L4_68
	if not L2_66 or L2_66 and L2_66 == "" then
		L4_68 = L1_1
		L4_68 = L4_68.get_default_no_open_tips
		L4_68 = L4_68()
		L2_66 = L4_68
	end
	return L2_66
end
function L3_3.get_default_no_open_tips()
	local L1_69 = L1_69
	do return assert(DataConfigs.language_define).get_string("TID_FUNC_NO_OPEN_TIP") end
	local L2_70 = L2_70
end
function L3_3.get_open_condition(A0_71)
	local L4_75 = _ENV.get_open_condition_type
	L4_75 = L4_75(A0_71)
	local L2_73 = L2_73
	local L2_73, L3_74 = L2_73(A0_71), L3_74
	L3_74 = L4_75
	return L3_74, L2_73
end
function L3_3.get_open_condition_type(A0_76)
	local L1_77 = L1_77
	local L1_77, L2_78 = L1_77(A0_76), L2_78
	return L1_77
end
function L3_3.get_open_condition_par(A0_79)
	local L1_80 = L1_80
	local L1_80, L2_81 = L1_80(A0_79), L2_81
	return L1_80
end
function L3_3.get_open_condition_open_days(A0_82)
	local L1_83 = L1_83
	local L1_83, L2_84 = L1_83(A0_82), L2_84
	return L1_83
end
function L3_3.get_func_open_by_role(A0_85, A1_86)
	local L2_87 = _ENV.get_player_id()
	if A0_85 == L2_87 then
		local L3_88 = L3_88
		do return L3_88(A1_86) end
		local L4_89 = L4_89
	end
	L3_88 = L5_5
	L3_88 = L3_88.role_open_func
	L3_88 = L3_88[A1_86]
	if L3_88 then
		L3_88 = L5_5
		L3_88 = L3_88.role_open_func
		L3_88 = L3_88[A1_86]
		L3_88 = L3_88[A0_85]
		L3_88 = not L3_88
		return L3_88
	end
	L3_88 = true
	return L3_88
end
function L3_3.func_preview_reward_sort(A0_90, A1_91)
	local L2_92, L3_93
	L2_92 = A0_90.is_geted
	L3_93 = A1_91.is_geted
	if L2_92 ~= L3_93 then
		L2_92 = A1_91.is_geted
		return L2_92
	end
	L2_92 = A0_90.is_open
	L3_93 = A1_91.is_open
	if L2_92 ~= L3_93 then
		L2_92 = A0_90.is_open
		return L2_92
	end
	L2_92 = A0_90.is_geted
	if L2_92 then
		L2_92 = A1_91.is_geted
		if L2_92 then
			L2_92 = A0_90.cfg
			L2_92 = L2_92.ispreview
			L3_93 = A1_91.cfg
			L3_93 = L3_93.ispreview
			if L2_92 ~= L3_93 then
				L2_92 = A0_90.cfg
				L2_92 = L2_92.ispreview
				L3_93 = A1_91.cfg
				L3_93 = L3_93.ispreview
				L2_92 = L2_92 > L3_93
				return L2_92
			end
		end
	end
	L2_92 = A0_90.cfg
	L2_92 = L2_92.index
	L3_93 = A1_91.cfg
	L3_93 = L3_93.index
	L2_92 = L2_92 < L3_93
	return L2_92
end
function L3_3.get_func_preview_reward_list()
	local L4_98 = _ENV.get_func_preview_reward_list_by_type
	L4_98 = L4_98()
	L5_99 = table
	L5_99 = L5_99.sort
	L6_100 = L4_98
	L5_99(L6_100, _UPVALUE1_)
	L5_99 = ipairs
	L6_100 = L4_98
	L5_99, L6_100, _FOR_ = L5_99(L6_100)
	for _FORV_4_, _FORV_5_ in L5_99, L6_100, _FOR_ do
		if not _FORV_5_.is_open and not _FORV_5_.is_geted then
			_FORV_5_.is_next_open = true
			break
		end
	end
	return L4_98
end
function L3_3.get_normal_func_preview_reward_list()
	local L4_105 = _ENV.get_func_preview_reward_list_by_type
	L5_106 = L6_6
	L5_106 = L5_106.func_preview_type
	L5_106 = L5_106.normal
	L4_105 = L4_105(L5_106)
	L5_106 = table
	L5_106 = L5_106.sort
	L6_107 = L4_105
	L5_106(L6_107, _UPVALUE2_)
	L5_106 = ipairs
	L6_107 = L4_105
	L5_106, L6_107, _FOR_ = L5_106(L6_107)
	for _FORV_4_, _FORV_5_ in L5_106, L6_107, _FOR_ do
		if not _FORV_5_.is_open and not _FORV_5_.is_geted then
			_FORV_5_.is_next_open = true
			break
		end
	end
	return L4_105
end
function L3_3.get_func_preview_reward_list_by_type(A0_108)
	local L2_110, L3_111, L4_112, L7_115 = _ENV.get_all_cfg, L3_111, L4_112, L7_115
	L2_110 = L2_110()
	L3_111 = {}
	L4_112 = false
	L7_115 = false
	L8_116 = pairs
	L9_117 = L2_110
	L8_116, L9_117, _FOR_ = L8_116(L9_117)
	for _FORV_8_, _FORV_9_ in L8_116, L9_117, _FOR_ do
		if _FORV_9_.is_open == 1 and _FORV_9_.ispreview and _FORV_9_.ispreview > 0 and (A0_108 == nil or _FORV_9_.ispreview == A0_108) then
			L4_112 = L1_1.is_open(_FORV_9_.id)
			L7_115 = true or L7_115
			if not L5_5.reward_list[_FORV_9_.id] or not true then
				L7_115 = false
			end
			;({}).cfg = _FORV_9_
			;({}).is_open = L4_112
			;({}).is_geted = L7_115
			table.insert(L3_111, {})
		end
	end
	return L3_111
end
function L3_3.add_open_func_req(A0_121, A1_122, A2_123)
	local L3_124, L4_125
	if A1_122 == nil then
		return
	end
	if A2_123 then
		L3_124 = _ENV
		L3_124 = L3_124.new_open_func_req_func
		if L3_124 then
			goto lbl_12
		end
	end
	L3_124 = _ENV
	L3_124 = L3_124.open_func_req_func
	::lbl_12::
	L4_125 = L3_124[A0_121]
	if not L4_125 then
		L4_125 = {}
		L3_124[A0_121] = L4_125
	end
	L4_125 = false
	L8_129 = 1
	_FOR_ = 1
	for _FORV_8_ = L8_129, _FOR_, _FOR_ do
		if L3_124[A0_121][_FORV_8_] == A1_122 then
			L4_125 = true
		end
	end
	if not L4_125 then
		L8_129 = table
		L8_129 = L8_129.insert
		L9_130 = L3_124[A0_121]
		L8_129(L9_130, A1_122)
	end
	if not A2_123 then
		L8_129 = L1_1
		L8_129 = L8_129.is_open
		L9_130 = A0_121
		L8_129 = L8_129(L9_130)
		if L8_129 then
			L8_129 = A1_122
			L8_129()
		end
	end
end
function L3_3.remove_open_func_req(A0_131, A1_132, A2_133)
	local L3_134, L4_135, L5_136, L6_137, L7_138
	if A1_132 == nil then
		return
	end
	if A2_133 then
		L3_134 = _ENV
		L3_134 = L3_134.new_open_func_req_func
		if L3_134 then
			goto lbl_12
		end
	end
	L3_134 = _ENV
	L3_134 = L3_134.open_func_req_func
	::lbl_12::
	L4_135 = L3_134[A0_131]
	if not L4_135 then
		return
	end
	L4_135 = 1
	L5_136 = L3_134[A0_131]
	L5_136 = #L5_136
	L6_137 = 1
	for L7_138 = L4_135, L5_136, L6_137 do
		if L3_134[A0_131][L7_138] == A1_132 then
			local L8_139 = L8_139
			local L9_140 = L9_140
			L8_139(L9_140, L7_138)
			local L10_141 = L10_141
			return
		end
	end
end
function L3_3.try_trigger_open_func_req(A0_142, A1_143, A2_144)
	local L3_145
	if A1_143 then
		L3_145 = _ENV
		L3_145 = L3_145.new_open_func_req_func
		if L3_145 then
			goto lbl_9
		end
	end
	L3_145 = _ENV
	L3_145 = L3_145.open_func_req_func
	::lbl_9::
	L6_148 = L3_145[A0_142]
	if L6_148 then
		L6_148 = L1_1
		L6_148 = L6_148.is_open
		L7_149 = A0_142
		L6_148 = L6_148(L7_149)
		if L6_148 then
			L6_148 = 1
			L7_149 = L3_145[A0_142]
			L7_149 = #L7_149
			_FOR_ = 1
			for _FORV_7_ = L6_148, L7_149, _FOR_ do
				L3_145[A0_142][_FORV_7_](A2_144)
			end
		end
	end
end
function L3_3.check_can_skip_ani()
	local L0_152 = L0_152
	L0_152 = L0_152("game.other.player_prefs")
	local L1_153 = L1_153
	local L2_154 = L2_154
	local L1_153, L3_155 = L1_153(L2_154, "number"), L3_155
	L2_154 = L1_153 ~= nil
	return L2_154
end
function L3_3.update_can_skip_ani_status(A0_156)
	repeat
		local L1_157 = L1_157
		L1_157 = L1_157("game.other.player_prefs")
		if A0_156 then
			L1_157.set_device_data(_ENV, 1)
			local L4_160 = L4_160
			break -- pseudo-goto
		end
		L4_160 = L1_157.remove_device_data
		L4_160(_ENV)
		local L3_159 = L3_159
	until true
end
function L3_3.check_open_preview_open()
	local L1_162 = _ENV.is_open(L6_6.type.main_view_open_func_preview)
	if not L1_162 then
		L1_162 = false
		return L1_162
	end
	L1_162 = L5_5
	L1_162 = L1_162.has_not_get_reward
	return L1_162()
end
function L3_3.on_open_func_event_update_all()
	L2_165 = _ENV
	L2_165 = L2_165.open_func_req_func
	L0_163, L2_165, L3_166 = L0_163(L2_165)
	for _FORV_3_, _FORV_4_ in L0_163, L2_165, L3_166 do
		local L7_169 = L7_169
		L7_169(_FORV_3_, nil, false)
		local L8_170 = L8_170
	end
end
function L3_3.on_open_func_event_update_item(A0_171, A1_172)
	if A1_172 then
		_ENV.try_trigger_open_func_req(A0_171, nil, true)
		local L4_175 = L4_175
		L4_175(A0_171, true, true)
		local L5_176 = L5_176
		L4_175 = Game
		L4_175 = L4_175.redpoint_helper
		L4_175 = L4_175.update_red_point
		L5_176 = "open_func_preview_red_point"
		L4_175(L5_176)
	end
end
function L3_3.on_got_cloud_data()
	_ENV.on_got_cloud_data_init()
end
function L3_3.on_update_left_up_btns()
	_ENV.try_check_open_func_anim()
end
function L3_3.on_update_right_up_btns()
	_ENV.try_check_open_func_anim()
end
function L3_3.on_update_pop_up_btns()
	_ENV.try_check_open_func_anim()
end
function L3_3.try_check_open_func_anim()
	local L4_181 = _ENV.clear_check_open_func_anim_timer
	L4_181()
	L4_181 = _ENV
	local L1_178, L2_179 = L1_178, L2_179
	local L3_180 = L3_180
	L1_178 = L1_178(L2_179, L3_180, function()
		_ENV.show_open_func_view_by_cloud_data_diff()
	end)
	L4_181.check_open_func_anim_timer = L1_178
end
function L3_3.clear_check_open_func_anim_timer()
	if _ENV.check_open_func_anim_timer then
		local L0_182, L1_183 = L0_182, L1_183
		L0_182(L1_183, _ENV.check_open_func_anim_timer)
		local L2_184 = L2_184
		L0_182 = _ENV
		L0_182.check_open_func_anim_timer = nil
	end
end
