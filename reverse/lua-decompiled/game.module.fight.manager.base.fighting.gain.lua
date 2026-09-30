local L0_0, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12 = L0_0, "game.ui.manager.ui_manager.init", L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
L0_0 = L0_0(L6_6)
L6_6 = require
L7_7 = "game.ui.manager.ui_const"
L6_6 = L6_6(L7_7)
L7_7 = require
L8_8 = "game.utils.events"
L7_7 = L7_7(L8_8)
L8_8 = require
L9_9 = "game.network.network_utils"
L8_8 = L8_8(L9_9)
L9_9 = require
L10_10 = "game.other.player_prefs"
L9_9 = L9_9(L10_10)
L10_10 = table
L10_10 = L10_10.insert
L11_11 = table
L11_11 = L11_11.remove
L12_12 = Game
function L12_12.module.fight.ways.base.init_gain_data(A0_13, A1_14)
	if not A1_14.gain_reset_cnt then
	end
	A0_13.gain_reset_cnt = 0
	A0_13:init_has_gains(A1_14.gain_list)
	A0_13.gain_performs = {}
	A0_13.select_gain_list = {}
	local L3_15 = L3_15
	L3_15(A0_13, A1_14.gain_select_list)
	local L4_16 = L4_16
end
function L12_12.module.fight.ways.base.cur_select_has_gain(A0_17, A1_18)
	if A0_17.cur_select_info then
		L4_21 = A0_17.cur_select_info
		L4_21 = L4_21.gain_id_list
		if L4_21 then
			goto lbl_10
		end
	end
	L4_21 = false
	do return L4_21 end
	::lbl_10::
	L4_21 = pairs
	L5_22 = A0_17.cur_select_info
	L5_22 = L5_22.gain_id_list
	L4_21, L5_22, L6_23 = L4_21(L5_22)
	for L7_24, _FORV_6_ in L4_21, L5_22, L6_23 do
		if _FORV_6_ == A1_18 then
			return true
		end
	end
	L4_21 = false
	return L4_21
end
function L12_12.module.fight.ways.base.is_gain_desc_short(A0_25)
	if A0_25.gain_desc_short == nil then
		local L1_26 = L1_26
		local L2_27 = L2_27
		local L3_28 = L3_28
		local L1_26, L4_29 = L1_26(L2_27, L3_28, 1), L4_29
		L1_26 = L1_26 == 1
		A0_25.gain_desc_short = L1_26
	end
	L1_26 = A0_25.gain_desc_short
	return L1_26
end
function L12_12.module.fight.ways.base.set_gain_desc_short(A0_30, A1_31)
	A0_30:is_gain_desc_short()
	if A0_30.gain_desc_short == A1_31 then
		return
	end
	A0_30.gain_desc_short = A1_31
	if not A0_30.gain_desc_short or not 1 then
	end
	_ENV.set_player_data("fight_gain_desc_short", 0)
	local L4_32 = L4_32
end
function L12_12.module.fight.ways.base.init_has_gains(A0_33, A1_34)
	A0_33.gains_by_type = {}
	if A1_34 then
		_FOR_, _FOR_, _FOR_ = pairs(A1_34)
		for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
			A0_33:add_gain(_FORV_6_)
		end
	end
	L9_42 = A0_33
	L8_41 = A0_33.get_ctrl_unit
	L8_41 = L8_41(L9_42)
	if L8_41 then
		L9_42 = A0_33.update_unit_shield_by_gain
		local L6_39, L7_40 = L6_39, L7_40
		L9_42(L6_39, L7_40, A0_33:get_gain_shield_effect_args())
	end
	L9_42 = _ENV
	L9_42 = L9_42.brocast
	L6_39 = "fight_ctrl_gains_changed"
	L9_42(L6_39)
end
function L12_12.module.fight.ways.base.add_select_gain_list(A0_43, A1_44)
	if not A1_44 then
		return
	end
	L5_48 = pairs
	L6_49 = A1_44
	L5_48, L6_49, _FOR_ = L5_48(L6_49)
	for _FORV_5_, _FORV_6_ in L5_48, L6_49, _FOR_ do
		_ENV(A0_43.select_gain_list, _FORV_6_)
	end
	L6_49 = A0_43
	L5_48 = A0_43.check_show_select_gain_ui
	L5_48(L6_49)
end
function L12_12.module.fight.ways.base.get_gain_shield_effect_args(A0_53)
	local L1_54, L2_55, L4_57, L5_58, L8_61 = L1_54, L2_55, _ENV, L5_58, L8_61
	L4_57 = L4_57.gain_type
	L4_57 = L4_57.shield
	L1_54 = L1_54(L2_55, L4_57)
	if not L1_54 then
		return
	end
	L2_55 = nil
	L4_57 = nil
	L5_58 = nil
	L8_61 = {}
	L11_62 = pairs
	L12_63 = L1_54
	L11_62, L12_63, _FOR_ = L11_62(L12_63)
	for _FORV_9_, _FORV_10_ in L11_62, L12_63, _FOR_ do
		L2_55 = _UPVALUE1_[_FORV_9_]
		L5_58 = L2_55.display_args
		if L5_58 and L5_58.type then
			L4_57 = L8_61[L5_58.type]
			if not L4_57 or L5_58.pri > L4_57.pri then
				L8_61[L5_58.type] = L5_58
			end
		end
	end
	return L8_61
end
function L12_12.module.fight.ways.base.add_gain(A0_64, A1_65)
	local L2_66, L3_67, L4_68, L5_69
	L2_66 = _ENV
	L2_66 = L2_66[A1_65]
	L3_67 = A0_64.gains_by_type
	L4_68 = L2_66.type
	L3_67 = L3_67[L4_68]
	if not L3_67 then
		L4_68 = {}
		L3_67 = L4_68
		L4_68 = A0_64.gains_by_type
		L5_69 = L2_66.type
		L4_68[L5_69] = L3_67
	end
	L3_67[A1_65] = true
end
function L12_12.module.fight.ways.base.has_gain(A0_70, A1_71)
	local L2_72, L3_73, L4_74
	L2_72 = _ENV
	L2_72 = L2_72[A1_71]
	if not L2_72 then
		L3_73 = false
		return L3_73
	end
	L3_73 = A0_70.gains_by_type
	L4_74 = L2_72.type
	L3_73 = L3_73[L4_74]
	if not L3_73 then
		L4_74 = false
		return L4_74
	end
	L4_74 = L3_73[A1_71]
	L4_74 = L4_74 == true
	return L4_74
end
function L12_12.module.fight.ways.base.remove_gain(A0_75, A1_76)
	local L2_77, L3_78, L4_79
	L2_77 = _ENV
	L2_77 = L2_77[A1_76]
	if not L2_77 then
		return
	end
	L3_78 = A0_75.gains_by_type
	L4_79 = L2_77.type
	L3_78 = L3_78[L4_79]
	if not L3_78 then
		return
	end
	L4_79 = L3_78[A1_76]
	L3_78[A1_76] = nil
	return L4_79
end
function L12_12.module.fight.ways.base.get_gain_dic_by_type(A0_80, A1_81)
	local L2_82
	L2_82 = A0_80.gains_by_type
	if not L2_82 then
		return
	end
	L2_82 = A0_80.gains_by_type
	L2_82 = L2_82[A1_81]
	return L2_82
end
function L12_12.module.fight.ways.base.get_type_gain_dic(A0_83)
	return A0_83.gains_by_type
end
function L12_12.module.fight.ways.base.get_gain_effect_path(A0_84)
	return "EffectNew/UI/fx_ui_equip_glow.ab"
end
function L12_12.module.fight.ways.base.show_select_gain_effect(A0_85, A1_86, A2_87)
	local L3_88, L11_96, L12_97 = A0_85:get_gain_effect_path(), L11_96, L12_97
	L11_96 = _ENV
	L11_96 = L11_96.scene_ui_canvas_recorder
	L12_97 = L11_96
	L11_96 = L11_96.GetObjByName
	L11_96 = L11_96(L12_97, "gold")
	L11_96 = L11_96.transform
	L11_96 = L11_96.parent
	L12_97 = A2_87.gameObject
	L12_97 = L12_97.transform
	L12_97 = L12_97.position
	L12_12.camera_manager.ui_camera_world_to_screen_point(L12_97, L12_97)
	L12_12.camera_manager.scene_camera_screen_to_world_pos(L12_97, L12_97)
	local L6_91 = A0_85:get_ctrl_unit()
	if not L6_91 then
		return
	end
	local L7_92 = L7_92
	local L8_93 = L8_93
	L7_92 = L7_92(L8_93, L6_91.height * 0.5, 0)
	L8_93 = L6_91.world_pos
	local L9_94, L10_95 = A0_85:add_perform(), L10_95
	L10_95 = A0_85
	local L13_98, L14_99 = L13_98, L14_99
	L14_99[L9_94] = A0_85.timer:run_after_no_args(500, L13_98)
	function L14_99()
		local L0_102, L1_103
		L0_102 = xpcall
		function L1_103()
			local L0_106
			L0_106 = "EffectNew/UI/fx_ui_fightselectgain_zhufu.ab"
			local L1_107 = L1_107
			local L7_113 = L7_113
			local L8_114 = L8_114
			local L1_107, L9_115 = L1_107(L7_113, L8_114, L4_89, L6_91.world_pos, nil, true, true, 500), L9_115
			if L1_107 then
				L8_114 = L1_107
				L7_113 = L1_107.SetScale
				L9_115 = 1
				local L5_111 = L5_111
				L7_113(L8_114, L9_115, L5_111, 1)
				local L6_112 = L6_112
			end
		end
		local L2_104, L3_105 = _ENV:fight_traceback()
		L0_102(L1_103, L2_104, L3_105)
	end
	local L15_100, L16_101 = L15_100, L16_101
	L15_100(L16_101, A0_85:fight_traceback())
end
function L12_12.module.fight.ways.base.req_battle_gain_select_c2s(A0_116, A1_117, A2_118)
	local L3_119 = L3_119
	local L4_120 = L4_120
	;({}).id = A1_117
	;({}).gain_id = A2_118
	L3_119(L4_120, {})
	local L5_121 = L5_121
end
function L12_12.module.fight.ways.base.req_battle_gain_list_c2s(A0_122)
	local L2_123 = L2_123
	L2_123("battle_gain_list_c2s", {})
	local L3_124 = L3_124
end
function L12_12.module.fight.ways.base.req_battle_gain_select_reset_c2s(A0_125, A1_126)
	local L2_127 = L2_127
	local L3_128 = L3_128
	;({}).id = A1_126
	L2_127(L3_128, {})
	local L4_129 = L4_129
end
function L12_12.module.fight.ways.base.on_msg_battle_gain_select_info_s2c(A0_130, A1_131, A2_132)
	A0_130:add_select_gain_list(A2_132.gain_select_list)
	local L5_133 = L5_133
end
function L12_12.module.fight.ways.base.check_show_select_gain_ui(A0_134)
	local L1_135
	do return end
	L1_135 = A0_134.cur_select_info
	if L1_135 then
		return
	end
	L1_135 = false
	local L2_136 = L2_136
	L2_136 = L2_136("BattleNewbieEquipView")
	if L2_136 then
		local L3_137 = L2_136:get_is_need_perform()
		L1_135 = L3_137
	end
	if L1_135 then
		return
	end
	L3_137 = nil
	if A0_134.select_gain_list and #A0_134.select_gain_list > 0 then
		local L4_138 = L4_138
		local L5_139 = L5_139
		L4_138 = L4_138(L5_139, 1)
		L3_137 = L4_138
	end
	A0_134.cur_select_info = L3_137
	L4_138 = A0_134.gain_pause_perform_id
	L5_139 = L1_1
	L5_139 = L5_139.FightSelectGainUI
	L5_139 = L5_139.name
	if not L3_137 then
		_ENV.close_view(L5_139)
		if A0_134.is_pause then
			A0_134:set_is_pause(false)
		end
		if L4_138 then
			A0_134:del_perform(L4_138)
		end
		return
	end
	A0_134.gain_pause_perform_id = A0_134:add_perform()
	if L4_138 then
		A0_134:del_perform(L4_138)
	end
	local L6_140 = L6_140
	local L7_141 = L7_141
	;({}).select_info = L3_137
	L6_140(L7_141, {})
	local L8_142 = L8_142
end
function L12_12.module.fight.ways.base.on_msg_battle_gain_select_s2c(A0_143, A1_144, A2_145)
	local L3_146, L4_147
	L3_146 = A2_145.gain_id
	L4_147 = A2_145.id
	A0_143:add_gain(L3_146)
	local L5_148 = L5_148
	local L6_149 = L6_149
	local L7_150 = L7_150
	L5_148(L6_149, L7_150, L4_147)
	local L8_151 = L8_151
end
function L12_12.module.fight.ways.base.on_msg_battle_gain_list_s2c(A0_152, A1_153, A2_154)
	A0_152:init_has_gains(A2_154.gain_list)
	local L5_155 = L5_155
end
function L12_12.module.fight.ways.base.on_msg_battle_gain_select_reset_s2c(A0_156, A1_157, A2_158)
	local L3_159
	if true then
		L3_159 = A2_158.reset_gain_select
		L7_163 = A0_156.cur_select_info
		if L7_163 then
			L7_163 = A0_156.cur_select_info
			L7_163 = L7_163.id
			L8_164 = L3_159.id
			if L7_163 == L8_164 then
				L7_163 = A0_156.cur_select_info
				L8_164 = L3_159.gain_id_list
				if not L8_164 then
					L8_164 = {}
				end
				L7_163.gain_id_list = L8_164
			end
			L7_163 = _ENV
			L7_163 = L7_163.brocast
			L8_164 = "fight_gain_reseted"
			L9_165 = L3_159
			L7_163(L8_164, L9_165)
		end
	else
		L7_163 = pairs
		L8_164 = A0_156.select_gain_list
		L7_163, L8_164, L9_165 = L7_163(L8_164)
		for L10_166, _FORV_8_ in L7_163, L8_164, L9_165 do
			if _FORV_8_.id == L3_159.id then
				if not L3_159.gain_id_list then
				end
				_FORV_8_.gain_id_list = {}
				break
			end
		end
	end
end
function L12_12.module.fight.ways.base.on_msg_battle_gain_reset_cnt_s2c(A0_167, A1_168, A2_169)
	if not A2_169.gain_reset_cnt then
		return
	end
	A0_167.gain_reset_cnt = A2_169.gain_reset_cnt
	local L4_170 = L4_170
	L4_170("fight_gain_reset_count_changed", A0_167.gain_reset_cnt)
	local L5_171 = L5_171
end
function L12_12.module.fight.ways.base.on_newbie_equip_perform_complete(A0_172)
	A0_172:check_show_select_gain_ui()
end
