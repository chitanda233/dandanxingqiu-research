local L0_0, L1_1, L2_2
L0_0 = Game
L0_0 = L0_0.module
L0_0 = L0_0.fight
L1_1 = L0_0.ways
L1_1 = L1_1.base
function L2_2(A0_3, A1_4, A2_5, A3_6)
	if A1_4 <= 0 then
		A2_5()
		return nil
	end
	local L4_7, L5_8 = L4_7, L5_8
	local L6_9 = L6_9
	local L4_7, L7_10 = L4_7(L5_8, L6_9, A2_5), L7_10
	L5_8 = A0_3.round
	L5_8 = L5_8.timers
	L5_8[L4_7] = true
	if A3_6 then
		L5_8 = A0_3.round
		L5_8 = L5_8.timers_special
		L5_8[L4_7] = true
	end
	return L4_7
end
L1_1.run_after_in_this_round = L2_2
function L2_2(A0_11, A1_12, A2_13, A3_14)
	local L4_15, L5_16 = L4_15, L5_16
	local L6_17 = L6_17
	local L4_15, L7_18 = L4_15(L5_16, L6_17, A2_13), L7_18
	L5_16 = A0_11.round
	L5_16 = L5_16.timers
	L6_17 = A3_14 or L6_17
	if not A3_14 then
		L6_17 = true
	end
	L5_16[L4_15] = L6_17
	return L4_15
end
L1_1.run_every_in_this_round = L2_2
function L2_2(A0_19, A1_20, A2_21)
	local L3_22, L4_23 = L3_22, L4_23
	local L5_24 = L5_24
	local L3_22, L6_25 = L3_22(L4_23, L5_24, A2_21), L6_25
	L4_23 = A0_19.round
	L4_23 = L4_23.unscale_timers
	L4_23[L3_22] = true
	return L3_22
end
L1_1.run_every_in_this_round_unscale_timer = L2_2
function L2_2(A0_26, A1_27)
	if not A0_26.round.timers[A1_27] then
		return
	end
	local L2_28, L3_29 = L2_28, L3_29
	L2_28(L3_29, A1_27)
	local L4_30 = L4_30
	L2_28 = A0_26.round
	L2_28 = L2_28.timers
	L2_28[A1_27] = nil
	L2_28 = A0_26.round
	L2_28 = L2_28.timers_special
	L2_28[A1_27] = nil
end
L1_1.del_this_round_timer = L2_2
function L2_2(A0_31, A1_32)
	if not A0_31.round.unscale_timers[A1_32] then
		return
	end
	local L2_33, L3_34 = L2_33, L3_34
	L2_33(L3_34, A1_32)
	local L4_35 = L4_35
	L2_33 = A0_31.round
	L2_33 = L2_33.unscale_timers
	L2_33[A1_32] = nil
end
L1_1.del_this_round_unscale_timer = L2_2
function L2_2(A0_36)
	local L1_37
	L1_37 = A0_36.round
	L1_37 = L1_37.timers
	L4_40 = A0_36.round
	L5_41 = {}
	L4_40.timers = L5_41
	L4_40 = pairs
	L5_41 = L1_37
	L4_40, L5_41, L6_42 = L4_40(L5_41)
	for _FORV_5_, _FORV_6_ in L4_40, L5_41, L6_42 do
		if A0_36.round.timers_special[_FORV_5_] then
			A0_36.round.timers_special[_FORV_5_] = nil
			if A0_36.timer:get_timer_info_by_timer_id(_FORV_5_) then
				A0_36.timer:excute_timer((A0_36.timer:get_timer_info_by_timer_id(_FORV_5_)))
			end
		end
		if type(_FORV_6_) == "function" then
			_FORV_6_()
		end
		A0_36.timer:del_timer(_FORV_5_)
		local L9_45 = L9_45
	end
end
L1_1.clear_all_round_timers = L2_2
