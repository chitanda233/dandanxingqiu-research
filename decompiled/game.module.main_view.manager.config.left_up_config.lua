local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
L0_0 = Game
local L0_0, L8_8, L9_9, L10_10, L11_11, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36 = L0_0.module, L8_8, L9_9, L10_10, L11_11, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36
L0_0 = L0_0.open_func
L0_0 = L0_0.const
L1_1 = L0_0.type
L2_2 = Game
L2_2 = L2_2.module
L2_2 = L2_2.open_func
L2_2 = L2_2.event
L3_3 = Game
L3_3 = L3_3.ui_manager
L4_4 = Game
L4_4 = L4_4.ui_const
L5_5 = Game
L5_5 = L5_5.module
L5_5 = L5_5.open_func
L8_8 = assert
L9_9 = DataConfigs
L9_9 = L9_9.language_define
L8_8 = L8_8(L9_9)
L9_9 = Game
L9_9 = L9_9.module
L9_9 = L9_9.bag
L10_10 = DataConfigs
L10_10 = L10_10.misc
L11_11 = DataConfigs
L11_11 = L11_11.activities
L17_17 = DataConfigs
L17_17 = L17_17.seven_sign
L18_18 = Game
L18_18 = L18_18.module
L18_18 = L18_18.main_view
L19_19 = require
L20_20 = "game.other.game_time.init"
L19_19 = L19_19(L20_20)
L20_20 = require
L21_21 = "game.other.server_time"
L20_20 = L20_20(L21_21)
L21_21 = Game
L21_21 = L21_21.module
L21_21 = L21_21.first_charge
L22_22 = require
L23_23 = "game.other.game_time.init"
L22_22 = L22_22(L23_23)
L23_23 = Game
L23_23 = L23_23.module
L23_23 = L23_23.main_view
L23_23 = L23_23.event
L24_24 = Game
L24_24 = L24_24.events
L25_25 = Game
L25_25 = L25_25.module
L25_25 = L25_25.seven_sign
L26_26 = L25_25.data
L27_27 = L25_25.const
L28_28 = Game
L28_28 = L28_28.module
L28_28 = L28_28.main_view
L28_28 = L28_28.event
L29_29 = Game
L29_29 = L29_29.module
L29_29 = L29_29.main_view
L29_29 = L29_29.const
L30_30 = Game
L30_30 = L30_30.module
L30_30 = L30_30.popup
L31_31 = nil
L32_32 = Game
L32_32 = L32_32.module
L32_32 = L32_32.season_activity
L33_33 = Game
L33_33 = L33_33.module
L33_33 = L33_33.activity_may_day
L34_34 = Game
L34_34 = L34_34.module
L34_34 = L34_34.activity_childrens_day
L35_35 = Game
L35_35 = L35_35.module
L35_35 = L35_35.activity_anniversary
L36_36 = nil
;({}).open_func_id = L1_1.first_charge
;({}).check_open_func = function()
	return _ENV.is_open()
end
;({}).click_handler = function()
	_ENV.click_first_charge()
	L3_3.open_view("FirstChargeView")
	local L1_37 = L1_37
end
;({}).first_charge, ({}).redpoint_id = {}, "first_charge_red_point"
;({}).redpoint_id = "seven_day_zhu_red_point"
;({}).click_handler = function()
	local L0_38 = L0_38
	local L1_39 = L1_39
	;({}).name = "\231\165\158\229\153\168\228\185\139\232\183\175"
	;({}).red_tag_first = true
	L0_38(L1_39, {})
	local L2_40 = L2_40
end
;({}).open_func_id = L1_1.task_freshman
;({}).check_open_func = function()
	local L0_41 = L0_41
	local L0_41, L1_42 = L0_41(1), L1_42
	L0_41 = L0_41 == false
	if not L0_41 then
		L1_42 = false
		local L2_43 = L2_43
		local L2_43, L3_44 = L2_43("TID_close_button")
		return L1_42, L2_43, L3_44
	end
	L1_42 = true
	return L1_42
end
;({}).fresh_reward, ({}).event_handler, ({}).seven_day_update_noob_score_reward = {}, {}, function()
	local L1_45 = L1_45
	L1_45(L28_28.main_view_update_btn, "fresh_reward")
	local L2_46 = L2_46
end
;({}).redpoint_id = "seven_day_zhu_red_point"
;({}).click_handler = function()
	local L0_47 = L0_47
	local L1_48 = L1_48
	;({}).name = "\229\174\160\231\137\169\228\185\139\232\183\175"
	;({}).red_tag_first = true
	L0_47(L1_48, {})
	local L2_49 = L2_49
end
;({}).open_func_id = L1_1.seven_day_pet
;({}).check_open_func = function()
	L0_50 = Game.module.seven_day.data.is_end(2) == false
	if not L0_50 then
		L1_51 = false
		local L2_52 = L2_52
		local L2_52, L3_53 = L2_52("TID_close_button")
		return L1_51, L2_52, L3_53
	end
	L1_51 = true
	return L1_51
end
;({}).fresh_reward_pet, ({}).event_handler, ({}).seven_day_update_noob_score_reward = {}, {}, function()
	local L1_54 = L1_54
	L1_54(L28_28.main_view_update_btn, "fresh_reward_pet")
	local L2_55 = L2_55
end
;({}).redpoint_id = "seven_day_zhu_red_point"
;({}).click_handler = function()
	local L0_56 = L0_56
	local L1_57 = L1_57
	;({}).name = "\231\167\175\230\156\168\228\185\139\232\183\175"
	;({}).red_tag_first = true
	L0_56(L1_57, {})
	local L2_58 = L2_58
end
;({}).open_func_id = L1_1.seven_day_advance
;({}).check_open_func = function()
	local L0_59
	L0_59 = {}
	L5_64 = 1
	L0_59[1] = L5_64
	L0_59[2] = 2
	L0_59[3] = 4
	L5_64 = pairs
	L5_64, _FOR_, _FOR_ = L5_64(L0_59)
	for _FORV_4_, _FORV_5_ in L5_64, _FOR_, _FOR_ do
		if Game.module.seven_day.data.is_end(_FORV_5_) == false then
			return false, _ENV.get_string("TID_close_button")
		end
	end
	L5_64 = Game
	L5_64 = L5_64.module
	L5_64 = L5_64.seven_day
	L5_64 = L5_64.data
	L5_64 = L5_64.is_end
	L6_65 = 3
	L5_64 = L5_64(L6_65)
	L5_64 = L5_64 == false
	if not L5_64 then
		L6_65 = false
		L7_66 = _ENV
		L7_66 = L7_66.get_string
		L8_67 = "TID_close_button"
		L7_66, L8_67 = L7_66(L8_67)
		return L6_65, L7_66, L8_67, L7_66(L8_67)
	end
	L6_65 = true
	return L6_65
end
;({}).fresh_reward_advanced, ({}).event_handler, ({}).seven_day_update_noob_score_reward = {}, {}, function()
	local L1_68 = L1_68
	L1_68(L28_28.main_view_update_btn, "fresh_reward_advanced")
	local L2_69 = L2_69
end
;({}).redpoint_id = "seven_day_zhu_red_point"
;({}).click_handler = function()
	local L0_70 = L0_70
	local L1_71 = L1_71
	;({}).name = "\229\174\157\231\143\160\228\185\139\232\183\175"
	;({}).red_tag_first = true
	L0_70(L1_71, {})
	local L2_72 = L2_72
end
;({}).open_func_id = L1_1.seven_day_stone
;({}).check_open_func = function()
	local L0_73
	L0_73 = {}
	L5_78 = 1
	L0_73[1] = L5_78
	L0_73[2] = 2
	L5_78 = pairs
	L5_78, _FOR_, _FOR_ = L5_78(L0_73)
	for _FORV_4_, _FORV_5_ in L5_78, _FOR_, _FOR_ do
		if Game.module.seven_day.data.is_end(_FORV_5_) == false then
			return false, _ENV.get_string("TID_close_button")
		end
	end
	L5_78 = Game
	L5_78 = L5_78.module
	L5_78 = L5_78.seven_day
	L5_78 = L5_78.data
	L5_78 = L5_78.is_end
	L6_79 = 4
	L5_78 = L5_78(L6_79)
	L5_78 = L5_78 == false
	if not L5_78 then
		L6_79 = false
		L7_80 = _ENV
		L7_80 = L7_80.get_string
		L8_81 = "TID_close_button"
		L7_80, L8_81 = L7_80(L8_81)
		return L6_79, L7_80, L8_81, L7_80(L8_81)
	end
	L6_79 = true
	return L6_79
end
;({}).fresh_reward_stone, ({}).event_handler, ({}).seven_day_update_noob_score_reward = {}, {}, function()
	local L1_82 = L1_82
	L1_82(L28_28.main_view_update_btn, "fresh_reward_stone")
	local L2_83 = L2_83
end
;({}).click_handler = function()
	_ENV.open_view(L4_4.StrengthenGiftView.name)
	local L1_84 = L1_84
end
;({}).check_open_func = function()
	return Game.module.strengthen_gift.get_gift_main_icon_show_state()
end
;({}).update_func = function(A0_85)
	if not _ENV then
		_ENV = Game.module.strengthen_gift
	end
	local L1_86 = _ENV.get_gift_main_icon_show_title()
	local L2_87 = L2_87
	if not A0_85.__data or not A0_85.__data.name then
	end
	L2_87 = L2_87("")
	if L1_86 ~= nil then
		local L6_91 = string.format([[
%s
<size=26><color=#FF665A>%s</color></size>]], L2_87, L1_86)
		L2_87 = L6_91
	end
	L6_91 = A0_85.txts
	L6_91 = L6_91.name
	L6_91 = L6_91.set_text
	local L4_89 = L4_89
	L6_91(L4_89, L2_87)
	local L5_90 = L5_90
end
;({}).update_delta_time = 1
;({}).strengthen_gift, ({}).redpoint_id = {}, "main_view_push_gift_btn"
;({}).click_handler = function()
	local L1_92 = L1_92
	Game.module.jump_to.jump_to("FestivalWishMainView")
	local L2_93 = L2_93
end
;({}).open_func_id = L0_0.type.festival_wish_main
;({}).check_open_func = function()
	local L0_94, L1_95
	L0_94 = Game
	L0_94 = L0_94.module
	L0_94 = L0_94.festival
	L1_95 = L0_94.const
	local L2_96 = L2_96
	L2_96 = L2_96(L1_95.fes_activity_theme.dress_up)
	if L2_96 then
		local L3_97 = L3_97
		local L3_97, L4_98 = L3_97(L2_96), L4_98
		if L3_97 then
			goto lbl_17
		end
	end
	L3_97 = false
	::lbl_17::
	return L3_97
end
;({}).activity_update_activity = function(A0_99, A1_100)
	local L3_101 = L3_101
	L3_101(L28_28.main_view_update_btn, "full_moon_act")
	local L4_102 = L4_102
end
;({}).event_handler, ({})[L2_2.update_item] = {}, function(A0_103, A1_104)
	if A1_104 == _ENV.type.festival_wish_main then
		local L3_105 = L3_105
		L3_105(L28_28.main_view_update_btn, "full_moon_act")
		local L4_106 = L4_106
	end
end
;({}).full_moon_act, ({}).redpoint_id = {}, "fes_act_theme_red_point_2"
;({}).open_func_id = L0_0.type.sign_freshman
;({}).click_handler = function()
	_ENV.open_view(L4_4.SevenSignView.name)
	local L1_107 = L1_107
end
;({}).event_handler, ({})[L2_2.update_item] = {}, function(A0_108, A1_109)
	if A1_109 == _ENV.type.sign_freshman then
		local L3_110 = L3_110
		L3_110(L28_28.main_view_update_btn, L29_29.right_up_btn.seven_day)
		local L4_111 = L4_111
	end
end
;({}).update_func = function(A0_112)
	local L1_113, L2_114
	L1_113 = _ENV
	L1_113 = L1_113.seven_sign_list
	L2_114 = nil
	if not L1_113 then
		return
	end
	_FOR_, _FOR_, _FOR_ = pairs(L1_113)
	for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_7_.state == L27_27.seven_sign_status.can_get then
			L2_114 = _FORV_7_
			break
		end
	end
	if not L2_114 then
		_FOR_, _FOR_, _FOR_ = ipairs(L1_113)
		for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_7_.state == L27_27.seven_sign_status.none then
				L2_114 = _FORV_7_
				break
			end
		end
	end
	if not L2_114 then
		return
	end
	local L3_115 = L3_115
	local L3_115, L4_116 = L3_115(L2_114.day), L4_116
	L4_116 = L3_115.reward
	L4_116 = L4_116[1]
	L4_116 = L4_116[1]
	local L5_117 = L5_117
	local L5_117, L6_118 = L5_117(L4_116)
	local L8_120 = L8_120
	L8_120(A0_112.imgs.icon, L5_117, L6_118)
	L8_120 = L15_15
	L8_120 = L8_120.get_server_time
	L8_120 = L8_120()
	if L2_114.state == L27_27.seven_sign_status.can_get then
	else
		local L12_124 = L12_124
		local L14_126 = L14_126
		L14_126 = L14_126([[
%s
<size=26><color=#FF665A>%s</color></size>]], L6_6.get_string(A0_112.__data.name), L22_22.get_time_show_format3(L8_120 + L22_22.get_sec_to_next_day(L8_120)))
		L12_124 = L14_126
	end
	L14_126 = A0_112.txts
	L14_126 = L14_126.name
	L14_126 = L14_126.set_text
	L14_126(L14_126, L12_124)
	local L11_123 = L11_123
end
;({}).update_delta_time = 1
;({}).redpoint_id = "seven_sign_main_red"
;({}).seven_day, ({}).check_open_func = {}, function()
	return _ENV.check_main_btn_open_func()
end
;({}).open_func_id = L0_0.type.open_server_activity
;({}).click_handler = function()
	_ENV.open_view(L4_4.OpenServerActivityMainView.name)
	local L1_127 = L1_127
end
;({}).check_open_func = function()
	local L1_129 = Game.module
	L1_129 = L1_129.cloud_data
	L1_129 = L1_129.is_audit_close_for_recharge
	L1_129 = L1_129()
	if L1_129 then
		return false
	end
	do return Game.module.open_server_activity.get_main_is_open() end
	local L2_130 = L2_130
end
;({})[L2_2.update_all] = function(A0_131, A1_132)
	local L3_133 = L3_133
	L3_133(L28_28.main_view_update_btn, L29_29.right_up_btn.open_server_activity)
	local L4_134 = L4_134
end
;({})[L2_2.update_item] = function(A0_135, A1_136)
	if A1_136 == _ENV.type.open_server_activity then
		local L3_137 = L3_137
		L3_137(L28_28.main_view_update_btn, L29_29.right_up_btn.open_server_activity)
		local L4_138 = L4_138
	end
end
;({}).event_handler, ({}).activity_update_activity = {}, function()
	local L1_139 = L1_139
	L1_139(L28_28.main_view_update_btn, L29_29.right_up_btn.open_server_activity)
	local L2_140 = L2_140
end
;({}).open_server_activity, ({}).redpoint_id = {}, "open_server_activity_red_point"
;({}).open_func_id = L0_0.type.qixi_activity
;({}).click_handler = function()
	_ENV.open_view(L4_4.QiXiActivityView.name)
	local L1_141 = L1_141
end
;({}).check_open_func = function()
	local L1_143 = Game.module
	L1_143 = L1_143.cloud_data
	L1_143 = L1_143.is_audit_close_for_recharge
	L1_143 = L1_143()
	if L1_143 then
		return false
	end
	do return Game.module.qixi_activity.get_entry_is_open() end
	local L2_144 = L2_144
end
;({})[L2_2.update_all] = function(A0_145, A1_146)
	local L3_147 = L3_147
	L3_147(L28_28.main_view_update_btn, L29_29.right_up_btn.qixi_activity)
	local L4_148 = L4_148
end
;({})[L2_2.update_item] = function(A0_149, A1_150)
	if A1_150 == _ENV.type.qixi_activity then
		local L3_151 = L3_151
		L3_151(L28_28.main_view_update_btn, L29_29.right_up_btn.qixi_activity)
		local L4_152 = L4_152
	end
end
;({}).event_handler, ({}).activity_role_upsert = {}, function()
	local L1_153 = L1_153
	L1_153(L28_28.main_view_update_btn, L29_29.right_up_btn.qixi_activity)
	local L2_154 = L2_154
end
;({}).qixi_activity, ({}).redpoint_id = {}, "qixi_activity_entry_red_point"
;({}).click_handler = function()
	local L0_155, L1_156, L2_157
	L0_155 = Game
	L0_155 = L0_155.module
	L0_155 = L0_155.activity
	L0_155 = L0_155.const
	L1_156 = Game
	L1_156 = L1_156.module
	L1_156 = L1_156.activity
	L1_156 = L1_156.network
	if L0_155 and L1_156 then
		L2_157 = Game
		L2_157 = L2_157.module
		L2_157 = L2_157.qixi_activity
		if L2_157 then
			L2_157.set_h5_entry_red_point()
		end
		local L3_158 = L3_158
		L3_158(L0_155.h5_jump_act_id.qixi)
		local L4_159 = L4_159
	end
end
;({}).check_open_func = function()
	local L1_161 = Game.module
	L1_161 = L1_161.cloud_data
	L1_161 = L1_161.is_audit_close_for_recharge
	L1_161 = L1_161()
	if L1_161 then
		return false
	end
	do return Game.module.qixi_activity.get_h5_is_open() end
	local L2_162 = L2_162
end
;({})[L2_2.update_all] = function(A0_163, A1_164)
	local L3_165 = L3_165
	L3_165(L28_28.main_view_update_btn, L29_29.right_up_btn.qixi_activity)
	local L4_166 = L4_166
end
;({})[L2_2.update_item] = function(A0_167, A1_168)
	if A1_168 == _ENV.type.qixi_activity then
		local L3_169 = L3_169
		L3_169(L28_28.main_view_update_btn, L29_29.right_up_btn.qixi_activity)
		local L4_170 = L4_170
	end
end
;({}).event_handler, ({}).activity_role_upsert = {}, function()
	local L1_171 = L1_171
	L1_171(L28_28.main_view_update_btn, L29_29.right_up_btn.qixi_activity)
	local L2_172 = L2_172
end
;({}).qixi_h5, ({}).redpoint_id = {}, "qixi_h5_entry_red_point"
;({}).click_handler = function()
	_ENV.open_view(L4_4.ActivityReturnOldMainView.name)
	local L1_173 = L1_173
end
;({}).check_open_func = function()
	local L0_174, L1_175
	L0_174 = Game
	L0_174 = L0_174.module
	L0_174 = L0_174.activity_return
	L1_175 = L0_174 or L1_175
	if L0_174 then
		L1_175 = L0_174.get_old_return_is_open
	end
	if L1_175 then
		do return L1_175() end
		local L2_176 = L2_176
	end
	L2_176 = false
	return L2_176
end
;({}).event_handler, ({}).update_old_return_info = {}, function()
	local L1_177 = L1_177
	L1_177(L28_28.main_view_update_btn, L29_29.right_up_btn.activity_old_return)
	local L2_178 = L2_178
end
;({}).activity_old_return, ({}).redpoint_id = {}, "activity_old_return_red_point"
;({}).click_handler = function()
	_ENV.open_view(L4_4.ActivityReturnNewMainView.name)
	local L1_179 = L1_179
end
;({}).check_open_func = function()
	local L0_180, L1_181
	L0_180 = Game
	L0_180 = L0_180.module
	L0_180 = L0_180.activity_return
	L1_181 = L0_180 or L1_181
	if L0_180 then
		L1_181 = L0_180.get_new_return_is_open
	end
	if L1_181 then
		do return L1_181() end
		local L2_182 = L2_182
	end
	L2_182 = false
	return L2_182
end
;({}).activity_new_return, ({}).redpoint_id = {}, "activity_new_return_red_point"
;({}).check_open_func = function()
	local L4_187, L5_188 = Game.module, L5_188
	L4_187 = L4_187.cloud_data
	L4_187 = L4_187.is_audit_close_for_recharge
	L4_187 = L4_187()
	if L4_187 then
		L5_188 = false
		return L5_188
	end
	L5_188 = _ENV
	L5_188 = L5_188.is_open
	local L5_188, L2_185 = L5_188(L0_0.type.godpet), L2_185
	L2_185 = Game
	L2_185 = L2_185.module
	L2_185 = L2_185.activity_bank
	if L2_185 and L2_185.activity_is_open then
		local L3_186 = L2_185.activity_is_open()
		if L3_186 then
			goto lbl_29
		end
	end
	L3_186 = false
	::lbl_29::
	if Game.module.activity and Game.module.activity.data and Game.module.activity.const then
		local L6_189 = L6_189
		local L7_190 = L7_190
		L7_190 = Game.module.activity.data.is_activity_open(Game.module.activity.const.act_id.dragon_boat_gift_pack)
	end
	if not L5_188 and not L3_186 then
	end
	return L7_190
end
;({}).click_handler = function()
	_ENV.open_view(L4_4.GameActivityView.name)
	local L1_191 = L1_191
end
;({}).redpoint_id = "main_btns_red_point_active"
;({})[L2_2.update_item] = function(A0_192, A1_193)
	local L3_194 = L3_194
	L3_194(L28_28.main_view_update_btn, L29_29.right_up_btn.activity)
	local L4_195 = L4_195
end
;({}).activity, ({}).event_handler, ({})[L2_2.update_all] = {}, {}, function(A0_196, A1_197)
	local L3_198 = L3_198
	L3_198(L28_28.main_view_update_btn, L29_29.right_up_btn.activity)
	local L4_199 = L4_199
end
;({}).check_open_func = function()
	local L0_200, L1_201
	L0_200 = GameDefine
	L0_200 = L0_200.BYTEGAME
	if L0_200 then
		L0_200 = Game
		L0_200 = L0_200.module
		L0_200 = L0_200.bytegame
		L0_200 = L0_200.data
		L0_200 = L0_200.can_come_from_side_bar
		if L0_200 then
			L0_200 = Game
			L0_200 = L0_200.module
			L0_200 = L0_200.bytegame
			L0_200 = L0_200.data
			L0_200 = L0_200.is_fetched_gift
			L0_200 = L0_200 == 0
		end
		return L0_200
	end
	L0_200 = false
	return L0_200
end
;({}).click_handler = function()
	_ENV.open_view(L4_4.ByteGameSideBarView.name)
	local L1_202 = L1_202
end
;({}).bytegame_entrance_reward, ({}).event_handler, ({}).bytegame_upd_is_fetched_gift = {}, {}, function(A0_203, A1_204)
	local L3_205 = L3_205
	L3_205(L28_28.main_view_update_btn, "bytegame_entrance_reward")
	local L4_206 = L4_206
end
