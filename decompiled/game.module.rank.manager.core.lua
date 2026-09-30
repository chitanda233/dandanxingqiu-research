local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16
L0_0 = pairs
local L1_1, L20_20, L21_21, L22_22, L23_23, L26_26, L27_27, L28_28, L31_31 = ipairs, L20_20, L21_21, L22_22, L23_23, L26_26, L27_27, L28_28, L31_31
L2_2 = table
L2_2 = L2_2.insert
L3_3 = table
L3_3 = L3_3.sort
L4_4 = string
L4_4 = L4_4.format
L5_5 = math
L5_5 = L5_5.abs
L6_6 = DataConfigs
L7_7 = L6_6.language_define
L8_8 = L6_6.rank_tab
L9_9 = L6_6.rank_system
L10_10 = L6_6.multi_series
L11_11 = L6_6.rank_settlement
L12_12 = L6_6.rank_settle_reward
L13_13 = L6_6.dungeon
L14_14 = DataConfigs
L14_14 = L14_14.tower
L15_15 = Game
L15_15 = L15_15.events
L16_16 = Game
L16_16 = L16_16.redpoint_helper
L20_20 = require
L21_21 = "game.other.game_time.init"
L20_20 = L20_20(L21_21)
L21_21 = require
L22_22 = "game.other.player_prefs"
L21_21 = L21_21(L22_22)
L22_22 = Game
L22_22 = L22_22.module
L22_22 = L22_22.open_func
L23_23 = Game
L23_23 = L23_23.module
L23_23 = L23_23.open_func
L23_23 = L23_23.const
L26_26 = Game
L26_26 = L26_26.module
L26_26 = L26_26.open_func
L26_26 = L26_26.event
L27_27 = Game
L27_27 = L27_27.module
L27_27 = L27_27.fight
L28_28 = Game
L28_28 = L28_28.module
L28_28 = L28_28.jump_to
L31_31 = import
L31_31 = L31_31(".head")
local L30_30 = L30_30
function L31_31.init()
	_ENV.init()
	_UPVALUE1_.init()
	L29_29.setup_events()
	L29_29.init_red_points()
	L29_29.register_jump()
	local L1_32 = L1_32
	L1_32(L23_23.type.rank, _UPVALUE1_.req_rank_role_c2s)
	local L2_33 = L2_33
end
function L31_31.clear()
	local L1_34 = L1_34
	L1_34(L23_23.type.rank, _UPVALUE2_.req_rank_role_c2s)
	local L2_35 = L2_35
	L1_34 = L29_29
	L1_34 = L1_34.clear_events
	L1_34()
	L1_34 = L29_29
	L1_34 = L1_34.clear_red_points
	L1_34()
	L1_34 = _UPVALUE2_
	L1_34 = L1_34.clear
	L1_34()
	L1_34 = L30_30
	L1_34 = L1_34.clear
	L1_34()
end
function L31_31.init_req()
	_ENV.req_like_info_c2s()
	_ENV.req_like_offline_num_c2s()
end
function L31_31.register_jump()
	local L3_39 = _ENV.register_info
	;({}).check_handler = function(A0_40)
		return _ENV.get_is_open()
	end
	L3_39("RankOpenCheck", {})
	local L2_38 = L2_38
end
function L31_31.get_is_open()
	local L0_41
	L0_41 = _ENV
	L2_43 = L8_8
	L2_43 = L2_43.get_all_config
	L2_43, L3_44, L4_45, L7_48, L8_49, L9_50 = L2_43()
	L0_41, L2_43, L3_44 = L0_41(L2_43, L3_44, L4_45, L7_48, L8_49, L9_50, L2_43())
	for L4_45, L7_48 in L0_41, L2_43, L3_44 do
		L8_49 = L1_1
		L9_50 = L7_48.rank_system_list
		L8_49, L9_50, _FOR_ = L8_49(L9_50)
		for _FORV_8_, _FORV_9_ in L8_49, L9_50, _FOR_ do
			if L29_29.get_rank_type_is_open(_FORV_9_) then
				return true
			end
		end
	end
	L0_41 = false
	return L0_41
end
function L31_31.get_rank_tab_is_open(A0_53)
	local L4_57 = _ENV.get_config
	L5_58 = A0_53
	L4_57 = L4_57(L5_58)
	if not L4_57 then
		L5_58 = false
		return L5_58
	end
	L5_58 = L1_1
	L6_59 = L4_57.rank_system_list
	L5_58, L6_59, _FOR_ = L5_58(L6_59)
	for _FORV_5_, _FORV_6_ in L5_58, L6_59, _FOR_ do
		if L29_29.get_tab_rank_type_is_can_show(L4_57.rank_lock_system_dict, _FORV_6_) then
			return true
		end
	end
	L5_58 = false
	return L5_58
end
function L31_31.get_rank_type_is_open(A0_63)
	local L1_64 = L1_64
	local L1_64, L2_65 = L1_64(A0_63), L2_65
	L2_65 = L1_64.open_func_id
	if L2_65 then
		if not (L2_65 and 0 < L2_65) then
			goto lbl_20
		end
		local L3_66 = L3_66
		local L3_66, L4_67 = L3_66(L2_65), L4_67
		if not L3_66 then
			goto lbl_20
		end
	end
	L3_66 = true
	do return L3_66 end
	::lbl_20::
	L3_66 = false
	return L3_66
end
function L31_31.get_tab_rank_type_is_can_show(A0_68, A1_69)
	if A0_68 and A0_68[A1_69] == 1 then
		return true
	end
	local L2_70 = L2_70
	do return L2_70(A1_69) end
	local L3_71 = L3_71
end
function L31_31.get_open_tab(A0_72)
	local L1_73
	if not A0_72 then
		A0_72 = 1
	end
	L1_73 = {}
	L5_77 = _ENV
	L6_78 = L8_8
	L6_78 = L6_78.get_all_config
	L6_78, L10_82, L11_83 = L6_78()
	L5_77, L6_78, L10_82 = L5_77(L6_78, L10_82, L11_83, L6_78())
	for L11_83, _FORV_6_ in L5_77, L6_78, L10_82 do
		if _FORV_6_.type == A0_72 then
			_FOR_, _FOR_, _FOR_ = L1_1(_FORV_6_.rank_system_list)
			for _FORV_10_, _FORV_11_ in _FOR_, _FOR_, _FOR_ do
				if L29_29.get_tab_rank_type_is_can_show(_FORV_6_.rank_lock_system_dict, _FORV_11_) then
					L2_2(L1_73, _FORV_6_)
					break
				end
			end
		end
	end
	L5_77 = L3_3
	L6_78 = L1_73
	function L10_82(A0_87, A1_88)
		local L2_89, L3_90
		L2_89 = A0_87.sort
		L3_90 = A1_88.sort
		if L2_89 ~= L3_90 then
			L2_89 = A0_87.sort
			L3_90 = A1_88.sort
			L2_89 = L2_89 < L3_90
			return L2_89
		end
		L2_89 = A0_87.id
		L3_90 = A1_88.id
		L2_89 = L2_89 < L3_90
		return L2_89
	end
	L5_77(L6_78, L10_82)
	return L1_73
end
function L31_31.get_tab_type(A0_91)
	local L1_92
	if not A0_91 then
		L1_92 = 1
		return L1_92
	end
	L1_92 = _ENV
	L3_94 = L8_8
	L3_94 = L3_94.get_all_config
	L3_94, L4_95, L5_96, L8_99, L9_100, L10_101, L11_102 = L3_94()
	L1_92, L3_94, L4_95 = L1_92(L3_94, L4_95, L5_96, L8_99, L9_100, L10_101, L11_102, L3_94())
	for L5_96, L8_99 in L1_92, L3_94, L4_95 do
		L9_100 = L1_1
		L10_101 = L8_99.rank_system_list
		L9_100, L10_101, L11_102 = L9_100(L10_101)
		for _FORV_9_, _FORV_10_ in L9_100, L10_101, L11_102 do
			if _FORV_10_ == A0_91 then
				return L8_99.type
			end
		end
	end
	L1_92 = 1
	return L1_92
end
function L31_31.get_open_sub_tab(A0_103)
	local L1_104
	L1_104 = {}
	local L5_108 = _ENV
	L5_108 = L5_108.get_config
	L6_109 = A0_103
	L5_108 = L5_108(L6_109)
	if L5_108 ~= nil then
		L6_109 = L5_108.rank_system_list
		if L6_109 ~= nil then
			goto lbl_12
		end
	end
	do return L1_104 end
	::lbl_12::
	L6_109 = L1_1
	L7_110 = L5_108.rank_system_list
	L6_109, L7_110, _FOR_ = L6_109(L7_110)
	for _FORV_6_, _FORV_7_ in L6_109, L7_110, _FOR_ do
		if L29_29.get_tab_rank_type_is_can_show(L5_108.rank_lock_system_dict, _FORV_7_) then
			L2_2(L1_104, (L9_9.get_config(_FORV_7_)))
			local L11_114 = L11_114
		end
	end
	return L1_104
end
function L31_31.is_settle_type(A0_115)
	local L1_116
	L1_116 = _ENV
	L3_118 = L11_11
	L3_118 = L3_118.get_all_config
	L3_118, L4_119, L5_120, L6_121, L8_123, L9_124, L10_125, L11_126, L12_127 = L3_118()
	L1_116, L3_118, L4_119 = L1_116(L3_118, L4_119, L5_120, L6_121, L8_123, L9_124, L10_125, L11_126, L12_127, L3_118())
	for L5_120, L6_121 in L1_116, L3_118, L4_119 do
		L8_123 = L6_121.rank_id
		if L8_123 == A0_115 then
			L8_123 = L6_121.settlement
			L9_124 = _UPVALUE2_
			L9_124 = L9_124.settle_type
			L9_124 = L9_124.daily
			if L8_123 ~= L9_124 then
				L8_123 = L6_121.settlement
				L9_124 = _UPVALUE2_
				L9_124 = L9_124.settle_type
				L9_124 = L9_124.weekly
				if L8_123 ~= L9_124 then
					goto lbl_42
				end
			end
			L8_123 = _ENV
			L9_124 = L12_12
			L9_124 = L9_124.get_all_config
			L9_124, L10_125, L11_126, L12_127 = L9_124()
			L8_123, L9_124, L10_125 = L8_123(L9_124, L10_125, L11_126, L12_127, L9_124())
			for L11_126, L12_127 in L8_123, L9_124, L10_125 do
				if L12_127.rank_id == A0_115 and L12_127.settlement_id and L12_127.settlement_id == L6_121.id then
					return true
				end
			end
		end
		::lbl_42::
	end
	L1_116 = false
	return L1_116
end
function L31_31.get_rank_tips(A0_128)
	local L3_131, L8_136, L9_137, L10_138 = _ENV.get_config, L8_136, L9_137, L10_138
	L8_136 = A0_128
	L3_131 = L3_131(L8_136)
	L8_136 = ""
	if L3_131 then
		L9_137 = "\229\141\179\230\151\182"
		L10_138 = L3_131.refresh_type
		if L10_138 then
			L10_138 = L3_131.refresh_type
			if L10_138 == 1 then
				L9_137 = "\230\175\143\229\176\143\230\151\182"
		end
		else
			L10_138 = L3_131.refresh_type
			if L10_138 then
				L10_138 = L3_131.refresh_type
				if L10_138 == 2 then
					L9_137 = "\230\175\143\230\151\1655\231\130\185"
			end
			else
				L10_138 = L3_131.refresh_type
				if L10_138 then
					L10_138 = L3_131.refresh_type
					if L10_138 == 3 then
						L9_137 = "\230\180\187\229\138\168\231\187\147\231\174\151\229\144\142"
					end
				end
			end
		end
		L10_138 = L8_136
		L8_136 = L10_138 .. L4_4("\230\156\172\230\142\146\232\161\140\230\166\156%s\229\136\183\230\150\176", L9_137)
		L10_138 = {}
		L10_138[1] = _UPVALUE2_.settle_type.daily
		L10_138[2] = _UPVALUE2_.settle_type.weekly
		L6_134, _FOR_, _FOR_ = L1_1(L10_138)
		for _FORV_8_, _FORV_9_ in L6_134, _FOR_, _FOR_ do
			if L11_11.get_config_by_rank_id_and_settlement(A0_128, _FORV_9_) then
				if L11_11.get_config_by_rank_id_and_settlement(A0_128, _FORV_9_).settlement == 1 then
				elseif L11_11.get_config_by_rank_id_and_settlement(A0_128, _FORV_9_).settlement == 2 then
				end
			end
			if "\230\175\143\229\145\168\228\184\1285\231\130\185" then
				L8_136 = L8_136 .. L4_4("\239\188\140%s\231\187\147\231\174\151", "\230\175\143\229\145\168\228\184\1285\231\130\185")
				break
			end
		end
	end
	return L8_136
end
function L31_31.table_contains(A0_144, A1_145)
	if A0_144 == nil then
		L4_148 = false
		return L4_148
	end
	L4_148 = _ENV
	L4_148, L3_147, _FOR_ = L4_148(A0_144)
	for _FORV_5_, _FORV_6_ in L4_148, L3_147, _FOR_ do
		if _FORV_6_ == A1_145 then
			return _FORV_5_
		end
	end
	L4_148 = false
	return L4_148
end
function L31_31.get_rank_desc(A0_149, A1_150, A2_151)
	local L3_152
	L3_152 = {}
	L3_152.type = _ENV.desc_type.text
	L3_152.value = "\230\151\160"
	local L4_153 = L4_153
	L4_153 = L4_153(A0_149)
	if A0_149 == _ENV.rank_type.pvp_v3 then
	elseif A0_149 == _ENV.rank_type.pvp_common or A0_149 == _ENV.rank_type.pvp_common_act or A0_149 == _ENV.rank_type.gold_miner then
		L3_152.type = _ENV.desc_type.image
		L3_152.atlas = "Icon/Rank"
		L3_152.sprite = "cup_256"
		if not (A1_150 and A1_150.rank_data) or not A1_150.rank_data[1] then
		end
		L3_152.value = 0
	elseif A0_149 == _ENV.rank_type.tower or A0_149 == _ENV.rank_type.tower_act then
		L3_152.value = 0
		if A1_150 and A1_150.rank_data and A1_150.rank_data[1] then
			if L14_14.get_config(A1_150.rank_data[1]) then
			end
			L3_152.value = L7_7.get_string(L14_14.get_config(A1_150.rank_data[1]).name)
		end
		if not L4_153.take_snapshot_before_rank then
		end
		L3_152.show_dapei_rank = 10
	elseif A0_149 == _ENV.rank_type.main_dungeon or A0_149 == _ENV.rank_type.main_dungeon_act then
		if A1_150 and A1_150.rank_data then
			if A1_150.rank_data[1] and A1_150.rank_data[2] and A1_150.rank_data[1] > 0 and 0 < A1_150.rank_data[2] then
				if DataConfigs.dungeon_main.get_dungeons_by_difficulty_and_chapter(1, A1_150.rank_data[1]) then
				end
				if DataConfigs.dungeon_main.get_dungeons_by_difficulty_and_chapter(1, A1_150.rank_data[1])[A1_150.rank_data[2]] then
					L3_152.value = Game.module.dungeon_main.get_dungeon_main4_dungeon_name(DataConfigs.dungeon_main.get_dungeons_by_difficulty_and_chapter(1, A1_150.rank_data[1])[A1_150.rank_data[2]])
				else
					L3_152.value = L4_4("\231\172\172%s\231\171\160 \231\172\172%s\229\133\179", A1_150.rank_data[1], A1_150.rank_data[2])
				end
			else
				L3_152.value = "\230\151\160"
			end
		end
	elseif A0_149 == _ENV.rank_type.mystery_dungeon then
		if A1_150 and A1_150.rank_data and A1_150.rank_data[1] and A1_150.rank_data[2] then
			if A2_151 then
				L3_152.value = L4_4("\231\172\172%s\230\179\162\n%s\232\189\174\230\172\161", A1_150.rank_data[1], L5_5(A1_150.rank_data[2]))
			else
				L3_152.value = L4_4("\231\172\172%s\230\179\162-%s\232\189\174\230\172\161", A1_150.rank_data[1], L5_5(A1_150.rank_data[2]))
			end
		end
		if not L4_153.take_snapshot_before_rank then
		end
		L3_152.show_dapei_rank = 10
	elseif A0_149 == _ENV.rank_type.pve then
		if A1_150 and A1_150.rank_data and A1_150.rank_data[1] and A1_150.rank_data[2] then
			if A2_151 then
				L3_152.value = L4_4("%s\n%s\229\155\158\229\144\136", L7_7.get_string(L10_10.get_config(L5_5(A1_150.rank_data[1])).name), A1_150.rank_data[2])
			else
				L3_152.value = L4_4("%s -%s\229\155\158\229\144\136", L7_7.get_string(L10_10.get_config(L5_5(A1_150.rank_data[1])).name), A1_150.rank_data[2])
			end
		end
	elseif A0_149 == _ENV.rank_type.pve_1 or A0_149 == _ENV.rank_type.pve_2 or A0_149 == _ENV.rank_type.pve_3 or A0_149 == _ENV.rank_type.pve_4 or A0_149 == _ENV.rank_type.pve_5 then
		if A1_150 and A1_150.rank_data and A1_150.rank_data[1] then
			if A2_151 then
				L3_152.value = L17_17.get_date_time_str(A1_150.rank_data[1], [[
yyyy-MM-dd
HH:mm]])
			else
				L3_152.value = L17_17.get_date_time_str(A1_150.rank_data[1], "yyyy-MM-dd HH:mm")
			end
		end
	elseif A0_149 == _ENV.rank_type.pve_tower_all or L29_29.table_contains(_ENV.rank_sub_list[_ENV.rank_type.pve_tower_sub], A0_149) then
		if A1_150 and A1_150.rank_data and A1_150.rank_data[1] and A1_150.rank_data[2] then
			if A2_151 then
				L3_152.value = L4_4("\231\172\172%s\229\177\130\n%s\229\155\158\229\144\136", A1_150.rank_data[1], L5_5(A1_150.rank_data[2]))
			else
				L3_152.value = L4_4("\231\172\172%s\229\177\130-%s\229\155\158\229\144\136", A1_150.rank_data[1], L5_5(A1_150.rank_data[2]))
			end
		end
		if not L4_153.take_snapshot_before_rank then
		end
		L3_152.show_dapei_rank = 10
	elseif A0_149 == _ENV.rank_type.legend_fight then
		if A1_150 and A1_150.rank_data and A1_150.rank_data[1] and A1_150.rank_data[2] then
			L3_152.type = _ENV.desc_type.image
			L3_152.atlas = "Icon/Rank"
			L3_152.sprite = "dungeonmain_icon_star01"
			L3_152.info = clone(A1_150.rank_data)
			L3_152.info[2] = L5_5(L3_152.info[2])
			if A2_151 then
				L3_152.value = L4_4("%s\230\152\159\n%s\232\189\174", A1_150.rank_data[1], L5_5(A1_150.rank_data[2]))
			else
				L3_152.value = L4_4("%s\230\152\159-%s\232\189\174", A1_150.rank_data[1], L5_5(A1_150.rank_data[2]))
			end
		end
	elseif A0_149 == _ENV.rank_type.label then
		if A1_150 and A1_150.rank_data and A1_150.rank_data[1] and A1_150.rank_data[2] and A1_150.rank_data[3] then
			L3_152.value = Game.module.label.format_label_name(A1_150.rank_data[1], A1_150.rank_data[3], nil, true, true).text
			L3_152.outline = _UPVALUE9_.get_color_by_hex_str(Game.module.label.format_label_name(A1_150.rank_data[1], A1_150.rank_data[3], nil, true, true).outline)
		end
	else
		if A0_149 == _ENV.rank_type.single_boss then
			if not (A1_150 and A1_150.rank_data and A1_150.rank_data[1]) then
				goto lbl_623
			end
			if not L6_6.single_boss.get_config(A1_150.rank_data[1]) or not L7_7.get_string(L6_6.single_boss.get_config(A1_150.rank_data[1]).name) then
			end
			if not A1_150.rank_data[2] then
			end
			local L11_160 = L11_160
			local L12_161 = L12_161
			L3_152.value = L4_4("[%s] %s%%", "", 0)
			break -- pseudo-goto
		end
		L11_160 = _ENV
		L11_160 = L11_160.rank_type
		L11_160 = L11_160.xingji
		if A0_149 == L11_160 then
			if not A1_150 then
				goto lbl_623
			end
			L11_160 = A1_150.rank_data
			if not L11_160 then
				goto lbl_623
			end
			L11_160 = A1_150.rank_data
			L11_160 = L11_160[1]
			if not L11_160 then
				goto lbl_623
			end
			L11_160 = A1_150.rank_data
			L11_160 = L11_160[2]
			if not L11_160 then
				goto lbl_623
			end
			L11_160 = L10_10
			L11_160 = L11_160.get_config
			L12_161 = L5_5
			L12_161 = L12_161(A1_150.rank_data[1])
			L11_160 = L11_160(L12_161, L12_161(A1_150.rank_data[1]))
			if A2_151 then
				L12_161 = L4_4
				L12_161 = L12_161("%s\n%s\229\155\158\229\144\136", L7_7.get_string(L11_160.name), A1_150.rank_data[2])
				L3_152.value = L12_161
			else
				L12_161 = L4_4
				L12_161 = L12_161("%s -%s\229\155\158\229\144\136", L7_7.get_string(L11_160.name), A1_150.rank_data[2])
				L3_152.value = L12_161
				do break end -- pseudo-goto
				L11_160 = _ENV
				L11_160 = L11_160.rank_type
				L11_160 = L11_160.dungeon_stake_dmg
				if A0_149 == L11_160 then
					if A1_150 then
						L11_160 = A1_150.rank_data
						if L11_160 then
							L11_160 = A1_150.rank_data
							L11_160 = L11_160[1]
							if L11_160 then
								goto lbl_555
							end
						end
					end
					L11_160 = "\230\151\160"
					::lbl_555::
					L3_152.value = L11_160
					L11_160 = L4_153.take_snapshot_before_rank
					if not L11_160 then
						L11_160 = 10
					end
					L3_152.show_dapei_rank = L11_160
				else
					L11_160 = _ENV
					L11_160 = L11_160.rank_type
					L11_160 = L11_160.location_rank
					if A0_149 == L11_160 then
						if A1_150 then
							L11_160 = A1_150.score
							if L11_160 then
								goto lbl_573
							end
						end
						L11_160 = "\230\151\160"
						::lbl_573::
						L3_152.value = L11_160
						L11_160 = _UPVALUE11_
						L11_160 = L11_160.is_in_change_location_no_rank
						L11_160 = L11_160()
						L3_152.is_cd = L11_160
						break -- pseudo-goto
					end
					L11_160 = _ENV
					L11_160 = L11_160.rank_type
					L11_160 = L11_160.alliance_trial_group
					if A0_149 == L11_160 then
						if A1_150 then
							L11_160 = A1_150.rank_data
							if L11_160 then
								L11_160 = A1_150.rank_data
								L11_160 = L11_160[1]
								if L11_160 then
									goto lbl_594
								end
							end
						end
						L11_160 = 0
						::lbl_594::
						if A1_150 then
							L12_161 = A1_150.rank_data
							if L12_161 then
								L12_161 = A1_150.rank_data
								L12_161 = L12_161[2]
								L12_161 = L12_161 / 100
								if L12_161 then
									goto lbl_605
								end
							end
						end
						L12_161 = 0
						::lbl_605::
						local L8_157 = L8_157
						local L9_158 = L9_158
						local L8_157, L10_159 = L8_157(L9_158, L11_160, L12_161), L10_159
						repeat
							L3_152.value = L8_157
							do break end -- pseudo-goto
							if A1_150 then
								L11_160 = A1_150.rank_data
								if L11_160 then
									L11_160 = A1_150.rank_data
									L11_160 = L11_160[1]
									if L11_160 then
										goto lbl_622
									end
								end
							end
							L11_160 = "\230\151\160"
							::lbl_622::
							L3_152.value = L11_160
						until true
					end
				end
			end
		end
	end
	::lbl_623::
	return L3_152
end
function L31_31.get_rank_tag(A0_162, A1_163)
	local L2_164
	L2_164 = _ENV
	L2_164 = L2_164.rank_type
	L2_164 = L2_164.tower
	if A0_162 ~= L2_164 then
		L2_164 = _ENV
		L2_164 = L2_164.rank_type
		L2_164 = L2_164.tower_act
		if A0_162 ~= L2_164 then
			goto lbl_16
		end
	end
	L2_164 = A1_163.rank_index
	if L2_164 == 1 then
		L2_164 = true
		return L2_164
	end
	::lbl_16::
	L2_164 = false
	return L2_164
end
function L31_31.req_rank_info(A0_165, A1_166, A2_167, A3_168)
	local L4_169 = L4_169
	local L4_169, L5_170 = L4_169(A0_165), L5_170
	if not A3_168 then
		A3_168 = 1
	end
	L5_170 = A1_166 or L5_170
	if not A1_166 then
		L5_170 = L4_169.rank_limit
	end
	if A2_167 == nil and L4_169.scope_group_type == 1 then
		A2_167 = Game.module.alliance.data.get_my_alliance_id()
	end
	local L6_171 = L6_171
	local L7_172 = L7_172
	local L8_173 = L8_173
	local L9_174 = L9_174
	L6_171(L7_172, L8_173, L9_174, A2_167)
	local L10_175 = L10_175
end
function L31_31.req_rank_info_by_page(A0_176, A1_177, A2_178, A3_179, A4_180, A5_181)
	local L8_184 = _ENV.get_config
	local L8_184, L7_183 = L8_184(A0_176), L7_183
	if not A3_179 then
		A3_179 = 1
	end
	L7_183 = A1_177 or L7_183
	if not A1_177 then
		L7_183 = L8_184.rank_limit
	end
	if A5_181 == nil and L8_184.scope_group_type == 1 then
		A5_181 = Game.module.alliance.data.get_my_alliance_id()
	end
	local L9_185 = L9_185
	local L10_186 = L10_186
	local L11_187 = L11_187
	local L12_188 = L12_188
	local L13_189 = L13_189
	local L14_190 = L14_190
	do return L10_186(L11_187, L12_188, L13_189, L14_190, A4_180, A5_181) end
	local L15_191 = L15_191
end
function L31_31.get_rank_preview_reward_by_type(A0_192, A1_193, A2_194)
	local L8_200, L9_201, L10_202 = _ENV.get_config_by_rank_id_and_settlement, L9_201, L10_202
	L9_201 = A0_192
	L10_202 = A1_193
	L8_200 = L8_200(L9_201, L10_202)
	L9_201 = L8_200.settle_id
	L10_202 = L8_200.settlement
	L11_203 = _UPVALUE1_
	L11_203 = L11_203.settle_type
	L11_203 = L11_203.season
	if L10_202 == L11_203 then
		L10_202 = Game
		L10_202 = L10_202.module
		L10_202 = L10_202.season
		L11_203 = L10_202.data
		L11_203 = L11_203.get_season_info
		L11_203 = L11_203()
		L11_203 = L11_203.season_id
		L9_201 = L8_200.settle_id[L11_203] or L9_201
		if not L8_200.settle_id[L11_203] then
			L9_201 = L8_200.settle_id[1]
		end
	end
	L10_202 = L12_12
	L10_202 = L10_202.get_configs_by_settlement_id
	L11_203 = L9_201
	L10_202 = L10_202(L11_203)
	if not L10_202 then
		L11_203 = {}
		return L11_203
	end
	L11_203 = L0_0
	L11_203, L7_199, _FOR_ = L11_203(L10_202)
	for _FORV_9_, _FORV_10_ in L11_203, L7_199, _FOR_ do
		if A2_194 >= _FORV_10_.min_rank and A2_194 <= _FORV_10_.max_rank then
			return _FORV_10_.reward
		end
	end
	L11_203 = {}
	return L11_203
end
