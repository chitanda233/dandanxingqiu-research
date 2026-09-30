local L0_0, L1_1, L2_2
L0_0 = string
local L0_0, L8_8, L9_9, L10_10, L11_11 = L0_0.format, L8_8, L9_9, L10_10, L11_11
L1_1 = GlobalConst
L2_2 = L1_1.play_type
L8_8 = require
L9_9 = "game.other.device_fit.init"
L8_8 = L8_8(L9_9)
L9_9 = require
L10_10 = "game.utils.events"
L9_9 = L9_9(L10_10)
L10_10 = require
L11_11 = "game.ui.manager.ui_const"
L10_10 = L10_10(L11_11)
L11_11 = require
local L11_11, L7_7 = L11_11("game.ui.manager.ui_manager.init"), L7_7
L7_7 = Game
L7_7 = L7_7.module
L7_7 = L7_7.fight
function L7_7.ways.base.init_fight_data(A0_13)
	A0_13.bullet_corss_unit_count = 0
	A0_13:init_smoke_data()
	A0_13:init_couple_data()
	A0_13:init_reply_data()
	A0_13:init_record()
	A0_13:init_audio()
	A0_13:init_blocks()
	A0_13:init_cmd()
	A0_13:init_round_data()
	A0_13:init_buff()
	A0_13:init_effect_data()
	A0_13:init_units()
	A0_13:init_tombs()
	A0_13:init_bullet()
	A0_13:init_hook_rope()
	A0_13:init_mark()
	A0_13:init_ui_data()
	A0_13:init_drop_gold_info()
	A0_13:init_show_forces()
	A0_13:init_soul()
	A0_13:init_drop()
	A0_13:init_score_list()
	A0_13:init_parabola()
	A0_13:init_gain_data(A0_13.msg)
	local L3_16 = L3_16
	A0_13.recommand_forces = nil
	L3_16 = A0_13.init_hit_show_data
	L3_16(A0_13)
	L3_16 = A0_13.init_battle_env
	L3_16(A0_13)
	L3_16 = A0_13.clear_preload_ultimate_skill_effect
	L3_16(A0_13)
	local L2_15 = L2_15
end
function L7_7.ways.base.is_pvp(A0_17)
	return false
end
function L7_7.ways.base.is_each_round(A0_18)
	return true
end
function L7_7.ways.base.clear_fight_data(A0_19)
	A0_19.recommand_forces = nil
	A0_19:clear_preload_ultimate_skill_effect()
	A0_19:clear_battle_env()
	A0_19:clear_parabola()
	A0_19:clear_audio()
	A0_19:clear_ui_data()
	A0_19:clear_drop_gold_info()
	A0_19:clear_drop()
	A0_19:clear_soul()
	A0_19:clear_record()
	A0_19:clear_cmd()
	A0_19:clear_mark()
	A0_19:clear_buff()
	A0_19:destroy_tombs()
	A0_19:clear_bullet()
	A0_19:clear_hook_rope()
	A0_19:destroy_holes()
	A0_19:destroy_units()
	A0_19:clear_camera()
	A0_19:clear_effect()
	A0_19:clear_reply_data()
	A0_19:clear_blocks()
	A0_19.evaluate_pos_index = nil
	A0_19:clear_hit_show_data()
	A0_19:remove_all_reference_pos()
	local L1_20, L2_21 = L1_20, L2_21
	A0_19.bullet_corss_unit_count = 0
end
function L7_7.ways.base.change_fight_state(A0_22, A1_23, A2_24, A3_25, A4_26)
	local L5_27
	L5_27 = A0_22.fight_state
	if L5_27 == A1_23 and A1_23 ~= "switch_round" then
		if A1_23 ~= "watch_attack" then
			GameLogger.Warning("controller same state :{0}", A1_23)
		end
		return
	end
	if L5_27 and A0_22[_ENV("on_exit_state_%s", L5_27)] then
		xpcall(A0_22[_ENV("on_exit_state_%s", L5_27)], A0_22:fight_traceback(), A0_22, A1_23, A2_24, A3_25, A4_26)
	end
	A0_22.fight_state = A1_23
	local L6_28 = L6_28
	local L7_29 = L7_29
	L6_28 = L6_28(L7_29, A1_23)
	L7_29 = A0_22[L6_28]
	if L7_29 then
		local L8_30 = L8_30
		local L9_31 = L9_31
		local L10_32 = L10_32
		local L11_33 = L11_33
		local L12_34 = L12_34
		local L13_35 = L13_35
		local L14_36 = L14_36
		L8_30(L9_31, L10_32, L11_33, L12_34, L13_35, L14_36, A4_26)
		local L15_37 = L15_37
	end
end
function L7_7.ways.base.on_enter_state_prepare_fight(A0_38, A1_39)
	A0_38:prepare_land()
	A0_38:try_to_init_scene_root()
	if A0_38:is_physics_env() then
		A0_38:prepare_physics2D()
	end
	A0_38:prepare_camera()
	A0_38:prepare_hole()
	A0_38:place_fight_units()
	A0_38:calculate_and_sorting_all_units_renderer()
	A0_38:prepare_env()
end
;({})[L2_2.alliance_boss], ({})[1] = {}, L10_10.FightAllianceBossUI
;({})[L2_2.alliance_boss_1v1], ({})[1] = {}, L10_10.FightAllianceBoss1v1UI
;({})[L2_2.alliance_conquest], ({})[1] = {}, L10_10.FightAllianceConquestUI
;({})[L2_2.alliance_raid_gve], ({})[1] = {}, L10_10.AllianceRaidBattleView
;({})[L2_2.alliance_raid_pvp], ({})[1] = {}, L10_10.AllianceRaidBattleView
;({})[L2_2.ranked_evaluation], ({})[1] = {}, L10_10.AllianceRaidBattleView
;({})[L2_2.dungeon_single_boss], ({})[1] = {}, L10_10.FightSingleBossUI
;({})[L2_2.gvg_tower], ({})[1] = {}, L10_10.FightGVGTowerUI
;({})[L2_2.group_air_race], ({})[1] = {}, L10_10.FightFlyUI
;({})[L2_2.gve_air_race_game_online], ({})[1] = {}, L10_10.FightFlyGroupUI
;({})[L2_2.dungeon_stake], ({})[1] = {}, L10_10.FightStakeUI
;({})[L2_2.pvp_tournament], ({})[1] = {}, L10_10.FightTournamentUI
;({})[L2_2.dungeon_mystery], ({})[1] = {}, L10_10.FightMysteryUI
;({})[L2_2.dungeon_air_race], ({})[1] = {}, L10_10.FightFlyDungeonUI
;({})[L2_2.dungeon_air_race_newbie], ({})[1] = {}, L10_10.FightFlyDungeonNewbieUI
;({})[L2_2.alliance_trial], ({})[1] = {}, L10_10.FightAllianceTrialUI
;({})[L2_2.sword_fly], ({})[1] = {}, L10_10.FightFlySwordUI
;({})[L2_2.pvp_brawl], ({})[1] = {}, L10_10.FightBrawlUI
local ({})[L2_2.pvp_javelin], ({})[1], L12_12 = {}, L10_10.FightJavelinUI, L12_12
function L12_12.add_extra_fight_names(A0_40, A1_41)
	local L2_42
	L2_42 = _ENV
	L5_45 = A0_40.play_type
	L2_42 = L2_42[L5_45]
	if L2_42 then
		L5_45 = pairs
		L8_46 = L2_42
		L5_45, L8_46, _FOR_ = L5_45(L8_46)
		for _FORV_6_, _FORV_7_ in L5_45, L8_46, _FOR_ do
			A1_41[_FORV_7_.name] = true
		end
	end
end
function L12_12.close_fight_uis(A0_47)
	local L5_52 = _ENV.view_is_opened
	L6_53 = "BattleSplitScreenView"
	L5_52 = L5_52(L6_53)
	if L5_52 then
		L5_52 = _ENV
		L5_52 = L5_52.close_view
		L6_53 = "BattleSplitScreenView"
		L5_52(L6_53)
	end
	L5_52 = _UPVALUE1_
	L6_53 = A0_47.play_type
	L5_52 = L5_52[L6_53]
	if L5_52 then
		L6_53 = ipairs
		L6_53, _FOR_, _FOR_ = L6_53(L5_52)
		for _FORV_5_, _FORV_6_ in L6_53, _FOR_, _FOR_ do
			_ENV.close_view(_FORV_6_.name)
		end
	end
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightCommandUI"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightCommanderBuildUI"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightCommanderUI"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightCommanderOrderUI"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightCommanderEffect"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightSoulUI"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightMenuUI"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightSelectGainUI"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightPetSummon"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightUI"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightReplayUI"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightDelegateUI"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightSelectSkill"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightBuffUI"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "FightBUffDetailUI"
	L6_53(L7_54)
	L6_53 = _ENV
	L6_53 = L6_53.close_view
	L7_54 = "BuffTipsView"
	L6_53(L7_54)
end
function L12_12.open_fight_uis(A0_56)
	local L5_61 = _ENV.open_view
	L6_62 = "FightUI"
	;({}).is_reconnect = A0_56.is_reconnecting
	L5_61(L6_62, {})
	L5_61 = _UPVALUE1_
	L6_62 = A0_56.play_type
	L5_61 = L5_61[L6_62]
	if L5_61 then
		L6_62 = ipairs
		L6_62, _FOR_, _FOR_ = L6_62(L5_61)
		for _FORV_5_, _FORV_6_ in L6_62, _FOR_, _FOR_ do
			_ENV.open_view(_FORV_6_.name)
		end
	end
	L7_63 = A0_56
	L6_62 = A0_56.me_in_fight
	L6_62 = L6_62(L7_63)
	if not L6_62 then
		L6_62 = _ENV
		L6_62 = L6_62.open_view
		L7_63 = "FightReplayUI"
		L6_62(L7_63)
	end
	L7_63 = A0_56
	L6_62 = A0_56.get_ctrl_unit
	L6_62 = L6_62(L7_63)
	if L6_62 then
		L7_63 = L6_62.is_hook
		if L7_63 == true then
			L7_63 = _ENV
			L7_63 = L7_63.open_view
			L8_64 = L5_5
			L8_64 = L8_64.FightDelegateUI
			L8_64 = L8_64.name
			L7_63(L8_64)
		end
	end
end
function L12_12.get_wait_goal_tip_ms(A0_65)
	local L1_66
	L1_66 = A0_65.cf_battle
	L1_66 = L1_66.show_target
	if L1_66 then
		L1_66 = A0_65.cf_battle
		L1_66 = L1_66.show_target
		if not (L1_66 < 1) then
			goto lbl_11
		end
	end
	L1_66 = 0
	do return L1_66 end
	::lbl_11::
	L1_66 = A0_65.target_list
	if L1_66 then
		L1_66 = A0_65.target_list
		L1_66 = #L1_66
		if not (L1_66 < 1) then
			goto lbl_20
		end
	end
	L1_66 = 0
	do return L1_66 end
	::lbl_20::
	L1_66 = 2300
	return L1_66
end
function L12_12.on_enter_state_preview(A0_67, A1_68)
	A0_67:clear_preview_action_data()
	local L5_72 = L5_72
	L5_72 = A0_67.try_change_frame_rate
	L5_72(A0_67)
	L5_72 = A0_67.try_to_trigger_guide_on_enter_preview
	L5_72(A0_67, A0_67.cf_battle_id, function()
		_ENV:try_to_init_unit_before_battle_start()
		_ENV:perform_preview()
		if not _ENV.is_reconnecting_from_replay then
			_ENV:open_fight_uis()
		end
		_ENV.brocast("fight_enter_state_preview")
		local L1_73 = L1_73
	end)
	L5_72 = A0_67.fix_ctrl_angle
	L5_72(A0_67)
	L5_72 = A0_67.check_continue_last_auto
	L5_72(A0_67)
	local L3_70 = L3_70
end
function L12_12.try_change_frame_rate(A0_74)
	local L1_75
	L1_75 = A0_74.cf_play_info
	L1_75 = L1_75.frame_rate
	if not L1_75 or L1_75 == 0 then
		L1_75 = _ENV.get_cur_quality_frame_rate()
	end
	local L2_76 = L2_76
	L2_76(L1_75)
	local L3_77 = L3_77
end
function L12_12.try_reset_common_frame_rate(A0_78)
	local L1_79 = _ENV.get_cur_quality_frame_rate()
	local L2_80 = L2_80
	L2_80(L1_79)
	local L3_81 = L3_81
end
function L12_12.on_exit_state_preview(A0_82)
	A0_82:try_to_reset_obstacle_kefactor()
end
function L12_12.try_to_init_unit_before_battle_start(A0_83)
	local L1_84, L2_85, L3_86
	L1_84 = -1
	L2_85 = nil
	L3_86 = nil
	_FOR_, _FOR_, _FOR_ = pairs(A0_83.id_to_unit)
	for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_8_.has_inited_before_battle_start then
		else
			_FORV_8_.has_inited_before_battle_start = true
			A0_83:try_to_add_or_update_unit_buffs(_FORV_8_, _FORV_8_.buff_list)
			A0_83:init_unit_extra_hit_area(_FORV_8_)
			A0_83:init_unit_shield_info(_FORV_8_)
			if _FORV_8_.hidden_units then
			else
				if _FORV_8_.monster then
					L2_85 = _FORV_8_.monster.camera_follow
				elseif _FORV_8_.placement then
					L2_85 = _FORV_8_.placement.camera_follow
					repeat
						do break end -- pseudo-goto
						L2_85 = -1
					until true
				end
				if L1_84 < L2_85 then
					L1_84 = L2_85
					L3_86 = _FORV_8_
				end
			end
		end
	end
	if L3_86 then
		L11_94 = A0_83
		L12_95 = A0_83.is_pvp
		L12_95 = L12_95(L11_94)
		if not L12_95 then
			L12_95 = 0
			if L12_95 then
				goto lbl_55
			end
		end
		L12_95 = nil
		::lbl_55::
		L11_94 = A0_83.camera_focus_target_unit
		local L6_89 = L6_89
		local L7_90 = L7_90
		L11_94(L6_89, L7_90, L12_95)
		local L8_91 = L8_91
	end
end
function L12_12.check_continue_last_auto(A0_96)
	local L1_97 = A0_96:get_ctrl_unit()
	if not L1_97 then
		return
	end
	if A0_96.cf_play_info.auto_battle ~= 1 then
		return
	end
	local L2_98, L3_99 = A0_96:is_guaji_able()
	if not L2_98 or not L3_99 then
		return
	end
	local L4_100 = A0_96:get_last_fight_auto()
	if L4_100 then
		if not L1_97.role.is_auto_battle then
			A0_96:set_ctrl_auto(true)
		end
	elseif L4_100 == false and L1_97.role.is_auto_battle then
		local L5_101, L6_102 = L5_101, L6_102
		L5_101(L6_102, false)
		local L7_103 = L7_103
	end
end
function L12_12.try_save_fight_auto(A0_104, A1_105)
	local L2_106
	L2_106 = _ENV
	L2_106.daily_dragon_auto = A1_105
end
function L12_12.get_last_fight_auto(A0_107)
	local L1_108
	L1_108 = _ENV
	L1_108 = L1_108.daily_dragon_auto
	return L1_108
end
function L12_12.fix_ctrl_angle(A0_109)
	local L1_110
	L1_110 = A0_109.cf_battle
	L1_110 = L1_110.angle
	if not L1_110 then
		L1_110 = A0_109.dungeon_config
		if L1_110 then
			L1_110 = A0_109.dungeon_config
			L1_110 = L1_110.angle
			if L1_110 then
				goto lbl_13
			end
		end
		L1_110 = -999
	end
	::lbl_13::
	if L1_110 < -360 then
		return
	end
	local L2_111 = A0_109:get_ctrl_unit()
	if not L2_111 then
		return
	end
	local L3_112, L4_113 = L3_112, L4_113
	local L3_112, L4_113, L5_114 = L3_112(L4_113, L2_111)
	L5_114 = math
	L5_114 = L5_114.max
	L5_114 = L5_114(L3_112, math.min(L1_110, L4_113))
	local L6_115, L7_116 = L6_115, L7_116
	local L8_117 = L8_117
	local L9_118 = L9_118
	L6_115(L7_116, L8_117, L9_118, true)
	local L10_119 = L10_119
end
function L12_12.on_enter_state_switch_round(A0_120, A1_121, A2_122)
	if A0_120.round.round_count >= A2_122.round then
		local L8_128 = L8_128
		L8_128(A0_120, _ENV("round_count error,local:%s, msg:%s", A0_120.round.round_count, A2_122.round))
	end
	L8_128 = xpcall
	L8_128(A0_120.finish_old_round, A0_120:fight_traceback(), A0_120, A2_122)
	L8_128 = xpcall
	local L4_124 = L4_124
	local L5_125 = L5_125
	local L6_126 = L6_126
	L8_128(L4_124, L5_125, L6_126, A2_122)
	local L7_127 = L7_127
end
function L12_12.on_enter_state_attack(A0_129)
	A0_129:try_to_start_all_unit_sp_idle_timer()
end
function L12_12.on_exit_state_attack(A0_130)
	A0_130:clear_all_round_timers()
	A0_130:try_to_stop_all_unit_sp_idle_timer()
	A0_130:deal_round_bullet_nodes_on_finish_round()
	A0_130:del_all_bullets()
	A0_130:clear_round_fire_actions()
	A0_130:clear_round_fire_action_contexts()
	A0_130:excute_nodes_right_now()
	A0_130:deal_round_obj_processing_msgs()
	A0_130:try_to_stop_timing_to_check_fire_angle_direction()
end
function L12_12.on_enter_state_wait_server(A0_131)
	_ENV.brocast("fight_state_wait_server")
	local L2_132 = L2_132
end
function L12_12.get_host(A0_133, A1_134, A2_135)
	local L3_136, L4_137, L5_138
	L3_136 = _ENV
	L3_136 = L3_136.unit_type
	L3_136 = L3_136.role
	if A1_134 then
		L4_137 = A0_133.id_to_unit
		L4_137 = L4_137[A1_134]
		if L4_137 then
			goto lbl_11
		end
	end
	L4_137 = nil
	::lbl_11::
	if L4_137 then
		L5_138 = L4_137.object_type
		if L5_138 == L3_136 then
			L5_138 = L4_137.is_quit
			if not L5_138 then
				return L4_137
			end
		end
	end
	L5_138 = nil
	L8_141 = pairs
	L9_142 = A0_133.id_to_unit
	L8_141, L9_142, L10_143 = L8_141(L9_142)
	for L11_144, L12_145 in L8_141, L9_142, L10_143 do
		if L12_145.is_quit ~= true and L12_145.object_type == L3_136 and (not (A2_135 and L4_137) or L4_137.camp == L12_145.camp) and (not L5_138 or L12_145.id < L5_138.id) then
			L5_138 = L12_145
		end
	end
	return L5_138
end
function L12_12.get_camp_host(A0_146, A1_147)
	local L2_148, L3_149
	L2_148 = _ENV
	L2_148 = L2_148.unit_type
	L2_148 = L2_148.role
	L3_149 = nil
	L6_152 = pairs
	L7_153 = A0_146.id_to_unit
	L6_152, L7_153, L8_154 = L6_152(L7_153)
	for L9_155, L10_156 in L6_152, L7_153, L8_154 do
		if L10_156.camp == A1_147 and not L10_156.is_quit and L10_156.object_type == L2_148 and (not L3_149 or L10_156.id < L3_149.id) then
			L3_149 = L10_156
		end
	end
	return L3_149
end
