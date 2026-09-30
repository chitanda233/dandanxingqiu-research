local L0_0, L3_3, L4_4, L7_7, L8_8, L9_9, L12_12 = L0_0, "game.utils.events", L4_4, L7_7, L8_8, L9_9, L12_12
L0_0 = L0_0(L3_3)
L3_3 = require
L4_4 = "game.network.network_utils"
L3_3 = L3_3(L4_4)
L4_4 = Game
L4_4 = L4_4.redpoint_helper
L7_7 = Game
L7_7 = L7_7.ui_manager
L8_8 = Game
L8_8 = L8_8.ui_const
L9_9 = import
L12_12 = "..head"
L9_9 = L9_9(L12_12)
L12_12 = L9_9.network
local L11_11 = L11_11
local L13_13 = L13_13
local L14_14 = L14_14
function L12_12.init()
	({}).weapon_pos_info_s2c = _ENV.on_weapon_pos_info_s2c
	;({}).weapon_update_pos_s2c = _ENV.on_weapon_update_pos_s2c
	;({}).weapon_wear_s2c = _ENV.on_weapon_wear_s2c
	;({}).weapon_remove_s2c = _ENV.on_weapon_remove_s2c
	;({}).weapon_strengthen_s2c = _ENV.on_weapon_strengthen_s2c
	;({}).weapon_star_up_s2c = _ENV.on_weapon_star_up_s2c
	;({}).weapon_master_info_s2c = _ENV.on_weapon_master_info_s2c
	;({}).weapon_master_s2c = _ENV.on_weapon_master_s2c
	;({}).weapon_bond_info_s2c = _ENV.on_weapon_bond_info_s2c
	_ENV.net_event_names, ({}).weapon_bond_s2c = {}, _ENV.on_weapon_bond_s2c
	local L0_15 = L0_15
	local L1_16 = L1_16
	L0_15(L1_16, "main_weapon_develop")
	local L2_17 = L2_17
end
function L12_12.weapon_bond_c2s(A0_18)
	local L1_19 = L1_19
	local L2_20 = L2_20
	;({}).bond_id = A0_18
	L1_19(L2_20, {})
	local L3_21 = L3_21
end
function L12_12.weapon_bond_info_c2s()
	local L1_22 = L1_22
	L1_22("weapon_bond_info_c2s", {})
	local L2_23 = L2_23
end
function L12_12.weapon_master_info_c2s()
	local L1_24 = L1_24
	L1_24("weapon_master_info_c2s", {})
	local L2_25 = L2_25
end
function L12_12.weapon_master_c2s()
	local L1_26 = L1_26
	L1_26("weapon_master_c2s", {})
	local L2_27 = L2_27
end
function L12_12.weapon_pos_info_c2s()
	local L1_28 = L1_28
	L1_28("weapon_pos_info_c2s", {})
	local L2_29 = L2_29
end
function L12_12.on_weapon_pos_info_s2c(A0_30, A1_31)
	if A0_30 ~= 0 then
		return
	end
	L4_34 = _ENV
	L4_34 = L4_34.init_weapon_pos_info
	L5_35 = A1_31.list
	L4_34(L5_35)
	L4_34 = _ENV
	L4_34 = L4_34.refresh_weapon_open_dic
	L4_34()
	L4_34 = _ENV
	L4_34 = L4_34.refresh_weapon_unlock_dic
	L4_34()
	L4_34 = _ENV
	L4_34 = L4_34.refresh_weapon_rating_dic
	L4_34()
	L4_34 = _ENV
	L4_34 = L4_34.refresh_weapon_can_star_up_dic
	L4_34()
	L4_34 = L14_14
	L4_34 = L4_34.update_default_weapon_plan_weapon_list
	L5_35 = A1_31.list
	L4_34(L5_35)
	L4_34 = L14_14
	L4_34 = L4_34.refresh_hot_plan_pool
	L4_34()
	L4_34 = L14_14
	L4_34 = L4_34.refresh_recommend_plan_pool
	L4_34()
	L4_34 = L0_0
	L4_34 = L4_34.brocast
	L5_35 = L13_13
	L5_35 = L5_35.update_main_weapon_develop_info
	L4_34(L5_35)
	L4_34 = L2_2
	L4_34 = L4_34.update_red_point
	L5_35 = "weapon_equip_mode_red_point"
	L4_34(L5_35)
	L4_34 = L2_2
	L4_34 = L4_34.update_red_point
	L5_35 = "main_weapon_develop_star_up_red_point"
	L4_34(L5_35)
	L4_34 = L2_2
	L4_34 = L4_34.update_red_point
	L5_35 = "main_weapon_develop_show_star_up_red_point"
	L4_34(L5_35)
	L4_34 = L2_2
	L4_34 = L4_34.update_red_point
	L5_35 = "main_weapon_develop_star_up_cur_red_point"
	L4_34(L5_35)
	L4_34 = L2_2
	L4_34 = L4_34.update_red_point
	L5_35 = "main_weapon_develop_unlock_red_point"
	L4_34(L5_35)
	L4_34 = L2_2
	L4_34 = L4_34.update_red_point
	L5_35 = "main_weapon_develop_strength_red_point"
	L4_34(L5_35)
	L4_34 = L2_2
	L4_34 = L4_34.update_red_point
	L5_35 = "equip_stone_inlay_1"
	L4_34(L5_35)
	L4_34 = L2_2
	L4_34 = L4_34.update_red_point
	L5_35 = "weapon_plan_red_point"
	L4_34(L5_35)
	L4_34 = L2_2
	L4_34 = L4_34.update_red_point
	L5_35 = "cur_default_weapon_plan_red_point"
	L4_34(L5_35)
	L4_34 = L2_2
	L4_34 = L4_34.update_red_point
	L5_35 = "weapon_bond_need_active_red_point"
	L4_34(L5_35)
	L4_34 = 1
	L5_35 = 5
	L6_36 = 1
	for _FORV_5_ = L4_34, L5_35, L6_36 do
		local L8_38 = L8_38
		local L9_39 = string.format("weapon_plan_%s_red_point", _FORV_5_)
		L8_38(L9_39, string.format("weapon_plan_%s_red_point", _FORV_5_))
	end
end
function L12_12.on_weapon_update_pos_s2c(A0_40, A1_41)
	if A0_40 ~= 0 then
		return
	end
	L4_44 = _ENV
	L4_44 = L4_44.update_weapon_pos_info
	L5_45 = A1_41.list
	L4_44(L5_45)
	L4_44 = _ENV
	L4_44 = L4_44.refresh_weapon_is_equip_dic
	L4_44()
	L4_44 = L14_14
	L4_44 = L4_44.update_default_weapon_plan_weapon_list
	L5_45 = A1_41.list
	L4_44(L5_45)
	L4_44 = L0_0
	L4_44 = L4_44.brocast
	L5_45 = L13_13
	L5_45 = L5_45.update_main_weapon_develop_info
	L4_44(L5_45)
	L4_44 = L2_2
	L4_44 = L4_44.update_red_point
	L5_45 = "weapon_equip_mode_red_point"
	L4_44(L5_45)
	L4_44 = L2_2
	L4_44 = L4_44.update_red_point
	L5_45 = "main_weapon_develop_star_up_red_point"
	L4_44(L5_45)
	L4_44 = L2_2
	L4_44 = L4_44.update_red_point
	L5_45 = "main_weapon_develop_show_star_up_red_point"
	L4_44(L5_45)
	L4_44 = L2_2
	L4_44 = L4_44.update_red_point
	L5_45 = "main_weapon_develop_star_up_cur_red_point"
	L4_44(L5_45)
	L4_44 = L2_2
	L4_44 = L4_44.update_red_point
	L5_45 = "main_weapon_develop_unlock_red_point"
	L4_44(L5_45)
	L4_44 = L2_2
	L4_44 = L4_44.update_red_point
	L5_45 = "main_weapon_develop_strength_red_point"
	L4_44(L5_45)
	L4_44 = L2_2
	L4_44 = L4_44.update_red_point
	L5_45 = "equip_stone_inlay_1"
	L4_44(L5_45)
	L4_44 = L2_2
	L4_44 = L4_44.update_red_point
	L5_45 = "weapon_plan_red_point"
	L4_44(L5_45)
	L4_44 = L2_2
	L4_44 = L4_44.update_red_point
	L5_45 = "cur_default_weapon_plan_red_point"
	L4_44(L5_45)
	L4_44 = L2_2
	L4_44 = L4_44.update_red_point
	L5_45 = "weapon_bond_need_active_red_point"
	L4_44(L5_45)
	L4_44 = 1
	L5_45 = 5
	L6_46 = 1
	for _FORV_5_ = L4_44, L5_45, L6_46 do
		local L8_48 = L8_48
		local L9_49 = string.format("weapon_plan_%s_red_point", _FORV_5_)
		L8_48(L9_49, string.format("weapon_plan_%s_red_point", _FORV_5_))
	end
end
function L12_12.weapon_wear_c2s(A0_50)
	_ENV.set_value("wear_weapon_count", L9_9.get_wear_weapon_count())
	local L1_51 = L1_51
	local L2_52 = L2_52
	;({}).list = A0_50
	L1_51(L2_52, {})
	local L3_53 = L3_53
end
function L12_12.on_weapon_wear_s2c(A0_54, A1_55)
	if A0_54 ~= 0 then
		return
	end
	local L2_56 = L2_56
	L2_56 = L2_56("wear_weapon_count")
	local L3_57 = L3_57
	L3_57 = L3_57("is_main_weapon_auto_wear")
	if L3_57 then
		_ENV.set_value("is_main_weapon_auto_wear")
		BroadcastTips.broadcast_tips("\228\184\128\233\148\174\232\163\133\233\133\141\229\174\140\230\136\144")
	end
	local L4_58 = L4_58
	L4_58 = L4_58("is_replace_weapon")
	if L4_58 then
		_ENV.set_value("is_replace_equip")
		local L5_59 = L5_59
		L5_59("\229\183\178\230\155\191\230\141\162\228\189\142\229\147\129\232\180\168\230\173\166\229\153\168")
	end
	L5_59 = Game
	L5_59 = L5_59.module
	L5_59 = L5_59.guide_system
	L5_59.trigger(L5_59.const.trigger_type.weapon_wear_s2c)
	local L6_60 = L6_60
	L6_60("wear_weapon_count")
	local L7_61 = L7_61
end
function L12_12.weapon_remove_c2s(A0_62)
	_ENV.set_value("remove_pos", A0_62)
	local L1_63 = L1_63
	local L2_64 = L2_64
	;({}).pos = A0_62
	L1_63(L2_64, {})
	local L3_65 = L3_65
end
function L12_12.on_weapon_remove_s2c(A0_66, A1_67)
	local L6_72 = L6_72
	if A0_66 ~= 0 then
		return
	end
	L6_72 = _ENV
	L6_72 = L6_72.get_value
	L7_73 = "remove_pos"
	L6_72 = L6_72(L7_73)
	L7_73 = _ENV
	L7_73 = L7_73.remove_weapon
	L7_73(L6_72)
	L7_73 = _ENV
	L7_73 = L7_73.refresh_weapon_is_equip_dic
	L7_73()
	L7_73 = L14_14
	L7_73 = L7_73.update_default_weapon_plan_weapon_list
	L7_73(_ENV.weapon_dic)
	L7_73 = _ENV
	L7_73 = L7_73.set_value
	L7_73("remove_pos", nil)
	L7_73 = L0_0
	L7_73 = L7_73.brocast
	L7_73(L13_13.update_main_weapon_develop_info)
	L7_73 = L2_2
	L7_73 = L7_73.update_red_point
	L7_73("weapon_equip_mode_red_point")
	L7_73 = L2_2
	L7_73 = L7_73.update_red_point
	L7_73("equip_stone_inlay_1")
	L7_73 = L2_2
	L7_73 = L7_73.update_red_point
	L7_73("weapon_plan_red_point")
	L7_73 = L2_2
	L7_73 = L7_73.update_red_point
	L7_73("cur_default_weapon_plan_red_point")
	L7_73 = L2_2
	L7_73 = L7_73.update_red_point
	L7_73("weapon_bond_need_active_red_point")
	L7_73 = 1
	L4_70 = 5
	_FOR_ = 1
	for _FORV_6_ = L7_73, L4_70, _FOR_ do
		local L10_76 = L10_76
		L10_76(string.format("weapon_plan_%s_red_point", _FORV_6_))
	end
end
function L12_12.weapon_strengthen_c2s(A0_77, A1_78, A2_79)
	_ENV.set_value("play_strengthen_anim", true)
	local L3_80 = L3_80
	local L4_81 = L4_81
	;({}).items = A0_77
	;({}).is_use = A1_78
	;({}).use_type = A2_79
	L3_80(L4_81, {})
	local L5_82 = L5_82
end
function L12_12.on_weapon_strengthen_s2c(A0_83, A1_84)
	if A0_83 ~= 0 then
		if not DataConfigs.error_code.get_dsc(A0_83) then
		else
		end
		BroadcastTips.broadcast_tips((_ENV.get_string((tostring(A1_84)))))
		local L5_88 = L5_88
		return
	end
	L5_88 = L11_11
	L5_88 = L5_88.update_strength_return_num
	L5_88(A1_84.return_num)
	L5_88 = L11_11
	L5_88 = L5_88.strength_success
	L5_88(A1_84)
	L5_88 = L0_0
	L5_88 = L5_88.brocast
	L5_88(L13_13.weapon_equip_strengthen, A1_84.result)
	L5_88 = L2_2
	L5_88 = L5_88.update_red_point
	L5_88("weapon_master_red_point")
	L5_88 = Game
	L5_88 = L5_88.module
	L5_88 = L5_88.guide_system
	local L3_86 = L3_86
	L3_86(L5_88.const.trigger_type.weapon_strengthen_s2c)
	local L4_87 = L4_87
end
function L12_12.weapon_star_up_c2s(A0_89, A1_90)
	local L2_91 = L2_91
	local L3_92 = L3_92
	;({}).item_cid = A0_89
	;({}).up_num = A1_90
	L2_91(L3_92, {})
	local L4_93 = L4_93
end
function L12_12.on_weapon_star_up_s2c(A0_94, A1_95)
	local L2_96
	if A0_94 ~= 0 then
		return
	end
	L2_96 = _ENV
	L2_96 = L2_96.pre_weapon_star_dic
	L2_96 = L2_96[A1_95.item_cid]
	if not L2_96 then
		L2_96 = _ENV
		L2_96 = L2_96.weapon_star_dic
		L2_96 = L2_96[A1_95.item_cid]
		if not L2_96 then
			L2_96 = 0
		end
	end
	_ENV.star_up(A1_95)
	_ENV.refresh_weapon_unlock_dic()
	_ENV.refresh_weapon_can_star_up_dic(A1_95.item_cid)
	_ENV.get_weapon_rating(A1_95.item_cid, true)
	L0_0.brocast("weapon_star_up", L2_96, A1_95.star)
	local L6_100 = L6_100
	L6_100 = L2_2
	L6_100 = L6_100.update_red_point
	L6_100("main_weapon_develop_star_up_red_point")
	L6_100 = L2_2
	L6_100 = L6_100.update_red_point
	L6_100("main_weapon_develop_show_star_up_red_point")
	L6_100 = L2_2
	L6_100 = L6_100.update_red_point
	L6_100("main_weapon_develop_star_up_cur_red_point")
	L6_100 = L2_2
	L6_100 = L6_100.update_red_point
	L6_100("main_weapon_develop_unlock_red_point")
	L6_100 = L9_9
	L6_100 = L6_100.try_record_star_upgrade_info
	local L4_98 = L4_98
	L6_100(L4_98, L2_96)
	local L5_99 = L5_99
end
function L12_12.on_weapon_master_info_s2c(A0_101, A1_102)
	_ENV.weapon_master_lv = A1_102.lv
	L2_2.update_red_point("weapon_master_red_point")
	local L2_103 = L2_103
	L2_103("update_weapon_master_lv")
	local L3_104 = L3_104
end
function L12_12.on_weapon_master_s2c(A0_105, A1_106)
	_ENV.weapon_master_lv = A1_106.lv
	L2_2.update_red_point("weapon_master_red_point")
	local L2_107 = L2_107
	L2_107("update_weapon_master_lv")
	local L3_108 = L3_108
end
function L12_12.on_weapon_bond_info_s2c(A0_109, A1_110)
	_ENV.update_weapon_bond_info(A1_110)
	local L3_111 = L3_111
end
function L12_12.on_weapon_bond_s2c(A0_112, A1_113)
	_ENV.active_weapon_bond_info(A1_113)
	_ENV.update_weapon_bond_rating_cache()
	L0_0.brocast("update_main_weapon_develop_info")
	L2_2.update_red_point("weapon_bond_need_active_red_point")
	local L3_114 = L3_114
end
function L12_12.clear()
	_ENV.unlisten_net_events(L10_10.net_event_names)
	local L1_115 = L1_115
end
