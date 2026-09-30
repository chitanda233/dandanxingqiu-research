local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
L0_0 = assert
local L1_1, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L45_45, L46_46, L49_49, L50_50, L53_53, L54_54, L57_57, L58_58, L59_59, L60_60, L61_61, L62_62, L63_63, L66_66, L67_67, L68_68, L69_69, L70_70, L71_71, L77_77, L78_78, L79_79, L80_80, L81_81, L84_84, L85_85, L86_86, L87_87, L88_88, L89_89, L90_90 = string, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L45_45, L46_46, L49_49, L50_50, L53_53, L54_54, L57_57, L58_58, L59_59, L60_60, L61_61, L62_62, L63_63, L66_66, L67_67, L68_68, L69_69, L70_70, L71_71, L77_77, L78_78, L79_79, L80_80, L81_81, L84_84, L85_85, L86_86, L87_87, L88_88, L89_89, L90_90
L1_1 = L1_1.format
L2_2 = table
L2_2 = L2_2.insert
L3_3 = Game
L4_4 = L3_3.module
L4_4 = L4_4.jump_to
L5_5 = L3_3.ui_manager
L12_12 = import
L13_13 = ".head"
L12_12 = L12_12(L13_13)
L13_13 = L0_0
L14_14 = L12_12.data
L13_13 = L13_13(L14_14)
L14_14 = L0_0
L15_15 = L12_12.network
L14_14 = L14_14(L15_15)
L15_15 = L0_0
L16_16 = L12_12.event
L15_15 = L15_15(L16_16)
L16_16 = L0_0
L17_17 = L12_12.const
L16_16 = L16_16(L17_17)
L17_17 = L12_12.data_2v2
L18_18 = nil
L19_19 = nil
L20_20 = nil
L21_21 = L3_3.module
L21_21 = L21_21.common_view
L22_22 = L3_3.events
L23_23 = DataConfigs
L23_23 = L23_23.team_target
L24_24 = DataConfigs
L24_24 = L24_24.rank_type
L25_25 = DataConfigs
L25_25 = L25_25.item
L26_26 = DataConfigs
L26_26 = L26_26.equip
L27_27 = DataConfigs
L27_27 = L27_27.weapon
L28_28 = DataConfigs
L28_28 = L28_28.team_misc
L29_29 = DataConfigs
L29_29 = L29_29.misc
L30_30 = DataConfigs
L30_30 = L30_30.gameplay
L33_33 = DataConfigs
L33_33 = L33_33.equip_effect
L34_34 = DataConfigs
L34_34 = L34_34.attr
L35_35 = DataConfigs
L35_35 = L35_35.skill
L36_36 = DataConfigs
L36_36 = L36_36.passive_skill
L37_37 = DataConfigs
L37_37 = L37_37.cross_group_limit
L38_38 = DataConfigs
L38_38 = L38_38.gem
L39_39 = require
L40_40 = "game.other.server_time"
L39_39 = L39_39(L40_40)
L40_40 = L3_3.module
L40_40 = L40_40.login
L41_41 = DataConfigs
L41_41 = L41_41.demo_plan
L42_42 = DataConfigs
L42_42 = L42_42.demo_plan_item
L45_45 = nil
L46_46 = nil
L49_49 = nil
L50_50 = nil
L53_53 = nil
L54_54 = nil
L57_57 = nil
L58_58 = DataConfigs
L58_58 = L58_58.rank_define
L59_59 = require
L60_60 = "game.module.common_view.manager.confirm"
L59_59 = L59_59(L60_60)
L60_60 = L3_3.module
L60_60 = L60_60.common_view
L61_61 = GlobalConst
L62_62 = L61_61.player_type
L63_63 = require
L66_66 = "game.other.player_prefs"
L63_63 = L63_63(L66_66)
L66_66 = "is_team_invite_only_icon"
L67_67 = "is_team_request_invite_only_icon"
L68_68 = L3_3.ui_const
L69_69 = require
L70_70 = "game.module.common_view.manager.const"
L69_69 = L69_69(L70_70)
L70_70 = DataConfigs
L70_70 = L70_70.language_define
L71_71 = L3_3.module
L71_71 = L71_71.scene_manager
L77_77 = L3_3.redpoint_helper
L78_78 = require
L79_79 = "game.module.common_view.manager.confirm"
L78_78 = L78_78(L79_79)
L79_79 = L3_3.module
L79_79 = L79_79.bag
L80_80 = L3_3.module
L80_80 = L80_80.data
L81_81 = L3_3.module
L81_81 = L81_81.data
L81_81 = L81_81.const
L84_84 = L3_3.module
L84_84 = L84_84.friend
L84_84 = L84_84.const
L85_85 = DataConfigs
L85_85 = L85_85.weapon_job
L86_86 = nil
L87_87 = nil
L88_88 = DataConfigs
L88_88 = L88_88.season_rank
L89_89 = require
L90_90 = "game.module.main_weapon_develop.manager.head"
L89_89 = L89_89(L90_90)
L90_90 = L89_89.data
function L12_12.init()
	local L5_96 = L5_96
	L5_96 = L5_96("game.module.common_view.manager.invite")
	_ENV = L5_96
	L5_96 = L3_3
	L5_96 = L5_96.module
	L5_96 = L5_96.season
	L18_18 = L5_96
	L5_96 = L18_18
	L5_96 = L5_96.data_2v2
	L19_19 = L5_96
	L5_96 = L18_18
	L5_96 = L5_96.const
	L20_20 = L5_96
	L5_96 = L3_3
	L5_96 = L5_96.module
	L5_96 = L5_96.pet
	L5_96 = L5_96.data
	L87_87 = L5_96
	L5_96 = L6_6
	L5_96.leave_team_cb_dic = {}
	L5_96 = L6_6
	L5_96.update_recruit_cb_dic = {}
	L5_96 = L7_7
	L5_96 = L5_96.init
	L5_96()
	L5_96 = L8_8
	L5_96 = L5_96.init
	L5_96()
	L5_96 = L6_6
	L5_96 = L5_96.init_red_points
	L5_96()
	L5_96 = L6_6
	L5_96.team_invite_req_dict = nil
	L5_96 = L6_6
	L5_96.team_apply_req_dict = nil
	L5_96 = {}
	L5_96[L9_9.update_team_info] = L6_6.on_update_team_info
	L5_96[L9_9.update_team_member_info] = L6_6.on_update_team_member_info
	L5_96[L9_9.update_invite_list] = L6_6.on_update_invite_list
	L5_96[L9_9.check_pop] = L6_6.on_check_pop
	L5_96[L9_9.enter_team] = L6_6.on_enter_team
	L5_96[L9_9.leave_team] = L6_6.on_leave_team
	L5_96.view_open = L6_6.on_open_main_view
	L5_96.role_info_back = L6_6.on_role_info_back
	L5_96.application_focus = L6_6.on_application_focus
	L5_96.update_new_day = L6_6.on_update_new_day
	L6_6.event_dic = L5_96
	L6_6.setup_events()
	L43_43 = L28_28.team_invite_count.val
	L55_55 = L56_56.robot_invitation_time.val / 1000
	L52_52 = L28_28.team_recruit_invite_receive_cd.val
	L44_44 = L28_28.team_leader_request_count.val
	L47_47 = L28_28.team_recruit_refresh_cd.val
	L48_48 = L28_28.apply_life.val
	L51_51 = L28_28.applied_mark_life.val
	local L3_94 = L3_94
	local L4_95 = L4_95
	L4_95 = L4_95(L3_3.timer, 1000, function()
		_ENV.update_apply_time()
		_ENV.update_invite_life()
	end)
	L3_94.apply_loop = L4_95
	L3_94 = L6_6
	L3_94 = L3_94.register_jump
	L3_94()
	L3_94 = L3_3
	L3_94 = L3_94.module
	L3_94 = L3_94.cloud_data
	_UPVALUE19_ = L3_94
	L3_94 = _UPVALUE20_
	L3_94 = L3_94.add_push
	L4_95 = _UPVALUE21_
	L4_95 = L4_95.notice_type
	L4_95 = L4_95.invite
	L3_94(L4_95)
	L3_94 = _UPVALUE20_
	L3_94 = L3_94.add_push
	L4_95 = _UPVALUE21_
	L4_95 = L4_95.notice_type
	L4_95 = L4_95.team_apply
	L3_94(L4_95)
end
function L12_12.setup_events()
	L2_99 = _ENV._has_setup_events
	if L2_99 then
		return
	end
	L2_99 = _ENV
	L2_99._has_setup_events = true
	L2_99 = pairs
	L3_100 = _ENV
	L3_100 = L3_100.event_dic
	L2_99, L3_100, L4_101 = L2_99(L3_100)
	for _FORV_3_, _FORV_4_ in L2_99, L3_100, L4_101 do
		L3_3.events.add_listener(_FORV_3_, _FORV_4_)
		local L7_104 = L7_104
	end
end
function L12_12.clear_events()
	L2_107 = _ENV._has_setup_events
	if not L2_107 then
		return
	end
	L2_107 = _ENV
	L2_107._has_setup_events = false
	L2_107 = pairs
	L3_108 = _ENV
	L3_108 = L3_108.event_dic
	L2_107, L3_108, L4_109 = L2_107(L3_108)
	for _FORV_3_, _FORV_4_ in L2_107, L3_108, L4_109 do
		L3_3.events.remove_listener(_FORV_3_, _FORV_4_)
		local L7_112 = L7_112
	end
end
function L12_12.clear()
	_ENV.team_invite_req_dict = nil
	table.clear(_ENV.leave_team_cb_dic)
	L7_7.clear()
	L8_8.clear()
	_UPVALUE3_.clear()
	_ENV.clear_red_points()
	_ENV.clear_events()
	if _ENV.apply_loop then
		local L0_113, L1_114 = L0_113, L1_114
		L0_113(L1_114, _ENV.apply_loop)
		local L2_115 = L2_115
		L0_113 = _ENV
		L0_113.apply_loop = nil
	end
end
function L12_12.register_jump()
	local L3_119 = _ENV.register_info
	;({}).handler = function(A0_120)
		local L1_121, L2_122, L3_123, L4_124
		L1_121 = A0_120.team_target
		local L2_122, L9_129 = A0_120.sub_team_target, L9_129
		L3_123 = A0_120.team_args
		L4_124 = A0_120.after_call_back
		L9_129 = _ENV
		L9_129 = L9_129.target_main_type
		L9_129 = L9_129.pvp
		if L1_121 == L9_129 then
			L9_129 = L6_6
			L9_129 = L9_129.get_target_module
			L9_129 = L9_129(L1_121)
			L2_122 = L9_129:get_team_args()
		end
		if not L1_121 then
			L9_129 = L7_7
			L9_129 = L9_129.get_team_type_target_args
			L2_122, L3_123, L9_129 = L9_129()
			L1_121 = L9_129
		end
		L9_129 = L6_6
		L9_129 = L9_129.team_target_turn_to
		local L6_126 = L6_126
		local L7_127 = L7_127
		local L8_128 = L8_128
		L9_129(L6_126, L7_127, L8_128, function()
			if _ENV then
				_ENV()
				_ENV = nil
			end
			L5_5.close_unuse_view()
		end)
	end
	L3_119("TeamMainView", {})
	L3_119 = _ENV
	L3_119 = L3_119.register_info
	local L1_117 = L1_117
	;({}).handler = function(A0_130)
		BroadcastTips.broadcast_tips("\230\149\172\232\175\183\230\156\159\229\190\133!")
		local L2_131 = L2_131
	end
	L3_119(L1_117, {})
	local L2_118 = L2_118
end
function L12_12.init_req()
	_ENV.team_role_info_c2s()
	_ENV.team_info_c2s()
	_ENV.avatar_act_request_info_c2s()
	local L1_132 = L1_132
	L1_132(_UPVALUE2_.type.demo_plan, _ENV.season_demo_info_c2s)
	local L2_133 = L2_133
end
function L12_12.get_target_module(A0_134)
	do return _ENV.get_target_module(A0_134) end
	local L2_135 = L2_135
end
function L12_12.get_invite_module(A0_136)
	do return _ENV.get_invite_module(A0_136) end
	local L2_137 = L2_137
end
function L12_12.on_open_main_view(A0_138)
	if A0_138 == "GameMainView" then
		_ENV.on_check_pop()
		local L1_139 = L1_139
		L1_139(L10_10.invite_answer_from_where.open_main_view)
		local L2_140 = L2_140
	end
end
function L12_12.on_update_team_info()
	local L1_142 = _ENV.try_trigger_member_count_change
	L1_142()
	L1_142 = L7_7
	L1_142 = L1_142.get_team_type_target_args
	L1_142 = L1_142()
	local L2_143 = L2_143
	local L3_144, L4_145 = L3_144, L4_145
	L4_145(_ENV.get_target_module(L1_142), L2_143)
	local L5_146 = L5_146
end
function L12_12.on_update_team_member_info()
	local L1_148 = _ENV.get_team_type_target_args
	L1_148 = L1_148()
	local L2_149 = L2_149
	local L3_150, L4_151 = L3_150, L4_151
	L4_151(L6_6.get_target_module(L1_148), L2_149)
	local L5_152 = L5_152
end
function L12_12.on_role_info_back(A0_153, A1_154, A2_155)
	_ENV.check_member_is_in_mini_game(A0_153)
	local L4_156 = L4_156
end
function L12_12.on_application_focus(A0_157)
	if A0_157 then
		local L1_158 = L1_158
		L1_158(L10_10.invite_answer_from_where.on_application_focus)
		local L2_159 = L2_159
	end
end
function L12_12.on_update_new_day()
	table.clear(_ENV.estimate_time_dic)
	local L1_160 = L1_160
end
function L12_12.try_trigger_member_count_change()
	local L0_161 = _ENV.get_members_ready_count()
	local L1_162 = L1_162
	L1_162 = L1_162("members_ready_count")
	if L1_162 and L0_161 ~= L1_162 then
		local L5_166 = L5_166
		local ({})[1], L6_167 = L0_161, L6_167
		L6_167(L3_3.module.guide_system.const.trigger_type.room_member_count, {})
	end
	L5_166 = _ENV
	L5_166 = L5_166.set_value
	L6_167 = "members_ready_count"
	L5_166(L6_167, L0_161)
	local L4_165 = L4_165
end
function L12_12.try_get_match_stat()
	local L1_169 = _ENV.get_team_type_target_args
	L1_169 = L1_169()
	if not L1_169 or not L1_169() then
		return
	end
	local L2_170 = L2_170
	local L3_171 = L3_171
	L3_171(L1_169, L2_170)
	local L4_172 = L4_172
end
function L12_12.on_update_invite_list()
	_ENV.brocast(_UPVALUE1_.update_push)
	local L1_173 = L1_173
end
function L12_12.get_can_pop_invite()
	local L6_180, L7_181, L8_182, L9_183 = _ENV.get_team_invite_list_data, L7_181, L8_182, L9_183
	L6_180 = L6_180()
	if L6_180 then
		L7_181 = next
		L8_182 = L6_180
		L7_181 = L7_181(L8_182)
		if L7_181 then
			goto lbl_12
		end
	end
	do return end
	::lbl_12::
	L7_181 = nil
	L8_182 = nil
	L9_183 = L39_39
	L9_183 = L9_183.get_server_time
	L9_183 = L9_183()
	L4_178, L5_179, _FOR_ = L4_178(L6_180)
	for _FORV_7_, _FORV_8_ in L4_178, L5_179, _FOR_ do
		if not _FORV_8_.has_pop then
			L7_181 = _FORV_8_
			L8_182 = _FORV_7_
			break
		end
	end
	L4_178 = L7_181
	L5_179 = L8_182
	return L4_178, L5_179
end
function L12_12.get_can_pop_robot_invite()
	local L0_184
	L0_184 = _ENV
	local L0_184, L6_190, L7_191, L8_192 = L0_184.robot_invite_list, L6_190, L7_191, L8_192
	if L0_184 then
		L6_190 = next
		L7_191 = L0_184
		L6_190 = L6_190(L7_191)
		if L6_190 then
			goto lbl_11
		end
	end
	do return end
	::lbl_11::
	L6_190 = nil
	L7_191 = nil
	L8_192 = L39_39
	L8_192 = L8_192.get_server_time
	L8_192 = L8_192()
	L9_193 = ipairs
	L9_193, L5_189, _FOR_ = L9_193(L0_184)
	for _FORV_7_, _FORV_8_ in L9_193, L5_189, _FOR_ do
		if not _FORV_8_.has_pop then
			L6_190 = _FORV_8_
			L7_191 = _FORV_7_
			break
		end
	end
	L9_193 = L6_190
	L5_189 = L7_191
	return L9_193, L5_189
end
function L12_12.get_can_pop_apply()
	local L0_194
	L0_194 = _ENV
	local L0_194, L5_199, L6_200 = L0_194.apply_list, L5_199, L6_200
	if L0_194 then
		L5_199 = next
		L6_200 = L0_194
		L5_199 = L5_199(L6_200)
		if L5_199 then
			goto lbl_11
		end
	end
	do return end
	::lbl_11::
	L5_199 = nil
	L6_200 = nil
	L7_201 = ipairs
	L8_202 = L0_194
	L7_201, L8_202, _FOR_ = L7_201(L8_202)
	for _FORV_6_, _FORV_7_ in L7_201, L8_202, _FOR_ do
		if not _FORV_7_.has_pop then
			L5_199 = _FORV_7_
			L6_200 = _FORV_6_
			break
		end
	end
	L7_201 = L5_199
	L8_202 = L6_200
	return L7_201, L8_202
end
function L12_12.get_relation_info(A0_203)
	local L1_204, L2_205, L3_206, L4_207
	L1_204 = ""
	L2_205 = nil
	L3_206 = A0_203.relation
	L4_207 = _ENV
	L4_207 = L4_207.relation_type
	L4_207 = L4_207.friend
	if L3_206 == L4_207 then
		L1_204 = "\229\165\189\229\143\139"
		L3_206 = _ENV
		L3_206 = L3_206.relation_type
		L2_205 = L3_206.friend
	else
		L3_206 = A0_203.relation
		L4_207 = _ENV
		L4_207 = L4_207.relation_type
		L4_207 = L4_207.alliance
		if L3_206 == L4_207 then
			L1_204 = "\229\133\172\228\188\154\230\136\144\229\145\152"
			L3_206 = _ENV
			L3_206 = L3_206.relation_type
			L2_205 = L3_206.alliance
		else
			L3_206 = A0_203.relation
			L4_207 = _ENV
			L4_207 = L4_207.relation_type
			L4_207 = L4_207.recent
			if L3_206 == L4_207 then
				L3_206 = _ENV
				L3_206 = L3_206.relation_type
				L2_205 = L3_206.recent
			end
		end
	end
	L3_206 = L1_204
	L4_207 = L2_205
	return L3_206, L4_207
end
function L12_12.on_check_pop(A0_208)
	if not _ENV.is_main_scene() then
		return
	end
	local L1_209 = L1_209
	L1_209 = L1_209(A0_208)
	local L2_210 = L2_210
	L2_210 = L2_210(A0_208)
	local L3_211 = L3_211
	local L3_211, L4_212 = L3_211(A0_208), L4_212
	L4_212 = L1_209 or A0_208
	L4_212 = L2_210 or L4_212
	if not L1_209 and not L2_210 then
		L4_212 = L3_211
	end
	return L4_212
end
function L12_12.check_pop_robot_invite(A0_213)
	local L1_214 = _ENV.get_can_pop_robot_invite()
	if not L1_214 then
		return
	end
	local L2_215 = L2_215
	L2_215 = L2_215(L1_214.type)
	local L3_216 = L3_216
	local L3_216, L6_219 = L3_216(L2_215, L1_214.target, L1_214.args), L6_219
	L6_219 = "\233\130\128\232\175\183\228\189\160\231\187\132\233\152\159\229\137\141\229\190\128"
	local L6_219, L5_218 = L6_219 .. L3_216, L5_218
	L5_218 = nil
	;({}).role_id = L1_214.role_id
	;({}).fashion_id = L1_214.invite_id
	;({}).content = L6_219
	;({}).friend_point_content = L5_218
	;({}).toggle_tips = "\229\139\190\233\128\137\229\144\142\230\156\172\230\172\161\231\153\187\229\189\149\228\187\133\233\128\154\232\191\135\230\181\174\230\160\135\233\128\154\231\159\165"
	;({}).sure_label = "\229\144\140\230\132\143"
	;({}).show_func = function()
		local L0_222, L1_223
		L0_222 = _ENV
		L0_222.has_pop = true
	end
	;({}).sure_click = function()
		_ENV.season_handle_invite_c2s(L1_214.robot_id)
		local L1_224 = L1_224
	end
	;({}).cancel_label = "\230\139\146\231\187\157"
	;({}).hide_cb = function()
		_ENV.on_check_pop()
	end
	;({}).cancel_left_time = L55_55
	;({}).toggle_key = L64_64
	;({}).cur_login = true
	;({}).force_show = A0_213
	;({}).type = L69_69.confirm_type.toggle
	;({}).key = "team_robot_invite_" .. L1_214.robot_id
	;({}).btn_icon = "rudui"
	;({}).is_invite = true
	;({}).not_play_click_tween = true
	local L7_220 = L7_220
	_UPVALUE5_.show({})
	local L8_221 = L8_221
	L8_221 = true
	return L8_221
end
function L12_12.check_pop_invite(A0_225)
	local L9_234 = _ENV.get_can_pop_invite
	L9_234 = L9_234()
	if not L9_234 then
		print("no invite can pop")
		return
	end
	local L2_227 = L2_227
	local L2_227, L3_228 = L2_227(L9_234)
	local L4_229 = L4_229
	L4_229 = L4_229(L9_234.type)
	local L5_230, L6_231 = L5_230, L6_231
	L5_230 = L5_230(L6_231, L9_234.target, L9_234.args)
	L6_231 = L9_234.type
	local L7_232 = L7_232
	local L7_232, L8_233 = L7_232 .. L5_230, L8_233
	L8_233 = nil
	;({}).role_id = L9_234.role_id
	;({}).fashion_id = L9_234.invite_id
	;({}).content = L7_232
	;({}).friend_point_content = L8_233
	;({}).toggle_tips = "\229\139\190\233\128\137\229\144\142\230\156\172\230\172\161\231\153\187\229\189\149\228\187\133\233\128\154\232\191\135\230\181\174\230\160\135\233\128\154\231\159\165"
	;({}).sure_label = "\229\144\140\230\132\143"
	;({}).title = L2_227
	;({}).show_func = function()
		local L0_237, L1_238
		L0_237 = _ENV
		L0_237.has_pop = true
	end
	;({}).sure_click = function(A0_239)
		if not _ENV then
			return
		end
		_ENV = L7_7.pop_invite(_ENV.role_id)
		if not _ENV then
			BroadcastTips.broadcast_tips("\233\130\128\232\175\183\229\183\178\232\191\135\230\156\159")
			return
		end
		_UPVALUE2_.clear_invites_with_key("team_invite_")
		local L2_240 = L2_240
		L2_240(_ENV, true)
		local L3_241 = L3_241
	end
	;({}).cancel_label = "\230\139\146\231\187\157"
	;({}).cancel_click = function(A0_242)
		if not _ENV then
			return
		end
		_ENV = L7_7.pop_invite(_ENV.role_id)
		if not _ENV then
			BroadcastTips.broadcast_tips("\233\130\128\232\175\183\229\183\178\232\191\135\230\156\159")
			return
		end
		local L2_243 = L2_243
		L2_243(_ENV, false)
		local L3_244 = L3_244
	end
	