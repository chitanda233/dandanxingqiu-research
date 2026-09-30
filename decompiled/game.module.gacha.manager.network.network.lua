local L0_0
L0_0 = assert
local L3_3, L4_4, L5_5 = require, L4_4, L5_5
L4_4 = "game.network.network_utils"
L3_3 = L3_3(L4_4)
L4_4 = Game
L4_4 = L4_4.events
L5_5 = Game
L5_5 = L5_5.module
L5_5 = L5_5.open_func
local L6_6 = L6_6
local L7_7 = L7_7
local L8_8 = L8_8
local L9_9 = L9_9
local L10_10 = L10_10
function L9_9.init()
	({}).gacha_info_s2c = _ENV.on_gacha_info_s2c
	;({}).gacha_wish_info_s2c = _ENV.on_gacha_wish_info_s2c
	;({}).gacha_update_wish_info_s2c = _ENV.on_gacha_update_wish_info_s2c
	;({}).gacha_set_wish_job_s2c = _ENV.on_gacha_set_wish_job_s2c
	;({}).gacha_set_wish_s2c = _ENV.on_gacha_set_wish_s2c
	;({}).gacha_spin_s2c = _ENV.on_gacha_spin_s2c
	;({}).gacha_preview_info_s2c = _ENV.on_gacha_preview_info_s2c
	;({}).gacha_refresh_preview_s2c = _ENV.on_gacha_refresh_preview_s2c
	;({}).gacha_update_preview_s2c = _ENV.on_gacha_update_preview_s2c
	;({}).gacha_draw_preview_s2c = _ENV.on_gacha_draw_preview_s2c
	;({}).gacha_single_info_s2c = _ENV.on_gacha_single_info_s2c
	_ENV.net_events, ({}).gacha_set_storage_id_s2c = {}, _ENV.on_gacha_set_storage_id_s2c
	local L0_11 = L0_11
	local L1_12 = L1_12
	L0_11(L1_12, "gacha")
	local L2_13 = L2_13
end
function L9_9.clear()
	local L0_14 = L0_14
	L0_14(L9_9.net_events)
	local L1_15 = L1_15
	L0_14 = L9_9
	L0_14.net_events = nil
end
function L9_9.gacha_info_c2s()
	local L1_16 = L1_16
	L1_16("gacha_info_c2s", {})
	local L2_17 = L2_17
end
function L9_9.gacha_wish_info_c2s(A0_18)
	local L1_19 = L1_19
	local L2_20 = L2_20
	;({}).cid = A0_18
	L1_19(L2_20, {})
	local L3_21 = L3_21
end
function L9_9.gacha_set_wish_job_c2s(A0_22, A1_23, A2_24)
	local L3_25 = L3_25
	local L4_26 = L4_26
	;({}).cid = A0_22
	;({}).job = A1_23
	;({}).old_job = A2_24
	L3_25(L4_26, {})
	local L5_27 = L5_27
end
function L9_9.gacha_set_wish_c2s(A0_28, A1_29, A2_30)
	local L3_31 = L3_31
	local L4_32 = L4_32
	;({}).cid = A0_28
	;({}).job = A1_29
	;({}).item_list = A2_30
	L3_31(L4_32, {})
	local L5_33 = L5_33
end
function L9_9.gacha_spin_c2s(A0_34, A1_35)
	local L3_37 = _ENV.get_auto_forge_setting
	L3_37 = L3_37()
	if L5_5.is_open(L5_5.const.type.resolve_equip_filter) then
		if L3_37 and L3_37.cond1 and L3_37.cond1_l_data and L3_37.cond1_l_data.attr_id and L3_37.cond1_l_data.attr_id > 0 then
			table.insert({}, L3_37.cond1_l_data.attr_id)
		end
		if L3_37 and L3_37.cond2 and L3_37.cond2_l_data and L3_37.cond2_l_data.attr_id and 0 < L3_37.cond2_l_data.attr_id then
			local L4_38 = L4_38
			table.insert({}, L3_37.cond2_l_data.attr_id)
		end
	end
	;({}).c_id = A0_34
	;({}).times = A1_35
	;({}).attr_list = L4_38
	local L5_39 = L5_39
	if L7_7.get_config(A0_34) and L7_7.get_config(A0_34).type == _UPVALUE3_.page_type.weapon then
		L10_10.cache_weapon_info()
	end
	L2_2.brocast("wait_reward_start")
	local L6_40 = L6_40
	local L7_41 = L7_41
	local L8_42 = L8_42
	L7_41(L8_42, L5_39, L4_38)
	local L9_43 = L9_43
end
function L9_9.gacha_preview_info_c2s(A0_44)
	local L1_45 = L1_45
	local L2_46 = L2_46
	;({}).c_id = A0_44
	L1_45(L2_46, {})
	local L3_47 = L3_47
end
function L9_9.gacha_refresh_preview_c2s(A0_48, A1_49)
	local L2_50 = L2_50
	local L3_51 = L3_51
	;({}).c_id = A0_48
	;({}).type = A1_49
	L2_50(L3_51, {})
	local L4_52 = L4_52
end
function L9_9.gacha_draw_preview_c2s(A0_53)
	local L1_54 = L1_54
	local L2_55 = L2_55
	;({}).c_id = A0_53
	L1_54(L2_55, {})
	local L3_56 = L3_56
end
function L9_9.gacha_set_storage_id_c2s(A0_57, A1_58)
	local L2_59 = L2_59
	local L3_60 = L3_60
	;({}).cid = A0_57
	;({}).storage_id = A1_58
	L2_59(L3_60, {})
	local L4_61 = L4_61
end
function L9_9.on_gacha_info_s2c(A0_62, A1_63)
	if A0_62 ~= 0 then
		return
	end
	L5_67 = _ENV
	L6_68 = {}
	L5_67.gacha_info = L6_68
	L5_67 = A1_63.list
	if L5_67 then
		L5_67 = pairs
		L6_68 = A1_63.list
		L5_67, L6_68, _FOR_ = L5_67(L6_68)
		for _FORV_5_, _FORV_6_ in L5_67, L6_68, _FOR_ do
			_ENV.update_gacha_info(_FORV_6_)
			;({}).c_id = _FORV_6_.c_id
			L2_2.brocast(_UPVALUE2_.event.update_gacha_info, {})
		end
		L5_67 = L2_2
		L5_67 = L5_67.brocast
		L6_68 = _UPVALUE2_
		L6_68 = L6_68.event
		L6_68 = L6_68.update_all_gacha_info
		L5_67(L6_68)
	end
end
function L9_9.on_gacha_wish_info_s2c(A0_73, A1_74)
	if A0_73 ~= 0 then
		return
	end
	_ENV.update_gacha_wish_info(A1_74.cid, A1_74.list, A1_74.num)
	local L5_78 = L5_78
	L5_78 = L2_2
	L5_78 = L5_78.brocast
	local L3_76 = L3_76
	L5_78(L3_76, A1_74.cid)
	local L4_77 = L4_77
end
function L9_9.on_gacha_update_wish_info_s2c(A0_79, A1_80)
	if A0_79 ~= 0 then
		return
	end
	_ENV.update_gacha_wish_info(A1_80.cid, A1_80.list, A1_80.num)
	local L5_84 = L5_84
	L5_84 = L2_2
	L5_84 = L5_84.brocast
	local L3_82 = L3_82
	L5_84(L3_82, A1_80.cid)
	local L4_83 = L4_83
end
function L9_9.on_gacha_set_wish_job_s2c(A0_85, A1_86)
	if A0_85 ~= 0 then
		return
	end
	_ENV.update_gacha_wish_job(A1_86.cid, A1_86.job, A1_86.old_job)
	local L5_90 = L5_90
	L5_90 = L2_2
	L5_90 = L5_90.brocast
	local L3_88 = L3_88
	L5_90(L3_88, A1_86.cid)
	local L4_89 = L4_89
end
function L9_9.on_gacha_set_wish_s2c(A0_91, A1_92)
	if A0_91 ~= 0 then
		return
	end
	_ENV.update_gacha_wish(A1_92.cid, A1_92.job, A1_92.item_list)
	local L5_96 = L5_96
	L5_96 = L2_2
	L5_96 = L5_96.brocast
	local L3_94 = L3_94
	L5_96(L3_94, A1_92.cid)
	local L4_95 = L4_95
end
function L9_9.on_gacha_spin_s2c(A0_97, A1_98)
	Game.events.brocast(_ENV.event.interrupt_main_view, false)
	if A0_97 ~= 0 then
		L10_10.clear_cache()
		return
	end
	if A1_98.list then
		L10_10.cache_spin_gacha_item(A1_98.list)
		if A1_98.info and A1_98.info.c_id then
		end
		if L10_10.get_gacha_info(A1_98.info.c_id) then
		end
		local L6_103 = L6_103
		;({}).gacha_lv = L6_103
		L2_2.brocast(_ENV.event.spin_gacha_info, {})
		local L7_104 = L7_104
	end
	L6_103 = A1_98.info
	if L6_103 then
		L6_103 = L10_10
		L6_103 = L6_103.update_gacha_info
		L7_104 = A1_98.info
		L6_103(L7_104)
		L6_103 = L2_2
		L6_103 = L6_103.brocast
		L7_104 = _ENV
		L7_104 = L7_104.event
		L7_104 = L7_104.update_gacha_info
		local ({}).c_id, L5_102 = A1_98.info.c_id, L5_102
		L5_102.not_update_immediatly = true
		L6_103(L7_104, L5_102)
		L6_103 = L10_10
		L6_103 = L6_103.spin_cache
		L7_104 = A1_98.info
		L7_104 = L7_104.c_id
		L6_103[L7_104] = true
	end
end
function L9_9.on_gacha_preview_info_s2c(A0_105, A1_106)
	if A0_105 ~= 0 then
		return
	end
	_ENV.update_gacha_preview_info(A1_106.info)
	local L2_107 = L2_107
	local L3_108 = L3_108
	L2_107(L3_108, A1_106.info.c_id)
	local L4_109 = L4_109
end
function L9_9.on_gacha_refresh_preview_s2c(A0_110, A1_111)
	if A0_110 ~= 0 then
		return
	end
	local L2_112 = L2_112
	L2_112(_UPVALUE1_.event.refresh_gacha_preview)
	local L3_113 = L3_113
end
function L9_9.on_gacha_update_preview_s2c(A0_114, A1_115)
	if A0_114 ~= 0 then
		return
	end
	_ENV.update_gacha_preview_info(A1_115.info)
	local L2_116 = L2_116
	local L3_117 = L3_117
	L2_116(L3_117, A1_115.info.c_id)
	local L4_118 = L4_118
end
function L9_9.on_gacha_draw_preview_s2c(A0_119, A1_120)
	if A0_119 ~= 0 then
		return
	end
	_ENV.update_gacha_preview_draw_info(A1_120.c_id, A1_120.index)
	local L2_121 = L2_121
	local L3_122 = L3_122
	local L4_123 = L4_123
	L2_121(L3_122, L4_123, A1_120.index)
	local L5_124 = L5_124
end
function L9_9.on_gacha_single_info_s2c(A0_125, A1_126)
	if A0_125 ~= 0 then
		return
	end
	_ENV.update_gacha_info(A1_126.gacha)
	local L2_127 = L2_127
	local L3_128 = L3_128
	local ({}).c_id, L5_130 = A1_126.gacha.c_id, L5_130
	L2_127(L3_128, L5_130)
end
function L9_9.on_gacha_set_storage_id_s2c(A0_131, A1_132)
	if A0_131 ~= 0 then
		return
	end
	_ENV.update_gacha_storage_info(A1_132.cid, A1_132.storage_id)
	local L2_133 = L2_133
	local L3_134 = L3_134
	local ({}).c_id, L5_136 = A1_132.cid, L5_136
	L2_133(L3_134, L5_136)
end
return L9_9
