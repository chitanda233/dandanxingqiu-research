local L0_0, L1_1, L2_2, L3_3
L0_0 = assert
local L1_1, L9_9, L16_16, L17_17, L18_18, L19_19, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60, L61_61, L62_62, L63_63, L64_64, L65_65, L66_66, L67_67, L68_68, L69_69, L70_70 = Game, L9_9, L16_16, L17_17, L18_18, L19_19, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60, L61_61, L62_62, L63_63, L64_64, L65_65, L66_66, L67_67, L68_68, L69_69, L70_70
L1_1 = L1_1.module
L1_1 = L1_1.jump_to
L2_2 = Game
L2_2 = L2_2.ui_manager
L3_3 = Game
L3_3 = L3_3.ui_const
L9_9 = import
L16_16 = ".head"
L9_9 = L9_9(L16_16)
L16_16 = Game
L16_16 = L16_16.module
L16_16 = L16_16.gacha
L17_17 = L0_0
L18_18 = L9_9.data
L17_17 = L17_17(L18_18)
L18_18 = L0_0
L19_19 = L9_9.const
L18_18 = L18_18(L19_19)
L19_19 = L9_9.event
L22_22 = L18_18.max_weapon_num
L23_23 = L0_0
L24_24 = L9_9.network
L23_23 = L23_23(L24_24)
L24_24 = L0_0
L25_25 = L9_9.plan_data
L24_24 = L24_24(L25_25)
L25_25 = L0_0
L26_26 = L9_9.plan_network
L25_25 = L25_25(L26_26)
L26_26 = Game
L26_26 = L26_26.events
L27_27 = L0_0
L28_28 = L9_9.const
L27_27 = L27_27(L28_28)
L28_28 = DataConfigs
L28_28 = L28_28.item
L29_29 = DataConfigs
L29_29 = L29_29.tasks
L30_30 = DataConfigs
L30_30 = L30_30.weapon_sit
L31_31 = DataConfigs
L31_31 = L31_31.language_define
L32_32 = GameLogger
L32_32 = L32_32.Error
L33_33 = require
L34_34 = "game.module.tips.view.try_to_cost.core"
L33_33 = L33_33(L34_34)
L34_34 = nil
L35_35 = Game
L35_35 = L35_35.module
L35_35 = L35_35.data
L36_36 = 20
L37_37 = 40
L38_38 = Game
L38_38 = L38_38.module
L38_38 = L38_38.open_func
L39_39 = L38_38.const
L40_40 = Game
L40_40 = L40_40.redpoint_helper
L47_47 = Game
L47_47 = L47_47.module
L47_47 = L47_47.popup
L48_48 = Game
L48_48 = L48_48.module
L48_48 = L48_48.attr_point
L49_49 = DataConfigs
L49_49 = L49_49.fight_plan_tag
L50_50 = DataConfigs
L50_50 = L50_50.weapon_bond
L51_51 = DataConfigs
L51_51 = L51_51.misc
L52_52 = Game
L52_52 = L52_52.module
L52_52 = L52_52.team
L52_52 = L52_52.event
L53_53 = Game
L53_53 = L53_53.module
L53_53 = L53_53.task
L53_53 = L53_53.event
L54_54 = Game
L54_54 = L54_54.module
L54_54 = L54_54.cloud_data
L55_55 = Game
L55_55 = L55_55.module
L55_55 = L55_55.main_view
L56_56 = Game
L56_56 = L56_56.module
L56_56 = L56_56.open_func
L57_57 = L51_51.weapon_display
L57_57 = L57_57.val
L58_58 = nil
L59_59 = GlobalConst
L59_59 = L59_59.weapon_quality
L60_60 = require
L61_61 = "game.utils.layer_type_helper"
L60_60 = L60_60(L61_61)
L61_61 = require
L62_62 = "game.other.server_time"
L61_61 = L61_61(L62_62)
L62_62 = require
L63_63 = "game.other.player_prefs"
L62_62 = L62_62(L63_63)
L63_63 = require
L64_64 = "game.module.common_view.manager.confirm"
L63_63 = L63_63(L64_64)
L64_64 = require
L65_65 = "game.other.game_time.init"
L64_64 = L64_64(L65_65)
L65_65 = nil
L66_66 = Game
L66_66 = L66_66.module
L66_66 = L66_66.main_view
L66_66 = L66_66.data
L67_67 = nil
L68_68 = {}
L69_69 = {}
L70_70 = {}
function L9_9.init()
	_ENV = Game.module.bag
	L65_65 = Game.module.battle
	L6_6.init()
	L11_11.init()
	L12_12.init()
	L13_13.init()
	L4_4.register_jump_info()
	L4_4.init_red_point()
	;({}).main_weapon_items_changed = L4_4.on_main_weapon_items_changed
	;({}).main_weapon_pieces_items_changed = L4_4.on_main_weapon_pieces_items_changed
	;({}).update_new_day = L4_4.on_update_new_day
	;({}).coin_changed = L4_4.on_coin_changed
	;({}).open_func_event_update_item = L4_4.on_open_func_event_update_item
	;({}).role_equip_strengthen = L4_4.on_role_equip_strengthen
	;({}).player_level_up = L4_4.on_player_level_up
	;({}).update_main_weapon_develop_info = L4_4.on_update_main_weapon_develop_info
	;({})[L46_46.change_team_target] = L4_4.on_change_team_target
	;({})[L8_8.update_weapon_tag] = L4_4.on_update_weapon_tag
	;({})[L8_8.update_weapon_plan] = L4_4.on_update_weapon_plan
	local ({})[L53_53.update_task_info], L3_74 = L4_4.on_task_update_task_info, L3_74
	;({}).weapon_strengthen_material_changed = L4_4.on_weapon_strengthen_material_changed
	;({}).view_close = L4_4.on_view_close
	;({}).fight_leave = L4_4.on_fight_leave
	L3_74.event_dic, ({}).season_info_changed = {}, L4_4.on_season_info_changed
	L3_74 = L4_4
	L3_74 = L3_74.add_listener
	L3_74()
	L3_74 = Game
	L3_74 = L3_74.module
	L3_74 = L3_74.equip
	L3_74 = L3_74.data
	L58_58 = L3_74
	L3_74 = L55_55
	L3_74 = L3_74.data
	L3_74 = L3_74.add_push
	L3_74(L55_55.notice_type.strength_return)
	local L1_72 = L1_72
end
function L9_9.clear()
	_ENV.clear()
	L11_11.clear()
	L4_4.remove_listener()
	local L1_75 = L1_75
	L1_75(L39_39.type.weapon_master, L11_11.weapon_master_info_c2s)
	local L2_76 = L2_76
end
function L9_9.add_listener()
	L2_79 = _ENV.has_add_listener
	if L2_79 then
		return
	end
	L2_79 = _ENV
	L2_79.has_add_listener = true
	L2_79 = pairs
	L3_80 = _ENV
	L3_80 = L3_80.event_dic
	L2_79, L3_80, L4_81 = L2_79(L3_80)
	for _FORV_3_, _FORV_4_ in L2_79, L3_80, L4_81 do
		L14_14.add_listener(_FORV_3_, _FORV_4_)
		local L7_84 = L7_84
	end
end
function L9_9.remove_listener()
	L2_87 = _ENV.has_add_listener
	if not L2_87 then
		return
	end
	L2_87 = _ENV
	L2_87.has_add_listener = false
	L2_87 = pairs
	L3_88 = _ENV
	L3_88 = L3_88.event_dic
	L2_87, L3_88, L4_89 = L2_87(L3_88)
	for _FORV_3_, _FORV_4_ in L2_87, L3_88, L4_89 do
		L14_14.remove_listener(_FORV_3_, _FORV_4_)
		local L7_92 = L7_92
	end
end
function L9_9.on_weapon_strengthen_material_changed()
	_ENV.update_red_point("main_weapon_develop_strength_red_point")
	local L1_93 = L1_93
end
function L9_9.on_view_close(A0_94)
	if _ENV.get_value("role_equip_switch_c2s") and A0_94 == L3_3.WeaponAcquireView.name then
		_ENV.set_value("role_equip_switch_c2s", false)
		local L3_96 = L3_96
		L3_96 = L4_4
		L3_96 = L3_96.try_pop_star_upgrade_view
		L3_96(true)
	end
end
function L9_9.on_fight_leave()
	_ENV.check_expire_weapon()
end
function L9_9.on_task_update_task_info(A0_97, A1_98)
	repeat
		if A1_98 then
			if _ENV.get_task_cfg(A1_98).task_tp ~= Game.module.task.const.task_type.strength_rand then
				goto lbl_31
			end
			local L5_102 = L5_102
			L14_14.brocast("main_view_update_push", L55_55.notice_type.strength_return)
			local L6_103 = L6_103
			break -- pseudo-goto
		end
		L5_102 = L14_14
		L5_102 = L5_102.brocast
		L6_103 = "main_view_update_push"
		L5_102(L6_103, L55_55.notice_type.strength_return)
		local L4_101 = L4_101
	until true
	::lbl_31::
end
function L9_9.on_update_weapon_plan()
	if not _ENV.is_open(L39_39.type.add_points_plan1) then
		return
	end
	local L0_104 = L43_43.get_all_cfg()
	local L1_105 = L12_12.get_using_weapon_plan()
	local L2_106 = L2_106
	L2_106 = L2_106("auto_set_weapon_plan")
	L2_106 = L2_106 == "true"
	if not L2_106 then
	else
	end
	L6_6.update_weapon_bond_rating_cache()
	local L3_107 = L3_107
end
function L9_9.on_update_weapon_tag(A0_108)
	_ENV.try_auto_change_plan()
end
function L9_9.on_change_team_target()
	_ENV.try_auto_change_plan()
end
function L9_9.try_auto_change_plan(A0_109)
	local L6_115, L7_116 = _ENV.try_get_val_from_server, L7_116
	L7_116 = "auto_set_weapon_plan"
	L6_115 = L6_115(L7_116)
	L6_115 = L6_115 == "true"
	if A0_109 then
		L7_116 = L43_43
		L7_116 = L7_116.get_all_cfg
		L7_116 = L7_116()
		_FOR_, _FOR_, _FOR_ = pairs(L7_116)
		for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
			if L12_12.get_using_plan_by_gameplay_id(_FORV_7_.id) then
				if L6_115 then
					L13_13.role_gameplay_set_c2s(_FORV_7_.id, 1, L12_12.get_using_plan_by_gameplay_id(_FORV_7_.id).id)
				else
					L13_13.role_gameplay_set_c2s(_FORV_7_.id, 1, 0)
				end
			end
		end
		return
	end
	if not L6_115 then
		return
	end
	L7_116 = {}
	L12_121 = ipairs
	L12_121, _FOR_, _FOR_ = L12_121(L12_12.plan_list)
	for _FORV_6_, _FORV_7_ in L12_121, _FOR_, _FOR_ do
		if _FORV_7_.gameplay_list and next(_FORV_7_.gameplay_list) then
			_FOR_, _FOR_, _FOR_ = ipairs(_FORV_7_.gameplay_list)
			for _FORV_11_, _FORV_12_ in _FOR_, _FOR_, _FOR_ do
				L7_116[_FORV_12_] = _FORV_7_.id
			end
		end
	end
	L12_121 = pairs
	L5_114 = L43_43
	L5_114 = L5_114.get_all_cfg
	L5_114, L13_122 = L5_114()
	L12_121, L5_114, L13_122 = L12_121(L5_114, L13_122, L5_114())
	for _FORV_6_, _FORV_7_ in L12_121, L5_114, L13_122 do
		if L7_116[_FORV_7_.id] ~= L12_12.gameplay_plan_dic[_FORV_7_.id] then
			if not L7_116[_FORV_7_.id] then
			end
			L13_13.role_gameplay_set_c2s(_FORV_7_.id, 1, 0)
			local L11_120 = L11_120
			L11_120 = L12_12
			L11_120 = L11_120.gameplay_plan_dic
			L11_120[_FORV_7_.id] = L7_116[_FORV_7_.id]
		end
	end
end
function L9_9.on_update_main_weapon_develop_info()
	_ENV.init_weapon_replace_display_dic()
	_ENV.init_weapon_view_dic()
	_ENV.update_weapon_bond_rating_cache()
	L4_4.try_pop_main_weapon()
	L67_67 = _ENV.get_value("cache_weapon_slot")
	table.clear(L68_68)
	table.clear(L69_69)
	table.clear(L70_70)
	table.clear(_UPVALUE6_)
	table.clear(_UPVALUE7_)
	table.clear(_UPVALUE8_)
	if L67_67 then
		_FOR_, _FOR_, _FOR_ = ipairs(L67_67)
		for _FORV_3_, _FORV_4_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_4_.item_cid > 0 then
				L68_68[_FORV_4_.item_cid] = true
				L69_69[_ENV.weapon_cfg_dic[_FORV_4_.item_cid].group] = _ENV.weapon_cfg_dic[_FORV_4_.item_cid].id
				if not _UPVALUE6_[_ENV.weapon_cfg_dic[_FORV_4_.item_cid].job_type] then
				end
				_UPVALUE6_[_ENV.weapon_cfg_dic[_FORV_4_.item_cid].job_type] = 0 + 1
			end
		end
	end
	L5_128 = _ENV
	L5_128 = L5_128.get_weapon_slot
	L5_128 = L5_128()
	_FOR_, _FOR_, _FOR_ = ipairs(L5_128)
	for _FORV_4_, _FORV_5_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_5_.item_cid > 0 then
			L70_70[_ENV.weapon_cfg_dic[_FORV_5_.item_cid].group] = _ENV.weapon_cfg_dic[_FORV_5_.item_cid].id
			if not _UPVALUE7_[_ENV.weapon_cfg_dic[_FORV_5_.item_cid].job_type] then
			end
			_UPVALUE7_[_ENV.weapon_cfg_dic[_FORV_5_.item_cid].job_type] = 0 + 1
			_UPVALUE8_[_ENV.weapon_cfg_dic[_FORV_5_.item_cid].group] = _ENV.weapon_quality_dic[_FORV_5_.item_cid]
		end
	end
	L6_129 = L67_67
	if L6_129 then
		L6_129 = L4_4
		L6_129 = L6_129.is_same_weapon_slot
		L8_131 = L67_67
		L10_133 = L5_128
		L6_129 = L6_129(L8_131, L10_133)
		if not L6_129 then
			L6_129 = L4_4
			L6_129 = L6_129.try_pop_weapon_replace
			L6_129()
			L6_129 = L4_4
			L6_129 = L6_129.try_pop_weapon_bond_active
			L6_129()
			L6_129 = L4_4
			L6_129 = L6_129.try_pop_weapon_camp_active
			L6_129()
			L6_129 = L4_4
			L6_129 = L6_129.try_pop_weapon_camp_up
			L6_129()
		end
	end
	L6_129 = _ENV
	L6_129 = L6_129.get_weapon_slot_with_new_tb
	L6_129 = L6_129()
	L8_131 = _ENV
	L8_131 = L8_131.set_value
	L10_133 = "cache_weapon_slot"
	L8_131(L10_133, L6_129)
	L8_131 = L4_4
	L8_131 = L8_131.check_expire_weapon
	L8_131()
end
function L9_9.check_expire_weapon()
	if true then
		local L6_140 = _ENV.will_or_is_in_fight
		L6_140 = L6_140()
		if L6_140 then
			return
		end
		L6_140 = L66_66
		L6_140 = L6_140.get_value
		L6_140 = L6_140("has_show_main_view")
		if not L6_140 then
			return
		end
		L6_140 = L62_62
		L6_140 = L6_140.get_player_data
		L6_140 = L6_140("pre_expire_weapon", "string")
		if L6_140 and L6_140 ~= "" then
			_FOR_, _FOR_, _FOR_ = ipairs((string.split(L6_140, "_")))
			for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
				_FORV_7_ = tonumber(_FORV_7_)
				if not L6_6.get_equip_info(_FORV_7_) then
					break
				end
			end
			if true then
				({}).content = "\232\175\149\231\148\168\230\173\166\229\153\168\229\183\178\229\136\176\230\156\159\239\188\140\230\152\175\229\144\166\229\137\141\229\190\128\232\163\133\233\133\141\229\133\182\228\187\150\230\173\166\229\153\168"
				;({}).sure_label = "\229\137\141\229\190\128\232\163\133\233\133\141"
				;({}).sure_click = function()
					local L0_148 = L0_148
					local L1_149 = L1_149
					;({}).key = "weapon"
					;({}).handler_args, ({}).sub_args, ({}).index = {}, {}, 1
					local L4_152 = L4_152
					L0_148(L1_149, L4_152)
				end
				L63_63.confirm({})
			end
		end
		local L1_135 = L6_6.get_weapon_slot()
		table.clear(_UPVALUE6_)
		_FOR_, _FOR_, _FOR_ = pairs(L1_135)
		for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_6_.item_cid > 0 then
				if not L6_6.get_equip_info(_FORV_6_.item_cid) then
					L32_32(string.format("[main_weapon_develop] check_expire_weapon missing bag item, slot=%s, item_cid=%s", tostring(_FORV_5_), tostring(_FORV_6_.item_cid)))
					break -- pseudo-goto
				end
				if L6_6.get_equip_info(_FORV_6_.item_cid).expired_time and 0 < L6_6.get_equip_info(_FORV_6_.item_cid).expired_time then
					table.insert(_UPVALUE6_, _FORV_6_.item_cid)
				end
			end
			repeat
			until true
		end
		L7_141 = next
		L11_145 = _UPVALUE6_
		L7_141 = L7_141(L11_145)
		if L7_141 then
			L7_141 = table
			L7_141 = L7_141.concat
			L11_145 = _UPVALUE6_
			L12_146 = "_"
			L7_141 = L7_141(L11_145, L12_146)
			L11_145 = L62_62
			L11_145 = L11_145.set_player_data
			L12_146 = "pre_expire_weapon"
			L13_147 = L7_141
			L11_145(L12_146, L13_147)
		end
	else
		L7_141 = L62_62
		L7_141 = L7_141.set_player_data
		L11_145 = "pre_expire_weapon"
		L12_146 = ""
		L7_141(L11_145, L12_146)
	end
end
function L9_9.try_pop_main_weapon()
	local L0_153 = L0_153
	L0_153 = L0_153("is_pop_main_weapon")
	if not L0_153 then
		return
	end
	_ENV.set_value("is_pop_main_weapon", false)
	local L1_154 = L1_154
	L1_154 = L1_154(L39_39.type.weapon_changed_pop)
	if not L1_154 then
		return
	end
	local L2_155 = L2_155
	L2_155 = L2_155(L3_3.WeaponSlotPopView.name)
	if L2_155 then
		L2_155:show_view()
	else
		local L3_156 = L3_156
		L3_156(L3_3.WeaponSlotPopView.name)
		local L4_157 = L4_157
	end
end
function L9_9.try_pop_weapon_replace()
	local L0_158
	L0_158 = _ENV
	local L8_166, L9_167 = L8_166, L9_167
	L0_158 = L0_158 == 1
	if not L0_158 then
		return
	end
	L3_161 = pairs
	L4_162 = L69_69
	L3_161, L4_162, L5_163 = L3_161(L4_162)
	for L6_164, L7_165 in L3_161, L4_162, L5_163 do
		L8_166 = L70_70
		L8_166 = L8_166[L6_164]
		if L8_166 and L8_166 ~= L7_165 then
			L9_167 = L6_6
			L9_167 = L9_167.weapon_quality_dic
			L9_167 = L9_167[L8_166]
			if L7_165 then
			end
			if not L6_6.weapon_replace_display_dic[L6_164] then
			end
			if L9_167 > 0 and L9_167 > L6_6.weapon_quality_dic[L7_165] then
				L6_6.update_weapon_replace_display_dic(L6_164, L9_167)
				local L10_168 = L10_168
				;({}).sort_id = 1
				local ({}).name, L12_170 = L3_3.WeaponReplaceView.name, L12_170
				;({}).func = function()
					({}).pre_weapon_id = L7_165
					local ({}).cur_weapon_id, L3_174 = L8_166, L3_174
					L3_174(L3_3.WeaponReplaceView.name, {})
					L3_174 = L41_41
					L3_174 = L3_174.force_show_pop_view
					L3_174("ScorePopUpView")
					local L1_172 = L1_172
				end
				L41_41.add_pop_view({})
			end
		end
	end
end
function L9_9.try_pop_weapon_bond_active()
	local L5_180 = _ENV.get_value
	L5_180 = L5_180("is_change_weapon_plan")
	if L5_180 then
		L5_180 = _ENV
		L5_180 = L5_180.set_value
		L5_180("is_change_weapon_plan", false)
		return
	end
	L5_180 = table
	L5_180 = L5_180.clear
	L5_180(_UPVALUE1_)
	L5_180 = table
	L5_180 = L5_180.clear
	L5_180(_UPVALUE2_)
	L5_180 = table
	L5_180 = L5_180.clear
	L5_180(_UPVALUE3_)
	L5_180 = table
	L5_180 = L5_180.clear
	L5_180(_UPVALUE4_)
	L5_180 = _ENV
	L5_180 = L5_180.get_weapon_slot
	L5_180 = L5_180(true)
	table.sort(L5_180, _UPVALUE5_)
	_FOR_, _FOR_, _FOR_ = ipairs(L5_180)
	for _FORV_4_, _FORV_5_ in _FOR_, _FOR_, _FOR_ do
		table.insert(_UPVALUE2_, _ENV.weapon_cfg_dic[_FORV_5_.item_cid].group)
	end
	_FOR_, _FOR_, _FOR_ = pairs(L44_44.get_all_cfg())
	for _FORV_4_, _FORV_5_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_5_.job_list and next(_FORV_5_.job_list) then
			_FOR_, _FOR_, _FOR_ = ipairs(_FORV_5_.job_list)
			for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
				if not _UPVALUE7_[_FORV_13_[1]] then
				end
				if _FORV_13_[2] > 0 then
					break
				end
			end
		end
		if _FORV_5_.job_list and next(_FORV_5_.job_list) then
			_FOR_, _FOR_, _FOR_ = ipairs(_FORV_5_.job_list)
			for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
				if not _UPVALUE8_[_FORV_13_[1]] then
				end
				if _FORV_13_[2] > 0 then
					break
				end
			end
		end
		_FOR_, _FOR_, _FOR_ = ipairs(_FORV_5_.weapon_team)
		for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
			if false and not L69_69[_FORV_13_] then
			end
			if false and not L70_70[_FORV_13_] then
			end
			if L70_70[_FORV_13_] then
			end
		end
		if not false and false and _FORV_5_.is_alert == 1 and _FORV_5_.quality == math.min(999, _UPVALUE11_[_FORV_13_]) then
			_UPVALUE1_[_FORV_5_.weapon_team_value] = _FORV_5_
		end
	end
	L6_181 = next
	L6_181 = L6_181(_UPVALUE1_)
	if not L6_181 then
		return
	end
	L6_181 = table
	L6_181 = L6_181.dict2arr
	L6_181 = L6_181(_UPVALUE1_)
	table.sort(L6_181, _UPVALUE12_)
	_FOR_, _FOR_, _FOR_ = ipairs(L6_181)
	for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
		_FOR_, _FOR_, _FOR_ = ipairs(_FORV_6_.weapon_team)
		for _FORV_11_, _FORV_12_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_6_ and _FORV_6_.job_list then
			end
			if next(_FORV_6_.job_list) then
				({}).is_art = true
				_FOR_, _FOR_, _FOR_ = pairs(_UPVALUE7_)
				for _FORV_20_, _FORV_21_ in _FOR_, _FOR_, _FOR_ do
					repeat
						if _FORV_20_ == _FORV_6_.job_list[1][1] then
						end
						;({}).other_weapon_job = _FORV_6_.job_list[1][1]
						;({}).other_weapon_num = _FORV_6_.job_list[1][2] - _FORV_21_
						do break end -- pseudo-goto
						if not L69_69[_FORV_12_] then
							({})[_FORV_12_] = true
						end
					until true
				end
			end
		end
		table.insert(_UPVALUE3_, {})
	end
	L13_188 = ipairs
	L18_193 = _UPVALUE2_
	L13_188, L18_193, L19_194 = L13_188(L18_193)
	for L22_195, _FORV_6_ in L13_188, L18_193, L19_194 do
		({}).weapon_id = L5_180[L22_195].item_cid
		_UPVALUE4_[L22_195], ({}).bond_list = {}, {}
		_FOR_ = 1
		for _FORV_13_ = _FOR_, _FOR_, _FOR_ do
			if _UPVALUE3_[_FORV_13_].is_art then
				if _UPVALUE3_[_FORV_13_].other_weapon_job == (not L68_68[L5_180[L22_195].item_cid] and _ENV.weapon_cfg_dic[L5_180[L22_195].item_cid].job_type) then
					_UPVALUE3_[_FORV_13_].other_weapon_num = _UPVALUE3_[_FORV_13_].other_weapon_num - 1
					if _UPVALUE3_[_FORV_13_].other_weapon_num == 0 then
						table.insert(_UPVALUE4_[L22_195].bond_list, L6_181[_FORV_13_])
					end
				end
			elseif _UPVALUE3_[_FORV_13_][_FORV_6_] then
				_UPVALUE3_[_FORV_13_][_FORV_6_] = nil
				if not next(_UPVALUE3_[_FORV_13_]) then
					local L15_190 = L15_190
					local L16_191 = L16_191
					table.insert(_UPVALUE4_[L22_195].bond_list, L6_181[_FORV_13_])
					local L17_192 = L17_192
				end
			end
		end
	end
	L13_188 = ipairs
	L18_193 = _UPVALUE4_
	L13_188, L18_193, L19_194 = L13_188(L18_193)
	for L22_195, L14_189 in L13_188, L18_193, L19_194 do
		L15_190 = next
		L16_191 = L14_189.bond_list
		L15_190 = L15_190(L16_191)
		if L15_190 then
			L15_190 = {}
			L16_191 = L3_3
			L16_191 = L16_191.WeaponBondActiveView
			L16_191 = L16_191.name
			L15_190.name = L16_191
			L15_190.show_args = L14_189
			L16_191 = L41_41
			L16_191 = L16_191.add_pop_view
			L17_192 = L15_190
			L16_191(L17_192)
		end
	end
end
function L9_9.try_pop_weapon_camp_active()
	local L4_200 = _ENV.get_player_data
	local L4_200, L2_198 = L4_200("has_pop_weapon_camp_active", "number"), L2_198
	if L4_200 == 1 then
		return
	end
	L4_200 = L6_6
	L4_200 = L4_200.get_active_suit
	L4_200, L2_198 = L4_200()
	if not L4_200() or not L4_200 then
		return
	end
	local L3_199 = L3_199
	local L5_201 = L5_201
	if not L2_2.get_top_focus_view() or L2_2.get_top_focus_view().name ~= "GameMainView" then
	else
		local L6_202 = L6_202
		if not L2_2.get_top_focus_view().sub_view_panel:get_cur_panel() or L2_2.get_top_focus_view().sub_view_panel:get_cur_panel().name ~= L3_3.sub_view_const.WeaponMainView.name then
			L6_202 = false
		elseif not L2_2.get_top_focus_view().sub_view_panel:get_cur_panel().sub_view_panel:get_cur_panel() or L2_2.get_top_focus_view().sub_view_panel:get_cur_panel().sub_view_panel:get_cur_panel().name ~= L3_3.sub_view_const.WeaponSubView.name then
			L6_202 = false
		end
	end
	;({}).name = L3_3.WeaponCampActiveView.name
	;({}).play_effect = L6_202
	;({}).weapon_slot = L5_201
	local L9_205 = L9_205
	;({}).show_args, ({}).suit = {}, L30_30.get_cfg_by_id(L4_200)
	L41_41.add_pop_view({})
	local L8_204 = L8_204
end
function L9_9.try_pop_weapon_camp_up()
	local L2_208, L4_210, L5_211 = L2_208, L4_210, L5_211
	if not _ENV then
		return
	end
	L2_208 = L6_6
	L2_208 = L2_208.get_active_suit
	L4_210 = _ENV
	L2_208, L4_210, L5_211 = L2_208(L4_210)
	if not L2_208 or not L6_6.get_active_suit() then
		return
	end
	if not L5_211 or not L6_6.get_active_suit() then
		return
	end
	local L6_212 = L6_212
	local L7_213 = L7_213
	if L30_30.get_cfg_by_id(L2_208).weapon_group_belong ~= L30_30.get_cfg_by_id(L6_212).weapon_group_belong then
		return
	end
	if L30_30.get_cfg_by_id(L2_208).weapon_num >= L30_30.get_cfg_by_id(L6_212).weapon_num then
		return
	end
	local L9_215 = L9_215
	L62_62.set_player_data("has_pop_weapon_camp_up", L30_30.get_cfg_by_id(L6_212).weapon_num)
	local L10_216 = L10_216
	if not L2_2.get_top_focus_view() or L2_2.get_top_focus_view().name ~= "GameMainView" then
	else
		local L11_217 = L11_217
		if not L2_2.get_top_focus_view().sub_view_panel:get_cur_panel() or L2_2.get_top_focus_view().sub_view_panel:get_cur_panel().name ~= L3_3.sub_view_const.WeaponMainView.name then
		else
			local L14_220 = L14_220
			if not L2_2.get_top_focus_view().sub_view_panel:get_cur_panel().sub_view_panel:get_cur_panel() or L2_2.get_top_focus_view().sub_view_panel:get_cur_panel().sub_view_panel:get_cur_panel().name ~= L3_3.sub_view_const.WeaponSubView.name then
			end
		end
	end
	;({}).name = L3_3.WeaponCampUpView.name
	;({}).play_effect = false
	;({}).weapon_slot = L14_220
	;({}).pre_suit = L10_216
	;({}).show_args, ({}).cur_suit = {}, L11_217
	L41_41.add_pop_view({})
	local L13_219 = L13_219
end
function L9_9.check_trigger_weapon_display(A0_221, A1_222)
	local L2_223, L3_224, L4_225, L5_226, L6_227, L7_228, L8_229
	L2_223 = {}
	local L3_224, L16_237 = false, L16_237
	L4_225 = false
	L5_226 = nil
	L6_227 = nil
	L7_228 = nil
	L8_229 = nil
	L11_232 = pairs
	L12_233 = _ENV
	L11_232, L12_233, L13_234 = L11_232(L12_233)
	for L14_235, L15_236 in L11_232, L12_233, L13_234 do
		L16_237 = L70_70
		L16_237 = L16_237[L14_235]
		if not L6_6.weapon_replace_display_dic[L14_235] then
		end
		if L16_237 and L16_237 ~= L15_236 and L6_6.weapon_quality_dic[L16_237] > 0 then
			L2_223[L15_236] = true
			L2_223[L16_237] = true
		end
	end
	return L2_223
end
function L9_9.init_red_point()
	local L0_238
	L0_238 = {}
	L0_238.parent_ids, ({})[1] = {}, "main_view_bottom_weapon_btn"
	L0_238.id = "weapon_sub_weapon_red_point"
	L0_238.tp = 1
	local L1_239 = L1_239
	L1_239(L0_238)
	L1_239 = {}
	L1_239.parent_ids, ({})[1] = {}, "main_view_bottom_weapon_btn"
	L1_239.id = "weapon_sub_equip_red_point"
	L1_239.tp = 1
	local L2_240 = L2_240
	L2_240(L1_239)
	L2_240 = {}
	L2_240.parent_ids, ({})[1] = {}, "main_view_bottom_weapon_btn"
	L2_240.id = "weapon_sub_skill_red_point"
	L2_240.tp = 1
	local L3_241 = L3_241
	L3_241(L2_240)
	L3_241 = {}
	L3_241.parent_ids, ({})[1] = {}, "weapon_sub_weapon_red_point"
	L3_241.id = "main_weapon_develop_show_star_up_red_point"
	L3_241.tp = 1
	L3_241.point_cb_infos, ({})[1], ({}).cb = {}, {}, L4_4.has_main_weapon_develop_show_star_up_red_point
	local L4_242 = L4_242
	L4_242(L3_241)
	L4_242 = {}
	L4_242.id = "main_weapon_develop_star_up_red_point"
	L4_242.tp = 1
	L4_242.point_cb_infos, ({})[1], ({}).cb = {}, {}, L4_4.has_main_weapon_develop_star_up_red_point
	local L5_243 = L5_243
	L5_243(L4_242)
	L5_243 = {}
	L5_243.id = "main_weapon_develop_star_up_cur_red_point"
	L5_243.tp = 1
	L5_243.point_cb_infos, ({})[1], ({}).cb = {}, {}, L4_4.has_main_weapon_develop_star_up_cur_red_point
	local L6_244 = L6_244
	L6_244(L5_243)
	L6_244 = {}
	L6_244.parent_ids, ({})[1] = {}, "weapon_sub_weapon_red_point"
	L6_244.id = "main_weapon_develop_strength_entrance_red_point"
	L6_244.tp = 1
	local L7_245 = L7_245
	L7_245(L6_244)
	L7_245 = {}
	L7_245.parent_ids, ({})[1] = {}, "main_weapon_develop_strength_entrance_red_point"
	L7_245.id = "main_weapon_develop_strength_red_point"
	L7_245.tp = 1
	L7_245.point_cb_infos, ({})[1], ({}).cb = {}, {}, L4_4.has_main_weapon_develop_strength_red_point
	local L8_246 = L8_246
	L8_246(L7_245)
	L8_246 = {}
	L8_246.id = "main_weapon_develop_strength_red_point"
	L8_246.tp = 1
	;({}).cb = L4_4.has_main_weapon_develop_strength_green_point
	L8_246.point_cb_infos, ({})[1], ({}).is_green = {}, {}, true
	local L9_247 = L9_247
	L9_247(L8_246)
	L9_247 = {}
	L9_247.id = "weapon_plan_red_point"
	L9_247.tp = 1
	;({})[1], ({}).cb = {}, function()
		return _ENV.has_weapon_plan_red_point()
	end
	;({}).cb = function()
		return _ENV.has_weapon_plan_green_point()
	end
	L9_247.point_cb_infos, ({})[2], ({}).is_green = {}, {}, true
	local L10_248 = L10_248
	L10_248(L9_247)
	L10_248 = {}
	L10_248.id = "cur_weapon_plan_red_point"
	L10_248.tp = 1
	;({})[1], ({}).cb = {}, function()
		local L0_259 = _ENV.get_using_weapon_plan()
		if L0_259 then
			local L1_260 = L1_260
			do return L1_260(L0_259.id) end
			local L2_261 = L2_261
		end
		L1_260 = 0
		return L1_260
	end
	;({}).cb = function()
		local L0_262 = _ENV.get_using_weapon_plan()
		if L0_262 then
			local L1_263 = L1_263
			do return L1_263(L0_262.id) end
			local L2_264 = L2_264
		end
		L1_263 = 0
		return L1_263
	end
	L10_248.point_cb_infos, ({})[2], ({}).is_green = {}, {}, true
	local L11_249 = L11_249
	L11_249(L10_248)
	L11_249 = {}
	L11_249.id = "cur_default_weapon_plan_red_point"
	L11_249.tp = 1
	;({})[1], ({}).cb = {}, function()
		local L0_265 = L0_265
		L0_265 = L0_265(true)
		if L0_265 then
			local L1_266 = L1_266
			do return L1_266(L0_265.id) end
			local L2_267 = L2_267
		end
		L1_266 = 0
		return L1_266
	end
	;({}).cb = function()
		local L0_268 = L0_268
		L0_268 = L0_268(true)
		if L0_268 then
			local L1_269 = L1_269
			do return L1_269(L0_268.id) end
			local L2_270 = L2_270
		end
		L1_269 = 0
		return L1_269
	end
	L11_249.point_cb_infos, ({})[2], ({}).is_green = {}, {}, true
	L12_250(L11_249)
	L12_250 = 1
	_FOR_ = 1
	for _FORV_15_ = L12_250, _FOR_, _FOR_ do
		({}).id = string.format("weapon_plan_%s_red_point", _FORV_15_)
		;({}).tp = 1
		;({})[1], ({}).cb = {}, function()
			do return _ENV.has_weapon_plan_red_point(_UPVALUE1_) end
			local L1_271 = L1_271
		end
		;({}).cb = function()
			do return _ENV.has_weapon_plan_green_point(_UPVALUE1_) end
			local L1_272 = L1_272
		end
		;({}).point_cb_infos, ({})[2], ({}).is_green = {}, {}, true
		_ENV.new_red_point({})
	end
	L12_250 = {}
	L12_250.parent_ids, ({})[1] = {}, "main_weapon_develop_star_up_red_point"
	L12_250.id = "main_weapon_develop_unlock_red_point"
	L12_250.tp = 1
	L12_250.point_cb_infos, ({})[1], ({}).cb = {}, {}, L4_4.has_main_weapon_develop_unlock_red_point
	local L13_251 = L13_251
	L13_251(L12_250)
	L13_251 = {}
	L13_251.parent_ids, ({})[1] = {}, "main_weapon_develop_strength_entrance_red_point"
	L13_251.id = "strength_return_task_red_point"
	L13_251.tp = 1
	L13_251.point_cb_infos, ({})[1], ({}).cb = {}, {}, function()
		local L0_273 = _ENV.has_strength_rand_task_red_point()
		if L0_273 then
			L0_273 = 1
			if L0_273 then
				goto lbl_10
			end
		end
		L0_273 = 0
		::lbl_10::
		return L0_273
	end
	local L14_252 = L14_252
	L14_252(L13_251)
	L14_252 = {}
	L14_252.parent_ids, ({})[1] = {}, "main_weapon_develop_strength_entrance_red_point"
	L14_252.id = "weapon_master_red_point"
	L14_252.tp = 1
	L14_252.point_cb_infos, ({})[1], ({}).cb = {}, {}, L4_4.has_weapon_master_red_point
	local L15_253 = L15_253
	L15_253(L14_252)
	L15_253 = {}
	L15_253.parent_ids, ({})[1] = {}, "weapon_sub_weapon_red_point"
	L15_253.id = "weapon_equip_mode_red_point"
	L15_253.tp = 1
	L15_253.point_cb_infos, ({})[1], ({}).cb = {}, {}, L4_4.has_weapon_equip_mode_red_point
	local L16_254 = L16_254
	L16_254(L15_253)
	L16_254 = {}
	L16_254.parent_ids, ({})[1] = {}, "weapon_sub_weapon_red_point"
	L16_254.id = "weapon_bond_need_active_red_point"
	L16_254.tp = 1
	L16_254.point_cb_infos, ({})[1], ({}).cb = {}, {}, function()
		return _ENV.has_weapon_bond_need_active_red_point()
	end
	local L17_255 = L17_255
	L17_255(L16_254)
	L17_255 = {}
	L17_255.id = "weapon_camp_info_red_point"
	L17_255.tp = 1
	local ({}).cb, L20_258 = L4_4.has_weapon_camp_info_red_point, L20_258
	L20_258[1], ({}).is_green = {}, true
	L17_255.point_cb_infos = L20_258
	L20_258 = _ENV
	L20_258 = L20_258.new_red_point
	L20_258(L17_255)
	local L19_257 = L19_257
end
function L9_9.has_weapon_bond_need_active_red_point(A0_274)
	local L4_278, L13_287 = _ENV.get_weapon_slot, L13_287
	L4_278 = L4_278()
	L5_279 = ipairs
	L6_280 = L4_278
	L5_279, L6_280, L7_281 = L5_279(L6_280)
	for L11_285, L12_286 in L5_279, L6_280, L7_281 do
		L13_287 = L12_286.item_cid
		if 0 < L13_287 then
			L13_287 = _ENV
			L13_287 = L13_287.weapon_cfg_dic
			L13_287 = L13_287[L12_286.item_cid]
			_FOR_, _FOR_, _FOR_ = ipairs((_ENV.get_bond_by_weapon_id(L12_286.item_cid)))
			for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
				local L14_288 = L14_288
				if _ENV.is_weapon_bond_active(_FORV_13_.id) and _ENV.is_bond_need_active(_FORV_13_.id) then
					return 1
				end
			end
		end
	end
	L5_279 = 0
	return L5_279
end
function L9_9.has_weapon_camp_info_red_point()
	if _ENV.get_unlock_slot_num() < 4 then
		return 0
	end
	local L0_291 = L0_291
	local L1_292 = L1_292
	local L0_291, L2_293 = L0_291(L1_292, "number"), L2_293
	L0_291 = L0_291 == 1
	if L0_291 then
		L1_292 = 0
		if L1_292 then
			goto lbl_23
		end
	end
	L1_292 = 1
	::lbl_23::
	return L1_292
end
function L9_9.has_weapon_bond_need_active_red_point_by_slot(A0_294)
	local L4_298, L13_307 = _ENV.get_weapon_slot, L13_307
	L4_298 = L4_298()
	L5_299 = ipairs
	L6_300 = L4_298
	L5_299, L6_300, L7_301 = L5_299(L6_300)
	for L11_305, L12_306 in L5_299, L6_300, L7_301 do
		L13_307 = L12_306.pos
		if L13_307 == A0_294 then
			L13_307 = L12_306.item_cid
			if 0 < L13_307 then
				L13_307 = _ENV
				L13_307 = L13_307.weapon_cfg_dic
				L13_307 = L13_307[L12_306.item_cid]
				_FOR_, _FOR_, _FOR_ = ipairs((_ENV.get_bond_by_weapon_id(L12_306.item_cid)))
				for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
					local L14_308 = L14_308
					if _ENV.is_weapon_bond_active(_FORV_13_.id) and _ENV.is_bond_need_active(_FORV_13_.id) then
						return true
					end
				end
				break
			end
		end
	end
	L5_299 = false
	return L5_299
end
function L9_9.is_same_weapon_slot(A0_311, A1_312)
	local L2_313
	L2_313 = true
	local L5_316, L12_323 = ipairs, L12_323
	L6_317 = A0_311
	L5_316, L6_317, L7_318 = L5_316(L6_317)
	for L8_319, L11_322 in L5_316, L6_317, L7_318 do
		L12_323 = false
		L13_324 = ipairs
		L14_325 = A1_312
		L13_324, L14_325, L15_326 = L13_324(L14_325)
		for _FORV_12_, _FORV_13_ in L13_324, L14_325, L15_326 do
			if _FORV_13_.pos == L11_322.pos and _FORV_13_.item_cid == L11_322.item_cid then
				L12_323 = true
				break
			end
		end
		if not L12_323 then
			L2_313 = false
			break
		end
	end
	return L2_313
end
function L9_9.has_weapon_equip_mode_red_point()
	local L19_346, L20_347 = _ENV.get_all_weapon_list, L20_347
	L20_347 = nil
	L19_346 = L19_346(L20_347, nil, true, true)
	L20_347 = next
	L20_347 = L20_347(L19_346)
	if not L20_347 then
		L20_347 = 0
		return L20_347
	end
	L20_347 = _ENV
	L20_347 = L20_347.get_weapon_slot
	L20_347 = L20_347()
	local L2_329 = _ENV.get_empty_slot()
	if 0 < L2_329 then
		table.clear(_UPVALUE1_)
		_FOR_, _FOR_, _FOR_ = ipairs(L20_347)
		for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
			if 0 < _FORV_7_.item_cid then
				_UPVALUE1_[_ENV.weapon_cfg_dic[_FORV_7_.item_cid].group] = _FORV_7_.item_cid
			end
		end
		_FOR_, _FOR_, _FOR_ = ipairs(L19_346)
		local L5_332 = L5_332
		for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
			if _UPVALUE1_[_ENV.weapon_cfg_dic[_FORV_8_.id].group] then
				repeat
					if not _ENV.is_better_quality_weapon(_FORV_8_.id, _UPVALUE1_[_ENV.weapon_cfg_dic[_FORV_8_.id].group]) then
						goto lbl_71
					end
					do return 1 end
					do break end -- pseudo-goto
					L5_332 = true
				until true
			end
			::lbl_71::
		end
		if L5_332 then
			L9_336 = 1
			return L9_336
		end
	end
	L5_332 = table
	L5_332 = L5_332.clear
	L9_336 = _UPVALUE1_
	L5_332(L9_336)
	L5_332 = 9999
	L9_336 = _ENV
	L9_336 = L9_336.get_weapon_slot
	L9_336 = L9_336()
	L10_337 = false
	_FOR_, _FOR_, _FOR_ = ipairs(L9_336)
	for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
		if 0 < _FORV_10_.item_cid then
			if _ENV.weapon_artifact_dic[_FORV_10_.item_cid] then
				L10_337 = true
			end
			_UPVALUE1_[_ENV.weapon_cfg_dic[_FORV_10_.item_cid].group] = _FORV_10_.item_cid
			L5_332 = math.min(_ENV.weapon_quality_dic[_FORV_10_.item_cid], L5_332)
		end
	end
	_FOR_, _FOR_, _FOR_ = pairs(_UPVALUE1_)
	for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
		_FOR_, _FOR_, _FOR_ = ipairs(_ENV.weapon_cfg_by_group_dic[_FORV_9_])
		for _FORV_19_, _FORV_20_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_20_.id ~= _FORV_10_ and _ENV.is_weapon_unlock(_FORV_20_.id) then
				if not L10_337 and L24_351 <= _ENV.weapon_quality_dic[_FORV_20_.id] and _ENV.get_weapon_rating(_FORV_10_) < _ENV.get_weapon_rating(_FORV_20_.id) then
					do return 1 end
					break -- pseudo-goto
				end
				if _ENV.weapon_quality_dic[_FORV_20_.id] == L24_351 and _ENV.get_weapon_rating(_FORV_20_.id) == _ENV.get_weapon_rating(_FORV_10_) and _ENV.get_weapon_star(_FORV_10_) < _ENV.get_weapon_star(_FORV_20_.id) then
					return 1
				end
			end
			repeat
			until true
		end
	end
	L13_340 = pairs
	L14_341 = _ENV
	L14_341 = L14_341.weapon_cfg_by_group_dic
	L13_340, L14_341, L15_342 = L13_340(L14_341)
	for L16_343, L21_348 in L13_340, L14_341, L15_342 do
		L22_349 = _UPVALUE1_
		L22_349 = L22_349[L16_343]
		if not L22_349 then
			L22_349 = ipairs
			L23_350 = L21_348
			L22_349, L23_350, L24_351 = L22_349(L23_350)
			for L25_352, _FORV_15_ in L22_349, L23_350, L24_351 do
				if not L10_337 and L5_332 < _ENV.weapon_quality_dic[_FORV_15_.id] and _ENV.is_weapon_unlock(_FORV_15_.id) and L5_332 < L59_59.purple then
					return 1
				end
			end
		end
	end
	L13_340 = 0
	return L13_340
end
function L9_9.has_weapon_equip_mode_red_point_by_weapon_id(A0_353)
	local L18_371 = _ENV.is_weapon_unlock
	L18_371 = L18_371(A0_353)
	if not L18_371 then
		return false
	end
	local L2_355 = L2_355
	local L2_355, L3_356 = L2_355(A0_353), L3_356
	if L2_355 then
		L3_356 = false
		return L3_356
	end
	L3_356 = _ENV
	L3_356 = L3_356.weapon_cfg_dic
	L3_356 = L3_356[A0_353]
	local L4_357 = _ENV.get_empty_slot()
	local L5_358 = _ENV.get_weapon_slot()
	if 0 < L4_357 then
		table.clear(_UPVALUE1_)
		_FOR_, _FOR_, _FOR_ = ipairs(L5_358)
		for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
			if 0 < _FORV_10_.item_cid then
				_UPVALUE1_[_ENV.weapon_cfg_dic[_FORV_10_.item_cid].group] = _FORV_10_.item_cid
			end
		end
		if _UPVALUE1_[L3_356.group] then
			do return _ENV.is_better_quality_weapon(A0_353, _UPVALUE1_[L3_356.group]), true end
			local L8_361 = L8_361
			repeat
				do break end -- pseudo-goto
				L8_361 = true
				return L8_361, true
			until true
		end
	end
	L8_361 = table
	L8_361 = L8_361.clear
	L8_361(_UPVALUE1_)
	L8_361 = table
	L8_361 = L8_361.clear
	L8_361(_UPVALUE2_)
	local L7_360 = L7_360
	L8_361 = L3_356.group
	L7_360 = 9999
	local L9_362 = L9_362
	L10_363, _FOR_, _FOR_ = ipairs(L5_358)
	for _FORV_12_, _FORV_13_ in L10_363, _FOR_, _FOR_ do
		if 0 < _FORV_13_.item_cid then
			_UPVALUE1_[_ENV.weapon_cfg_dic[_FORV_13_.item_cid].group] = _FORV_13_.item_cid
			_UPVALUE2_[_FORV_13_.item_cid] = true
			if _ENV.weapon_artifact_dic[_FORV_13_.item_cid] then
				L9_362 = true
			end
			L7_360 = math.min(_ENV.weapon_quality_dic[_FORV_13_.item_cid], L7_360)
		end
	end
	L10_363 = _UPVALUE1_
	L10_363 = L10_363[L8_361]
	if L10_363 then
		L10_363 = _UPVALUE1_
		L10_363 = L10_363[L8_361]
		L14_367 = _ENV
		L14_367 = L14_367.weapon_quality_dic
		L14_367 = L14_367[L10_363]
		local L12_365 = L12_365
		local L13_366 = _ENV.get_weapon_star(L10_363)
		local L15_368 = L15_368
		local L16_369 = L16_369
		local L17_370 = L17_370
		if not L9_362 and L14_367 <= L16_369 and L12_365 < L17_370 then
			return true, true
		else
			repeat
				if not (L16_369 == L14_367 and L17_370 == L12_365 and L13_366 < _ENV.get_weapon_star(A0_353)) then
					goto lbl_183
				end
				do return true, true end
				do break end -- pseudo-goto
				L10_363 = _ENV
				L10_363 = L10_363.weapon_quality_dic
				L10_363 = L10_363[A0_353]
				if not L9_362 then
					L14_367 = _UPVALUE2_
					L14_367 = L14_367[A0_353]
					if not L14_367 and L7_360 < L10_363 then
						L14_367 = L59_59
						L14_367 = L14_367.purple
						if L7_360 < L14_367 then
							L14_367 = true
							return L14_367
						end
					end
				end
			until true
		end
	end
	::lbl_183::
	L10_363 = false
	return L10_363
end
function L9_9.has_weapon_master_red_point()
	if not _ENV.is_open(L39_39.type.weapon_strengthen) then
		return 0
	end
	local L1_373 = _ENV.is_open(L39_39.type.weapon_master)
	if not L1_373 then
		L1_373 = 0
		return L1_373
	end
	L1_373 = L6_6
	L1_373 = L1_373.can_weapon_master_level_up
	L1_373 = L1_373()
	if not L1_373 or not 1 then
	end
	return 0
end
function L9_9.has_main_weapon_develop_unlock_red_point()
	local L2_376, L10_384 = _ENV.is_open, L10_384
	L3_377 = L39_39
	L3_377 = L3_377.type
	L3_377 = L3_377.weapon_star_up
	L2_376 = L2_376(L3_377)
	if not L2_376 then
		L2_376 = 0
		return L2_376
	end
	L2_376 = pairs
	L3_377 = L6_6
	L3_377 = L3_377.weapon_cfg_dic
	L2_376, L3_377, L4_378 = L2_376(L3_377)
	for L5_379, L6_380 in L2_376, L3_377, L4_378 do
		L10_384 = L6_6
		L10_384 = L10_384.weapon_unlock_dic
		L10_384 = L10_384[L5_379]
		if L6_6.weapon_open_dic[L5_379] and not L10_384 and L6_6.weapon_star_cfg_dic[L5_379] and not L6_6.is_limit_time_weapon(L5_379) then
			local L8_382 = L8_382
			local L9_383 = L9_383
			if L20_20.get_item(L6_6.weapon_star_cfg_dic[L5_379][1].cost_shards[1]).syn_effect and next(L20_20.get_item(L6_6.weapon_star_cfg_dic[L5_379][1].cost_shards[1]).syn_effect) then
				local L11_385 = L11_385
				local L12_386 = L12_386
			end
			if L33_33.get_item_count(L20_20.get_item(L6_6.weapon_star_cfg_dic[L5_379][1].cost_shards[1]).id) >= L12_386[1] then
				return 1
			end
		end
	end
	L2_376 = 0
	return L2_376
end
function L9_9.has_weapon_plan_red_point(A0_387)
	local L5_392, L6_393 = _ENV.is_open, L6_393
	L6_393 = _ENV
	L6_393 = L6_393.const
	L6_393 = L6_393.type
	L6_393 = L6_393.weapon_wear_pos_4
	L5_392 = L5_392(L6_393)
	if not L5_392 then
		L5_392 = 0
		return L5_392
	end
	L5_392 = L12_12
	L5_392 = L5_392.get_plan_list
	L5_392 = L5_392()
	L6_393 = 0
	L7_394 = ipairs
	L8_395 = L5_392
	L7_394, L8_395, L11_398 = L7_394(L8_395)
	for L14_399, _FORV_7_ in L7_394, L8_395, L11_398 do
		if not A0_387 or _FORV_7_.id == A0_387 then
			if _FORV_7_.list then
				_FOR_, _FOR_, _FOR_ = ipairs(_FORV_7_.list)
				repeat
					for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
						if 0 < _FORV_13_.item_cid then
						end
					end
					if 0 + 1 ~= 0 then
						goto lbl_44
					end
					L6_393 = L6_393 + 1
					do break end -- pseudo-goto
					L6_393 = L6_393 + 1
				until true
			end
		end
		::lbl_44::
	end
	return L6_393
end
function L9_9.has_weapon_plan_green_point(A0_400)
	local L5_405, L6_406 = _ENV.is_open, L6_406
	L6_406 = _ENV
	L6_406 = L6_406.const
	L6_406 = L6_406.type
	L6_406 = L6_406.weapon_wear_pos_4
	L5_405 = L5_405(L6_406)
	if not L5_405 then
		L5_405 = 0
		return L5_405
	end
	L5_405 = L12_12
	L5_405 = L5_405.get_plan_list
	L5_405 = L5_405()
	L6_406 = 0
	L7_407 = ipairs
	L8_408 = L5_405
	L7_407, L8_408, L11_411 = L7_407(L8_408)
	for L14_412, _FORV_7_ in L7_407, L8_408, L11_411 do
		if (not A0_400 or _FORV_7_.id == A0_400) and _FORV_7_.list then
			_FOR_, _FOR_, _FOR_ = ipairs(_FORV_7_.list)
			for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
				if 0 < _FORV_13_.item_cid then
				end
			end
			if 0 < 0 + 1 and 0 + 1 < 3 then
				L6_406 = L6_406 + 1
			end
		end
	end
	return L6_406
end
function L9_9.has_main_weapon_develop_auto_wear_red_point()
	local L5_418 = table.clear
	L5_418(_ENV)
	L5_418 = L4_4
	L5_418 = L5_418.get_auto_wear_result
	L5_418 = L5_418()
	_FOR_, _FOR_, _FOR_ = ipairs(L5_418)
	for _FORV_4_, _FORV_5_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_5_.item_cid > 0 then
			_ENV[_FORV_5_.item_cid] = true
		end
	end
	L6_419 = table
	L6_419 = L6_419.clear
	L6_419(_UPVALUE2_)
	L6_419 = L6_6
	L6_419 = L6_419.get_weapon_slot
	L6_419 = L6_419()
	L2_415, _FOR_, _FOR_ = L2_415(L6_419)
	for _FORV_5_, _FORV_6_ in L2_415, _FOR_, _FOR_ do
		if _FORV_6_.item_cid > 0 then
			_UPVALUE2_[_FORV_6_.item_cid] = true
		end
	end
	L2_415 = false
	L8_421 = pairs
	L8_421, L4_417, _FOR_ = L8_421(_ENV)
	for _FORV_6_, _FORV_7_ in L8_421, L4_417, _FOR_ do
		if _FORV_7_ and not _UPVALUE2_[_FORV_6_] then
			L2_415 = true
			break
		end
	end
	if L2_415 then
		L8_421 = 1
		if L8_421 then
			goto lbl_60
		end
	end
	L8_421 = 0
	::lbl_60::
	return L8_421
end
function L9_9.has_main_weapon_develop_show_star_up_red_point()
	local L4_426, L5_427 = _ENV.is_open, L5_427
	L5_427 = L39_39
	L5_427 = L5_427.type
	L5_427 = L5_427.weapon_star_up
	L4_426 = L4_426(L5_427)
	if not L4_426 then
		L4_426 = 0
		return L4_426
	end
	L4_426 = 0
	L5_427 = L6_6
	L5_427 = L5_427.get_weapon_slot
	L5_427 = L5_427()
	L6_428 = pairs
	L6_428, L3_425, _FOR_ = L6_428(L6_6.weapon_can_star_up_dic)
	for _FORV_5_, _FORV_6_ in L6_428, L3_425, _FOR_ do
		if _FORV_6_ then
			if L6_6.weapon_star_cfg_dic[_FORV_5_] then
			end
			if L6_6.weapon_star_cfg_dic[_FORV_5_][L6_6.get_weapon_star(_FORV_5_)] then
				if not L6_6.weapon_star_cfg_dic[_FORV_5_][L6_6.get_weapon_star(_FORV_5_)].cost or not next(L6_6.weapon_star_cfg_dic[_FORV_5_][L6_6.get_weapon_star(_FORV_5_)].cost) then
					if L6_6.is_weapon_equip(_FORV_5_) then
						return 1
					else
						L4_426 = L4_426 + 1
					end
				else
					local L10_432 = L10_432
					local L11_433 = L11_433
					if L33_33.get_item_count(L6_6.weapon_star_cfg_dic[_FORV_5_][L6_6.get_weapon_star(_FORV_5_)].cost[1]) >= L6_6.weapon_star_cfg_dic[_FORV_5_][L6_6.get_weapon_star(_FORV_5_)].cost[2] then
						if L10_432 then
							return 1
						else
							L4_426 = L4_426 + 1
						end
					end
				end
			end
		end
	end
	if 10 <= L4_426 then
		L6_428 = 1
		if L6_428 then
			goto lbl_79
		end
	end
	L6_428 = 0
	::lbl_79::
	return L6_428
end
function L9_9.has_main_weapon_develop_star_up_red_point()
	local L3_437 = _ENV.is_open
	L4_438 = L39_39
	L4_438 = L4_438.type
	L4_438 = L4_438.weapon_star_up
	L3_437 = L3_437(L4_438)
	if not L3_437 then
		L3_437 = 0
		return L3_437
	end
	L3_437 = L6_6
	L3_437 = L3_437.get_weapon_slot
	L3_437 = L3_437()
	L4_438 = pairs
	L5_439 = L6_6
	L5_439 = L5_439.weapon_can_star_up_dic
	L4_438, L5_439, _FOR_ = L4_438(L5_439)
	for _FORV_4_, _FORV_5_ in L4_438, L5_439, _FOR_ do
		if _FORV_5_ then
			if L6_6.weapon_star_cfg_dic[_FORV_4_] then
			end
			if L6_6.weapon_star_cfg_dic[_FORV_4_][L6_6.get_weapon_star(_FORV_4_)] then
				if not L6_6.weapon_star_cfg_dic[_FORV_4_][L6_6.get_weapon_star(_FORV_4_)].cost or not next(L6_6.weapon_star_cfg_dic[_FORV_4_][L6_6.get_weapon_star(_FORV_4_)].cost) then
					return 1
				else
					local L9_443 = L9_443
					local L10_444 = L10_444
					if L33_33.get_item_count(L6_6.weapon_star_cfg_dic[_FORV_4_][L6_6.get_weapon_star(_FORV_4_)].cost[1]) >= L6_6.weapon_star_cfg_dic[_FORV_4_][L6_6.get_weapon_star(_FORV_4_)].cost[2] then
						return 1
					end
				end
			end
		end
	end
	L4_438 = 0
	return L4_438
end
function L9_9.has_main_weapon_develop_star_up_cur_red_point()
	if not _ENV.is_open(L39_39.type.weapon_star_up) then
		return 0
	end
	local L0_445 = L0_445
	local L0_445, L1_446 = L0_445("is_show_star_up_red_point"), L1_446
	if L0_445 then
		L1_446 = 1
		if L1_446 then
			goto lbl_21
		end
	end
	L1_446 = 0
	::lbl_21::
	return L1_446
end
function L9_9.has_main_weapon_develop_strength_red_point()
	if not _ENV.is_open(L39_39.type.weapon_strengthen) then
		return 0
	end
	local L0_447 = L6_6.get_first_weapon()
	L0_447 = 0 < L0_447
	if not L0_447 then
		return 0
	end
	local L1_448 = L1_448
	L1_448 = L1_448(true)
	if not L1_448 then
		L1_448 = 0
		return L1_448
	end
	L1_448 = {}
	local L2_449 = L2_449
	local L3_450 = L3_450
	local L2_449, L4_451 = L2_449(L3_450, L1_448), L4_451
	L3_450 = 0
	L4_451 = nil
	local L5_452 = L5_452
	L5_452 = L5_452("WeaponOtherDevelopView")
	if L5_452 then
		local L8_455 = L5_452.sub_view_mgr:get_panel(1)
		if L8_455 then
			L4_451 = L8_455.selected_stone
		end
	end
	L8_455 = L6_6
	L8_455 = L8_455.get_strength_success_rate
	local L8_455, L7_454 = L8_455(L4_451), L7_454
	if L2_449 > L8_455 then
		L7_454 = _UPVALUE4_
		if L2_449 >= L7_454 then
			L7_454 = 1
			if L7_454 then
				goto lbl_64
			end
		end
	end
	L7_454 = 0
	::lbl_64::
	return L7_454
end
function L9_9.has_main_weapon_develop_strength_green_point()
	local L7_463 = _ENV.is_open
	L7_463 = L7_463(L39_39.type.weapon_strengthen)
	if not L7_463 then
		L7_463 = 0
		return L7_463
	end
	L7_463 = L6_6
	L7_463 = L7_463.get_first_weapon
	L7_463 = L7_463()
	L7_463 = 0 < L7_463
	if not L7_463 then
		return 0
	end
	if L6_6.get_cur_strength_lv() < _UPVALUE3_ then
		return 0
	end
	local L1_457 = L1_457
	local L1_457, L2_458 = L1_457(true), L2_458
	if not L1_457 then
		L1_457 = 0
		return L1_457
	end
	L1_457 = nil
	L2_458 = nil
	local L3_459 = L3_459
	L3_459 = L3_459("WeaponOtherDevelopView")
	if L3_459 and L3_459.sub_view_mgr:get_panel(1) then
		L1_457 = L3_459.sub_view_mgr:get_panel(1).selected_stone
		L2_458 = L3_459.sub_view_mgr:get_panel(1).lucky_note_cid
	end
	local L4_460 = L4_460
	L4_460 = L4_460(L1_457, L2_458)
	local L5_461 = L6_6.get_cur_auto_strength_success_rate()
	local L6_462 = L6_6.check_any_note_enough()
	if L6_462 then
		local L8_464 = L8_464
		L5_461 = L5_461 + L5_461 * L6_6.get_luck_note_multiplier(L6_6.check_any_note_enough())
	end
	local L9_465 = L9_465
	L9_465 = L9_465(L6_6.get_cur_strength_lv())
	if not (L4_460 < L5_461 and L5_461 >= L9_465 and L5_461 < _UPVALUE5_) or not 1 then
	end
	return 0
end
function L9_9.on_coin_changed()
	_ENV.refresh_weapon_can_star_up_dic()
	L40_40.update_red_point("main_weapon_develop_strength_red_point")
	L40_40.update_red_point("main_weapon_develop_star_up_red_point")
	L40_40.update_red_point("main_weapon_develop_show_star_up_red_point")
	L40_40.update_red_point("main_weapon_develop_star_up_cur_red_point")
	local L1_466 = L1_466
end
function L9_9.on_player_level_up()
	_ENV.update_red_point("main_weapon_develop_strength_red_point")
	local L1_467 = L1_467
end
function L9_9.on_open_func_event_update_item(A0_468)
	L3_471 = _ENV.type
	L3_471 = L3_471.weapon_star_up
	if A0_468 == L3_471 then
		L3_471 = L6_6
		L3_471 = L3_471.refresh_weapon_can_star_up_dic
		L3_471()
		L3_471 = L40_40
		L3_471 = L3_471.update_red_point
		L3_471("main_weapon_develop_star_up_red_point")
		L3_471 = L40_40
		L3_471 = L3_471.update_red_point
		L3_471("main_weapon_develop_show_star_up_red_point")
		L3_471 = L40_40
		L3_471 = L3_471.update_red_point
		L3_471("main_weapon_develop_star_up_cur_red_point")
		L3_471 = L40_40
		L3_471 = L3_471.update_red_point
		L3_471("main_weapon_develop_unlock_red_point")
	else
		L3_471 = _ENV
		L3_471 = L3_471.type
		L3_471 = L3_471.weapon_strengthen
		if A0_468 == L3_471 then
			L3_471 = L40_40
			L3_471 = L3_471.update_red_point
			L3_471("main_weapon_develop_strength_red_point")
		else
			L3_471 = L6_6
			L3_471 = L3_471.get_weapon_strength_open_func
			L3_471 = L3_471()
			if A0_468 == L3_471 then
				L3_471 = L40_40
				L3_471 = L3_471.update_red_point
				L3_471("main_weapon_develop_strength_red_point")
			else
				L3_471 = _ENV
				L3_471 = L3_471.type
				L3_471 = L3_471.weapon_master
				if A0_468 == L3_471 then
					L3_471 = L40_40
					L3_471 = L3_471.update_red_point
					L3_471("weapon_master_red_point")
				else
					L3_471 = ipairs
					L3_471, L2_470, _FOR_ = L3_471(L6_6.slot_func_id)
					for _FORV_4_, _FORV_5_ in L3_471, L2_470, _FOR_ do
						if _FORV_5_ == A0_468 then
							L40_40.update_red_point("weapon_camp_info_red_point")
							break
						end
					end
				end
			end
		end
	end
end
function L9_9.on_role_equip_strengthen()
	_ENV.update_red_point("main_weapon_develop_strength_red_point")
	local L1_474 = L1_474
end
function L9_9.on_main_weapon_items_changed()
	_ENV.refresh_weapon_unlock_dic()
	_ENV.refresh_weapon_can_star_up_dic()
	_ENV.refresh_weapon_rating_dic()
	L40_40.update_red_point("main_weapon_develop_star_up_red_point")
	L40_40.update_red_point("main_weapon_develop_show_star_up_red_point")
	L40_40.update_red_point("main_weapon_develop_star_up_cur_red_point")
	L40_40.update_red_point("main_weapon_develop_unlock_red_point")
	L40_40.update_red_point("weapon_master_red_point")
	L40_40.update_red_point("weapon_equip_mode_red_point")
	local L1_475 = L1_475
end
function L9_9.on_main_weapon_pieces_items_changed()
	_ENV.refresh_weapon_unlock_dic()
	_ENV.refresh_weapon_can_star_up_dic()
	L40_40.update_red_point("main_weapon_develop_star_up_red_point")
	L40_40.update_red_point("main_weapon_develop_show_star_up_red_point")
	L40_40.update_red_point("main_weapon_develop_star_up_cur_red_point")
	L40_40.update_red_point("main_weapon_develop_unlock_red_point")
	local L1_476 = L1_476
end
function L9_9.on_update_new_day()
	_ENV.refresh_weapon_open_dic()
	L12_12.refresh_hot_plan_pool()
	L14_14.brocast("refresh_main_weapon_list")
	local L1_477 = L1_477
end
function L9_9.on_season_info_changed()
	_ENV.refresh_weapon_open_dic()
	L14_14.brocast("refresh_main_weapon_list")
	local L1_478 = L1_478
end
function L9_9.register_jump_info()
	local L3_482 = _ENV.register_info
	;({}).check_handler = function()
		local L1_483
		L1_483 = true
		return L1_483
	end
	;({}).handler = function(A0_484)
		if A0_484.index == 1 then
		elseif A0_484.index == 2 and not _ENV.is_open(L39_39.type.weapon_star_up) then
			BroadcastTips.broadcast_tips(_ENV.get_no_open_tips(L39_39.type.weapon_star_up))
			return
		end
		local L1_485 = L1_485
		local L2_486 = L2_486
		L1_485(L2_486, A0_484)
		local L3_487 = L3_487
	end
	L3_482("WeaponDevelopView", {})
	L3_482 = _ENV
	L3_482 = L3_482.register_info
	;({}).check_handler = function()
		local L1_488
		L1_488 = true
		return L1_488
	end
	;({}).handler = function(A0_489)
		if A0_489.index == 1 then
			if not _ENV.is_open(L39_39.type.weapon_strengthen) then
				BroadcastTips.broadcast_tips(_ENV.get_no_open_tips(L39_39.type.weapon_strengthen))
				return
			end
			if L6_6.get_first_weapon() == 0 then
				BroadcastTips.broadcast_tips("\232\175\183\229\133\136\231\169\191\230\136\180\228\187\187\230\132\143\228\184\128\230\138\138\230\173\166\229\153\168")
				return
			end
		end
		local L1_490 = L1_490
		local L2_491 = L2_491
		L1_490(L2_491, A0_489)
		local L3_492 = L3_492
	end
	L3_482("WeaponOtherDevelopView", {})
	L3_482 = _ENV
	L3_482 = L3_482.register_info
	;({}).check_handler = function()
		local L1_493
		L1_493 = true
		return L1_493
	end
	;({}).handler = function(A0_494)
		_ENV.open_view("WeaponPlanView")
		local L2_495 = L2_495
	end
	L3_482("WeaponPlan", {})
	L3_482 = _ENV
	L3_482 = L3_482.register_info
	