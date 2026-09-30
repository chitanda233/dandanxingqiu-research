local L0_0, L5_5, L6_6, L7_7, L8_8, L9_9, L12_12 = L0_0, "game.utils.events", L6_6, L7_7, L8_8, L9_9, L12_12
L0_0 = L0_0(L5_5)
L5_5 = require
L6_6 = "game.network.network_utils"
L5_5 = L5_5(L6_6)
L6_6 = Game
L6_6 = L6_6.redpoint_helper
L7_7 = import
L8_8 = "..head"
L7_7 = L7_7(L8_8)
L8_8 = L7_7.network
L9_9 = L7_7.data
L12_12 = L7_7.const
local L11_11 = L11_11
function L8_8.init()
	({}).task_info_s2c = _ENV.on_task_info_s2c
	;({}).task_daily_liveness_info_s2c = _ENV.on_task_daily_liveness_info_s2c
	;({}).task_daily_liveness_reward_s2c = _ENV.on_task_daily_liveness_reward_s2c
	;({}).task_daily_week_reward_s2c = _ENV.on_task_daily_week_reward_s2c
	;({}).task_commit_s2c = _ENV.on_task_commit_s2c
	;({}).task_update_s2c = _ENV.on_task_update_s2c
	;({}).task_delete_s2c = _ENV.on_task_delete_s2c
	;({}).task_start_alliance_trust_s2c = _ENV.on_task_start_alliance_trust_s2c
	;({}).task_accept_s2c = _ENV.on_task_accept_s2c
	;({}).task_finish_s2c = _ENV.on_task_finish_s2c
	;({}).task_alliance_trust_reward_s2c = _ENV.on_task_alliance_trust_reward_s2c
	;({}).role_equip_be_task_s2c = _ENV.on_role_equip_be_task_s2c
	;({}).task_main_info_s2c = _ENV.on_task_main_info_s2c
	;({}).task_receive_main_reward_s2c = _ENV.on_task_receive_main_reward_s2c
	;({}).task_career_info_s2c = _ENV.on_task_career_info_s2c
	;({}).task_batch_commit_s2c = _ENV.on_task_batch_commit_s2c
	_ENV.net_event_names, ({}).task_main_task_s2c = {}, _ENV.on_task_main_task_s2c
	local L0_13 = L0_13
	local L1_14 = L1_14
	L0_13(L1_14, "task")
	local L2_15 = L2_15
end
function L8_8.clear()
	_ENV.unlisten_net_events(L4_4.net_event_names)
	local L1_16 = L1_16
end
function L8_8.task_batch_commit_c2s(A0_17)
	local L1_18 = L1_18
	local L2_19 = L2_19
	;({}).task_list = A0_17
	L1_18(L2_19, {})
	local L3_20 = L3_20
end
function L8_8.task_career_info_c2s()
	local L1_21 = L1_21
	L1_21("task_career_info_c2s", {})
	local L2_22 = L2_22
end
function L8_8.task_receive_main_reward_c2s(A0_23)
	local L1_24 = L1_24
	local L2_25 = L2_25
	;({}).id = A0_23
	L1_24(L2_25, {})
	local L3_26 = L3_26
end
function L8_8.task_main_info_c2s()
	local L1_27 = L1_27
	L1_27("task_main_info_c2s", {})
	local L2_28 = L2_28
end
function L8_8.role_equip_be_task_c2s()
	local L1_29 = L1_29
	L1_29("role_equip_be_task_c2s", {})
	local L2_30 = L2_30
end
function L8_8.task_start_alliance_trust_c2s()
	local L1_31 = L1_31
	L1_31("task_start_alliance_trust_c2s", {})
	local L2_32 = L2_32
end
function L8_8.task_info_c2s(A0_33)
	local L1_34 = L1_34
	local L2_35 = L2_35
	;({}).type = A0_33
	L1_34(L2_35, {})
	local L3_36 = L3_36
end
function L8_8.task_daily_liveness_info_c2s()
	local L1_37 = L1_37
	L1_37("task_daily_liveness_info_c2s", {})
	local L2_38 = L2_38
end
function L8_8.task_daily_liveness_reward_c2s(A0_39)
	local L1_40 = L1_40
	local L2_41 = L2_41
	;({}).act_id = A0_39
	L1_40(L2_41, {})
	local L3_42 = L3_42
end
function L8_8.task_daily_week_reward_c2s(A0_43)
	local L1_44 = L1_44
	local L2_45 = L2_45
	;({}).week_id = A0_43
	L1_44(L2_45, {})
	local L3_46 = L3_46
end
function L8_8.task_commit_c2s(A0_47, A1_48)
	local L2_49 = L2_49
	L2_49 = L2_49(A0_47)
	if L2_49 and L2_49.status and L2_49.status == L10_10.task_status.finish then
		L0_0.brocast(L11_11.update_task_info, nil, A0_47)
		local L6_53 = L6_53
		return
	end
	L6_53 = L1_1
	L6_53 = L6_53.send
	local L4_51 = L4_51
	;({}).task_id = A0_47
	;({}).npc_id = A1_48
	L6_53(L4_51, {})
	local L5_52 = L5_52
end
function L8_8.task_accept_c2s(A0_54, A1_55)
	local L2_56 = L2_56
	local L3_57 = L3_57
	;({}).task_id = A0_54
	;({}).npc_id = A1_55
	L2_56(L3_57, {})
	local L4_58 = L4_58
end
function L8_8.task_finish_c2s(A0_59)
	local L1_60 = L1_60
	local L2_61 = L2_61
	;({}).task_id = A0_59
	L1_60(L2_61, {})
	local L3_62 = L3_62
end
function L8_8.task_long_press_c2s()
	local L1_63 = L1_63
	L1_63("task_long_press_c2s", {})
	local L2_64 = L2_64
end
function L8_8.task_main_task_c2s()
	local L1_65 = L1_65
	L1_65("task_main_task_c2s", {})
	local L2_66 = L2_66
end
function L8_8.task_role_gem_look_c2s()
	local L1_67 = L1_67
	L1_67("task_role_gem_look_c2s", {})
	local L2_68 = L2_68
end
function L8_8.on_task_info_s2c(A0_69, A1_70)
	if not A0_69 == 0 then
		return
	end
	local L5_74 = L5_74
	local L6_75 = L6_75
	local L7_76 = _UPVALUE1_.get_player_data("has_click_exchange_task", "number", 0)
	L7_76 = L7_76 == 1
	L5_74(L6_75, L7_76)
	L5_74 = _ENV
	L5_74 = L5_74.init_task_data
	L6_75 = A1_70
	L5_74(L6_75)
	L5_74 = L10_10
	L5_74 = L5_74.daily_task_setting
	L6_75 = A1_70.type
	L5_74 = L5_74[L6_75]
	if L5_74 then
		L5_74 = L3_3
		L5_74 = L5_74.check_daily_task
		L6_75 = A1_70.type
		L5_74(L6_75)
	end
	L5_74 = L2_2
	L5_74 = L5_74.update_red_point
	L6_75 = L10_10
	L6_75 = L6_75.task_red_point_id
	L5_74(L6_75)
	L5_74 = L3_3
	L5_74 = L5_74.trigger_task_red_point
	L6_75 = A1_70.type
	L5_74(L6_75)
	L5_74 = L0_0
	L5_74 = L5_74.brocast
	L6_75 = "after_task_info_s2c"
	L7_76 = A1_70.type
	L5_74(L6_75, L7_76)
end
function L8_8.on_task_daily_liveness_info_s2c(A0_77, A1_78)
	if not A0_77 == 0 then
		return
	end
	_ENV.update_daily_liveness_data(A1_78)
	local L3_79 = L3_79
end
function L8_8.on_task_commit_s2c(A0_80, A1_81)
	if not A0_80 == 0 then
		return
	end
	_ENV.finish_task(A1_81.task_id)
	if L10_10.daily_task_setting[A1_81.type] then
		L3_3.check_daily_task(A1_81.type)
	elseif A1_81.type == L10_10.task_type.main then
		local L4_84 = L4_84
		local L5_85 = L5_85
		_ENV.set_value("show_task_type_index", 1)
		local L6_86 = L6_86
		repeat
			do break end -- pseudo-goto
			L4_84 = A1_81.type
			L5_85 = L10_10
			L5_85 = L5_85.task_type
			L5_85 = L5_85.career_pve
			if L4_84 == L5_85 then
				L4_84 = L3_3
				L4_84 = L4_84.check_career_pve_task_tips_cache
				L5_85 = A1_81
				L4_84(L5_85)
			end
		until true
	end
	L4_84 = L3_3
	L4_84 = L4_84.trigger_task_red_point
	L5_85 = A1_81.type
	L4_84(L5_85)
	L4_84 = L0_0
	L4_84 = L4_84.brocast
	L5_85 = "update_task_main_reward"
	L4_84(L5_85)
	L4_84 = L0_0
	L4_84 = L4_84.brocast
	L5_85 = "hook_gift_task_refresh"
	L4_84(L5_85)
	L4_84 = L0_0
	L4_84 = L4_84.brocast
	L5_85 = L11_11
	L5_85 = L5_85.update_recent_main_task
	L4_84(L5_85)
end
function L8_8.on_task_update_s2c(A0_87, A1_88)
	if not A0_87 == 0 then
		return
	end
	_ENV.update_task_data(A1_88)
	if L10_10.daily_task_setting[A1_88.type] then
		L3_3.check_daily_task(A1_88.type)
	end
	L3_3.trigger_task_red_point(A1_88.type)
	L2_2.update_red_point(L10_10.task_red_point_id)
	L2_2.update_red_point("strength_return_task_red_point")
	local L3_89 = L3_89
end
function L8_8.on_task_delete_s2c(A0_90, A1_91)
	if not A0_90 == 0 then
		return
	end
	_ENV.delete_task_data(A1_91)
	if L10_10.daily_task_setting[A1_91.type] then
		L3_3.check_daily_task(A1_91.type)
	end
	L2_2.update_red_point(L10_10.task_red_point_id)
	L2_2.update_red_point("daily_task_tab_red_point")
	L2_2.update_red_point("alliance_daily_task_red_point")
	local L3_92 = L3_92
end
function L8_8.on_task_daily_liveness_reward_s2c(A0_93, A1_94)
	if not A0_93 == 0 then
		return
	end
	_ENV.update_liveness_reward(A1_94)
	L2_2.update_red_point("daily_task_tab_red_point")
	L2_2.update_red_point("daily_task_reward_red_point_total")
	local L3_95 = L3_95
end
function L8_8.on_task_daily_week_reward_s2c(A0_96, A1_97)
	if not A0_96 == 0 then
		return
	end
	_ENV.update_week_point_reward(A1_97)
	L2_2.update_red_point("daily_task_tab_red_point")
	local L3_98 = L3_98
end
function L8_8.on_task_start_alliance_trust_s2c(A0_99, A1_100)
	if not A0_99 == 0 then
		return
	end
end
function L8_8.on_task_accept_s2c(A0_101, A1_102)
	if not A0_101 == 0 then
		return
	end
	_ENV.accept_task(A1_102)
	local L3_103 = L3_103
	local L4_104 = L4_104
	L3_103(L4_104, nil, A1_102.task_id)
	local L5_105 = L5_105
end
function L8_8.on_task_finish_s2c(A0_106, A1_107)
	if not A0_106 == 0 then
		return
	end
	_ENV.finish_task(A1_107)
	local L3_108 = L3_108
	local L4_109 = L4_109
	L3_108(L4_109, nil, A1_107.task_id)
	local L5_110 = L5_110
end
function L8_8.on_task_alliance_trust_reward_s2c(A0_111, A1_112)
	local L2_113
	if A0_111 ~= 0 then
		return
	end
	L2_113 = A1_112.list
	if L2_113 then
		L2_113 = {}
		L6_117 = _ENV
		L6_117 = L6_117.set
		L2_113.img_title = L6_117
		L6_117 = {}
		L2_113.items = L6_117
		L6_117 = ipairs
		L7_118 = A1_112.list
		L6_117, L7_118, _FOR_ = L6_117(L7_118)
		for _FORV_6_, _FORV_7_ in L6_117, L7_118, _FOR_ do
			({}).item_cid = _FORV_7_.k
			;({}).number = _FORV_7_.v
			table.insert(L2_113.items, {})
		end
		L6_117 = _ENV
		L6_117 = L6_117.show_reward_display
		L7_118 = L2_113
		L6_117(L7_118)
	end
end
function L8_8.on_role_equip_be_task_s2c(A0_123, A1_124)
	if A0_123 ~= 0 then
		return
	end
	local L2_125 = L2_125
	L2_125(A1_124.list)
	local L3_126 = L3_126
end
function L8_8.on_task_main_info_s2c(A0_127, A1_128)
	if A0_127 ~= 0 then
		return
	end
	_ENV.update_main_info(A1_128)
	L0_0.brocast("update_task_main_reward")
	local L2_129 = L2_129
	L2_129("task_main_red_point")
	local L3_130 = L3_130
end
function L8_8.on_task_receive_main_reward_s2c(A0_131, A1_132)
	if A0_131 ~= 0 then
		return
	end
	_ENV.get_main_stage_reward(A1_132.id)
	_ENV.get_task_career_reward(A1_132.id)
	L2_2.update_red_point("task_other_red_point")
	L2_2.update_red_point("task_other_show_red_point")
	L0_0.brocast("update_task_main_reward")
	local L2_133 = L2_133
	L2_133(L11_11.update_task_career_info)
	local L3_134 = L3_134
end
function L8_8.on_task_career_info_s2c(A0_135, A1_136)
	if A0_135 ~= 0 then
		return
	end
	_ENV.update_task_career_info(A1_136)
	local L2_137 = L2_137
	L2_137(L11_11.update_task_career_info)
	local L3_138 = L3_138
end
function L8_8.on_task_batch_commit_s2c(A0_139, A1_140)
	if A1_140.task_list then
		L5_144 = A1_140.task_list
		L5_144 = #L5_144
		if 0 < L5_144 then
			L5_144 = _ENV
			L5_144 = L5_144.finish_batch_task
			L6_145 = A1_140.task_list
			L5_144(L6_145)
			L5_144 = table
			L5_144 = L5_144.clear
			L6_145 = _UPVALUE1_
			L5_144(L6_145)
			L5_144 = ipairs
			L6_145 = A1_140.task_list
			L5_144, L6_145, _FOR_ = L5_144(L6_145)
			for _FORV_5_, _FORV_6_ in L5_144, L6_145, _FOR_ do
				_UPVALUE1_[_UPVALUE2_.get_task_cfg(_FORV_6_).task_tp] = true
			end
			L5_144 = pairs
			L6_145 = _UPVALUE1_
			L5_144, L6_145, L9_148 = L5_144(L6_145)
			for _FORV_5_, _FORV_6_ in L5_144, L6_145, L9_148 do
				L3_3.trigger_task_red_point(_FORV_5_)
			end
			L5_144 = L0_0
			L5_144 = L5_144.brocast
			L6_145 = "hook_gift_task_refresh"
			L5_144(L6_145)
		end
	end
end
function L8_8.on_task_main_task_s2c(A0_149, A1_150)
	_ENV.set_recent_finish_main_task_list(A1_150.list)
	L0_0.brocast(L11_11.update_recent_main_task)
	local L3_151 = L3_151
end
