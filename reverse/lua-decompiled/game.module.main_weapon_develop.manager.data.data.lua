local L0_0, L1_1
L0_0 = assert
local L1_1, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L37_37, L38_38, L43_43, L44_44, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60, L61_61, L62_62, L63_63 = DataConfigs, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L37_37, L38_38, L43_43, L44_44, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60, L61_61, L62_62, L63_63
L1_1 = L1_1.item
L7_7 = import
L8_8 = "..head"
L7_7 = L7_7(L8_8)
L8_8 = L0_0
L9_9 = L7_7.data
L8_8 = L8_8(L9_9)
L9_9 = L0_0
L10_10 = L7_7.const
L9_9 = L9_9(L10_10)
L10_10 = require
L11_11 = "game.other.server_time"
L10_10 = L10_10(L11_11)
L11_11 = Game
L11_11 = L11_11.module
L11_11 = L11_11.bag
L12_12 = L11_11.data
L13_13 = Game
L13_13 = L13_13.module
L13_13 = L13_13.bag
L13_13 = L13_13.const
L14_14 = DataConfigs
L14_14 = L14_14.weapon_sit
L15_15 = DataConfigs
L15_15 = L15_15.attr
L16_16 = DataConfigs
L16_16 = L16_16.weapon_tag
L17_17 = DataConfigs
L17_17 = L17_17.weapon_bag_list
L18_18 = DataConfigs
L18_18 = L18_18.skill
L19_19 = DataConfigs
L19_19 = L19_19.weapon_pos
L20_20 = DataConfigs
L20_20 = L20_20.weapon
L23_23 = DataConfigs
L23_23 = L23_23.language_define
L24_24 = DataConfigs
L24_24 = L24_24.weapon_camp
L25_25 = DataConfigs
L25_25 = L25_25.equip
L26_26 = DataConfigs
L26_26 = L26_26.equip_effect
L27_27 = DataConfigs
L27_27 = L27_27.weapon_injection
L28_28 = require
L29_29 = "game.other.player_prefs"
L28_28 = L28_28(L29_29)
L29_29 = Game
L29_29 = L29_29.module
L29_29 = L29_29.season
L30_30 = Game
L30_30 = L30_30.server_time
L31_31 = DataConfigs
L31_31 = L31_31.misc
L32_32 = L31_31.season_weapon_revert_limit
L32_32 = L32_32.val
L33_33 = Game
L33_33 = L33_33.module
L33_33 = L33_33.open_func
L34_34 = L33_33.const
L37_37 = GlobalConst
L37_37 = L37_37.equ_pos
L38_38 = L9_9.max_weapon_num
L43_43 = string
L43_43 = L43_43.format
L44_44 = math
L44_44 = L44_44.floor
L45_45 = table
L45_45 = L45_45.insert
L46_46 = table
L46_46 = L46_46.sort
L47_47 = table
L47_47 = L47_47.remove
L48_48 = require
L49_49 = "game.module.tips.view.try_to_cost.core"
L48_48 = L48_48(L49_49)
L49_49 = BroadcastTips
L50_50 = Game
L50_50 = L50_50.module
L50_50 = L50_50.data
L51_51 = L7_7.plan_data
L52_52 = require
L53_53 = "game.interface.attr"
L52_52 = L52_52(L53_53)
L54_54 = L52_52
L53_53 = L52_52.implement
L55_55 = L8_8
L53_53(L54_54, L55_55)
L53_53 = GlobalConst
L53_53 = L53_53.item_quality
L53_53 = L53_53.pink
L54_54 = GlobalConst
L54_54 = L54_54.item_quality
L54_54 = L54_54.purple
L55_55 = {}
function L56_56()
	_ENV.reset()
	_ENV.refresh_weapon_quality_dic()
	_ENV.refresh_weapon_cfg()
	_ENV.refresh_equip_cfg_dic()
	_ENV.init_star()
	_ENV.init_bond()
	_ENV.init_suit()
	_ENV.init_strength_return()
end
L8_8.init = L56_56
function L56_56()
	_ENV.reset()
end
L8_8.clear = L56_56
function L56_56()
	L2_66 = _ENV.reset_star
	L2_66()
	L2_66 = _ENV
	L2_66 = L2_66.reset_bond
	L2_66()
	L2_66 = _ENV
	L2_66 = L2_66.reset_suit
	L2_66()
	L2_66 = _ENV
	L2_66 = L2_66.reset_strength_return
	L2_66()
	L2_66 = _ENV
	L2_66 = L2_66.reset_master
	L2_66()
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_dic = L3_67
	L2_66 = _ENV
	L2_66.weapon_list = nil
	L2_66 = _ENV
	L3_67 = {}
	L2_66.k_v = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_base_attr_cfg = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_unlock_dic = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_is_equip_dic = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_rating_dic = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_open_dic = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_season_open_dic = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_quality_dic = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_cfg_dic = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_limit_cfg_dic = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_cfg_by_group_dic = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.equip_cfg_dic = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_artifact_dic = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.slot_func_id = L3_67
	L2_66 = pairs
	L3_67 = L19_19
	L2_66, L3_67, L4_68 = L2_66(L3_67)
	for _FORV_3_, _FORV_4_ in L2_66, L3_67, L4_68 do
		table.insert(_ENV.slot_func_id, _FORV_4_.open_fun_id)
		local L7_71 = L7_71
	end
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_replace_display_dic = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.has_viewed_weapon_in_equip_mode = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.weapon_view_dic = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.skill_list = L3_67
	L2_66 = _ENV
	L3_67 = {}
	L2_66.skill_id_to_list = L3_67
end
L8_8.reset = L56_56
function L56_56()
	local L0_72
	L0_72 = pairs
	local L2_74, L6_78 = _ENV, L6_78
	L2_74 = L2_74.get_all_cfg
	L2_74, L3_75, L4_76, L5_77, L6_78 = L2_74()
	L0_72, L2_74, L3_75 = L0_72(L2_74, L3_75, L4_76, L5_77, L6_78, L2_74())
	for L4_76, L5_77 in L0_72, L2_74, L3_75 do
		L6_78 = L3_3
		L6_78 = L6_78.equip_cfg_dic
		local L7_79 = L7_79
		local L8_80 = L25_25.get_equip_cfg(L5_77.id)
		L6_78[L7_79] = L8_80
		L6_78 = L3_3
		L6_78 = L6_78.weapon_artifact_dic
		L7_79 = L5_77.id
		L8_80 = L3_3
		L8_80 = L8_80.equip_cfg_dic
		L8_80 = L8_80[L5_77.id]
		L8_80 = L8_80.artifact
		L8_80 = L8_80 == 1
		L6_78[L7_79] = L8_80
	end
end
L8_8.refresh_equip_cfg_dic = L56_56
function L56_56()
	local L4_85, L5_86 = _ENV._has_init_weapon_view_dic, L5_86
	if L4_85 then
		return
	end
	L4_85 = _ENV
	L4_85._has_init_weapon_view_dic = true
	L4_85 = L28_28
	L4_85 = L4_85.get_player_data
	L5_86 = "weapon_view_dic"
	L6_87 = "string"
	L4_85 = L4_85(L5_86, L6_87)
	if not L4_85 then
		return
	end
	L5_86 = table
	L5_86 = L5_86.clear
	L6_87 = _ENV
	L6_87 = L6_87.weapon_view_dic
	L5_86(L6_87)
	if L4_85 == "" then
		return
	end
	L5_86 = string
	L5_86 = L5_86.split
	L6_87 = L4_85
	L7_88 = "-"
	L5_86 = L5_86(L6_87, L7_88)
	L6_87 = ipairs
	L7_88 = L5_86
	L6_87, L7_88, _FOR_ = L6_87(L7_88)
	for _FORV_5_, _FORV_6_ in L6_87, L7_88, _FOR_ do
		_ENV.weapon_view_dic[tonumber(_FORV_6_)] = true
	end
end
L8_8.init_weapon_view_dic = L56_56
function L56_56()
	local L4_95, L5_96 = _ENV._has_weapon_replace_display_dic, L5_96
	if L4_95 then
		return
	end
	L4_95 = _ENV
	L4_95._has_weapon_replace_display_dic = true
	L4_95 = L28_28
	L4_95 = L4_95.get_player_data
	L5_96 = "weapon_replace_display"
	L6_97 = "string"
	L4_95 = L4_95(L5_96, L6_97)
	if not L4_95 then
		return
	end
	L5_96 = string
	L5_96 = L5_96.split
	L6_97 = L4_95
	L5_96 = L5_96(L6_97, "|")
	L6_97 = table
	L6_97 = L6_97.clear
	L6_97(_ENV.weapon_replace_display_dic)
	L6_97 = ipairs
	L6_97, L3_94, _FOR_ = L6_97(L5_96)
	for _FORV_5_, _FORV_6_ in L6_97, L3_94, _FOR_ do
		local L10_101 = L10_101
		local L11_102 = L11_102
		L11_102[tonumber(string.split(_FORV_6_, "-")[1])] = tonumber(string.split(_FORV_6_, "-")[2])
	end
end
L8_8.init_weapon_replace_display_dic = L56_56
function L56_56(A0_103)
	local L1_104
	L1_104 = _ENV
	L1_104 = L1_104.weapon_view_dic
	L1_104[A0_103] = true
	L1_104 = ""
	L5_108 = pairs
	L5_108, _FOR_, _FOR_ = L5_108(_ENV.weapon_view_dic)
	for _FORV_5_, _FORV_6_ in L5_108, _FOR_, _FOR_ do
		if _FORV_6_ then
			if L1_104 == "" then
				L1_104 = _FORV_5_
			else
				L1_104 = string.format("%s-%s", L1_104, _FORV_5_)
			end
		end
	end
	L5_108 = L28_28
	L5_108 = L5_108.set_player_data
	L8_110 = "weapon_view_dic"
	L9_111 = L1_104
	L5_108(L8_110, L9_111)
end
L8_8.update_weapon_view_dic = L56_56
function L56_56()
	local L0_113
	L0_113 = pairs
	L2_115 = _ENV
	L2_115 = L2_115.get_all_cfg
	L2_115, L3_116, L4_117 = L2_115()
	L0_113, L2_115, L3_116 = L0_113(L2_115, L3_116, L4_117, L2_115())
	for L4_117, _FORV_4_ in L0_113, L2_115, L3_116 do
		local L6_119 = L6_119
		L6_119(_FORV_4_.id, true)
		local L7_120 = L7_120
	end
end
L8_8.refresh_weapon_rating_dic = L56_56
function L56_56(A0_121)
	local L1_122
	L1_122 = _ENV
	L1_122 = L1_122.weapon_rating_dic
	L1_122 = L1_122[A0_121]
	if not L1_122 then
		L1_122 = 0
	end
	return L1_122
end
L8_8.get_or_init_weapon_rating = L56_56
function L56_56(A0_123)
	local L1_124, L2_125, L3_126
	L1_124 = _ENV
	local L1_124, L6_129 = L1_124.weapon_star_cfg_dic, L6_129
	L1_124 = L1_124[A0_123]
	if not L1_124 then
		L1_124 = false
		return L1_124
	end
	L1_124 = _ENV
	L1_124 = L1_124.weapon_open_dic
	L1_124 = L1_124[A0_123]
	if L1_124 then
		L1_124 = _ENV
		L1_124 = L1_124.weapon_season_open_dic
		L1_124 = L1_124[A0_123]
	end
	if not L1_124 then
		L2_125 = false
		return L2_125
	end
	L2_125 = _ENV
	L2_125 = L2_125.weapon_unlock_dic
	L2_125 = L2_125[A0_123]
	if L2_125 then
		L3_126 = false
		return L3_126
	end
	L3_126 = _ENV
	L3_126 = L3_126.weapon_star_cfg_dic
	L3_126 = L3_126[A0_123]
	L3_126 = L3_126[1]
	L6_129 = L1_1
	L6_129 = L6_129.get_item
	local L6_129, L5_128 = L6_129(L3_126.cost_shards[1]), L5_128
	L5_128 = L6_129.syn_effect
	if L5_128 and next(L5_128) then
		local L7_130 = L7_130
		local L8_131 = L48_48.get_item_count(L6_129.id)
		L7_130 = L8_131 >= L5_128[1]
	end
	return L7_130
end
L8_8.can_weapon_unlock_by_pieces = L56_56
function L56_56()
	L4_136 = _ENV
	L4_136 = L4_136.get_all_cfg
	L4_136 = L4_136()
	L3_135, L4_136, _FOR_ = L3_135(L4_136, L4_136())
	for _FORV_3_, _FORV_4_ in L3_135, L4_136, _FOR_ do
		if L1_1.get_item(_FORV_4_.id) and L1_1.get_item(_FORV_4_.id).prototype and next(L1_1.get_item(_FORV_4_.id).prototype) then
			L3_3.weapon_cfg_dic[_FORV_4_.id] = L20_20[L1_1.get_item(_FORV_4_.id).prototype[1][2]]
		else
			L3_3.weapon_cfg_dic[_FORV_4_.id] = L20_20[_FORV_4_.id]
			if not L3_3.weapon_cfg_by_group_dic[L20_20[_FORV_4_.id].group] then
				L3_3.weapon_cfg_by_group_dic[L20_20[_FORV_4_.id].group] = {}
			end
			table.insert(L3_3.weapon_cfg_by_group_dic[L20_20[_FORV_4_.id].group], L20_20[_FORV_4_.id])
		end
		if L3_3.is_limit_time_weapon(_FORV_4_.id) then
			L3_3.weapon_limit_cfg_dic[_FORV_4_.id] = L3_3.weapon_cfg_dic[_FORV_4_.id]
		end
	end
	L3_135 = pairs
	L4_136 = L3_3
	L4_136 = L4_136.weapon_cfg_by_group_dic
	L3_135, L4_136, L7_139 = L3_135(L4_136)
	for L9_141, _FORV_4_ in L3_135, L4_136, L7_139 do
		table.sort(_FORV_4_, function(A0_142, A1_143)
			local L2_144, L3_145, L4_146
			L2_144 = _ENV
			L2_144 = L2_144.weapon_quality_dic
			L3_145 = A0_142.id
			L2_144 = L2_144[L3_145]
			L3_145 = _ENV
			L3_145 = L3_145.weapon_quality_dic
			L4_146 = A1_143.id
			L3_145 = L3_145[L4_146]
			L4_146 = L2_144 < L3_145
			return L4_146
		end)
	end
end
L8_8.refresh_weapon_cfg = L56_56
function L56_56()
	local L0_147
	L0_147 = pairs
	local L2_149, L8_155 = _ENV, L8_155
	L2_149 = L2_149.get_all_cfg
	L2_149, L3_150, L4_151, L7_154, L8_155 = L2_149()
	L0_147, L2_149, L3_150 = L0_147(L2_149, L3_150, L4_151, L7_154, L8_155, L2_149())
	for L4_151, L7_154 in L0_147, L2_149, L3_150 do
		L8_155 = L25_25
		L8_155 = L8_155.get_equip_cfg
		L8_155 = L8_155(L7_154.id)
		L3_3.weapon_quality_dic[L7_154.id] = L8_155.quality
	end
end
L8_8.refresh_weapon_quality_dic = L56_56
function L56_56()
	local L4_160, L5_161 = table.clear, L5_161
	L5_161 = _ENV
	L5_161 = L5_161.weapon_open_dic
	L4_160(L5_161)
	L4_160 = table
	L4_160 = L4_160.clear
	L5_161 = _ENV
	L5_161 = L5_161.weapon_season_open_dic
	L4_160(L5_161)
	L4_160 = L17_17
	L4_160 = L4_160.get_all_cfg
	L4_160 = L4_160()
	L5_161 = L5_5
	L5_161 = L5_161.get_server_open_day
	L5_161 = L5_161()
	L6_162 = pairs
	L7_163 = L4_160
	L6_162, L7_163, L8_164 = L6_162(L7_163)
	for _FORV_5_, _FORV_6_ in L6_162, L7_163, L8_164 do
		_ENV.weapon_open_dic[_FORV_6_.id] = _ENV.is_weapon_server_day_open(_FORV_6_.id)
		_ENV.weapon_season_open_dic[_FORV_6_.id] = _ENV.is_weapon_season_open(_FORV_6_.id)
	end
end
L8_8.refresh_weapon_open_dic = L56_56
function L56_56()
	L4_171 = _ENV
	L4_171 = L4_171.get_all_cfg
	L4_171 = L4_171()
	L3_170, L4_171, _FOR_ = L3_170(L4_171, L4_171())
	for _FORV_3_, _FORV_4_ in L3_170, L4_171, _FOR_ do
		L3_3.weapon_unlock_dic[_FORV_4_.id] = false
		L3_3.weapon_star_dic[_FORV_4_.id] = 0
	end
	L3_170 = L6_6
	L3_170 = L3_170.get_items
	L4_171 = L13_13
	L4_171 = L4_171.bag_type
	L4_171 = L4_171.main_weapon
	L5_172 = GlobalConst
	L5_172 = L5_172.item_type
	L5_172 = L5_172.equ
	L3_170 = L3_170(L4_171, L5_172)
	L4_171 = ipairs
	L5_172 = L3_170
	L4_171, L5_172, _FOR_ = L4_171(L5_172)
	for _FORV_4_, _FORV_5_ in L4_171, L5_172, _FOR_ do
		if L3_3.weapon_unlock_dic[_FORV_5_.cfg_id] ~= nil then
			L3_3.weapon_unlock_dic[_FORV_5_.cfg_id] = true
		end
		if not _FORV_5_.equip or not _FORV_5_.equip.weapon_star then
		end
		L3_3.weapon_star_dic[_FORV_5_.cfg_id] = 0
		L3_3.get_weapon_rating(_FORV_5_.cfg_id, false, true)
		local L9_176 = L9_176
	end
end
L8_8.refresh_weapon_unlock_dic = L56_56
function L56_56()
	local L0_177
	L0_177 = pairs
	L2_179 = _ENV
	L2_179 = L2_179.get_all_cfg
	L2_179, L3_180, L4_181, L7_184 = L2_179()
	L0_177, L2_179, L3_180 = L0_177(L2_179, L3_180, L4_181, L7_184, L2_179())
	for L4_181, L7_184 in L0_177, L2_179, L3_180 do
		local L6_183 = L3_3.is_weapon_equip(L7_184.id)
		L3_3.weapon_is_equip_dic[L7_184.id] = L6_183
	end
end
L8_8.refresh_weapon_is_equip_dic = L56_56
function L56_56(A0_185)
	local L1_186, L2_187
	L1_186 = _ENV
	L1_186 = L1_186.weapon_quality_dic
	L1_186 = L1_186[A0_185]
	L2_187 = L54_54
	if L1_186 < L2_187 then
		L2_187 = false
		return L2_187
	end
	L2_187 = _ENV
	L2_187 = L2_187.weapon_unlock_dic
	L2_187 = L2_187[A0_185]
	if L2_187 then
		L2_187 = _ENV
		L2_187 = L2_187.weapon_view_dic
		L2_187 = L2_187[A0_185]
		L2_187 = not L2_187
	end
	return L2_187
end
L8_8.has_weapon_new_point = L56_56
function L56_56(A0_188)
	if A0_188 then
		L4_192 = table
		L4_192 = L4_192.clear
		L5_193 = _ENV
		L5_193 = L5_193.weapon_dic
		L4_192(L5_193)
		L4_192 = ipairs
		L5_193 = A0_188
		L4_192, L5_193, _FOR_ = L4_192(L5_193)
		for _FORV_4_, _FORV_5_ in L4_192, L5_193, _FOR_ do
			_ENV.weapon_dic[_FORV_5_.pos] = _FORV_5_
		end
	end
	L4_192 = _ENV
	L4_192 = L4_192.refresh_weapon_is_equip_dic
	L4_192()
end
L8_8.init_weapon_pos_info = L56_56
function L56_56(A0_196)
	local L3_199, L7_203 = A0_196, L7_203
	L1_197, L3_199, L4_200 = L1_197(L3_199)
	for L5_201, L6_202 in L1_197, L3_199, L4_200 do
		L7_203 = _ENV
		L7_203 = L7_203.weapon_dic
		L7_203[L6_202.pos] = L6_202
	end
end
L8_8.update_weapon_pos_info = L56_56
function L56_56()
	local L0_204, L1_205, L2_206, L3_207, L4_208
	L0_204 = 0
	L1_205 = 1
	L2_206 = _ENV
	L3_207 = 1
	for L4_208 = L1_205, L2_206, L3_207 do
		local L5_209 = L5_209
		local L5_209, L6_210 = L5_209(L4_208), L6_210
		if L5_209 then
			L0_204 = L0_204 + 1
		end
	end
	return L0_204
end
L8_8.get_unlock_slot_num = L56_56
function L56_56()
	local L0_211, L1_212, L2_213, L3_214, L4_215
	L0_211 = {}
	L1_212 = 1
	L2_213 = _ENV
	L3_214 = 1
	for L4_215 = L1_212, L2_213, L3_214 do
		if L3_3.is_slot_unlock(L4_215) then
			local L5_216 = L5_216
			local L6_217 = L6_217
			L5_216(L6_217, L4_215)
			local L7_218 = L7_218
		end
	end
	return L0_211
end
L8_8.get_unlock_slot = L56_56
function L56_56(A0_219)
	local L5_224, L6_225, L9_228 = _ENV.get_item, L6_225, L9_228
	L6_225 = A0_219
	L5_224 = L5_224(L6_225)
	L6_225 = L29_29
	L6_225 = L6_225.get_cur_season_id
	L6_225 = L6_225()
	L9_228 = L29_29
	L9_228 = L9_228.get_season_time
	local L9_228, L4_223 = L9_228(L6_225)
	local L7_226 = L7_226
	local L8_227 = L8_227
	if L5_224.season_id ~= L6_225 or not (L32_32 - math.floor(L9_228(L6_225) / 86400)) then
	end
	return L5_224.season_id ~= 1 and (L6_225 < L5_224.season_id or L5_224.season_id == L6_225 and math.floor(L9_228(L6_225) / 86400) < L32_32), 0
end
L8_8.is_weapon_cur_season = L56_56
L56_56 = {}
function L57_57(A0_229, A1_230, A2_231)
	if not A2_231 then
		A2_231 = _ENV
	end
	L5_234 = table
	L5_234 = L5_234.clear
	L6_235 = A2_231
	L5_234(L6_235)
	L5_234 = 1
	L6_235 = L36_36
	L7_236 = 1
	for _FORV_6_ = L5_234, L6_235, L7_236 do
		if not L3_3.weapon_dic[_FORV_6_] or not L3_3.weapon_dic[_FORV_6_].item_cid then
		end
		if (not A0_229 or 0 < 0) and (not A1_230 or L3_3.is_slot_unlock(_FORV_6_)) then
			local L9_238 = L9_238
			if not L3_3.weapon_dic[_FORV_6_] then
				({}).item_cid = 0
				;({}).pos = _FORV_6_
			end
			table.insert(A2_231, {})
			local L10_239 = L10_239
		end
	end
	return A2_231
end
L8_8.get_weapon_slot = L57_57
function L57_57(A0_240, A1_241)
	local L6_246 = _ENV.get_weapon_slot
	L7_247 = A0_240
	L8_248 = A1_241
	L9_249 = {}
	L6_246 = L6_246(L7_247, L8_248, L9_249)
	L7_247 = pairs
	L8_248 = L6_246
	L7_247, L8_248, L9_249 = L7_247(L8_248)
	for _FORV_6_, _FORV_7_ in L7_247, L8_248, L9_249 do
		({}).item_cid = _FORV_7_.item_cid
		L6_246[_FORV_6_], ({}).pos = {}, _FORV_7_.pos
	end
	return L6_246
end
L8_8.get_weapon_slot_with_new_tb = L57_57
function L57_57()
	local L0_250, L1_251, L2_252, L3_253, L4_254, L5_255
	L0_250 = {}
	L1_251 = 1
	L2_252 = _ENV
	L3_253 = 1
	for L4_254 = L1_251, L2_252, L3_253 do
		L5_255 = L3_3
		L5_255 = L5_255.weapon_dic
		L5_255 = L5_255[L4_254]
		if L5_255 then
			L5_255 = L3_3
			L5_255 = L5_255.weapon_dic
			L5_255 = L5_255[L4_254]
			L5_255 = L5_255.item_cid
			if L5_255 ~= 0 then
				L5_255 = L3_3
				L5_255 = L5_255.weapon_dic
				L5_255 = L5_255[L4_254]
				return L5_255
			end
		end
	end
	L1_251 = {}
	L1_251.pos = 1
	L1_251.item_cid = 0
	return L1_251
end
L8_8.get_weapon_first_slot = L57_57
function L57_57(A0_256, A1_257)
	local L2_258, L3_259, L4_260
	L2_258 = _ENV
	L2_258 = L2_258.weapon_star_cfg_dic
	L2_258 = L2_258[A0_256]
	if not L2_258 then
		return
	end
	L2_258 = _ENV
	L2_258 = L2_258.weapon_star_cfg_dic
	L2_258 = L2_258[A0_256]
	L2_258 = L2_258[A1_257]
	if L2_258 then
		L3_259 = L18_18
		L4_260 = L2_258.skill
		L3_259 = L3_259[L4_260]
		return L3_259
	end
end
L8_8.get_weapon_skill = L57_57
function L57_57(A0_261, A1_262)
	local L2_263, L3_264
	L2_263 = _ENV
	L2_263 = L2_263.weapon_star_cfg_dic
	L2_263 = L2_263[A0_261]
	if not L2_263 then
		L3_264 = 0
		return L3_264
	end
	L3_264 = {}
	L7_268 = pairs
	L8_269 = L2_263
	L7_268, L8_269, _FOR_ = L7_268(L8_269)
	for _FORV_7_, _FORV_8_ in L7_268, L8_269, _FOR_ do
		if _FORV_8_.star == A1_262 and _FORV_8_.attrs and next(_FORV_8_.attrs) then
			_FOR_, _FOR_, _FOR_ = pairs(_FORV_8_.attrs)
			for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
				if not L3_264[_FORV_12_] then
				end
				L3_264[_FORV_12_] = 0 + _FORV_13_
			end
		end
	end
	L7_268 = 0
	L8_269 = pairs
	L9_270 = L3_264
	L8_269, L9_270, _FOR_ = L8_269(L9_270)
	for _FORV_8_, _FORV_9_ in L8_269, L9_270, _FOR_ do
		local L13_274 = L13_274
		local L13_274, L14_275 = L13_274(nil, _FORV_8_, _FORV_9_, L13_13.attr_source.weapon_base), L14_275
		L7_268 = L7_268 + L13_274
	end
	return L7_268
end
L8_8.get_weapon_star_rating = L57_57
function L57_57(A0_276)
	local L3_279, L4_280 = _ENV.weapon_star_cfg_dic, L4_280
	L3_279 = L3_279[A0_276]
	if not L3_279 then
		L3_279 = 0
		return L3_279
	end
	L3_279 = _ENV
	L3_279 = L3_279.get_weapon_star
	L4_280 = A0_276
	L3_279 = L3_279(L4_280)
	L4_280 = _ENV
	L4_280 = L4_280.weapon_star_cfg_dic
	L4_280 = L4_280[A0_276]
	if L4_280 then
		L4_280 = _ENV
		L4_280 = L4_280.weapon_star_cfg_dic
		L4_280 = L4_280[A0_276]
		L4_280 = L4_280[L3_279]
	end
	if L4_280 then
		return L18_18[L4_280.skill].lvl
	else
		return 0
	end
end
L8_8.get_weapon_skill_lv = L57_57
function L57_57(A0_281)
	local L1_282
	L1_282 = _ENV
	L1_282 = L1_282.weapon_dic
	L1_282 = L1_282[A0_281]
	if L1_282 then
		L1_282 = _ENV
		L1_282 = L1_282.weapon_dic
		L1_282 = L1_282[A0_281]
		L1_282 = L1_282.item_cid
		if L1_282 then
			goto lbl_13
		end
	end
	L1_282 = 0
	::lbl_13::
	return L1_282
end
L8_8.get_weapon_by_slot = L57_57
function L57_57(A0_283, A1_284)
	local L2_285
	L2_285 = _ENV
	L2_285 = L2_285[A0_283]
	L2_285 = L2_285.open_fun_id
	local L3_286 = L3_286
	local L3_286, L4_287 = L3_286(L2_285), L4_287
	if A1_284 and not L3_286 then
		L4_287 = L49_49
		L4_287 = L4_287.broadcast_tips
		local L5_288 = L5_288
		local L5_288, L6_289 = L5_288(L2_285)
		L4_287(L5_288, L6_289)
	end
	return L3_286
end
L8_8.is_slot_unlock = L57_57
function L57_57(A0_290)
	local L1_291 = L1_291
	local L1_291, L2_292 = L1_291(A0_290), L2_292
	L2_292 = L1_291 or A0_290
	L2_292 = L1_291 and 0 < L1_291
	return L2_292
end
L8_8.is_slot_fill = L57_57
function L57_57(A0_293)
	local L3_296 = _ENV.get_cfg_by_id
	L3_296 = L3_296(A0_293)
	local L2_295 = L5_5.get_server_open_day()
	if not L3_296.open_sever_limit or L2_295 < L3_296.open_sever_limit then
		return false
	end
	return true
end
L8_8.is_weapon_server_day_open = L57_57
function L57_57(A0_297)
	local L1_298 = _ENV.get_cur_season_id()
	if L1_298 then
		local L2_299 = L2_299
		local L2_299, L3_300 = L2_299(A0_297), L3_300
		if L2_299 then
			L3_300 = L2_299.season_id
			if not L3_300 then
				goto lbl_20
			end
			L3_300 = L2_299.season_id
			if not (L1_298 < L3_300) then
				goto lbl_20
			end
		end
		L3_300 = false
		return L3_300
	end
	::lbl_20::
	L2_299 = true
	return L2_299
end
L8_8.is_weapon_season_open = L57_57
function L57_57(A0_301)
	if not _ENV.is_weapon_server_day_open(A0_301) then
		return false
	else
		local L1_302 = L1_302
		local L1_302, L2_303 = L1_302(A0_301), L2_303
		if not L1_302 then
			L1_302 = false
			return L1_302
		end
	end
	L1_302 = true
	return L1_302
end
L8_8.is_weapon_open = L57_57
function L57_57(A0_304)
	local L1_305
	L1_305 = _ENV
	L1_305 = L1_305.weapon_unlock_dic
	L1_305 = L1_305[A0_304]
	return L1_305
end
L8_8.is_weapon_unlock = L57_57
function L57_57(A0_306)
	local L4_310 = _ENV.is_weapon_unlock
	L4_310 = L4_310(A0_306)
	local L2_308 = L2_308
	local L2_308, L3_309 = L2_308(A0_306)
	return not L4_310 and 0 < L3_309 and L3_309 <= L2_308
end
L8_8.can_weapon_unlock = L57_57
function L57_57(A0_311)
	L3_314 = _ENV
	L3_314 = L3_314.weapon_dic
	L1_312, L3_314, L4_315 = L1_312(L3_314)
	for L5_316, L6_317 in L1_312, L3_314, L4_315 do
		if L6_317.item_cid == A0_311 then
			return true
		end
	end
	L1_312 = false
	return L1_312
end
L8_8.is_weapon_equip = L57_57
function L57_57(A0_318)
	do return _ENV.get_bag_first_item_by_cid(A0_318) end
	local L2_319 = L2_319
end
L8_8.get_equip_info = L57_57
function L57_57(A0_320)
	local L8_328, L9_329 = _ENV.get_equip_info, L9_329
	L9_329 = A0_320
	L8_328 = L8_328(L9_329)
	if L8_328 then
		L9_329 = L8_328.equip
		L9_329 = L9_329.base_attr
		if L9_329 then
			L9_329 = L42_42
			L9_329(L8_328.equip.base_attr, _ENV.attr_sort_array)
			L9_329 = L8_328.equip
			L9_329 = L9_329.base_attr
			return L9_329
		end
	end
	L9_329 = _ENV
	L9_329 = L9_329.weapon_base_attr_cfg
	L9_329 = L9_329[A0_320]
	if not L9_329 then
		L9_329 = {}
		local L3_323 = L3_323
		local L3_323, L4_324 = L3_323(A0_320), L4_324
		L4_324 = L3_323.basic_limit
		_FOR_, _FOR_, _FOR_ = pairs(L4_324)
		for _FORV_8_, _FORV_9_ in _FOR_, _FOR_, _FOR_ do
			({}).attr_type = _FORV_8_
			;({}).val = _FORV_9_[1]
			L41_41(L9_329, {})
		end
		L10_330 = L42_42
		L11_331 = L9_329
		L13_333 = attr_sort_array
		L10_330(L11_331, L13_333)
		L10_330 = _ENV
		L10_330 = L10_330.weapon_base_attr_cfg
		L10_330[A0_320] = L9_329
	end
	L9_329 = _ENV
	L9_329 = L9_329.weapon_base_attr_cfg
	L9_329 = L9_329[A0_320]
	return L9_329
end
L8_8.get_weapon_attr = L57_57
function L57_57(A0_334)
	local L1_335
	L1_335 = _ENV
	L1_335 = L1_335.weapon_cfg_dic
	L1_335 = L1_335[A0_334]
	local L2_336 = L2_336
	local L2_336, L3_337 = L2_336(A0_334), L3_337
	if L2_336 then
		L3_337 = L2_336.equip
		L3_337 = L3_337.skin_id
		if L3_337 then
			L3_337 = L2_336.equip
			L3_337 = L3_337.skin_id
			if 0 < L3_337 then
				L3_337 = L2_336.equip
				L3_337 = L3_337.skin_id
				if L3_337 then
					goto lbl_24
				end
			end
		end
	end
	L3_337 = L1_335.skin_list
	L3_337 = L3_337[1]
	::lbl_24::
	return L3_337
end
L8_8.get_skin_id = L57_57
function L57_57(A0_338)
	local L1_339
	L1_339 = _ENV
	L1_339 = L1_339.weapon_cfg_dic
	L1_339 = L1_339[A0_338]
	return L1_339
end
L8_8.get_weapon_cfg = L57_57
function L57_57(A0_340, A1_341)
	local L2_342, L3_343, L4_344, L5_345
	L2_342 = _ENV
	local L2_342, L9_349 = L2_342.weapon_unlock_dic, L9_349
	L3_343 = A0_340.id
	L2_342 = L2_342[L3_343]
	L3_343 = _ENV
	L3_343 = L3_343.weapon_unlock_dic
	L4_344 = A1_341.id
	L3_343 = L3_343[L4_344]
	if L2_342 ~= L3_343 then
		return L2_342
	end
	L4_344 = _ENV
	L4_344 = L4_344.weapon_quality_dic
	L5_345 = A0_340.id
	L4_344 = L4_344[L5_345]
	L5_345 = _ENV
	L5_345 = L5_345.weapon_quality_dic
	L9_349 = A1_341.id
	L5_345 = L5_345[L9_349]
	if L4_344 ~= L5_345 then
		L9_349 = L4_344 > L5_345
		return L9_349
	end
	L9_349 = _ENV
	L9_349 = L9_349.is_limit_time_weapon
	L9_349 = L9_349(A0_340.id)
	local L7_347 = L7_347
	local L7_347, L8_348 = L7_347(A1_341.id), L8_348
	if L9_349 ~= L7_347 then
		return L7_347
	end
	L8_348 = A0_340.id
	L8_348 = L8_348 < A1_341.id
	return L8_348
end
function L58_58(A0_350, A1_351, A2_352)
	local L3_353
	L3_353 = {}
	L7_357 = pairs
	L8_358 = _ENV
	L8_358 = L8_358.weapon_cfg_dic
	L7_357, L8_358, _FOR_ = L7_357(L8_358)
	for _FORV_7_, _FORV_8_ in L7_357, L8_358, _FOR_ do
		if (_ENV.weapon_quality_dic[_FORV_8_.id] == A0_350 and A2_352 or A0_350 <= _ENV.weapon_quality_dic[_FORV_8_.id] and not A2_352) and _FORV_8_.group == A1_351 and _ENV.is_weapon_open(_FORV_8_.id) then
			table.insert(L3_353, _FORV_8_)
		end
	end
	L7_357 = #L3_353
	if 1 < L7_357 then
		L7_357 = table
		L7_357 = L7_357.sort
		L8_358 = L3_353
		L9_359 = L57_57
		L7_357(L8_358, L9_359)
	end
	L7_357 = L3_353[1]
	return L7_357
end
L8_8.get_weapon_by_quality_group = L58_58
L58_58 = {}
function L59_59(A0_362, A1_363, A2_364, A3_365)
	local L4_366
	L4_366 = {}
	L9_371 = table
	L9_371 = L9_371.clear
	L12_374 = _ENV
	L9_371(L12_374)
	if A0_362 then
		L9_371 = L22_22
		L9_371 = L9_371.get_config
		L12_374 = A0_362
		L9_371 = L9_371(L12_374)
		L12_374 = ipairs
		L13_375 = L9_371.job_type
		L12_374, L13_375, _FOR_ = L12_374(L13_375)
		for _FORV_9_, _FORV_10_ in L12_374, L13_375, _FOR_ do
			if not A1_363 or A1_363 == _FORV_10_ then
				_ENV[_FORV_10_] = true
			end
		end
		L12_374 = next
		L13_375 = _ENV
		L12_374 = L12_374(L13_375)
		if L12_374 then
			goto lbl_47
		end
		do return L4_366 end
		break -- pseudo-goto
	end
	if A1_363 then
		L9_371 = _ENV
		L9_371[A1_363] = true
	else
		L9_371 = ipairs
		L12_374 = L16_16
		L12_374 = L12_374.get_all_cfg
		L12_374, L13_375 = L12_374()
		L9_371, L12_374, L13_375 = L9_371(L12_374, L13_375, L12_374())
		for _FORV_8_, _FORV_9_ in L9_371, L12_374, L13_375 do
			_ENV[_FORV_9_.id] = true
			repeat
			until true
		end
	end
	::lbl_47::
	L9_371 = pairs
	L12_374 = L17_17
	L12_374 = L12_374.get_all_cfg
	L12_374, L13_375 = L12_374()
	L9_371, L12_374, L13_375 = L9_371(L12_374, L13_375, L12_374())
	for _FORV_8_, _FORV_9_ in L9_371, L12_374, L13_375 do
		if A2_364 then
		end
		if L3_3.weapon_cfg_dic[_FORV_9_.id] and L3_3.weapon_season_open_dic[_FORV_9_.id] and _ENV[L3_3.weapon_cfg_dic[_FORV_9_.id].job_type] and (false or L3_3.weapon_unlock_dic[_FORV_9_.id]) and (not A3_365 or not L3_3.is_weapon_equip(_FORV_9_.id)) then
			local L16_378 = L16_378
			table.insert(L4_366, _FORV_9_)
			local L17_379 = L17_379
		end
	end
	return L4_366
end
L8_8.get_all_weapon_list = L59_59
L59_59 = {}
L60_60 = {}
function L61_61(A0_380, A1_381)
	local L2_382, L3_383
	L2_382 = A0_380.id
	local L7_387, L8_388, L9_389 = L7_387, L8_388, L9_389
	if not L2_382 then
		L2_382 = A0_380.item_cid
	end
	L3_383 = A1_381.id
	if not L3_383 then
		L3_383 = A1_381.item_cid
	end
	L7_387 = _ENV
	L7_387 = L7_387.get_weapon_rating
	L8_388 = L2_382
	L7_387 = L7_387(L8_388)
	L8_388 = _ENV
	L8_388 = L8_388.get_weapon_rating
	L9_389 = L3_383
	L8_388 = L8_388(L9_389)
	if L7_387 ~= L8_388 then
		L9_389 = L7_387 > L8_388
		return L9_389
	end
	L9_389 = _ENV
	L9_389 = L9_389.weapon_artifact_dic
	L9_389 = L9_389[L2_382]
	if L9_389 ~= _ENV.weapon_artifact_dic[L3_383] then
		return L9_389
	end
	if _ENV.weapon_quality_dic[L2_382] ~= _ENV.weapon_quality_dic[L3_383] then
		return _ENV.weapon_quality_dic[L2_382] > _ENV.weapon_quality_dic[L3_383]
	end
	local L10_390 = L10_390
	local L11_391 = L11_391
	local L12_392 = L12_392
	if _ENV.get_weapon_star(L2_382) ~= _ENV.get_weapon_star(L3_383) then
		return _ENV.get_weapon_star(L2_382) > _ENV.get_weapon_star(L3_383)
	end
	return L2_382 > L3_383
end
L8_8.weapon_sort_func = L61_61
function L62_62(A0_393, A1_394)
	local L2_395, L3_396
	L2_395 = A0_393.pink_quality_num
	L3_396 = A1_394.pink_quality_num
	if L2_395 ~= L3_396 then
		L2_395 = A0_393.pink_quality_num
		L3_396 = A1_394.pink_quality_num
		L2_395 = L2_395 > L3_396
		return L2_395
	end
	L2_395 = A0_393.weapon_num
	L3_396 = A1_394.weapon_num
	if L2_395 ~= L3_396 then
		L2_395 = A0_393.weapon_num
		L3_396 = A1_394.weapon_num
		L2_395 = L2_395 > L3_396
		return L2_395
	end
	L2_395 = A0_393.quality_num
	L3_396 = A1_394.quality_num
	if L2_395 ~= L3_396 then
		L2_395 = A0_393.quality_num
		L3_396 = A1_394.quality_num
		L2_395 = L2_395 > L3_396
		return L2_395
	end
	L2_395 = A0_393.power_num
	L3_396 = A1_394.power_num
	if L2_395 ~= L3_396 then
		L2_395 = A0_393.power_num
		L3_396 = A1_394.power_num
		L2_395 = L2_395 > L3_396
		return L2_395
	end
	L2_395 = A0_393.star_num
	L3_396 = A1_394.star_num
	if L2_395 ~= L3_396 then
		L2_395 = A0_393.star_num
		L3_396 = A1_394.star_num
		L2_395 = L2_395 > L3_396
		return L2_395
	end
end
function L63_63(A0_397, A1_398)
	local L2_399, L3_400
	L2_399 = _ENV
	L2_399 = L2_399.weapon_quality_dic
	L2_399 = L2_399[A0_397]
	L3_400 = _ENV
	L3_400 = L3_400.weapon_quality_dic
	L3_400 = L3_400[A1_398]
	if L2_399 ~= L3_400 then
		return L2_399 > L3_400
	end
	local L4_401 = L4_401
	L4_401 = L4_401(A0_397)
	local L5_402 = L5_402
	L5_402 = L5_402(A1_398)
	if L4_401 ~= L5_402 then
		return L4_401 > L5_402
	end
	local L6_403 = L6_403
	L6_403 = L6_403(A0_397)
	local L7_404 = L7_404
	local L7_404, L8_405 = L7_404(A1_398), L8_405
	if L6_403 ~= L7_404 then
		L8_405 = L6_403 > L7_404
		return L8_405
	end
end
function L8_8.get_auto_wear_result(A0_406)
	local L6_412 = table.clear
	L6_412(_ENV)
	L6_412 = table
	L6_412 = L6_412.clear
	L6_412(_UPVALUE1_)
	L6_412 = table
	L6_412 = L6_412.clear
	L6_412(_UPVALUE2_)
	L6_412 = table
	L6_412 = L6_412.clear
	L6_412(_UPVALUE3_)
	L6_412 = L3_3
	L6_412 = L6_412.set_value
	L6_412("attr_sort_better_type", nil)
	L6_412 = L3_3
	L6_412 = L6_412.get_all_weapon_list
	L6_412 = L6_412(nil, nil, true)
	if not next(L6_412) then
		return L55_55
	end
	if not A0_406 then
		A0_406 = L3_3.get_unlock_slot()
	end
	if 3 <= #A0_406 then
		_FOR_, _FOR_, _FOR_ = pairs(L6_412)
		for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
			if not _UPVALUE1_[L14_14.get_cfg_by_job_type_num_wear_tb(L3_3.weapon_cfg_dic[_FORV_6_.id].job_type, 0, _UPVALUE7_).weapon_group_belong] then
				_UPVALUE1_[L14_14.get_cfg_by_job_type_num_wear_tb(L3_3.weapon_cfg_dic[_FORV_6_.id].job_type, 0, _UPVALUE7_).weapon_group_belong] = {}
			end
			if L3_3.weapon_quality_dic[_FORV_6_.id] >= L54_54 then
				table.insert(_UPVALUE1_[L14_14.get_cfg_by_job_type_num_wear_tb(L3_3.weapon_cfg_dic[_FORV_6_.id].job_type, 0, _UPVALUE7_).weapon_group_belong], _FORV_6_.id)
			end
		end
		_FOR_, _FOR_, _FOR_ = pairs(_UPVALUE1_)
		for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
			table.sort(_FORV_6_, L63_63)
			table.clear(_UPVALUE10_)
			table.clear(_UPVALUE11_)
			_FOR_ = 1
			for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
				if L3_3.weapon_quality_dic[_FORV_6_[_FORV_11_]] == L53_53 then
				end
				if not _UPVALUE10_[L3_3.weapon_cfg_dic[_FORV_6_[_FORV_11_]].group] then
					_UPVALUE10_[L3_3.weapon_cfg_dic[_FORV_6_[_FORV_11_]].group] = true
					table.insert(_UPVALUE11_, _FORV_6_[_FORV_11_])
				end
			end
			table.clear(_FORV_6_)
			_FOR_, _FOR_, _FOR_ = ipairs(_UPVALUE11_)
			for _FORV_11_, _FORV_12_ in _FOR_, _FOR_, _FOR_ do
				table.insert(_FORV_6_, _FORV_12_)
			end
			if 3 <= #_FORV_6_ or true then
				table.clear(_UPVALUE10_)
				table.clear(_UPVALUE13_)
				_FOR_ = -1
				for _FORV_12_ = _FOR_, _FOR_, _FOR_ do
					table.remove(_FORV_6_, _FORV_12_)
				end
				table.insert(_UPVALUE3_, _FORV_6_)
			end
		end
		L17_423 = next
		L17_423 = L17_423(_UPVALUE3_)
		if L17_423 then
			L17_423 = ipairs
			L17_423, _FOR_, _FOR_ = L17_423(_UPVALUE3_)
			for _FORV_5_, _FORV_6_ in L17_423, _FOR_, _FOR_ do
				_FOR_, _FOR_, _FOR_ = ipairs(_FORV_6_)
				for _FORV_16_, _FORV_17_ in _FOR_, _FOR_, _FOR_ do
					if L3_3.weapon_quality_dic[_FORV_17_] == L53_53 then
					end
				end
				;({}).star_num, ({}).power_num, ({}).quality_num, ({}).weapon_num, ({}).pink_quality_num = 0 + L3_3.get_weapon_star(_FORV_17_), 0 + L3_3.get_weapon_rating(_FORV_17_), 0 + L3_3.weapon_quality_dic[_FORV_17_], 0 + 1, 0 + 1
				;({}).result_list = _FORV_6_
				_UPVALUE2_[_FORV_5_] = {}
			end
			L17_423 = table
			L17_423 = L17_423.sort
			L18_424 = _UPVALUE2_
			L20_426 = L62_62
			L17_423(L18_424, L20_426)
			L17_423 = table
			L17_423 = L17_423.clear
			L18_424 = _UPVALUE10_
			L17_423(L18_424)
			L17_423 = ipairs
			L18_424 = _UPVALUE2_
			L18_424 = L18_424[1]
			L18_424 = L18_424.result_list
			L17_423, L18_424, L20_426 = L17_423(L18_424)
			for _FORV_5_, _FORV_6_ in L17_423, L18_424, L20_426 do
				_ENV[_FORV_5_] = _FORV_6_
				_UPVALUE10_[L3_3.weapon_cfg_dic[_FORV_6_].group] = true
				_FOR_, _FOR_, _FOR_ = ipairs(L6_412)
				for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
					if _FORV_13_.id == _FORV_6_ then
						table.remove(L6_412, _FORV_12_)
						break
					end
				end
			end
			L17_423 = table
			L17_423 = L17_423.sort
			L18_424 = L6_412
			L20_426 = L61_61
			L17_423(L18_424, L20_426)
			L17_423 = ipairs
			L18_424 = A0_406
			L17_423, L18_424, L20_426 = L17_423(L18_424)
			for _FORV_5_, _FORV_6_ in L17_423, L18_424, L20_426 do
				if not _ENV[_FORV_6_] and next(L6_412) then
					while 0 < #L6_412 do
						table.remove(L6_412, 1)
						if not _UPVALUE10_[L3_3.weapon_cfg_dic[L6_412[1].id].group] then
							_ENV[_FORV_6_] = L6_412[1].id
							_UPVALUE10_[L3_3.weapon_cfg_dic[L6_412[1].id].group] = true
							break
						end
					end
				end
			end
			L17_423 = {}
			L18_424 = pairs
			L20_426 = _ENV
			L18_424, L20_426, _FOR_ = L18_424(L20_426)
			for _FORV_6_, _FORV_7_ in L18_424, L20_426, _FOR_ do
				({}).pos = _FORV_6_
				;({}).item_cid = _FORV_7_
				table.insert(L17_423, {})
			end
			return L17_423
		end
	end
	L17_423 = table
	L17_423 = L17_423.clear
	L18_424 = _ENV
	L17_423(L18_424)
	L17_423 = table
	L17_423 = L17_423.clear
	L18_424 = L60_60
	L17_423(L18_424)
	L17_423 = L3_3
	L17_423 = L17_423.set_value
	L18_424 = "weapon_wear_type"
	L20_426 = nil
	L17_423(L18_424, L20_426)
	L17_423 = table
	L17_423 = L17_423.sort
	L18_424 = L6_412
	L20_426 = L61_61
	L17_423(L18_424, L20_426)
	L17_423 = ipairs
	L18_424 = A0_406
	L17_423, L18_424, L20_426 = L17_423(L18_424)
	for _FORV_5_, _FORV_6_ in L17_423, L18_424, L20_426 do
		if not next(L6_412) then
			break
		end
		_FOR_ = 1
		for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
			if not L60_60[L3_3.weapon_cfg_dic[L6_412[_FORV_10_].id].group] then
				L60_60[L3_3.weapon_cfg_dic[L6_412[_FORV_10_].id].group] = true
				;({}).pos = _FORV_6_
				;({}).item_cid = L6_412[_FORV_10_].id
				table.insert(_ENV, {})
				table.remove(L6_412, _FORV_10_)
				break
			end
		end
	end
	L17_423 = _ENV
	return L17_423
end
function L8_8.get_filter_wear_result(A0_427, A1_428)
	local L7_434 = _ENV.get_all_weapon_list
	L7_434 = L7_434(nil, nil, true)
	table.clear(_UPVALUE1_)
	table.clear(_UPVALUE2_)
	table.clear(_UPVALUE3_)
	table.clear(L59_59)
	L3_430, _FOR_, _FOR_ = L3_430(L7_434)
	for _FORV_6_, _FORV_7_ in L3_430, _FOR_, _FOR_ do
		if _ENV.weapon_cfg_dic[_FORV_7_.id].job_type == A0_427 then
			table.insert(_UPVALUE1_, _FORV_7_)
		else
			table.insert(_UPVALUE2_, _FORV_7_)
		end
	end
	L3_430 = false
	_FOR_, _FOR_, _FOR_ = ipairs(_UPVALUE1_)
	for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
		if _ENV.weapon_artifact_dic[_FORV_8_.id] then
			L3_430 = true
			break
		end
	end
	if not L3_430 then
		_FOR_ = -1
		for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
			if not _ENV.weapon_quality_dic[_UPVALUE1_[_FORV_7_].id] then
			end
			if 0 < L54_54 then
				table.insert(_UPVALUE3_, _UPVALUE1_[_FORV_7_])
				table.remove(_UPVALUE1_, _FORV_7_)
			end
		end
		_FOR_ = -1
		for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
			if not _ENV.weapon_quality_dic[_UPVALUE2_[_FORV_7_].id] then
			end
			if 0 < L54_54 then
				table.insert(_UPVALUE2_, _UPVALUE2_[_FORV_7_])
				table.remove(_UPVALUE2_, _FORV_7_)
			end
		end
	end
	L8_435 = table
	L8_435 = L8_435.sort
	L9_436 = _UPVALUE1_
	L8_435(L9_436, L61_61)
	L8_435 = table
	L8_435 = L8_435.sort
	L9_436 = _UPVALUE2_
	L8_435(L9_436, L61_61)
	L8_435 = next
	L9_436 = _UPVALUE3_
	L8_435 = L8_435(L9_436)
	if L8_435 then
		L8_435 = table
		L8_435 = L8_435.sort
		L9_436 = _UPVALUE3_
		L8_435(L9_436, L61_61)
	end
	if not A1_428 then
		L8_435 = _ENV
		L8_435 = L8_435.get_unlock_slot
		L8_435 = L8_435()
		A1_428 = L8_435
	end
	L8_435 = 1
	L9_436 = table
	L9_436 = L9_436.clear
	L9_436(_UPVALUE7_)
	L9_436 = ipairs
	L9_436, L6_433, _FOR_ = L9_436(A1_428)
	for _FORV_8_, _FORV_9_ in L9_436, L6_433, _FOR_ do
		if not next(_UPVALUE1_) and not next(_UPVALUE2_) and not next(_UPVALUE3_) then
			break
		end
		if next(_UPVALUE1_) then
			while next(_UPVALUE1_) do
				if not _UPVALUE7_[_ENV.weapon_cfg_dic[_UPVALUE1_[1].id].group] then
					_UPVALUE7_[_ENV.weapon_cfg_dic[_UPVALUE1_[1].id].group] = true
					;({}).pos = A1_428[_FORV_8_]
					;({}).item_cid = _UPVALUE1_[1].id
					table.insert(L59_59, {})
					table.remove(_UPVALUE1_, 1)
					if true then
						break
				end
				else
					table.remove(_UPVALUE1_, 1)
				end
			end
			break -- pseudo-goto
		end
		if next(_UPVALUE2_) then
			while next(_UPVALUE2_) do
				if not _UPVALUE7_[_ENV.weapon_cfg_dic[_UPVALUE2_[1].id].group] then
					_UPVALUE7_[_ENV.weapon_cfg_dic[_UPVALUE2_[1].id].group] = true
					;({}).pos = A1_428[_FORV_8_]
					;({}).item_cid = _UPVALUE2_[1].id
					table.insert(L59_59, {})
					table.remove(_UPVALUE2_, 1)
					break
				else
					table.remove(_UPVALUE2_, 1)
				end
			end
		elseif next(_UPVALUE3_) then
			while true do
				if not next(_UPVALUE3_) then
					break
				end
				if not _UPVALUE7_[_ENV.weapon_cfg_dic[_UPVALUE3_[1].id].group] then
					_UPVALUE7_[_ENV.weapon_cfg_dic[_UPVALUE3_[1].id].group] = true
					;({}).pos = A1_428[_FORV_8_]
					;({}).item_cid = _UPVALUE3_[1].id
					table.insert(L59_59, {})
					table.remove(_UPVALUE3_, 1)
					do break end
					break -- pseudo-goto
				end
				local L13_440 = L13_440
				table.remove(_UPVALUE3_, 1)
				local L14_441 = L14_441
				repeat
					repeat
					until true
				until true
			end
		end
	end
	L9_436 = L59_59
	return L9_436
end
function L8_8.get_empty_slot(A0_445)
	local L6_451 = _ENV.get_weapon_slot
	L6_451 = L6_451()
	if A0_445 then
		_FOR_, _FOR_, _FOR_ = ipairs(L6_451)
		for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_7_.item_cid > 0 and _ENV.is_slot_unlock(_FORV_7_.pos) and _ENV.weapon_cfg_dic[_FORV_7_.item_cid].group == L4_449.group then
				if L1_1.get_item(A0_445).quality > L1_1.get_item(_FORV_7_.item_cid).quality then
					do return _FORV_7_.pos, true end
					break
				end
				do return 0, false, true end
				local L13_458 = L13_458
				break
			end
		end
	end
	L4_449 = ipairs
	L5_450 = L6_451
	L4_449, L5_450, L9_454 = L4_449(L5_450)
	for L10_455, L11_456 in L4_449, L5_450, L9_454 do
		L12_457 = L11_456.item_cid
		if L12_457 == 0 then
			L12_457 = _ENV
			L12_457 = L12_457.is_slot_unlock
			L13_458 = L11_456.pos
			L12_457 = L12_457(L13_458)
			if L12_457 then
				L12_457 = L11_456.pos
				return L12_457
			end
		end
	end
	L4_449 = 0
	return L4_449
end
function L8_8.has_same_group(A0_459, A1_460)
	local L2_461
	L2_461 = _ENV
	local L2_461, L10_469, L11_470 = L2_461.weapon_cfg_dic, L10_469, L11_470
	L2_461 = L2_461[A0_459]
	if not A1_460 then
		L5_464 = _ENV
		L5_464 = L5_464.get_weapon_slot
		L5_464 = L5_464()
		A1_460 = L5_464
	end
	L5_464 = ipairs
	L6_465 = A1_460
	L5_464, L6_465, L7_466 = L5_464(L6_465)
	for L8_467, L9_468 in L5_464, L6_465, L7_466 do
		L10_469 = L9_468.item_cid
		if L10_469 then
			L10_469 = L9_468.item_cid
			if 0 < L10_469 then
				L10_469 = _ENV
				L10_469 = L10_469.weapon_cfg_dic
				L11_470 = L9_468.item_cid
				L10_469 = L10_469[L11_470]
				L11_470 = L2_461.group
				if L11_470 == L10_469.group then
					L11_470 = L2_461.id
					if L11_470 ~= L10_469.id then
						L11_470 = true
						return L11_470, L10_469.id, L9_468.pos
					end
				end
			end
		end
	end
	L5_464 = false
	return L5_464
end
function L8_8.get_weapon_cur_slot(A0_471)
	local L4_475 = _ENV.get_weapon_slot
	L4_475 = L4_475()
	L5_476 = ipairs
	L6_477 = L4_475
	L5_476, L6_477, L7_478 = L5_476(L6_477)
	for _FORV_5_, _FORV_6_ in L5_476, L6_477, L7_478 do
		if _FORV_6_.item_cid == A0_471 then
			return _FORV_6_.pos
		end
	end
	L5_476 = 0
	return L5_476
end
function L8_8.get_weapon_normal_skill(A0_479, A1_480)
	local L2_481
	if not A0_479 then
		return
	end
	L2_481 = _ENV
	L2_481 = L2_481.weapon_star_cfg_dic
	L2_481 = L2_481[A0_479]
	if L2_481 then
		L2_481 = _ENV
		L2_481 = L2_481.weapon_star_cfg_dic
		L2_481 = L2_481[A0_479]
		L2_481 = L2_481[A1_480]
	end
	if L2_481 and L2_481.init_skill then
		local L3_482 = L3_482
		local L3_482, L4_483 = L3_482(L2_481.init_skill), L4_483
		if L3_482 then
			L3_482 = L2_481.init_skill
			L3_482 = L3_482[1]
			return L3_482
		end
	end
	L3_482 = _ENV
	L3_482 = L3_482.weapon_cfg_dic
	L3_482 = L3_482[A0_479]
	if not L3_482 then
		L3_482 = L20_20
		L3_482 = L3_482[A0_479]
	end
	L4_483 = L3_482 or L4_483
	if L3_482 then
		L4_483 = L3_482.normal_skill
	end
	return L4_483
end
function L8_8.remove_weapon(A0_484)
	local L1_485
	L1_485 = _ENV
	L1_485 = L1_485.weapon_dic
	L1_485 = L1_485[A0_484]
	if L1_485 then
		L1_485 = _ENV
		L1_485 = L1_485.weapon_dic
		L1_485 = L1_485[A0_484]
		L1_485.item_cid = 0
	end
end
function L8_8.get_weapon_pieces(A0_486)
	local L5_491, L6_492, L7_493, L8_494, L9_495, L14_500, L15_501 = _ENV.get_weapon_star, L6_492, L7_493, L8_494, L9_495, L14_500, L15_501
	L6_492 = A0_486
	L5_491 = L5_491(L6_492)
	L6_492 = _ENV
	L6_492 = L6_492.weapon_star_cfg_dic
	L6_492 = L6_492[A0_486]
	if L6_492 then
		L6_492 = _ENV
		L6_492 = L6_492.weapon_star_cfg_dic
		L6_492 = L6_492[A0_486]
		L6_492 = L6_492[L5_491]
	end
	L7_493 = _ENV
	L7_493 = L7_493.is_weapon_unlock
	L8_494 = A0_486
	L7_493 = L7_493(L8_494)
	L8_494 = 0
	L9_495 = 0
	L14_500 = nil
	L15_501 = nil
	if L6_492 and next(L6_492.cost_shards) then
		L14_500 = L6_492.cost_shards[1]
		L8_494 = L6_492.cost_shards[2] or L8_494
		if not L7_493 or not L6_492.cost_shards[2] then
			L8_494 = L1_1.get_item(L14_500).syn_effect[1]
		end
		L9_495 = L6_6.get_bag_item_count_by_cid(nil, L14_500) or L9_495
		if not L6_6.get_bag_item_count_by_cid(nil, L14_500) then
			L9_495 = 0
		end
		L15_501 = L6_492.cost[1]
		local L12_498 = L12_498
		local L13_499 = L13_499
		L13_499 = L6_6.get_bag_item_count_by_cid(nil, L15_501) or 0
		if not L6_6.get_bag_item_count_by_cid(nil, L15_501) then
			L13_499 = 0
		end
	end
	return L9_495, L8_494, L14_500, L13_499, L12_498, L15_501
end
function L8_8.get_first_weapon()
	local L0_502, L1_503, L2_504, L3_505
	L0_502 = 1
	L1_503 = 5
	L2_504 = 1
	for L3_505 = L0_502, L1_503, L2_504 do
		local L4_506 = L4_506
		local L4_506, L5_507 = L4_506(L3_505), L5_507
		if 0 < L4_506 then
			return L4_506
		end
	end
	L0_502 = 0
	return L0_502
end
function L8_8.get_wear_weapon_count()
	local L0_508
	L0_508 = 0
	L3_511 = pairs
	L4_512 = _ENV
	L4_512 = L4_512.weapon_dic
	L3_511, L4_512, L5_513 = L3_511(L4_512)
	for L6_514, _FORV_5_ in L3_511, L4_512, L5_513 do
		if _FORV_5_.item_cid ~= nil and _FORV_5_.item_cid ~= 0 then
			L0_508 = L0_508 + 1
		end
	end
	return L0_508
end
function L8_8.get_weapon_rating(A0_515, A1_516, A2_517)
	local L3_518 = L3_518
	L3_518 = L3_518(A0_515, A1_516)
	if A2_517 then
		L3_518 = L3_518 + _ENV.get_weapon_bond_rating(A0_515)
	end
	local L4_519 = L4_519
	do return L4_519(L3_518) end
	local L5_520 = L5_520
end
function L8_8.get_weapon_base_rating(A0_521, A1_522)
	local L4_525 = L4_525
	if not A1_522 then
		L4_525 = _ENV
		L4_525 = L4_525.weapon_rating_dic
		L4_525 = L4_525[A0_521]
		if L4_525 then
			return L4_525
		end
	end
	L4_525 = L6_6
	L4_525 = L4_525.get_bag_first_item_by_cid
	local L4_525, L3_524 = L4_525(A0_521), L3_524
	if L4_525 then
		L3_524 = L4_525.equip
		if L3_524 then
			goto lbl_20
		end
	end
	L3_524 = 0
	do return L3_524 end
	::lbl_20::
	L3_524 = _ENV
	L3_524 = L3_524.weapon_rating_dic
	local L5_526 = L5_526
	local L6_527 = _ENV.calcute_weapon_rating(L4_525)
	L3_524[L5_526] = L6_527
	L3_524 = _ENV
	L3_524 = L3_524.weapon_rating_dic
	L5_526 = L4_525.id
	L3_524 = L3_524[L5_526]
	return L3_524
end
function L8_8.get_weapon_attr_dic(A0_528, A1_529)
	if A0_528.equip then
		L6_534 = A0_528.equip
		L6_534 = L6_534.base_attr
		if L6_534 then
			L6_534 = ipairs
			L11_539 = A0_528.equip
			L11_539 = L11_539.base_attr
			L6_534, L11_539, L12_540 = L6_534(L11_539)
			for L14_541, _FORV_6_ in L6_534, L11_539, L12_540 do
				if not A1_529[_FORV_6_.attr_type] then
				end
				A1_529[_FORV_6_.attr_type] = 0 + _FORV_6_.val
			end
		end
		L6_534 = A0_528.equip
		L6_534 = L6_534.extra_attr
		if L6_534 then
			L6_534 = ipairs
			L11_539 = A0_528.equip
			L11_539 = L11_539.extra_attr
			L6_534, L11_539, L12_540 = L6_534(L11_539)
			for L14_541, _FORV_6_ in L6_534, L11_539, L12_540 do
				if not A1_529[_FORV_6_.attr_type] then
				end
				A1_529[_FORV_6_.attr_type] = 0 + _FORV_6_.val
			end
		end
		L6_534 = _ENV
		L6_534 = L6_534.weapon_star_cfg_dic
		L11_539 = A0_528.cfg_id
		L6_534 = L6_534[L11_539]
		L11_539 = _ENV
		L11_539 = L11_539.get_weapon_star
		L12_540 = A0_528.cfg_id
		L11_539 = L11_539(L12_540)
		L12_540 = pairs
		L14_541 = L6_534
		L12_540, L14_541, _FOR_ = L12_540(L14_541)
		for _FORV_7_, _FORV_8_ in L12_540, L14_541, _FOR_ do
			if _FORV_8_.star == L11_539 and _FORV_8_.attrs and next(_FORV_8_.attrs) then
				_FOR_, _FOR_, _FOR_ = pairs(_FORV_8_.attrs)
				for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
					if not A1_529[_FORV_12_] then
					end
					A1_529[_FORV_12_] = 0 + _FORV_13_
				end
			end
		end
	end
end
function L8_8.calcute_weapon_rating(A0_542, A1_543, A2_544)
	local L3_545 = L3_545
	L3_545 = L3_545(A0_542, A1_543)
	if A2_544 then
		local L6_548 = _ENV.calcute_weapon_bond_rating(A0_542, A2_544)
		L3_545 = L3_545 + L6_548
	end
	L6_548 = math
	L6_548 = L6_548.ceil
	do return L6_548(L3_545) end
	local L5_547 = L5_547
end
function L8_8.calcute_weapon_base_rating(A0_549, A1_550, A2_551)
	local L3_552
	L3_552 = A0_549.equip
	local L6_555, L9_558 = _ENV, L9_558
	L6_555 = L6_555.get_equip_cfg
	L9_558 = A0_549.cfg_id
	L6_555 = L6_555(L9_558)
	L9_558 = L6_555.part
	local L7_556 = L7_556
	local L8_557 = L3_3.get_weapon_strengthen_attr(A0_549)
	if not A1_550 then
		local L10_559 = L10_559
		local L11_560 = L11_560
	end
	if L10_559 then
		_FOR_, _FOR_, _FOR_ = ipairs(L10_559)
		for _FORV_15_, _FORV_16_ in _FOR_, _FOR_, _FOR_ do
			local L22_571 = L22_571
		end
	end
	if L11_560 then
		_FOR_, _FOR_, _FOR_ = ipairs(L11_560)
		for _FORV_15_, _FORV_16_ in _FOR_, _FOR_, _FOR_ do
			local L19_568 = L19_568
			L19_568 = L19_568 + L3_3.get_attr_rating(nil, _FORV_16_.attr_type, _FORV_16_.val, L13_13.attr_source.weapon_base)
		end
	end
	L20_569 = math
	L20_569 = L20_569.ceil
	L21_570 = L19_568
	L20_569 = L20_569(L21_570)
	L19_568 = L20_569
	L20_569 = L3_3
	L20_569 = L20_569.get_weapon_star_rating
	L21_570 = A0_549.cfg_id
	L20_569 = L20_569(L21_570, L22_571)
	L21_570 = 0
	local L16_565 = L3_3.get_weapon_skill(A0_549.cfg_id, L22_571)
	if L16_565 then
		L21_570 = L21_570 + L16_565.score
	end
	return L19_568 + L21_570 + L20_569
end
function L8_8.get_active_skill_rating(A0_572)
	local L3_575, L4_576 = _ENV.get_config, L4_576
	L4_576 = A0_572
	L3_575 = L3_575(L4_576)
	if not L3_575 then
		L4_576 = 0
		return L4_576
	end
	L4_576 = L50_50
	L4_576 = L4_576.get_player_server_id
	L4_576 = L4_576()
	if not L3_575.score_server_limit[L4_576] then
	end
	return L3_575.score
end
function L8_8.get_all_attr()
	local L6_583 = _ENV.get_all_equipped_attr
	L6_583 = L6_583()
	local L1_578 = _ENV.get_all_star_attr()
	if next(L6_583) then
		L2_579, _FOR_, _FOR_ = L2_579(L6_583)
		for _FORV_5_, _FORV_6_ in L2_579, _FOR_, _FOR_ do
			if not L1_578[_FORV_5_] then
			end
			L1_578[_FORV_5_] = 0 + _FORV_6_
		end
	end
	L2_579 = {}
	L7_584 = pairs
	L7_584, _FOR_, _FOR_ = L7_584(L1_578)
	for _FORV_6_, _FORV_7_ in L7_584, _FOR_, _FOR_ do
		({}).id = _FORV_6_
		;({}).value = _FORV_7_
		table.insert(L2_579, {})
	end
	L7_584 = table
	L7_584 = L7_584.sort
	L8_585 = L2_579
	function L9_586(A0_588, A1_589)
		local L5_593 = _ENV.get_config
		L5_593 = L5_593(A0_588.id)
		local L3_591 = L3_591
		local L3_591, L4_592 = L3_591(A1_589.id), L4_592
		L4_592 = L5_593.priority
		L4_592 = L4_592 < L3_591.priority
		return L4_592
	end
	L7_584(L8_585, L9_586)
	return L2_579
end
function L8_8.get_all_equipped_attr()
	local L0_594
	L0_594 = {}
	local L4_598, L15_609 = _ENV, L15_609
	L4_598 = L4_598.get_weapon_slot
	L4_598 = L4_598()
	L5_599 = ipairs
	L6_600 = L4_598
	L5_599, L6_600, L10_604 = L5_599(L6_600)
	for L11_605, L12_606 in L5_599, L6_600, L10_604 do
		L15_609 = L12_606.item_cid
		if 0 < L15_609 then
			L15_609 = L6_6
			L15_609 = L15_609.get_bag_first_item_by_cid
			L16_610 = L12_606.item_cid
			L15_609 = L15_609(L16_610)
			if L15_609 then
				L16_610 = L15_609.equip
				L16_610 = L16_610.base_attr
				if L16_610 then
					L16_610 = ipairs
					L16_610, _FOR_, _FOR_ = L16_610(L15_609.equip.base_attr)
					for _FORV_11_, _FORV_12_ in L16_610, _FOR_, _FOR_ do
						if L15_15.get_config(_FORV_12_.attr_type) and L15_15.get_config(_FORV_12_.attr_type).attr_show_in_view == 1 then
							if not L0_594[_FORV_12_.attr_type] then
							end
							L0_594[_FORV_12_.attr_type] = 0 + _FORV_12_.val
						end
					end
				end
			end
		end
	end
	return L0_594
end
function L8_8.get_current_main_weapon_type()
	local L0_611 = _ENV.get_first_weapon()
end
function L8_8.get_value(A0_612)
	local L1_613
	L1_613 = _ENV
	L1_613 = L1_613.k_v
	L1_613 = L1_613[A0_612]
	return L1_613
end
function L8_8.set_value(A0_614, A1_615)
	local L2_616
	L2_616 = _ENV
	L2_616 = L2_616.k_v
	L2_616[A0_614] = A1_615
end
function L8_8.update_weapon_replace_display_dic(A0_617, A1_618)
	local L2_619
	L2_619 = _ENV
	L2_619 = L2_619.weapon_replace_display_dic
	L2_619[A0_617] = A1_618
	L2_619 = ""
	L6_623 = pairs
	L7_624 = _ENV
	L7_624 = L7_624.weapon_replace_display_dic
	L6_623, L7_624, _FOR_ = L6_623(L7_624)
	for _FORV_6_, _FORV_7_ in L6_623, L7_624, _FOR_ do
		if L2_619 == "" then
			L2_619 = string.format("%s-%s", _FORV_6_, _FORV_7_)
		else
			local L12_629 = string.format("%s|%s-%s", L2_619, _FORV_6_, _FORV_7_)
			L2_619 = L12_629
		end
	end
	L6_623 = L28_28
	L6_623 = L6_623.set_player_data
	L7_624 = "weapon_replace_display"
	L9_626 = L2_619
	L6_623(L7_624, L9_626)
end
function L8_8.view_weapon_in_equip_mode(A0_630)
	local L1_631
	L1_631 = _ENV
	L1_631 = L1_631.has_viewed_weapon_in_equip_mode
	L1_631[A0_630] = true
end
function L8_8.view_all_unlock_weapon_in_equip_mode()
	local L5_637 = _ENV.get_weapon_slot
	L5_637 = L5_637()
	table.clear(_UPVALUE1_)
	_FOR_, _FOR_, _FOR_ = ipairs(L5_637)
	for _FORV_4_, _FORV_5_ in _FOR_, _FOR_, _FOR_ do
		_UPVALUE1_[_FORV_5_.item_cid] = true
	end
	L6_638 = _ENV
	L6_638 = L6_638.get_all_weapon_list
	L6_638 = L6_638(nil, nil, true)
	L4_636 = ipairs
	L4_636, L3_635, _FOR_ = L4_636(L6_638)
	for _FORV_5_, _FORV_6_ in L4_636, L3_635, _FOR_ do
		if not _UPVALUE1_[_FORV_6_.id] and L2_2.has_weapon_equip_mode_red_point_by_weapon_id(_FORV_6_.id) and not L2_2.has_weapon_equip_mode_red_point_by_weapon_id(_FORV_6_.id) then
			_ENV.view_weapon_in_equip_mode(_FORV_6_.id)
			local L10_642 = L10_642
		end
	end
end
function L8_8.is_better_quality_weapon(A0_643, A1_644)
	local L2_645, L3_646, L4_647
	L2_645 = _ENV
	L2_645 = L2_645.weapon_quality_dic
	L2_645 = L2_645[A0_643]
	L3_646 = _ENV
	L3_646 = L3_646.weapon_quality_dic
	L3_646 = L3_646[A1_644]
	L4_647 = L2_645 > L3_646
	return L4_647
end
function L8_8.has_same_group_weapon(A0_648)
	local L3_651, L8_656 = table.clear, L8_656
	L4_652 = _ENV
	L3_651(L4_652)
	L3_651 = ipairs
	L4_652 = A0_648
	L3_651, L4_652, L5_653 = L3_651(L4_652)
	for L6_654, L7_655 in L3_651, L4_652, L5_653 do
		L8_656 = L3_3
		L8_656 = L8_656.weapon_cfg_dic
		L8_656 = L8_656[L7_655]
		if not _ENV[L8_656.group] then
			_ENV[L8_656.group] = true
		else
			return true
		end
	end
	L3_651 = false
	return L3_651
end
function L8_8.is_limit_time_weapon(A0_657)
	if _ENV.weapon_limit_cfg_dic[A0_657] then
		if not next(_ENV.weapon_limit_cfg_dic[A0_657]) or not true then
		end
		return false
	end
	local L1_658 = L1_658
	local L1_658, L2_659 = L1_658(A0_657), L2_659
	L2_659 = L1_658.default_expire_time
	L2_659 = 0 < L2_659
	return L2_659
end
function L8_8.is_artifact_weapon(A0_660)
	local L1_661
	L1_661 = _ENV
	L1_661 = L1_661.equip_cfg_dic
	L1_661 = L1_661[A0_660]
	L1_661 = L1_661.artifact
	L1_661 = L1_661 == 1
	return L1_661
end
function L8_8.get_same_group_legend_weapon(A0_662)
	local L1_663, L2_664, L3_665
	L1_663 = _ENV
	L1_663 = L1_663.weapon_cfg_dic
	L1_663 = L1_663[A0_662]
	if not L1_663 then
		return
	end
	L2_664 = _ENV
	L2_664 = L2_664.weapon_cfg_by_group_dic
	L3_665 = L1_663.group
	L2_664 = L2_664[L3_665]
	L3_665 = _ENV
	L3_665 = L3_665.weapon_quality_dic
	L3_665 = L3_665[A0_662]
	if not L2_664 then
		return
	end
	L6_668 = ipairs
	L7_669 = L2_664
	L6_668, L7_669, L8_670 = L6_668(L7_669)
	for L9_671, _FORV_8_ in L6_668, L7_669, L8_670 do
		if _FORV_8_.id ~= A0_662 and _ENV.weapon_quality_dic[_FORV_8_.id] == L3_665 then
			local L11_673 = L11_673
			if not _ENV.is_limit_time_weapon(_FORV_8_.id) then
				return _FORV_8_.id
			end
		end
	end
end
function L8_8.get_show_skill_list(A0_674, A1_675, A2_676)
	local L13_687, L14_688 = _ENV.get_weapon_star, L14_688
	L14_688 = A0_674
	L13_687 = L13_687(L14_688)
	if A1_675 then
		L14_688 = A1_675.equip
		if L14_688 then
			L14_688 = A1_675.equip
			L14_688 = L14_688.weapon_star
			if L14_688 then
				goto lbl_15
				L13_687 = L14_688 or L13_687
			end
		end
		L13_687 = 0
		::lbl_15::
	else
		L14_688 = _ENV
		L14_688 = L14_688.get_weapon_star
		L14_688 = L14_688(A0_674)
		L13_687 = L14_688
	end
	L14_688 = _ENV
	L14_688 = L14_688.get_weapon_cfg
	L14_688 = L14_688(A0_674)
	local L5_679 = L5_679
	L5_679 = L5_679(A0_674, L13_687)
	local L6_680 = L6_680
	local L7_681 = L7_681
	L6_680 = L6_680(L7_681, L13_687)
	L7_681 = {}
	;({}).skill_id = L5_679
	;({}).is_active = true
	;({}).can_interactable = true
	;({}).show_lv = true
	local L8_682 = L8_682
	;({}).skill_id = L6_680
	;({}).is_active = true
	;({}).can_interactable = true
	;({}).show_lv = true
	L7_681[1] = L8_682
	L7_681[2] = {}
	L8_682 = _ENV
	L8_682 = L8_682.weapon_star_cfg_dic
	L8_682 = L8_682[A0_674]
	if L8_682 then
		L8_682 = _ENV
		L8_682 = L8_682.weapon_star_cfg_dic
		L8_682 = L8_682[A0_674]
		L8_682 = L8_682[L13_687]
	end
	if L8_682 and L8_682.characteristic then
		({}).skill_id = L8_682.characteristic
		;({}).is_passive = true
		;({}).can_interactable = true
		;({}).show_zd = true
		;({}).show_lv = true
		table.insert(L7_681, {})
	end
	if not A2_676 then
		if L8_682 and L8_682.characteristic2 then
			local L9_683 = L9_683
			;({}).skill_id = L8_682.characteristic2
			L12_686.is_passive = true
			L12_686.can_interactable = true
			L12_686.show_zd = true
			L12_686.show_lv = true
			L9_683(L10_684, L12_686)
		end
		else
			L9_683 = _ENV
			L9_683 = L9_683.weapon_max_star_dic
			L9_683 = L9_683[A0_674]
			if not L9_683 then
				L9_683 = 0
			end
			L10_684 = L13_687 + 1
			L12_686 = L9_683
			_FOR_ = 1
			for _FORV_13_ = L10_684, L12_686, _FOR_ do
				if _ENV.weapon_star_cfg_dic[A0_674][_FORV_13_].characteristic2 then
					local L17_691 = L17_691
					local ({}).skill_id, L19_693 = L17_691.characteristic2, L19_693
					;({}).is_passive = true
					;({}).can_interactable = true
					;({}).show_zd = true
					;({}).is_lock = true
					;({}).lock_desc = L19_693
					;({}).show_lv = true
					table.insert(L7_681, {})
					do break end
					if true then
				end
			end
		end
	end
	return L7_681
end
function L8_8.get_skill_list(A0_694)
	local L1_695, L2_696
	L1_695 = _ENV
	L1_695 = L1_695.skill_id_to_list
	L1_695 = L1_695[A0_694]
	L2_696 = _ENV
	L2_696 = L2_696.skill_list
	L2_696 = L2_696[L1_695]
	return L2_696
end
function L8_8.get_weapon_ultimate_skill(A0_697, A1_698)
	local L2_699, L3_700, L4_701
	L2_699 = _ENV
	L2_699 = L2_699.weapon_star_cfg_dic
	L2_699 = L2_699[A0_697]
	if not L2_699 then
		return
	end
	if not A1_698 then
		A1_698 = #L2_699
	end
	L3_700 = L2_699[A1_698]
	if L3_700 then
		L4_701 = L3_700.skill
		if L4_701 then
			L4_701 = L3_700.skill
			return L4_701
		end
	end
end
return L8_8
