local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18
L0_0 = table
local L0_0, L23_23, L24_24, L25_25, L29_29, L30_30, L31_31, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43, L46_46, L47_47, L48_48, L49_49, L50_50, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60, L61_61, L62_62, L63_63, L64_64, L65_65 = L0_0.insert, L23_23, L24_24, L25_25, L29_29, L30_30, L31_31, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43, L46_46, L47_47, L48_48, L49_49, L50_50, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60, L61_61, L62_62, L63_63, L64_64, L65_65
L1_1 = string
L1_1 = L1_1.format
L2_2 = table
L2_2 = L2_2.sort
L3_3 = BroadcastTips
L4_4 = Game
L4_4 = L4_4.module
L4_4 = L4_4.data
L5_5 = DataConfigs
L6_6 = L5_5.language_define
L7_7 = L5_5.season_cup
L8_8 = L5_5.season_rank
L9_9 = L5_5.cfg_3V3_rank
L10_10 = L5_5.rank_define
L11_11 = L5_5.cfg_3V3_misc
L12_12 = L5_5.team_target
L13_13 = L5_5.activities
L14_14 = L5_5.rank_daily_reward
L15_15 = L5_5.season_new
L16_16 = L5_5.passive_skill
L17_17 = L5_5.season_talent
L18_18 = Game
L18_18 = L18_18.events
L23_23 = require
L24_24 = "game.ui.manager.ui_manager.init"
L23_23 = L23_23(L24_24)
L24_24 = require
L25_25 = "game.ui.manager.ui_const"
L24_24 = L24_24(L25_25)
L25_25 = require
L29_29 = "game.other.game_time.init"
L25_25 = L25_25(L29_29)
L29_29 = Game
L29_29 = L29_29.module
L29_29 = L29_29.team
L30_30 = Game
L30_30 = L30_30.module
L30_30 = L30_30.team
L30_30 = L30_30.data
L31_31 = Game
L31_31 = L31_31.module
L31_31 = L31_31.open_func
L35_35 = Game
L35_35 = L35_35.module
L35_35 = L35_35.jump_to
L36_36 = require
L37_37 = "game.other.player_prefs"
L36_36 = L36_36(L37_37)
L37_37 = require
L38_38 = "game.platform.fnsdk.fnsdk_interface"
L37_37 = L37_37(L38_38)
L38_38 = Game
L38_38 = L38_38.module
L38_38 = L38_38.activity
L39_39 = L38_38.data
L40_40 = L38_38.const
L41_41 = L38_38.event
L42_42 = require
L43_43 = "game.other.server_time"
L42_42 = L42_42(L43_43)
L43_43 = require
L46_46 = "game.module.tips.view.try_to_cost.core"
L43_43 = L43_43(L46_46)
L46_46 = Game
L46_46 = L46_46.module
L46_46 = L46_46.open_func
L46_46 = L46_46.const
L47_47 = Game
L47_47 = L47_47.module
L47_47 = L47_47.common_view
L48_48 = DataConfigs
L48_48 = L48_48.multi_series
L49_49 = DataConfigs
L49_49 = L49_49.battle
L50_50 = DataConfigs
L50_50 = L50_50.battle_env
L53_53 = DataConfigs
L53_53 = L53_53.season_cultivate
L54_54 = DataConfigs
L54_54 = L54_54.season
L55_55 = DataConfigs
L55_55 = L55_55.pet_skill_learn
L56_56 = Game
L56_56 = L56_56.redpoint_helper
L57_57 = Game
L57_57 = L57_57.events
L58_58 = import
L59_59 = ".head"
L58_58 = L58_58(L59_59)
L59_59 = L58_58.data
L60_60 = L58_58.const
L61_61 = L58_58.data_3v3
L62_62 = L58_58.data_2v2
L63_63 = L58_58.network
L64_64 = L58_58.network_2v2
L65_65 = require
L65_65 = L65_65("game.other.game_time.init")
local L66_66 = L66_66
local L67_67 = L67_67
function L58_58.init()
	_ENV.init_season_2v2()
	L59_59.init()
	L63_63.init()
	L61_61.init()
	_UPVALUE4_.init()
	_UPVALUE5_.init()
	_UPVALUE6_.init()
	_ENV.data_2v2.init()
	_ENV.network_2v2.init()
	_ENV.setup_events()
	_ENV.init_red_points()
	_ENV.register_jump()
	_ENV.refresh_time()
	local L3_71 = L3_71
	local L4_72 = Game.timer:run_every(1000, _ENV.every_refresh_time)
	L3_71.timer = L4_72
	L3_71 = _ENV
	L3_71.is_login = false
	L3_71 = L27_27
	L3_71 = L3_71.add_open_func_req
	L4_72 = L44_44
	L4_72 = L4_72.type
	L4_72 = L4_72.season_cultivate
	L3_71(L4_72, L63_63.req_season_cultivation_info_c2s)
	local L2_70 = L2_70
	L3_71 = _ENV
	L4_72 = {}
	L3_71.battle_cfg_list = L4_72
end
function L58_58.every_refresh_time()
	_ENV.refresh_time()
	local L0_73 = L0_73
	L0_73 = _ENV
	L0_73.can_req_rank = true
end
function L58_58.refresh_time()
	_ENV = L42_42.get_server_time()
	local L2_76 = L2_76
	local L3_77 = L21_21.get_date_time_str(_ENV, "hh")
	L2_76 = L2_76(L3_77, L21_21.get_date_time_str(_ENV, "hh"))
	_UPVALUE2_ = L2_76
	L2_76 = _UPVALUE4_
	L3_77 = _UPVALUE2_
	if L2_76 ~= L3_77 then
		L2_76 = _UPVALUE2_
		_UPVALUE4_ = L2_76
		L2_76 = L56_56
		L2_76 = L2_76.update_red_point
		L3_77 = "season_cup_start_match"
		L2_76(L3_77)
		L2_76 = L56_56
		L2_76 = L2_76.update_red_point
		L3_77 = "arena_entry_season"
		L2_76(L3_77)
	end
end
function L58_58.clear()
	_ENV.clear_season_2v2()
	Game.timer:clear_timer(_ENV.timer)
	_ENV.timer = nil
	_ENV.clear_events()
	_ENV.clear_red_points()
	_UPVALUE1_.clear()
	_UPVALUE2_.clear()
	L63_63.clear()
	_UPVALUE4_.clear()
	L59_59.clear()
	L61_61.clear()
	_ENV.data_2v2.clear()
	_ENV.network_2v2.clear()
	_ENV.match_succ_finish_cb = nil
	_ENV.battle_cfg_list = {}
	local L0_78 = L0_78
	local L1_79 = L1_79
	L0_78(L1_79, L63_63.req_season_cultivation_info_c2s)
	local L2_80 = L2_80
end
function L58_58.init_req()
	_ENV.req_season_info_c2s()
	_ENV.req_season_role_info_c2s()
	local L0_81 = L0_81
	L0_81 = L58_58
	L0_81.is_login = true
	L0_81 = {}
	local L1_82 = L1_82
	L0_81[1] = L1_82
	local L0_81[2], L2_83 = "season_role_info_s2c", L2_83
	return L0_81
end
function L58_58.init_red_points()
	local L0_84
	L0_84 = {}
	local L0_84.id, L9_93 = "season_cup_reward_main_redpoint", L9_93
	L0_84.tp = 1
	L9_93 = _ENV
	L9_93 = L9_93.new_red_point
	L9_93(L0_84)
	L9_93 = {}
	L9_93.id = "season_cup_reward_redpoint"
	L9_93.tp = 1
	L9_93.parent_ids, ({})[1] = {}, "season_cup_reward_main_redpoint"
	;({}).cb = L58_58.get_cup_reward_redpoint_state
	L9_93.point_cb_infos, ({})[1] = {}, {}
	local L2_86 = L2_86
	L2_86(L9_93)
	L2_86 = {}
	L2_86.id = "season_cultivate_main_redpoint"
	L2_86.tp = 1
	local L3_87 = L3_87
	L3_87(L2_86)
	L3_87 = {}
	L3_87.id = "season_cultivate_upgrade_redpoint"
	L3_87.tp = 1
	L3_87.parent_ids, ({})[1] = {}, "season_cultivate_main_redpoint"
	;({}).cb = L58_58.can_season_cultivate_upgrade
	L3_87.point_cb_infos, ({})[1] = {}, {}
	local L4_88 = L4_88
	L4_88(L3_87)
	L4_88 = {}
	L4_88.id = "season_cultivate_equip_redpoint"
	L4_88.tp = 1
	L4_88.parent_ids, ({})[1] = {}, "season_cultivate_main_redpoint"
	;({}).cb = L58_58.can_season_cultivate_equip
	L4_88.point_cb_infos, ({})[1] = {}, {}
	_ENV.new_red_point(L4_88)
	;({}).id = "season_description_redpoint"
	;({}).tp = 1
	_ENV.new_red_point({})
	;({}).parent_ids, ({})[1] = {}, "season_description_redpoint"
	;({}).id = L67_67.season_balance_redpoint[1]
	;({}).tp = 1
	;({}).cb = function()
		do return _ENV.get_season_balance_red_point_num(1) end
		local L1_94 = L1_94
	end
	;({}).point_cb_infos, ({})[1] = {}, {}
	_ENV.new_red_point({})
	;({}).id = L67_67.season_balance_redpoint[2]
	;({}).tp = 1
	;({}).cb = function()
		do return _ENV.get_season_balance_red_point_num(2) end
		local L1_95 = L1_95
	end
	;({}).point_cb_infos, ({})[1] = {}, {}
	_ENV.new_red_point({})
	;({}).parent_ids, ({})[1] = {}, "pvp_tab_red_point"
	;({}).id = L67_67.season_balance_redpoint[3]
	;({}).tp = 1
	local L7_91 = L7_91
	;({}).cb = function()
		do return _ENV.get_season_balance_red_point_num(3) end
		local L1_96 = L1_96
	end
	local L8_92.point_cb_infos, ({})[1], L8_92 = {}, {}, L8_92
	L7_91(L8_92)
	L7_91 = L58_58
	L7_91 = L7_91.init_season_pve_red_points
	L7_91()
	L7_91 = L58_58
	L7_91 = L7_91.init_season_2v2_red_points
	L7_91()
end
function L58_58.get_season_cup_start_match_num(A0_97)
	local L7_104, L8_105 = _ENV.get_team_info, L8_105
	if L7_104 then
		L7_104 = _ENV
		L7_104 = L7_104.get_team_info
		L7_104 = L7_104()
		L8_105 = L58_58
		L8_105 = L8_105.check_common_pvp_forbid_time
		L8_105 = L8_105()
		if not L8_105 and L7_104 and L7_104.type == 2 and L7_104.target == 2 then
			local L3_100 = L58_58.check_common_pvp_forbid_time()
			if L3_100 then
				return 0
			end
			if L59_59.get_max_newbie_fight_num then
				local L4_101 = L59_59.get_max_newbie_fight_num()
				if L4_101 then
					goto lbl_38
				end
			end
			L4_101 = 0
			::lbl_38::
			local L5_102 = L59_59.get_player_info()
			if L5_102 and L4_101 > L5_102.fight_num then
				return 1
			end
			local L6_103 = L58_58.get_fudai_daily_num()
			if L5_102 then
			end
			if L6_103 > L5_102.day_reward then
				return 1
			end
			return 0
		end
	end
	L7_104 = 0
	return L7_104
end
function L58_58.get_season_award_red_point_num(A0_106)
	if _ENV.player_info then
		local L1_107 = L1_107
		L1_107 = L1_107(L27_27.const.type.four_vs_four)
		if L1_107 then
			goto lbl_16
		end
	end
	L1_107 = 0
	do return L1_107 end
	::lbl_16::
	L1_107 = A0_106.rank_id
	local L2_108 = _ENV.get_season_limit_max_cup_rank()
	local L5_111 = _ENV.rank_has_award(L1_107, _ENV.player_info.season_id)
	if L5_111 then
		L5_111 = L2_108.id
		if not (L1_107 > L5_111) then
			goto lbl_34
		end
	end
	L5_111 = 0
	do return L5_111 end
	::lbl_34::
	L5_111 = _ENV
	L5_111 = L5_111.get_my_season_award_state
	local L5_111, L4_110 = L5_111(L1_107), L4_110
	L4_110 = _UPVALUE2_
	L4_110 = L4_110.reached
	L5_111 = L5_111 == L4_110
	if L5_111 == true then
		L4_110 = 1
		if L4_110 then
			goto lbl_50
		end
	end
	L4_110 = 0
	::lbl_50::
	return L4_110
end
function L58_58.get_season_v3_award_red_point_num(A0_112)
	local L1_113
	L1_113 = _ENV
	L1_113 = L1_113.player_v3_info
	if not L1_113 then
		L1_113 = 0
		return L1_113
	end
	L1_113 = A0_112.rank_id
	local L4_116 = _ENV.rank_v3_has_award(L1_113, _ENV.player_v3_info.season_id)
	if not L4_116 then
		L4_116 = 0
		return L4_116
	end
	L4_116 = _ENV
	L4_116 = L4_116.get_my_season_v3_award_state
	local L4_116, L3_115 = L4_116(L1_113), L3_115
	L3_115 = _UPVALUE1_
	L3_115 = L3_115.reached
	L4_116 = L4_116 == L3_115
	if L4_116 == true then
		L3_115 = 1
		if L3_115 then
			goto lbl_35
		end
	end
	L3_115 = 0
	::lbl_35::
	return L3_115
end
function L58_58.get_first_award_red_point_num(A0_117)
	if not _ENV.player_info or not L27_27.is_open(L27_27.const.type.four_vs_four) then
		return 0
	end
	local L1_118 = L1_118
	L1_118 = L1_118(L27_27.const.type.season_career_reward)
	if not L1_118 then
		L1_118 = 0
		return L1_118
	end
	L1_118 = A0_117.rank_id
	local L2_119 = L2_119
	L2_119 = L2_119(L1_118)
	local L3_120 = _ENV.get_season_limit_max_cup_rank()
	if not L2_119.first_reward or 0 >= #L2_119.first_reward or L2_119.id > L3_120.id then
		return 0
	end
	local L4_121 = L4_121
	local L4_121, L5_122 = L4_121(L1_118), L5_122
	L5_122 = _UPVALUE3_
	L5_122 = L5_122.reached
	L4_121 = L4_121 == L5_122
	if L4_121 == true then
		L5_122 = 1
		if L5_122 then
			goto lbl_64
		end
	end
	L5_122 = 0
	::lbl_64::
	return L5_122
end
function L58_58.get_season_v3_activity_award_join_red_point_num()
	local L0_123, L1_124, L2_125
	L0_123 = _ENV
	L0_123 = L0_123.player_v3_info
	if L0_123 then
		L1_124 = L0_123.day_fight_num
		if L1_124 then
			goto lbl_10
		end
	end
	L1_124 = 0
	do return L1_124 end
	::lbl_10::
	L1_124 = L0_123.is_join_reward
	L1_124 = L1_124 ~= 1
	if L1_124 then
		L2_125 = 1
		if L2_125 then
			goto lbl_27
		end
	end
	L2_125 = 0
	::lbl_27::
	return L2_125
end
function L58_58.get_season_v3_activity_award_win_red_point_num()
	local L0_126, L1_127, L2_128
	L0_126 = _ENV
	L0_126 = L0_126.player_v3_info
	if L0_126 then
		L1_127 = L0_126.day_win_num
		if L1_127 then
			goto lbl_10
		end
	end
	L1_127 = 0
	do return L1_127 end
	::lbl_10::
	L1_127 = L0_126.is_win_reward
	L1_127 = L1_127 ~= 1
	if L1_127 then
		L2_128 = 1
		if L2_128 then
			goto lbl_27
		end
	end
	L2_128 = 0
	::lbl_27::
	return L2_128
end
function L58_58.clear_red_points()
	local L4_133 = _ENV.destroy_red_point
	L4_133("season_entry_award_btn", true)
	L4_133 = _ENV
	L4_133 = L4_133.destroy_red_point
	L4_133("season_v3_entry_award_btn", true)
	L4_133 = _ENV
	L4_133 = L4_133.destroy_red_point
	L4_133("season_v3_activity_award_btn", true)
	L4_133 = _ENV
	L4_133 = L4_133.destroy_red_point
	L4_133("season_v3_activity_award_join", true)
	L4_133 = _ENV
	L4_133 = L4_133.destroy_red_point
	L4_133("season_v3_activity_award_win", true)
	L4_133 = _ENV
	L4_133 = L4_133.destroy_red_point
	L4_133(L67_67.season_balance_redpoint[3], true)
	L4_133 = _ENV
	L4_133 = L4_133.destroy_red_point
	L4_133(L67_67.season_balance_redpoint[2], true)
	L4_133 = _ENV
	L4_133 = L4_133.destroy_red_point
	L4_133(L67_67.season_balance_redpoint[1], true)
	L4_133 = _ENV
	L4_133 = L4_133.destroy_red_point
	L4_133("season_description_redpoint", true)
	L4_133 = nil
	_FOR_, _FOR_, _FOR_ = pairs(L7_7.get_all_cfg())
	for _FORV_4_, _FORV_5_ in _FOR_, _FOR_, _FOR_ do
		L4_133 = L58_58.get_rank_season_award_red_point_id(_FORV_4_)
		_ENV.destroy_red_point(L4_133, true)
		L4_133 = L58_58.get_rank_first_award_red_point_id(_FORV_4_)
		_ENV.destroy_red_point(L4_133, true)
	end
	L8_137 = _ENV
	L8_137 = L8_137.destroy_red_point
	L8_137("season_cup_reward_redpoint", true)
	L8_137 = 1
	_FOR_ = 1
	for _FORV_4_ = L8_137, _FOR_, _FOR_ do
		if L67_67.path_list[_FORV_4_].red_point_id then
			_ENV.destroy_red_point(L67_67.path_list[_FORV_4_].red_point_id, true)
			local L7_136 = L7_136
		end
	end
	L8_137 = L58_58
	L8_137 = L8_137.clear_season_pve_red_points
	L8_137()
	L8_137 = L58_58
	L8_137 = L8_137.clear_season_2v2_red_points
	L8_137()
end
function L58_58.refresh_all_award_red_point()
	L4_142 = _ENV
	L4_142 = L4_142.get_all_cfg
	L4_142 = L4_142()
	L3_141, L4_142, _FOR_ = L3_141(L4_142, L4_142())
	for _FORV_3_, _FORV_4_ in L3_141, L4_142, _FOR_ do
		L56_56.update_red_point(L58_58.get_rank_season_award_red_point_id(_FORV_3_))
		L56_56.update_red_point(L58_58.get_rank_first_award_red_point_id(_FORV_3_))
	end
	L3_141 = L56_56
	L3_141 = L3_141.update_red_point
	L4_142 = "season_cup_reward_redpoint"
	L3_141(L4_142)
end
