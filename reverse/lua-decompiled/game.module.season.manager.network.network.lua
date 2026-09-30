local L0_0, L1_1
L0_0 = assert
local L1_1, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13 = table, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13
L1_1 = L1_1.insert
L7_7 = require
L8_8 = "game.utils.events"
L7_7 = L7_7(L8_8)
L8_8 = require
L9_9 = "game.network.network_utils"
L8_8 = L8_8(L9_9)
L9_9 = require
L10_10 = "game.ui.manager.ui_manager.init"
L9_9 = L9_9(L10_10)
L10_10 = import
L11_11 = "..head"
L10_10 = L10_10(L11_11)
L11_11 = L10_10.network
L12_12 = L10_10.data
L13_13 = L10_10.event
function L11_11.init()
	({}).season_info_s2c = _ENV.on_season_info_s2c
	;({}).season_role_info_s2c = _ENV.on_season_role_info_s2c
	;({}).season_receive_rank_s2c = _ENV.on_season_receive_rank_s2c
	;({}).season_receive_season_rank_s2c = _ENV.on_season_receive_season_rank_s2c
	;({}).season_fight_result_s2c = _ENV.on_season_fight_result_s2c
	;({}).team_force_open_match_s2c = _ENV.on_team_force_open_match_s2c
	;({}).season_unlock_s2c = _ENV.on_season_unlock_s2c
	;({}).season_match_succ_s2c = _ENV.on_season_match_succ_s2c
	;({}).season_use_item_s2c = _ENV.on_season_use_item_s2c
	;({}).season_receive_repeat_reward_s2c = _ENV.on_season_receive_repeat_reward_s2c
	;({}).task_season_s2c = _ENV.on_task_season_s2c
	;({}).task_receive_repeat_reward_s2c = _ENV.on_task_receive_repeat_reward_s2c
	;({}).task_receive_season_rank_s2c = _ENV.on_task_receive_season_rank_s2c
	;({}).season_cultivation_info_s2c = _ENV.on_season_cultivation_info_s2c
	;({}).season_cultivation_upgrade_s2c = _ENV.on_season_cultivation_upgrade_s2c
	;({}).season_cultivation_unlock_talent_s2c = _ENV.on_season_cultivation_unlock_talent_s2c
	;({}).season_cultivation_use_talent_s2c = _ENV.on_season_cultivation_use_talent_s2c
	;({}).season_simple_battle_report_s2c = _ENV.on_season_simple_battle_report_s2c
	;({}).battle_report_info_s2c = _ENV.on_battle_report_info_s2c
	;({}).battle_report_like_role_s2c = _ENV.on_battle_report_like_role_s2c
	;({}).battle_report_report_role_s2c = _ENV.on_battle_report_report_role_s2c
	_ENV.net_event_names, ({}).season_receive_day_reward_s2c = {}, _ENV.on_season_receive_day_reward_s2c
	local L0_14 = L0_14
	local L1_15 = L1_15
	L0_14(L1_15, "season")
	local L2_16 = L2_16
end
function L11_11.clear()
	_ENV.unlisten_net_events(L6_6.net_event_names)
	local L1_17 = L1_17
end
function L11_11.season_rank_c2s(A0_18)
	local L1_19 = L1_19
	local L2_20 = L2_20
	;({}).role_list = A0_18
	L1_19(L2_20, {})
	local L3_21 = L3_21
end
function L11_11.req_season_info_c2s()
	local L1_22 = L1_22
	L1_22("season_info_c2s", {})
	local L2_23 = L2_23
end
function L11_11.req_season_role_info_c2s()
	local L1_24 = L1_24
	L1_24("season_role_info_c2s", {})
	local L2_25 = L2_25
end
function L11_11.req_season_receive_rank_c2s(A0_26)
	local L1_27 = L1_27
	local L2_28 = L2_28
	;({}).rank_id = A0_26
	L1_27(L2_28, {})
	local L3_29 = L3_29
end
function L11_11.req_season_receive_season_rank_c2s(A0_30)
	local L1_31 = L1_31
	local L2_32 = L2_32
	;({}).cup = A0_30
	L1_31(L2_32, {})
	local L3_33 = L3_33
end
function L11_11.req_season_receive_repeat_reward_c2s(A0_34)
	local L1_35
	L1_35 = {}
	local L2_36 = L2_36
	local L3_37 = L3_37
	L2_36(L3_37, L1_35)
	local L4_38 = L4_38
end
function L11_11.req_team_force_open_match_c2s(A0_39, A1_40)
	_ENV = A1_40
	local L2_41 = L2_41
	local L3_42 = L3_42
	;({}).target = A0_39
	L2_41(L3_42, {})
	local L4_43 = L4_43
end
function L11_11.req_season_use_item_c2s()
	local L1_44 = L1_44
	L1_44("season_use_item_c2s", {})
	local L2_45 = L2_45
end
function L11_11.req_season_report_c2s(A0_46, A1_47, A2_48)
	local L3_49 = L3_49
	local L4_50 = L4_50
	;({}).role_id = A0_46
	;({}).reason = A1_47
	;({}).msg = A2_48
	L3_49(L4_50, {})
	local L5_51 = L5_51
end
function L11_11.req_season_cultivation_info_c2s()
	local L1_52 = L1_52
	L1_52("season_cultivation_info_c2s", {})
	local L2_53 = L2_53
end
function L11_11.req_season_cultivation_upgrade_c2s()
	local L1_54 = L1_54
	L1_54("season_cultivation_upgrade_c2s", {})
	local L2_55 = L2_55
end
function L11_11.req_season_cultivation_unlock_talent_c2s(A0_56)
	local L1_57 = L1_57
	local L2_58 = L2_58
	;({}).talent_id = A0_56
	L1_57(L2_58, {})
	local L3_59 = L3_59
end
function L11_11.req_season_cultivation_use_talent_c2s(A0_60)
	local L1_61 = L1_61
	local L2_62 = L2_62
	;({}).talent_id = A0_60
	L1_61(L2_62, {})
	local L3_63 = L3_63
end
function L11_11.req_season_simple_battle_report_c2s(A0_64, A1_65)
	local L2_66 = L2_66
	local L3_67 = L3_67
	;({}).page = A0_64
	;({}).size = A1_65
	L2_66(L3_67, {})
	local L4_68 = L4_68
end
function L11_11.req_battle_report_info_c2s(A0_69)
	local L1_70 = L1_70
	local L2_71 = L2_71
	;({}).report_id = A0_69
	L1_70(L2_71, {})
	local L3_72 = L3_72
end
function L11_11.req_battle_report_like_role_c2s(A0_73, A1_74)
	local L2_75 = L2_75
	local L3_76 = L3_76
	;({}).report_id = A0_73
	;({}).role_id = A1_74
	L2_75(L3_76, {})
	local L4_77 = L4_77
end
function L11_11.req_battle_report_report_role_c2s(A0_78, A1_79, A2_80, A3_81)
	local L4_82 = L4_82
	local L5_83 = L5_83
	;({}).report_id = A0_78
	;({}).role_id = A1_79
	;({}).reason = A2_80
	;({}).msg = A3_81
	L4_82(L5_83, {})
	local L6_84 = L6_84
end
function L11_11.on_season_unlock_s2c(A0_85, A1_86)
	_ENV.update_map_env_list(A1_86)
	local L3_87 = L3_87
end
function L11_11.on_season_match_succ_s2c(A0_88, A1_89)
	_ENV.match_succ_finish_cb = nil
	L4_4.open_view("MatchSuccessView", A1_89)
	local L4_92 = L4_92
	L4_92 = L2_2
	L4_92 = L4_92.brocast
	L4_92("team_match_success")
	local L3_91 = L3_91
end
function L11_11.on_season_use_item_s2c(A0_93, A1_94)
	local L2_95
	L2_95 = A1_94.add_cup
	if not L2_95 then
		L2_95 = 0
	end
	_ENV.player_info.rank.cup = _ENV.player_info.rank.cup + L2_95
	local L3_96 = L3_96
	local L4_97 = L4_97
	L3_96(L4_97, L2_95)
	local L5_98 = L5_98
end
function L11_11.on_season_receive_repeat_reward_s2c(A0_99, A1_100)
	local L2_101
	L2_101 = A1_100.num
	if not L2_101 then
		return
	end
	_ENV.set_season_reward_overflow(L2_101)
	L2_2.brocast("season_get_season_rank_extra_award")
	local L3_102 = L3_102
	L3_102("season_cup_reward_redpoint")
	local L4_103 = L4_103
end
function L11_11.on_team_force_open_match_s2c(A0_104, A1_105)
	if _ENV then
		local L3_106 = L3_106
		L3_106(A0_104, A1_105)
		local L4_107 = L4_107
	end
end
function L11_11.on_season_info_s2c(A0_108, A1_109)
	_ENV(A1_109.season_id)
	_ENV(A1_109.status)
	if A1_109.season_id == 0 then
		A1_109.season_id = 1
	end
	L12_12.save_season_info(A1_109)
	L2_2.brocast(L13_13.season_info_changed)
	local L3_110 = L3_110
end
function L11_11.on_season_role_info_s2c(A0_111, A1_112)
	L6_117 = A1_112
	L5_116(L6_117)
	L5_116 = L12_12
	L5_116 = L5_116.update_player_info
	L6_117 = A1_112
	L5_116(L6_117)
	L5_116 = A1_112.season_id
	if L5_116 == 0 then
		A1_112.season_id = 1
	end
	L5_116 = L2_2
	L5_116 = L5_116.brocast
	L6_117 = "season_player_info_changed"
	L5_116(L6_117, L12_12.player_info)
	L5_116 = L5_5
	L5_116 = L5_116.refresh_all_award_red_point
	L5_116()
	L5_116 = L5_5
	L5_116 = L5_116.report_season_score
	L5_116()
	L5_116 = L5_5
	L5_116 = L5_116.network_pve
	L5_116 = L5_116.req_task_season_c2s
	L5_116()
	L5_116 = L2_2
	L5_116 = L5_116.brocast
	L6_117 = L13_13
	L6_117 = L6_117.season_2v2_day_reward
	L5_116(L6_117)
	L5_116 = _UPVALUE5_
	L5_116 = L5_116.update_red_point
	L6_117 = "season_2v2_day_reward"
	L5_116(L6_117)
	L5_116 = pairs
	L6_117 = _UPVALUE6_
	L6_117 = L6_117.season_balance_redpoint
	L5_116, L6_117, _FOR_ = L5_116(L6_117)
	for _FORV_5_, _FORV_6_ in L5_116, L6_117, _FOR_ do
		if L5_5.get_season_balance_red_point(_FORV_5_) then
			_UPVALUE5_.update_red_point(_FORV_6_)
		end
	end
end
function L11_11.on_season_receive_rank_s2c(A0_120, A1_121)
	local L2_122
	L2_122 = A1_121.rank_id
	if not L2_122 then
		return
	end
	_ENV.save_get_rank_award(L2_122)
	local L3_123 = L3_123
	L3_123(L13_13.season_get_rank_award, L2_122)
	L3_123 = Game
	L3_123 = L3_123.redpoint_helper
	L3_123 = L3_123.update_red_point
	local L4_124 = L4_124
	local L4_124, L5_125 = L4_124(L2_122)
	L3_123(L4_124, L5_125)
end
function L11_11.on_season_receive_season_rank_s2c(A0_126, A1_127)
	if not A1_127.cup then
		return
	end
	L5_131 = pairs
	L6_132 = A1_127.cup
	L5_131, L6_132, _FOR_ = L5_131(L6_132)
	for _FORV_5_, _FORV_6_ in L5_131, L6_132, _FOR_ do
		_ENV.save_get_season_rank_award(_FORV_6_)
		L2_2.brocast("season_get_season_rank_award", _FORV_6_)
		Game.redpoint_helper.update_red_point(L5_5.get_rank_season_award_red_point_id(_FORV_6_))
		Game.redpoint_helper.update_red_point("season_cup_reward_redpoint")
		if _FORV_6_ == 2200 then
			require("game.platform.fnsdk.fnsdk_interface").iOS_store_guide("iOS_store_guide_get_2200_cup")
		end
	end
	L5_131 = L5_5
	L5_131 = L5_131.check_pop_reach_mode_unlock
	L6_132 = A1_127.cup
	L5_131(L6_132)
end
