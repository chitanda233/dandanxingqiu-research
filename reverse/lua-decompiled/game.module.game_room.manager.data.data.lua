local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = table
local L0_0, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12 = L0_0.insert, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
L1_1 = DataConfigs
L2_2 = L1_1.opening_carnival_rank
L3_3 = Game
L3_3 = L3_3.server_time
L4_4 = table
L4_4 = L4_4.sort
L7_7 = import
L8_8 = "..head"
L7_7 = L7_7(L8_8)
L8_8 = L7_7.data
L9_9 = L7_7.const
L10_10 = L1_1.dungeon_air_race
L11_11 = Game
L11_11 = L11_11.module
L11_11 = L11_11.dungeon_main
L12_12 = Game
L12_12 = L12_12.module
L12_12 = L12_12.dungeon_main
L12_12 = L12_12.data
function L8_8.init()
	_ENV.reset()
end
function L8_8.clear()
	_ENV.reset()
end
;({})[1] = L10_10
function L8_8.get_difficulty_cfg_list(A0_13)
	local L1_14
	L1_14 = _ENV
	local L1_14, L3_16, L6_19 = L1_14[A0_13], L3_16, L6_19
	if not L1_14 then
		L3_16 = {}
		return L3_16
	end
	L3_16 = L1_14.get_all_config_list
	L3_16 = L3_16()
	if not L3_16 then
		L3_16 = {}
	end
	L6_19 = {}
	L7_20 = ipairs
	L8_21 = L3_16
	L7_20, L8_21, _FOR_ = L7_20(L8_21)
	for _FORV_7_, _FORV_8_ in L7_20, L8_21, _FOR_ do
		({}).game_id = A0_13
		;({}).cfg = _FORV_8_
		L0_0(L6_19, {})
	end
	return L6_19
end
function L8_8.is_dungeon_unlock(A0_25, A1_26)
	local L2_27
	L2_27 = _ENV
	local L2_27, L8_33, L9_34, L10_35 = L2_27[A0_25], L8_33, L9_34, L10_35
	if not L2_27 then
		L8_33 = false
		return L8_33
	end
	L8_33 = L2_27.get_config
	L9_34 = A1_26
	L8_33 = L8_33(L9_34)
	if not L8_33 then
		L9_34 = false
		return L9_34
	end
	L9_34 = L8_33.pre_dup
	if L9_34 then
		L10_35 = next
		L10_35 = L10_35(L9_34)
		if L10_35 then
			goto lbl_24
		end
	end
	L10_35 = true
	do return L10_35 end
	::lbl_24::
	L10_35 = false
	L6_31, L7_32, _FOR_ = L6_31(L9_34)
	for _FORV_9_, _FORV_10_ in L6_31, L7_32, _FOR_ do
		L10_35 = L12_12.get_dungeon_data(_FORV_10_) and L12_12.get_dungeon_data(_FORV_10_).is_pass == 1 or L10_35
		if not L10_35 then
			break
		end
	end
	return L10_35
end
function L8_8.is_dungeon_passed(A0_38)
	local L1_39 = L1_39
	local L1_39, L2_40 = L1_39(A0_38), L2_40
	if L1_39 then
		L2_40 = L1_39.is_pass
	end
	L2_40 = L2_40 == 1 or L2_40
	return L2_40
end
function L8_8.get_dungeon_fast_pass_rounds(A0_41)
	local L1_42 = L1_42
	local L1_42, L2_43 = L1_42(A0_41), L2_43
	if L1_42 then
		L2_43 = L1_42.pass_rounds
		if L2_43 then
			goto lbl_11
		end
	end
	L2_43 = 0
	::lbl_11::
	return L2_43
end
function L8_8.get_max_pass_num(A0_44)
	local L1_45
	L1_45 = _ENV
	local L1_45, L5_49 = L1_45[A0_44], L5_49
	if not L1_45 then
		L5_49 = 0
		return L5_49
	end
	L5_49 = L1_45.get_all_config_list
	L5_49 = L5_49()
	if not L5_49 then
		L5_49 = {}
	end
	L6_50 = ipairs
	L7_51 = L5_49
	L6_50, L7_51, _FOR_ = L6_50(L7_51)
	for _FORV_6_, _FORV_7_ in L6_50, L7_51, _FOR_ do
		if not L6_6.is_dungeon_passed(_FORV_7_.id) then
			return _FORV_7_.index
		end
	end
	L6_50 = 0
	return L6_50
end
function L8_8.get_game_id_by_dungeon_id(A0_54)
	if not A0_54 then
		L3_57 = nil
		return L3_57
	end
	L3_57 = pairs
	L4_58 = _ENV
	L3_57, L4_58, L5_59 = L3_57(L4_58)
	for _FORV_4_, _FORV_5_ in L3_57, L4_58, L5_59 do
		if _FORV_5_.get_config(A0_54) then
			return _FORV_4_
		end
	end
	L3_57 = nil
	return L3_57
end
function L8_8.get_rewards_by_dungeon_id(A0_62)
	local L5_67 = _ENV.get_game_id_by_dungeon_id
	local L5_67, L2_64 = L5_67(A0_62), L2_64
	L2_64 = _UPVALUE1_
	L2_64 = L2_64[L5_67]
	if not L2_64 then
		return {}
	end
	local L3_65 = L3_65
	local L3_65, L4_66 = L3_65(A0_62), L4_66
	if not L3_65 then
		L4_66 = {}
		return L4_66
	end
	L4_66 = L3_65.first_reward
	if not L4_66 then
	end
	return {}
end
function L8_8.reset()
	local L0_68, L1_69
	L0_68 = _ENV
	L0_68.test_share_flag = false
end
function L8_8.set_test_share_flag(A0_70)
	local L1_71
	L1_71 = _ENV
	L1_71.test_share_flag = A0_70
end
function L8_8.is_test_share()
	local L0_72, L1_73
	L0_72 = _ENV
	L0_72 = L0_72.test_share_flag
	if not L0_72 then
		L0_72 = false
	end
	return L0_72
end
