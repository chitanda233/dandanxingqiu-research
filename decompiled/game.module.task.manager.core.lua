local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
L0_0 = assert
local L1_1, L12_12, L13_13, L19_19, L20_20, L21_21, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35 = pairs, L12_12, L13_13, L19_19, L20_20, L21_21, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35
L2_2 = ipairs
L3_3 = table
L3_3 = L3_3.insert
L4_4 = table
L4_4 = L4_4.remove
L5_5 = Game
L5_5 = L5_5.module
L5_5 = L5_5.main_view
L12_12 = import
L13_13 = ".head"
L12_12 = L12_12(L13_13)
L13_13 = L0_0
L19_19 = L12_12.data
L13_13 = L13_13(L19_19)
L19_19 = L0_0
L20_20 = L12_12.network
L19_19 = L19_19(L20_20)
L20_20 = L0_0
L21_21 = L12_12.const
L20_20 = L20_20(L21_21)
L21_21 = L0_0
L24_24 = L12_12.event
L21_21 = L21_21(L24_24)
L24_24 = Game
L24_24 = L24_24.redpoint_helper
L25_25 = Game
L25_25 = L25_25.ui_manager
L26_26 = Game
L26_26 = L26_26.ui_const
L27_27 = require
L28_28 = "game.utils.events"
L27_27 = L27_27(L28_28)
L28_28 = Game
L28_28 = L28_28.module
L28_28 = L28_28.open_func
L29_29 = require
L30_30 = "game.module.open_func.manager.event"
L29_29 = L29_29(L30_30)
L30_30 = require
L31_31 = "game.module.open_func.manager.const"
L30_30 = L30_30(L31_31)
L31_31 = Game
L31_31 = L31_31.module
L31_31 = L31_31.cloud_data
L32_32 = Game
L32_32 = L32_32.module
L32_32 = L32_32.popup
L33_33 = Game
L33_33 = L33_33.module
L33_33 = L33_33.main_weapon_develop
L34_34 = L33_33.data
L35_35 = require
L35_35 = L35_35("game.platform.sdk.sdk_manager")
function L12_12.init()
	local L1_37 = _ENV.init
	L1_37()
	L1_37 = L8_8
	L1_37 = L1_37.init
	L1_37()
	L1_37 = Game
	L1_37 = L1_37.module
	L1_37 = L1_37.activity
	_UPVALUE2_ = L1_37
	L1_37 = _UPVALUE2_
	L1_37 = L1_37.data
	_UPVALUE3_ = L1_37
	L1_37 = _UPVALUE2_
	L1_37 = L1_37.const
	_UPVALUE4_ = L1_37
	L1_37 = L6_6
	L1_37 = L1_37.setup_events
	L1_37()
	L1_37 = L6_6
	L1_37 = L1_37.init_red_points
	L1_37()
	L1_37 = L6_6
	L1_37.task_generate_dic = {}
end
function L12_12.clear()
	_ENV.clear()
	L8_8.clear()
	L6_6.clear_events()
	L6_6.clear_red_points()
	L17_17.remove_open_func_req(L22_22.type.battle_pass, L6_6.get_battle_pass_req)
	L17_17.remove_open_func_req(L22_22.type.champion, L6_6.get_championship_req)
	L17_17.remove_open_func_req(L22_22.type.daily_task, L6_6.get_task_daily_liveness_req)
	L17_17.remove_open_func_req(L22_22.type.weapon_strengthen, L6_6.get_role_equip_be_task_req)
	L17_17.remove_open_func_req(L22_22.type.marriage, L6_6.get_marriage_req)
	L17_17.remove_open_func_req(L22_22.type.game_club, L6_6.get_game_club_req)
	L17_17.remove_open_func_req(L22_22.type.physical_challenge, L6_6.get_physical_challenge_req)
	L17_17.remove_open_func_req(L22_22.type.live_stream, L6_6.get_live_stream_req)
	L17_17.remove_open_func_req(L22_22.type.red_cat_blue_rabbit, L6_6.get_mid_autumn_match_daily)
	local L1_38 = L1_38
	L1_38(L22_22.type.alliance, L6_6.get_alliance_req)
	local L2_39 = L2_39
end
function L12_12.init_req()
	_ENV.task_info_c2s(L9_9.task_type.main)
	_ENV.task_info_c2s(L9_9.task_type.zhixian)
	_ENV.task_main_task_c2s()
	_ENV.task_main_info_c2s()
	function L6_6.get_battle_pass_req()
		_ENV.task_info_c2s(L9_9.task_type.battle_pass)
		local L1_43 = L1_43
	end
	function L6_6.get_championship_req()
		_ENV.task_info_c2s(L9_9.task_type.championship)
		local L1_44 = L1_44
	end
	function L6_6.get_task_daily_liveness_req()
		_ENV.task_daily_liveness_info_c2s()
	end
	function L6_6.get_role_equip_be_task_req()
		_ENV.role_equip_be_task_c2s()
		_ENV.task_info_c2s(L9_9.task_type.strength_rand)
		local L1_45 = L1_45
	end
	function L6_6.get_marriage_req()
		_ENV.task_info_c2s(L9_9.task_type.marriage)
		local L1_46 = L1_46
	end
	function L6_6.get_game_club_req()
		_ENV.task_info_c2s(L9_9.task_type.game_club)
		local L1_47 = L1_47
	end
	function L6_6.get_physical_challenge_req()
		_ENV.task_info_c2s(L9_9.task_type.physical_challenge)
		local L1_48 = L1_48
	end
	function L6_6.get_live_stream_req()
		_ENV.task_info_c2s(L9_9.task_type.live_stream)
		local L1_49 = L1_49
	end
	function L6_6.get_mid_autumn_match_daily()
		_ENV.task_info_c2s(L9_9.task_type.mid_autumn_match_daily)
		local L1_50 = L1_50
	end
	function L6_6.get_alliance_pk_req()
		_ENV.task_info_c2s(L9_9.task_type.alliance_pk_active)
		local L1_51 = L1_51
	end
	function L6_6.get_season_arti_train_req()
		_ENV.task_info_c2s(L9_9.task_type.season_act_arti)
		_ENV.task_info_c2s(L9_9.task_type.season_pet_trial)
		local L1_52 = L1_52
	end
	function L6_6.get_id_fight_req()
		_ENV.task_info_c2s(L9_9.task_type.id_fight)
		local L1_53 = L1_53
	end
	function L6_6.get_id_javelin_req()
		_ENV.task_info_c2s(L9_9.task_type.id_javelin)
		local L1_54 = L1_54
	end
	L17_17.add_open_func_req(L22_22.type.battle_pass, L6_6.get_battle_pass_req)
	L17_17.add_open_func_req(L22_22.type.champion, L6_6.get_championship_req)
	L17_17.add_open_func_req(L22_22.type.daily_task, L6_6.get_task_daily_liveness_req)
	L17_17.add_open_func_req(L22_22.type.weapon_strengthen, L6_6.get_role_equip_be_task_req)
	L17_17.add_open_func_req(L22_22.type.marriage, L6_6.get_marriage_req)
	L17_17.add_open_func_req(L22_22.type.game_club, L6_6.get_game_club_req)
	L17_17.add_open_func_req(L22_22.type.physical_challenge, L6_6.get_physical_challenge_req)
	L17_17.add_open_func_req(L22_22.type.live_stream, L6_6.get_live_stream_req)
	L17_17.add_open_func_req(L22_22.type.red_cat_blue_rabbit, L6_6.get_mid_autumn_match_daily)
	L17_17.add_open_func_req(L22_22.type.alliance_pk, L6_6.get_alliance_pk_req)
	L17_17.add_open_func_req(L22_22.type.season_activity, L6_6.get_season_arti_train_req)
	L17_17.add_open_func_req(L22_22.type.id_fight, L6_6.get_id_fight_req)
	local L1_41 = L1_41
	L1_41(L22_22.type.id_javelin, L6_6.get_id_javelin_req)
	local L2_42 = L2_42
	L1_41 = _ENV
	L1_41 = L1_41.task_career_info_c2s
	L1_41()
end
function L12_12.register_custom_task(A0_55, A1_56)
	if _ENV.task_generate_dic[A0_55] then
		error("Task Generate has register key " .. A0_55)
		return
	end
	if not A1_56.generate_func then
		error("No generate_func for register key " .. A0_55)
		return
	end
	if not A1_56.key_order then
		local L2_57 = L2_57
		local L4_59 = "No key_order for register key " .. A0_55
		L2_57(L4_59)
		return
	end
	L2_57 = _ENV
	L2_57 = L2_57.task_generate_dic
	L2_57[A0_55] = A1_56
end
function L12_12.get_custom_task(A0_60)
	local L1_61
	L1_61 = {}
	if A0_60 then
		L6_66 = _ENV
		L6_66 = L6_66.task_generate_dic
		L6_66 = L6_66[A0_60]
		if not L6_66 then
			goto lbl_61
		end
		L11_71 = L6_66.generate_func
		L11_71 = L11_71()
		L1_61 = L11_71 or L1_61
		if not L11_71 then
			L11_71 = {}
			L1_61 = L11_71
		end
		L11_71 = L2_2
		L11_71, _FOR_, _FOR_ = L11_71(L1_61)
		for _FORV_6_, _FORV_7_ in L11_71, _FOR_, _FOR_ do
			_FORV_7_.is_custom = true
			_FORV_7_.key_order = L6_66.key_order
		end
		L11_71 = table
		L11_71 = L11_71.sort
		L11_71(L1_61, function(A0_76, A1_77)
			local L2_78, L3_79
			L2_78 = A0_76.order
			L3_79 = A1_77.order
			L2_78 = L2_78 > L3_79
			return L2_78
		end)
		break -- pseudo-goto
	end
	L6_66 = L1_1
	L11_71 = _ENV
	L11_71 = L11_71.task_generate_dic
	L6_66, L11_71, _FOR_ = L6_66(L11_71)
	for _FORV_5_, _FORV_6_ in L6_66, L11_71, _FOR_ do
		if not _FORV_6_.generate_func() then
		end
		_FOR_, _FOR_, _FOR_ = L2_2({})
		for _FORV_11_, _FORV_12_ in _FOR_, _FOR_, _FOR_ do
			_FORV_12_.is_custom = true
			_FORV_12_.key_order = _FORV_6_.key_order
			local L12_72 = L12_72
			table.insert(L1_61, _FORV_12_)
		end
	end
	L6_66 = table
	L6_66 = L6_66.sort
	L11_71 = L1_61
	function L8_68(A0_80, A1_81)
		local L2_82, L3_83
		L2_82 = A0_80.key_order
		L3_83 = A1_81.key_order
		if L2_82 ~= L3_83 then
			L2_82 = A0_80.key_order
			L3_83 = A1_81.key_order
			L2_82 = L2_82 > L3_83
			return L2_82
		end
		L2_82 = A0_80.order
		L3_83 = A1_81.order
		L2_82 = L2_82 > L3_83
		return L2_82
	end
	repeat
		L6_66(L11_71, L8_68)
	until true
	::lbl_61::
	return L1_61
end
function L12_12.show_task_tips(A0_84)
	local L3_87 = L3_87
	if A0_84 then
		L3_87 = next
		local L3_87, L2_86 = L3_87(A0_84), L2_86
		if L3_87 then
			goto lbl_9
		end
	end
	do return end
	::lbl_9::
	L3_87 = {}
	L2_86 = 0
	_FOR_, _FOR_, _FOR_ = _ENV(A0_84)
	for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
		L2_86 = L2_86 + _FORV_8_.weight
		L3_87[_FORV_7_] = {}
		L3_87[_FORV_7_].info = _FORV_8_
		;({}).begin_val = 0
		L3_87[_FORV_7_].range, ({}).end_val = {}, 0 + _FORV_8_.weight
		local L10_94 = L10_94
		L10_94 = L10_94 + _FORV_8_.weight
	end
	local L5_89 = L5_89
	L5_89 = L5_89(0, L2_86)
	_FOR_, _FOR_, _FOR_ = _ENV(L3_87)
	for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
		local L11_95 = L11_95
		if L5_89 >= _FORV_10_.range.begin_val and L5_89 <= _FORV_10_.range.end_val then
			L11_95 = _FORV_10_.info
			break
		end
	end
	if L14_14.view_is_waiting_open("GameMainView") or L14_14.view_is_waiting_open("DungeonMainEntryView") then
		L7_7.task_tips_info = L11_95
	else
		L7_7.task_tips_info = nil
		local L7_91 = L7_91
		L7_91("update_task_tips", L11_95)
		local L8_92 = L8_92
	end
end
function L12_12.after_close_task_view()
	local L4_100 = _ENV.get_task_data_by_type
	L5_101 = L9_9
	L5_101 = L5_101.task_type
	L5_101 = L5_101.strength_rand
	L4_100 = L4_100(L5_101)
	L5_101 = next
	L5_101 = L5_101(L4_100)
	if L5_101 then
		L5_101 = L2_2
		L5_101, _FOR_, _FOR_ = L5_101(L4_100)
		for _FORV_4_, _FORV_5_ in L5_101, _FOR_, _FOR_ do
			_ENV.strength_rand_red_info[_FORV_5_.task_id] = false
		end
	end
	L5_101 = L1_1
	L7_103 = _ENV
	L7_103 = L7_103.strength_rand_red_info
	L5_101, L7_103, _FOR_ = L5_101(L7_103)
	for _FORV_4_, _FORV_5_ in L5_101, L7_103, _FOR_ do
		if _ENV.strength_rand_red_info[_FORV_4_] == true then
			_ENV.strength_rand_red_info[_FORV_4_] = false
		end
	end
	L5_101 = Game
	L5_101 = L5_101.redpoint_helper
	L5_101 = L5_101.update_red_point
	L7_103 = L9_9
	L7_103 = L7_103.task_red_point_id
	L5_101(L7_103)
	L5_101 = _ENV
	L7_103 = {}
	L5_101.alliance_invite_red_info = L7_103
end
function L12_12.init_red_points()
	({}).parent_ids, ({})[1] = {}, "main_view_red_point"
	;({}).id = "daily_task_red_point"
	;({}).tp = 1
	_ENV.new_red_point({})
	;({}).id = L9_9.task_red_point_id
	;({}).tp = 1
	;({}).cb = function()
		local L3_112 = _ENV.get_strength_rand_task_red_num
		L3_112 = L3_112()
		if 0 < L3_112 then
			L4_113 = 1
			return L4_113
		end
		L4_113 = L1_1
		L5_114 = L7_7
		L5_114 = L5_114.task_data
		L4_113, L5_114, L8_117 = L4_113(L5_114)
		for L9_118, L10_119 in L4_113, L5_114, L8_117 do
			L11_120 = L9_9
			L11_120 = L11_120.task_type
			L11_120 = L11_120.main
			if L9_118 ~= L11_120 then
				L11_120 = L9_9
				L11_120 = L11_120.task_type
				L11_120 = L11_120.zhixian
				if L9_118 ~= L11_120 then
					L11_120 = L9_9
					L11_120 = L11_120.task_type
					L11_120 = L11_120.strength_rand
					if L9_118 ~= L11_120 then
						goto lbl_49
					end
				end
			end
			L11_120 = L10_119.doing_dic
			if L11_120 then
				L11_120 = L1_1
				L12_121 = L10_119.doing_dic
				L11_120, L12_121, _FOR_ = L11_120(L12_121)
				for _FORV_9_, _FORV_10_ in L11_120, L12_121, _FOR_ do
					if _FORV_10_.status == L9_9.task_status.can_get then
						return 1
					end
				end
			end
			::lbl_49::
		end
		L4_113 = 0
		return L4_113
	end
	;({}).point_cb_infos, ({})[1] = {}, {}
	_ENV.new_red_point({})
	;({}).parent_ids, ({})[1] = {}, L9_9.task_red_point_id
	;({}).id = "task_main_point"
	;({}).tp = 1
	_ENV.new_red_point({})
	;({}).parent_ids, ({})[1] = {}, "task_main_point"
	;({}).id = "task_main_red_point"
	;({}).tp = 1
	_ENV.new_red_point({})
	;({}).parent_ids, ({})[1] = {}, "task_main_point"
	;({}).id = "task_other_show_red_point"
	;({}).tp = 1
	;({}).cb = L6_6.has_zhixian_show_red_point
	;({}).point_cb_infos, ({})[1] = {}, {}
	_ENV.new_red_point({})
	;({}).id = "task_other_red_point"
	;({}).tp = 1
	local ({}).cb, L4_108 = L6_6.has_zhixian_red_point, L4_108
	;({}).point_cb_infos, ({})[1] = {}, {}
	L4_108({})
	L4_108 = _ENV
	L4_108 = L4_108.new_red_point
	;({}).parent_ids, ({})[1] = {}, "task_main_point"
	;({}).id = "task_marriage_red_point"
	;({}).tp = 1
	;({}).cb = function()
		local L3_125 = _ENV.is_open
		L4_126 = L22_22
		L4_126 = L4_126.type
		L4_126 = L4_126.marriage
		L3_125 = L3_125(L4_126)
		if not L3_125 then
			L3_125 = 0
			return L3_125
		end
		L3_125 = Game
		L3_125 = L3_125.module
		L3_125 = L3_125.marriage
		L3_125 = L3_125.get_marriage_task_data
		L3_125 = L3_125()
		L4_126 = next
		L5_127 = L3_125
		L4_126 = L4_126(L5_127)
		if L4_126 then
			L4_126 = L1_1
			L5_127 = L3_125
			L4_126, L5_127, L6_128 = L4_126(L5_127)
			for L7_129, _FORV_5_ in L4_126, L5_127, L6_128 do
				if _FORV_5_.status == L9_9.task_status.can_get then
					return 1
				end
			end
		end
		L4_126 = 0
		return L4_126
	end
	;({}).point_cb_infos, ({})[1] = {}, {}
	L4_108({})
	L4_108 = _ENV
	L4_108 = L4_108.new_red_point
	;({}).parent_ids, ({})[1] = {}, "daily_task_red_point"
	;({}).id = "daily_task_tab_red_point"
	;({}).tp = 1
	;({}).cb = function()
		local L4_134 = _ENV.is_open
		L5_135 = L22_22
		L5_135 = L5_135.type
		L5_135 = L5_135.daily_task
		L4_134 = L4_134(L5_135)
		if not L4_134 then
			L4_134 = 0
			return L4_134
		end
		L4_134 = L7_7
		L4_134 = L4_134.get_task_data_by_type
		L5_135 = L9_9
		L5_135 = L5_135.task_type
		L5_135 = L5_135.daily
		L4_134 = L4_134(L5_135)
		L5_135 = L2_2
		L5_135, _FOR_, _FOR_ = L5_135(L4_134)
		for _FORV_4_, _FORV_5_ in L5_135, _FOR_, _FOR_ do
			if _FORV_5_.status == L9_9.task_status.can_get then
				return 1
			end
		end
		L5_135 = L7_7
		L5_135 = L5_135.get_daily_liveness_task_data
		L5_135 = L5_135()
		L7_137 = L2_2
		L7_137, L3_133, _FOR_ = L7_137(L5_135)
		for _FORV_5_, _FORV_6_ in L7_137, L3_133, _FOR_ do
			if not _FORV_6_.is_get and _FORV_6_.can_get then
				return 1
			end
		end
		L7_137 = 0
		return L7_137
	end
	local L3_107.point_cb_infos, ({})[1], L3_107 = {}, {}, L3_107
	L4_108(L3_107)
end
function L12_12.has_zhixian_red_point()
	local L4_142 = _ENV.is_open
	L5_143 = L22_22
	L5_143 = L5_143.type
	L5_143 = L5_143.zhixian_task
	L4_142 = L4_142(L5_143)
	if not L4_142 then
		L4_142 = 0
		return L4_142
	end
	L4_142 = _UPVALUE2_
	L4_142 = L4_142.get_all_cfg
	L4_142 = L4_142()
	L5_143 = L1_1
	L8_146 = L4_142
	L5_143, L8_146, L9_147 = L5_143(L8_146)
	for L10_148, L11_149 in L5_143, L8_146, L9_147 do
		if L7_7.can_task_career_get(L11_149) then
			return 1
		end
	end
	L5_143 = L1_1
	L8_146 = L7_7
	L8_146 = L8_146.task_data
	L5_143, L8_146, L9_147 = L5_143(L8_146)
	for L10_148, L11_149 in L5_143, L8_146, L9_147 do
		if L10_148 == L9_9.task_type.zhixian and L11_149.doing_dic then
			_FOR_, _FOR_, _FOR_ = L1_1(L11_149.doing_dic)
			for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
				if _FORV_10_.status == L9_9.task_status.can_get then
					return 1
				end
				if L6_6.is_have_red_by_weap_readpacket_task(_FORV_10_.task_id) then
					return 1
				end
			end
		end
	end
	L5_143 = 0
	return L5_143
end
function L12_12.has_zhixian_show_red_point()
	local L4_156 = _ENV.is_open
	L5_157 = L22_22
	L5_157 = L5_157.type
	L5_157 = L5_157.zhixian_task
	L4_156 = L4_156(L5_157)
	if not L4_156 then
		L4_156 = 0
		return L4_156
	end
	L4_156 = _UPVALUE2_
	L4_156 = L4_156.get_all_cfg
	L4_156 = L4_156()
	L5_157 = L1_1
	L9_161 = L4_156
	L5_157, L9_161, L10_162 = L5_157(L9_161)
	for L11_163, L12_164 in L5_157, L9_161, L10_162 do
		L13_165 = L7_7
		L13_165 = L13_165.can_task_career_get
		L13_165 = L13_165(L12_164)
		if L13_165 then
			L13_165 = 1
			return L13_165
		end
	end
	L5_157 = 0
	L9_161 = L1_1
	L10_162 = L7_7
	L10_162 = L10_162.task_data
	L9_161, L10_162, L11_163 = L9_161(L10_162)
	for L12_164, L13_165 in L9_161, L10_162, L11_163 do
		if L12_164 == L9_9.task_type.zhixian and L13_165.doing_dic then
			_FOR_, _FOR_, _FOR_ = L1_1(L13_165.doing_dic)
			for _FORV_10_, _FORV_11_ in _FOR_, _FOR_, _FOR_ do
				if _FORV_11_.status == L9_9.task_status.can_get then
					L5_157 = L5_157 + 1
				end
			end
		end
	end
	if 10 <= L5_157 then
		L9_161 = 1
		if L9_161 then
			goto lbl_67
		end
	end
	L9_161 = 0
	::lbl_67::
	return L9_161
end
function L12_12.clear_red_points()
	_ENV.destroy_red_point("task_main_red_point", true)
	_ENV.destroy_red_point("task_other_red_point", true)
	_ENV.destroy_red_point("task_other_show_red_point", true)
	_ENV.destroy_red_point("task_marriage_red_point", true)
	_ENV.destroy_red_point("daily_task_red_point", true)
	_ENV.destroy_red_point(L9_9.task_red_point_id, true)
	local L1_166 = L1_166
	L1_166("daily_task_reward_red_point_total", true)
	local L2_167 = L2_167
end
function L12_12.get_strength_rand_task_red_num()
	local L0_168
	L0_168 = _ENV
	local L0_168.strength_rand_is_red, L4_172 = false, L4_172
	L0_168 = 0
	L4_172 = _ENV
	L4_172 = L4_172.get_task_data_by_type
	L5_173 = L9_9
	L5_173 = L5_173.task_type
	L5_173 = L5_173.strength_rand
	L4_172 = L4_172(L5_173)
	L5_173 = next
	L6_174 = L4_172
	L5_173 = L5_173(L6_174)
	if L5_173 then
		L5_173 = L2_2
		L6_174 = L4_172
		L5_173, L6_174, L7_175 = L5_173(L6_174)
		repeat
			for L8_176, _FORV_6_ in L5_173, L6_174, L7_175 do
				if _ENV.strength_rand_red_info[_FORV_6_.task_id] == nil or _ENV.strength_rand_red_info[_FORV_6_.task_id] == true then
					_ENV.strength_rand_red_info[_FORV_6_.task_id] = true
					_ENV.strength_rand_is_red = true
					L0_168 = L0_168 + 1
				end
			end
			do break end -- pseudo-goto
			L5_173 = _ENV
			L6_174 = {}
			L5_173.strength_rand_red_info = L6_174
		until true
	end
	return L0_168
end
function L12_12.setup_events()
	local L4_181 = L4_181
	;({})[1] = L18_18.update_all
	;({})[2] = L18_18.update_item
	;({})[3] = "task_update_task_info"
	local ({})[4], L5_182 = "weapon_equip_strengthen", L5_182
	L4_181.listen_events = L5_182
	L4_181 = _ENV
	L4_181 = L4_181.has_setup
	if L4_181 then
		return
	end
	L4_181 = _ENV
	L4_181.has_setup = true
	L4_181 = Game
	L4_181 = L4_181.events
	L4_181 = L4_181.add_listeners
	L5_182 = _ENV
	L5_182 = L5_182.listen_events
	L4_181(L5_182, _ENV, false)
	local L3_180 = L3_180
	L4_181 = _ENV
	L4_181 = L4_181.setup_daily_task_events
	L4_181()
end
function L12_12.clear_events()
	if not _ENV.has_setup then
		return
	end
	_ENV.has_setup = false
	local L1_184 = L1_184
	local L2_185 = L2_185
	L1_184(L2_185, _ENV, false)
	local L3_186 = L3_186
	L1_184 = _ENV
	L1_184 = L1_184.clear_daily_task_events
	L1_184()
end
function L12_12.on_task_update_task_info()
	local L5_192, L6_193 = _ENV.get_show_main_task, L6_193
	L6_193 = _ENV
	L6_193 = L6_193.get_value
	L6_193 = L6_193("show_task_type_index")
	if not L6_193 then
		L6_193 = 1
	end
	L5_192, L6_193 = L5_192(L6_193)
	if not L5_192 or not L5_192.task_id then
		_ENV.set_value(_UPVALUE1_, false)
		return
	end
	local L2_189 = L2_189
	L2_189 = L2_189(L5_192.task_id)
	local L3_190 = L3_190
	local L3_190, L4_191 = L3_190(L22_22.type.main_task_change_btn), L4_191
	L4_191 = L2_189.task_priority
	L4_191 = L4_191 == L9_9.zixuan_task_priority
	if L3_190 and L4_191 then
	end
	local L7_194 = L7_194
	if L7_194 and L5_192.status == L9_9.task_status.is_accepted then
		_ENV.set_value(_UPVALUE1_, true)
		Game.module.guide_system.trigger(Game.module.guide_system.const.trigger_type.show_switch_task)
	else
		local L8_195 = L8_195
		local L9_196 = L9_196
		_ENV.set_value(_UPVALUE1_, false)
		local L10_197 = L10_197
	end
end
function L12_12.on_open_func_event_update_all()
	if _ENV.is_open(L22_22.type.task_freshman) then
		L8_8.task_info_c2s(L9_9.task_type.noob)
	end
	if _ENV.is_open(L22_22.type.alliance_series) then
		L8_8.task_info_c2s(L9_9.task_type.alliance_series)
		L8_8.task_info_c2s(L9_9.task_type.alliance_series_sub)
	end
	if _ENV.is_open(L22_22.type.daily_task) then
		L8_8.task_info_c2s(L9_9.task_type.daily)
		L8_8.task_info_c2s(L9_9.task_type.alliance_daily)
	end
	if _ENV.is_open(L22_22.type.label) then
		L8_8.task_info_c2s(L9_9.task_type.label)
		local L1_198 = L1_198
	end
end
function L12_12.on_open_func_event_update_item(A0_199, A1_200)
	if A0_199 == _ENV.type.alliance_series and A1_200 and L17_17.is_open(_ENV.type.alliance_series) then
		L8_8.task_info_c2s(L9_9.task_type.alliance_series)
		L8_8.task_info_c2s(L9_9.task_type.alliance_series_sub)
	end
	if A0_199 == _ENV.type.daily_task and A1_200 and L17_17.is_open(_ENV.type.daily_task) then
		L8_8.task_info_c2s(L9_9.task_type.daily)
		L8_8.task_info_c2s(L9_9.task_type.alliance_daily)
	end
	if A0_199 == _ENV.type.label and A1_200 then
		L8_8.task_info_c2s(L9_9.task_type.label)
		local L3_201 = L3_201
	end
end
function L12_12.on_weapon_equip_strengthen()
	_ENV.trigger_task_red_point(L9_9.task_type.zhixian)
	local L1_202 = L1_202
end
function L12_12.pop_reward(A0_203, A1_204)
	repeat
		local L2_205 = L2_205
		L2_205 = L2_205(A0_203)
		local L3_206 = L3_206
		L3_206 = L3_206(A0_203)
		if L2_205 and not L3_206 then
			local L4_207 = L4_207
			L4_207(A0_203.id)
			break -- pseudo-goto
		end
		L4_207 = A0_203.reward
		L4_207 = #L4_207
		if 1 < L4_207 then
			L4_207 = {}
			L4_207.reward_configs = A0_203.reward
			L4_207.is_through = true
			L4_207.rt_target = A1_204
			L4_207.alignment = 0
			L14_14.open_view(L15_15.CommonRewardTipsView.name, L4_207)
			local L7_210 = L7_210
			break -- pseudo-goto
		end
		L4_207 = {}
		L7_210 = A0_203.reward
		L7_210 = L7_210[1]
		L7_210 = L7_210[1]
		L4_207.cfg_id = L7_210
		L7_210 = A0_203.reward
		L7_210 = L7_210[1]
		L7_210 = L7_210[2]
		L4_207.num = L7_210
		L4_207.item_transform = A1_204
		L4_207.no_op = true
		L7_210 = Game
		L7_210 = L7_210.module
		L7_210 = L7_210.bag
		L7_210 = L7_210.show_tips_with_params
		L7_210(L4_207)
		local L6_209 = L6_209
	until true
end
function L12_12.check_career_pve_task_tips_cache(A0_211)
	local L3_214 = _ENV.add_pop_view
	;({}).name = "MainTaskTipsView"
	;({}).func = function()
		local L1_215 = L1_215
		L1_215("TaskTipsView", A0_211.task_id)
		local L2_216 = L2_216
	end
	L3_214({})
	local L2_213 = L2_213
end
function L12_12.trigger_task_red_point(A0_217, A1_218)
	if A0_217 == _ENV.task_type.main then
		L11_11.update_red_point("task_main_red_point")
	elseif A0_217 == _ENV.task_type.zhixian then
		L11_11.update_red_point("task_other_red_point")
		L11_11.update_red_point("task_other_show_red_point")
	elseif A0_217 == _ENV.task_type.marriage then
		L11_11.update_red_point("task_marriage_red_point")
	elseif A0_217 == _ENV.task_type.strength_rand then
		L11_11.update_red_point("strength_return_task_red_point")
	elseif A0_217 == _ENV.task_type.daily then
		L11_11.update_red_point("daily_task_tab_red_point")
	elseif A0_217 == _ENV.task_type.alliance_daily then
		L11_11.update_red_point("alliance_daily_task_red_point")
	elseif A0_217 == _ENV.task_type.mid_autumn_match_daily then
		L11_11.update_red_point("red_cat_blue_rabbit_mid_autumn_match_task_red_point")
		local L3_219 = L3_219
	end
end
function L12_12.is_show_zhixian_task(A0_220)
	local L1_221 = L1_221
	L1_221 = L1_221(A0_220)
	if L1_221 == nil or L1_221.pre_con == nil then
		return true
	end
	if L35_35 and L35_35.is_box_4399_h5() or GameDefine.HYKB_MINIGAME then
		local L2_222 = L2_222
		local L2_222, L3_223 = L2_222(A0_220), L3_223
		if L2_222 then
			L3_223 = L2_222.status
			if L3_223 ~= L9_9.task_status.can_get then
				L3_223 = L1_221.condition_args
				if L3_223 then
					local L4_224 = L4_224
					L4_224 = L4_224(L3_223)
					if L4_224 then
						L4_224 = L3_223.chat_type
						if L4_224 == 1 then
							L4_224 = false
							return L4_224
						end
					end
				end
			end
		end
	end
	L2_222 = L1_221.pre_con
	L2_222 = L2_222[1]
	if L2_222 == nil then
		L3_223 = true
		return L3_223
	end
	L3_223 = L2_222[1]
	if not L3_223 then
		L3_223 = 0
	end
	L4_224 = L2_222[2]
	if not L4_224 then
		L4_224 = 0
	end
	local L7_227 = L7_227
	if L3_223 ~= 0 and L7_7.get_task_data_by_id(L3_223) and L7_7.get_task_data_by_id(L3_223).status ~= L9_9.task_status.finish then
		return false
	end
	L7_227 = L34_34
	L7_227 = L7_227.get_cur_strength_lv
	L7_227 = L7_227()
	if not L7_227 then
		L7_227 = 0
	end
	if L4_224 > L7_227 then
		return false
	end
	return true
end
function L12_12.is_have_red_by_weap_readpacket_task(A0_228)
	local L1_229 = L1_229
	L1_229 = L1_229(A0_228)
	if not L1_229 or L1_229.sub_task_tp ~= L9_9.sub_task_type.weap_readpacket then
		return false
	end
	local L3_231 = L6_6.is_show_zhixian_task(A0_228)
	if not L3_231 then
		L3_231 = false
		return L3_231
	end
	L3_231 = L7_7
	L3_231 = L3_231.get_looked_weap_redpack_task_id
	L3_231 = L3_231()
	if A0_228 > L3_231 then
		return true
	end
	return false
end
function L12_12.get_task_red_point(A0_232)
	local L4_236 = _ENV.get_task_data_by_type
	L5_237 = A0_232
	L4_236 = L4_236(L5_237)
	if L4_236 then
		L5_237 = next
		L6_238 = L4_236
		L5_237 = L5_237(L6_238)
		if L5_237 then
			goto lbl_14
		end
	end
	L5_237 = 0
	do return L5_237 end
	::lbl_14::
	L5_237 = L2_2
	L6_238 = L4_236
	L5_237, L6_238, L7_239 = L5_237(L6_238)
	for L8_240, _FORV_6_ in L5_237, L6_238, L7_239 do
		if _FORV_6_.status == L9_9.task_status.can_get then
			return 1
		end
	end
	L5_237 = 0
	return L5_237
end
