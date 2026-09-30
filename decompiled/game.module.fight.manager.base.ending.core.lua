local L0_0, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L11_11, L12_12, L13_13, L14_14 = L0_0, "game.utils.events", L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L11_11, L12_12, L13_13, L14_14
L0_0 = L0_0(L2_2)
L2_2 = table
L2_2 = L2_2.insert
L3_3 = GameFunctions
L4_4 = DataConfigs
L4_4 = L4_4.gameplay
L5_5 = Game
L5_5 = L5_5.module
L5_5 = L5_5.open_func
L6_6 = Game
L6_6 = L6_6.module
L6_6 = L6_6.mvp_result
L7_7 = Game
L7_7 = L7_7.module
L7_7 = L7_7.fight
L8_8 = Game
L8_8 = L8_8.module
L8_8 = L8_8.data
L11_11 = L7_7.ways
L11_11 = L11_11.base
L12_12 = require
L13_13 = "game.utils.sound_manager"
L12_12 = L12_12(L13_13)
L13_13 = Game
L13_13 = L13_13.ui_const
L14_14 = Game
L14_14 = L14_14.ui_manager
function L11_11.clear_ending_data(A0_15)
	if A0_15.end_action_context then
		A0_15.end_action_context.stop = true
		if A0_15.end_action_context.data.wait_timer then
			local L1_16, L2_17 = L1_16, L2_17
			L1_16(L2_17, A0_15.end_action_context.data.wait_timer)
			local L3_18 = L3_18
			L1_16 = A0_15.end_action_context
			L1_16 = L1_16.data
			L1_16.wait_timer = nil
		end
		A0_15.end_action_context = nil
	end
end
function L11_11.on_msg_battle_quit_s2c(A0_19, A1_20, A2_21)
	local L3_22
	L3_22 = A2_21.object_id
	if not L3_22 then
		return
	end
	if A0_19.ctrl_unit_id == L3_22 then
		A0_19:raw_exit_fight()
	else
		local L4_23 = L4_23
		L4_23 = L4_23(A0_19, L3_22, true)
		if not L4_23 then
			return
		end
		L4_23.is_quit = true
		local L5_24 = L5_24
		local L6_25 = L6_25
		L5_24(L6_25, L3_22)
		local L7_26 = L7_26
		return L4_23
	end
end
function L11_11.on_msg_battle_playback_quit_s2c(A0_27, A1_28, A2_29)
	A0_27:raw_exit_fight()
end
function L11_11.on_msg_battle_watcher_quit_s2c(A0_30, A1_31, A2_32)
	A0_30:raw_exit_fight()
end
function L11_11.on_msg_battle_result_s2c(A0_33, A1_34, A2_35)
	A0_33.fight_result_msg = A2_35
	A0_33:stop_fight()
	local L3_36, L4_37 = L3_36, L4_37
end
function L11_11.on_msg_battle_custom_result_s2c(A0_38, A1_39, A2_40)
	A0_38.fight_result_msg = A2_40
	A0_38:stop_fight()
	local L3_41, L4_42 = L3_41, L4_42
end
function L11_11.stop_fight(A0_43)
	if A0_43.game_state == "loading" then
		A0_43.need_stop_fight = true
		return
	end
	A0_43.need_stop_fight = false
	local L2_44 = L2_44
	L2_44(A0_43, "ending")
	local L3_45 = L3_45
end
;({}).season = true
;({}).gve_air_race_game_online = true
;({}).pve_build_snowman = true
function L11_11.on_enter_game_state_ending(A0_46, A1_47, A2_48)
	local L3_49, L8_54 = A0_46:get_ctrl_unit(), L8_54
	if L3_49 then
		L8_54 = A0_46.set_unit_hook
		L8_54(A0_46, L3_49, false)
	end
	L8_54 = _ENV
	L8_54 = L8_54.brocast
	L8_54("fight_stop")
	L8_54 = A0_46.is_win
	L8_54 = L8_54(A0_46)
	if L8_54 then
		L8_54 = _UPVALUE1_
		L8_54 = L8_54[A0_46.play_type]
		if not L8_54 then
			L8_54 = Game
			L8_54 = L8_54.module
			L8_54 = L8_54.newbie_fight_flow
			L8_54.try_to_update_to_next_flow()
		end
	end
	L8_54 = A0_46.get_fight_end_action_config
	L8_54 = L8_54(A0_46)
	local L5_51 = L5_51
	L5_51 = L5_51(L8_54, function()
		local L0_55, L1_56
		L0_55 = _ENV
		L0_55.end_action_context = nil
	end)
	A0_46.end_action_context = L5_51
	L5_51 = {}
	L5_51.fight_way = A0_46
	L5_51.cf_battle_id = A0_46.cf_battle_id
	L5_51.play_type = A0_46.play_type
	L5_51.msg = A0_46.fight_result_msg
	A0_46.end_action_context.data.args = L5_51
	local L6_52 = L6_52
	L6_52(function()
		local L1_57 = L1_57
		local L2_58 = L2_58
		L1_57(L2_58, A0_46.end_action_context, L5_51)
		local L3_59 = L3_59
	end, function(A0_60)
		local L1_61 = _ENV:fight_traceback()
		local L5_65 = L5_65
		L5_65("\231\187\147\231\174\151\230\181\129\231\168\139\230\137\167\232\161\140\229\135\186\233\148\153: " .. tostring(A0_60))
		L5_65 = _ENV
		L5_65 = L5_65.exit_fight
		L5_65(L5_65)
		local L3_63 = L3_63
	end)
end
function L11_11.get_fight_end_action_config(A0_66)
	local L1_67
	L1_67 = {}
	;({}).func = "wait_end"
	local L2_68 = L2_68
	;({}).func = "try_to_trigger_guide_before_show_result"
	local L3_69 = L3_69
	;({}).func = "wait_ms"
	local L4_70 = L4_70
	;({}).func = "exit_fight"
	L1_67[1] = L2_68
	L1_67[2] = L3_69
	L1_67[3] = L4_70
	local L1_67[4], L5_71 = {}, L5_71
	return L1_67
end
function L11_11.end_actions.collect_all_gold(A0_72, A1_73, A2_74)
	local L3_75
	repeat
		L3_75 = A1_73.fight_way
		local L8_80 = L3_75.need_collect_gold
		L8_80 = L8_80(L3_75)
		if L8_80 then
			if L3_75:try_auto_collect_drop_gold() then
				local L7_79 = L7_79
				L7_79(L3_75.timer, 1000, function()
					_ENV(true)
					local L1_81 = L1_81
				end)
				break -- pseudo-goto
			end
			L7_79 = L3_75.set_drop_gold_collect_callback
			L7_79(L3_75, function()
				local L3_85 = _ENV.timer
				L3_85 = L3_85.run_after_no_args
				local L2_84 = L2_84
				L3_85(L2_84, 1000, function()
					_ENV(true)
					local L1_86 = L1_86
				end)
			end)
			L7_79 = L3_75.try_to_trigger_guide_on_collect_gold
			L7_79(L3_75)
			break -- pseudo-goto
		end
		L7_79 = A2_74
		L7_79(true)
		local L6_78 = L6_78
	until true
end
function L11_11.end_actions.wait_end(A0_87, A1_88, A2_89)
	local L3_90, L4_91
	L3_90 = A1_88.fight_way
	local L4_91, L9_96, L10_97, L14_101 = {}, L9_96, L10_97, L14_101
	L10_97 = L3_90
	L9_96 = L3_90.is_win
	L9_96 = L9_96(L10_97)
	L4_91.is_win = L9_96
	L9_96 = L3_90.cf_battle_id
	L4_91.cfg_battle_id = L9_96
	L9_96 = clone
	L10_97 = L3_90.id_to_unit
	L9_96 = L9_96(L10_97)
	L4_91.units = L9_96
	L9_96 = Game
	L9_96 = L9_96.module
	L9_96 = L9_96.friend
	L10_97 = L9_96.data
	L10_97.fight_end_add_friend_data = L4_91
	function L10_97()
		_ENV:try_to_uninstall_touch()
		_ENV.timer:del_all_timers()
		_ENV:close_fight_uis()
		local L1_102 = L1_102
	end
	L14_101 = L3_90.cf_battle
	if not L14_101 then
		L14_101 = L10_97
		L14_101()
		L14_101 = A2_89
		L14_101(true)
		local L8_95 = L8_95
		return
	end
	L14_101 = 0
	L8_95 = 100
	local L11_98, L12_99 = L11_98, L12_99
	local L13_100 = L13_100
	L13_100 = L13_100(L3_90.timer, L8_95, function()
		_ENV = _ENV + L8_95
		if not L3_90:can_show_fight_result_view() then
			if _ENV <= 6000 then
				return
			end
		elseif L11_98 and _ENV < L11_98 then
			return
		end
		local L2_105, L3_106 = L2_105, L3_106
		L2_105(L3_106, L3_90:fight_traceback())
		L2_105 = A2_89
		L3_106 = true
		L2_105(L3_106)
	end)
	L12_99.wait_timer = L13_100
end
function L11_11.end_actions.wait_ms(A0_107, A1_108, A2_109, A3_110)
	local L4_111
	L4_111 = A1_108.fight_way
	local L9_116 = L4_111.cf_play_info
	if not L9_116 then
		L9_116 = A2_109
		L9_116(true)
		return
	end
	L9_116 = L4_111.cf_play_info
	L9_116 = L9_116.show_result_delay
	if not L9_116 then
		L9_116 = 10
	end
	if A3_110 and A3_110.duration then
		L9_116 = A3_110.duration
	end
	print("--------wait_ms---------", L9_116)
	local L6_113, L7_114 = L6_113, L7_114
	local L8_115 = L8_115
	L6_113 = L6_113(L7_114, L8_115, function()
		_ENV:clear_end_wait_timer()
		A2_109(true)
		local L1_117 = L1_117
	end)
	L4_111.end_wait_timer = L6_113
end
function L11_11.end_actions.try_to_trigger_guide_before_show_result(A0_118, A1_119, A2_120)
	local L3_121
	L3_121 = A1_119.fight_way
	local L7_125 = L3_121.is_win
	L7_125 = L7_125(L3_121)
	if not L7_125 then
		L7_125 = A2_120
		L7_125(true)
		return
	end
	L7_125 = L3_121.try_to_trigger_guide_on_win
	local L5_123 = L5_123
	local L6_124 = L6_124
	L7_125(L5_123, L6_124, function()
		_ENV(true)
		local L1_126 = L1_126
	end)
end
function L11_11.end_actions.show_fight_result_view(A0_127, A1_128, A2_129)
	local L3_130, L4_131
	L3_130 = A1_128.fight_way
	L4_131 = Game
	L4_131 = L4_131.module
	L4_131 = L4_131.newbie_fight_flow
	if not L4_131.is_pass_flow() and L3_130:is_win() then
		A2_129(true)
		return
	end
	local L5_132 = L3_130:get_result_view_result()
	local L6_133 = L6_133
	local L7_134 = L7_134
	;({}).win = L5_132
	;({}).cf_battle_id = L3_130.cf_battle_id
	;({}).msg = L3_130.fight_result_msg
	local ({}).play_type, L9_136 = L3_130.cf_play_info.play_type, L9_136
	function L9_136.finish_cb()
		_ENV(true)
		local L1_137 = L1_137
	end
	L6_133(L7_134, L9_136)
end
function L11_11.end_actions.load_mvp_anim_view(A0_138, A1_139, A2_140)
	local L3_141, L4_142
	L3_141 = A1_139.fight_way
	local L4_142, L9_147, L10_148, L11_149, L12_150, L16_154, L17_155 = L3_141.cf_play_info, L9_147, L10_148, L11_149, L12_150, L16_154, L17_155
	L4_142 = L4_142.play_type
	L9_147 = L3_141.fight_result_msg
	if L9_147 then
		L9_147 = _ENV
		L9_147 = L9_147[L4_142]
		if L9_147 then
			goto lbl_15
		end
	end
	L9_147 = A2_140
	L10_148 = true
	L9_147(L10_148)
	do return end
	::lbl_15::
	L9_147 = _ENV
	L9_147 = L9_147[L4_142]
	L9_147 = L9_147.show_mvp
	L10_148 = L5_5
	L10_148 = L10_148.is_open
	L11_149 = L5_5
	L11_149 = L11_149.const
	L11_149 = L11_149.type
	L11_149 = L11_149.mvp_ani
	L10_148 = L10_148(L11_149)
	L10_148 = L9_147 or L10_148
	L10_148 = L10_148 and L9_147 and L9_147 == 1
	if not L10_148 then
		L11_149 = A2_140
		L12_150 = true
		L11_149(L12_150)
	end
	L11_149 = L3_141.fight_result_msg
	L12_150 = nil
	L16_154 = {}
	L17_155 = nil
	if L11_149.camp then
	end
	if L11_149.camp[L11_149.win_camp_id] then
	end
	if L11_149.camp[L11_149.win_camp_id].roles then
		_FOR_, _FOR_, _FOR_ = pairs(L11_149.camp[L11_149.win_camp_id].roles)
		for _FORV_16_, _FORV_17_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_17_.id == L11_149.mvp_role_id then
				L17_155 = _FORV_17_
				L12_150 = Game.module.dress_up.data.get_mvp_scene_id_by_looks(_FORV_17_.looks)
				if L3_141.self_camp ~= L11_149.win_camp_id or not 2 then
				end
				L17_155.unit_type = 3
				if L11_149.mvp_role_id ~= L8_8.get_player_id() or not 1 then
				end
				L17_155.unit_type = L17_155.unit_type
			else
				local L18_156 = L18_156
				local L19_157 = L19_157
				L1_1(L16_154, _FORV_17_)
			end
		end
	end
	L20_158 = {}
	L20_158.mvp_scene_id = L12_150
	L20_158.mvp_data = L17_155
	L20_158.cheer_data_list = L16_154
	L6_6.load_mvp_scene(L20_158)
	A2_140(true)
end
function L11_11.end_actions.play_mvp_anim_view(A0_159, A1_160, A2_161)
	if not A1_160.fight_way.fight_result_msg then
		A2_161(true)
		return
	end
	_ENV.reset_ui_canvas_size()
	local L3_162 = L3_162
	L3_162 = {}
	function L3_162.finish_cb()
		_ENV(true)
		local L1_165 = L1_165
	end
	local L4_163 = L4_163
	L4_163(L3_162)
	local L5_164 = L5_164
end
function L11_11.end_actions.exit_fight(A0_166, A1_167, A2_168)
	local L3_169
	L3_169 = A1_167.fight_way
	A2_168(true)
	L3_169:exit_fight()
	local L4_170, L5_171 = L4_170, L5_171
end
function L11_11.exit_fight(A0_172)
	local L1_173
	L1_173 = xpcall
	local L4_176 = L4_176
	L1_173(L4_176, A0_172:fight_traceback())
	L1_173 = Game
	L1_173 = L1_173.module
	L1_173 = L1_173.newbie_fight_flow
	L4_176 = L1_173.is_in_multi_player_fly_race_flow
	L4_176 = L4_176()
	if L4_176 then
		L4_176 = A0_172.raw_exit_fight
		L4_176(A0_172)
	else
		L4_176 = L1_173.try_to_do_cur_flow
		L4_176 = L4_176()
		if L4_176 then
		else
			L4_176 = A0_172.raw_exit_fight
			L4_176(A0_172)
			local L3_175 = L3_175
		end
	end
end
function L11_11.register_raw_exit_fight_call_back(A0_177, A1_178)
	A0_177.raw_exit_fight_call_back = A1_178
end
function L11_11.clear_end_wait_timer(A0_179)
	if not A0_179.end_wait_timer or not A0_179.timer then
		return
	end
	local L2_180 = L2_180
	L2_180(A0_179.timer, A0_179.end_wait_timer)
	local L3_181 = L3_181
	A0_179.end_wait_timer = nil
end
function L11_11.just_exit_fight(A0_182)
	print("~~~~~~~~~~~~~~!!!!!!!!!exit old fight")
	A0_182:clear_end_wait_timer()
	local L3_184 = L3_184
	L3_184(A0_182, false, true)
	local L4_185 = L4_185
	L3_184 = Game
	L3_184 = L3_184.module
	L3_184 = L3_184.scene_manager
	L4_185 = L3_184.clear
	L4_185()
end
function L11_11.raw_exit_fight(A0_186)
	A0_186:clear_end_wait_timer()
	local L5_191 = L5_191
	L5_191 = A0_186.raw_set_is_pause
	L5_191(A0_186, false, true)
	local L4_190 = L4_190
	L5_191 = _ENV
	L5_191 = L5_191.stop_bgm
	L5_191()
	L4_190 = A0_186
	L5_191 = A0_186.try_get_result_leave_args
	L5_191, L4_190 = L5_191(L4_190)
	A0_186.force_back_to_view = nil
	A0_186.force_back_to_scene = nil
	A0_186.raw_exit_fight_call_back = nil
	if not L4_190 then
		L4_190 = {}
	end
	L4_190.is_fight_exit = true
	if not L4_190 or not L4_190.back_to_scene then
	end
	if not Game.module.scene_manager.scenes.fight or not Game.module.scene_manager.scenes.fight.source_scene_tp then
	end
	if not nil and (not nil or nil == "fight") then
	end
	if GameDefine.UNITY_EDITOR then
		if L4_190 then
		end
		local L10_196 = L10_196
		local L11_197 = L11_197
		local L12_198 = L12_198
		local L13_199 = L13_199
		local L14_200 = L14_200
		L13_199(L14_200, "scene", L4_190.back_to_scene, Game.module.scene_manager.last_scene_tp, table_string(L4_190, nil, 2))
	end
	L13_199 = L11_197.enter
	L14_200 = L12_198
	L13_199(L14_200, L4_190, L5_191, function()
		if _ENV then
			_ENV()
		end
	end)
end
function L11_11.try_get_result_leave_args(A0_201)
	if A0_201.force_back_to_view and A0_201.force_back_to_view ~= "" or A0_201.force_back_to_scene and A0_201.force_back_to_scene ~= "" then
		({}).back_to_view = A0_201.force_back_to_view
		;({}).back_to_scene = A0_201.force_back_to_scene
		do return {}, {} end
		local L3_204 = L3_204
	end
	L3_204 = A0_201.get_result_leav_args
	if L3_204 then
		L3_204 = A0_201.get_result_leav_args
		do return L3_204(A0_201) end
		local L2_203 = L2_203
	end
end
function L11_11.is_win(A0_205)
	local L1_206, L2_207
	L1_206 = A0_205.fight_result_msg
	if not L1_206 then
		L1_206 = false
		return L1_206
	end
	L1_206 = A0_205.fight_result_msg
	L1_206 = L1_206.win_camp_id
	L2_207 = A0_205.self_camp
	L1_206 = L1_206 == L2_207
	return L1_206
end
function L11_11.get_result_view_result(A0_208)
	local L1_209 = A0_208:is_win()
	if L1_209 then
		L1_209 = 1
		if L1_209 then
			goto lbl_9
		end
	end
	L1_209 = 2
	::lbl_9::
	return L1_209
end
function L11_11.can_show_fight_result_view(A0_210)
	if A0_210:is_has_unit_falling() then
		return false
	end
	local L1_211 = A0_210:is_still_unit_moving()
	if L1_211 then
		L1_211 = false
		return L1_211
	end
	L1_211 = A0_210.fight_result_msg
	if not L1_211 then
		L1_211 = false
		return L1_211
	end
	L1_211 = true
	return L1_211
end
