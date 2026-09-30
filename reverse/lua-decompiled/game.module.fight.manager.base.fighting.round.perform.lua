local L0_0, L1_1, L2_2
L0_0 = string
local L0_0, L5_5, L6_6, L7_7 = L0_0.format, L5_5, L6_6, L7_7
L1_1 = Game
L1_1 = L1_1.module
L1_1 = L1_1.fight
L2_2 = L1_1.ways
L2_2 = L2_2.base
L5_5 = require
L6_6 = "game.module.fight.manager.base.fighting.hit_rate_logger"
L5_5 = L5_5(L6_6)
function L6_6(A0_8)
	local L1_9, L2_10
	L1_9 = A0_8.round
	L2_10 = L1_9.perform_id
	L2_10 = L2_10 + 1
	L1_9.perform_id = L2_10
	L2_10 = L1_9.perform_id
	return L2_10
end
L2_2.get_next_perform_id = L6_6
function L6_6(A0_11)
	local L1_12, L2_13 = A0_11:get_next_perform_id(), L2_13
	L2_13 = A0_11.round
	L2_13 = L2_13.cur_perform_ids
	L2_13[L1_12] = true
	return L1_12
end
L2_2.add_perform = L6_6
function L6_6(A0_14, A1_15)
	local L2_16
	L2_16 = A0_14.round
	if not L2_16 then
		return
	end
	L2_16 = A0_14.round
	L2_16 = L2_16.cur_perform_ids
	L2_16[A1_15] = nil
end
L2_2.del_perform = L6_6
function L6_6(A0_17, A1_18)
	local L2_19, L3_20
	L2_19 = A0_17.round
	if not L2_19 then
		return
	end
	L2_19 = A0_17.round
	L2_19 = L2_19.perform_status
	if L2_19 == A1_18 then
		return
	end
	if L2_19 then
		L3_20 = _ENV
		L3_20 = L3_20.round_perform_status_str
		L3_20 = L3_20[L2_19]
		if A0_17[L0_0("on_round_exit_perform_status_%s", L3_20)] then
			A0_17[L0_0("on_round_exit_perform_status_%s", L3_20)](A0_17, A1_18)
		end
	end
	L3_20 = A0_17.round
	L3_20.perform_status = A1_18
	L3_20 = _ENV
	L3_20 = L3_20.round_perform_status_str
	L3_20 = L3_20[A1_18]
	local L4_21 = L4_21
	local L5_22 = L5_22
	L4_21 = L4_21(L5_22, L3_20)
	L5_22 = A0_17[L4_21]
	if L5_22 then
		local L6_23 = L6_23
		local L7_24 = L7_24
		L6_23(L7_24, L2_19)
		local L8_25 = L8_25
	end
end
L2_2.set_round_perform_status = L6_6
function L6_6(A0_26, A1_27)
	A0_26:try_to_start_timing_to_check_perform_finish()
	A0_26:try_to_pick_up_all_waited_drops()
end
L2_2.on_round_enter_perfrom_status_wait_done = L6_6
function L6_6(A0_28, A1_29)
	A0_28:try_to_stop_timing_to_check_perform_finish()
end
L2_2.on_round_exit_perform_status_wait_done = L6_6
function L6_6(A0_30, A1_31)
	A0_30.wait_obstacle_move_timestamp = nil
	_ENV.finish_round(A0_30)
	local L2_32, L3_33 = L2_32, L3_33
	local L4_34 = L4_34
	local ({}).round, L6_36 = A0_30.round.round_count, L6_36
	L2_32(L3_33, L4_34, L6_36)
end
L2_2.on_round_enter_perfrom_status_done = L6_6
function L6_6(A0_37)
	local L4_41 = L4_41
	if A0_37.timer_perfrom_finish then
		return
	end
	L4_41 = A0_37.timer
	L4_41 = L4_41.run_every_no_args
	local L2_39 = L2_39
	local L3_40 = L3_40
	L4_41 = L4_41(L2_39, L3_40, function()
		_ENV:on_timing_to_check_perform_finish()
		local L1_42 = L1_42
	end)
	A0_37.timer_perfrom_finish = L4_41
end
L2_2.try_to_start_timing_to_check_perform_finish = L6_6
L6_6 = {}
L7_7 = L1_1.role_status
L7_7 = L7_7.moving
L6_6[L7_7] = true
L7_7 = L1_1.role_status
L7_7 = L7_7.falling
L6_6[L7_7] = true
L7_7 = L1_1.role_status
L7_7 = L7_7.target_falling
L6_6[L7_7] = true
L7_7 = L1_1.role_status
L7_7 = L7_7.push_out_land
L6_6[L7_7] = true
L7_7 = L1_1.role_status
L7_7 = L7_7.blowing
L6_6[L7_7] = true
function L7_7(A0_43)
	if A0_43.node_list then
		L3_46 = next
		L4_47 = A0_43.node_list
		L3_46 = L3_46(L4_47)
		if L3_46 then
			L3_46 = false
			return L3_46
		end
	end
	L3_46 = A0_43.round
	if L3_46 then
		L3_46 = A0_43.round
		L3_46 = L3_46.bullet_nodes
		if L3_46 then
			L3_46 = next
			L4_47 = A0_43.round
			L4_47 = L4_47.bullet_nodes
			L3_46 = L3_46(L4_47)
			if L3_46 then
				L3_46 = false
				return L3_46
			end
		end
		L3_46 = A0_43.round
		L3_46 = L3_46.cur_perform_ids
		if L3_46 then
			L3_46 = next
			L4_47 = A0_43.round
			L4_47 = L4_47.cur_perform_ids
			L3_46 = L3_46(L4_47)
			if L3_46 then
				L3_46 = false
				return L3_46
			end
		end
	end
	L3_46 = pairs
	L4_47 = A0_43.id_to_unit
	L3_46, L4_47, L5_48 = L3_46(L4_47)
	for L6_49, L7_50 in L3_46, L4_47, L5_48 do
		if L7_50.is_dead then
		elseif _ENV[L7_50.state] then
			return false
		end
	end
	L3_46 = true
	return L3_46
end
function L2_2.on_timing_to_check_perform_finish(A0_51)
	if not _ENV(A0_51) then
		return
	end
	if not _UPVALUE1_(A0_51) then
		return
	end
	local L2_52 = L2_52
	L2_52(A0_51, L1_1.round_perform_status.done)
	local L3_53 = L3_53
end
function L2_2.try_to_stop_timing_to_check_perform_finish(A0_54)
	if not A0_54.timer_perfrom_finish then
		return
	end
	local L2_55 = L2_55
	L2_55(A0_54.timer, A0_54.timer_perfrom_finish)
	local L3_56 = L3_56
	A0_54.timer_perfrom_finish = nil
end
function L2_2.on_msg_battle_round_finish_s2c(A0_57, A1_58, A2_59)
	A0_57:set_round_perform_status(_ENV.round_perform_status.wait_done)
	local L5_60 = L5_60
end
function L2_2.on_fight_perform_finished(A0_61, A1_62)
	A0_61:del_perform(A1_62)
	local L4_63 = L4_63
end
function L2_2.on_msg_battle_end_s2c(A0_64, A1_65, A2_66)
	A0_64.already_enter_battle_end = true
	A0_64:try_to_stop_timing_to_check_perform_finish()
	A0_64:try_to_start_timing_to_check_perform_finish_on_battle_end()
	local L3_67, L4_68 = L3_67, L4_68
end
function L2_2.try_to_start_timing_to_check_perform_finish_on_battle_end(A0_69)
	local L1_70, L2_71
	L1_70 = A0_69.timer_perfrom_finish_on_battle_end
	local L6_75 = L6_75
	if L1_70 then
		return
	end
	L1_70 = 0
	L2_71 = 200
	L6_75 = A0_69.timer
	L6_75 = L6_75.run_every_no_args
	local L4_73 = L4_73
	local L5_74 = L5_74
	L6_75 = L6_75(L4_73, L5_74, function()
		_ENV = _ENV + L2_71
		if (not A0_69:is_physics_env() or _ENV < 1500) and not _ENV(A0_69) then
			return
		end
		L3_3.finish_round(A0_69)
		local L2_77 = L2_77
		L2_77(A0_69, "battle_end_c2s", {})
		local L3_78 = L3_78
		L2_77 = A0_69
		L3_78 = L2_77
		L2_77 = L2_77.try_to_stop_timing_to_check_perform_finish_on_battle_end
		L2_77(L3_78)
	end)
	A0_69.timer_perfrom_finish_on_battle_end = L6_75
end
function L2_2.try_to_stop_timing_to_check_perform_finish_on_battle_end(A0_79)
	if not A0_79.timer_perfrom_finish_on_battle_end then
		return
	end
	local L2_80 = L2_80
	L2_80(A0_79.timer, A0_79.timer_perfrom_finish_on_battle_end)
	local L3_81 = L3_81
	A0_79.timer_perfrom_finish_on_battle_end = nil
end
