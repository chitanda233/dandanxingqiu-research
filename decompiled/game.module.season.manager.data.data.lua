local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = DataConfigs
local L1_1, L7_7, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16 = L0_0.season_cup, L7_7, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16
L2_2 = L0_0.season_new
L3_3 = L0_0.season
L4_4 = L0_0.level
L7_7 = require
L10_10 = "game.other.server_time"
L7_7 = L7_7(L10_10)
L10_10 = L0_0.rank_define
L11_11 = L0_0.rank_daily_reward
L12_12 = import
L13_13 = "..head"
L12_12 = L12_12(L13_13)
L13_13 = L12_12.data
L14_14 = L12_12.const
L15_15 = Game
L15_15 = L15_15.module
L15_15 = L15_15.data
L16_16 = Game
L16_16 = L16_16.module
L16_16 = L16_16.open_func
function L13_13.init()
	_ENV.reset()
end
function L13_13.clear()
	_ENV.reset()
end
function L13_13.reset()
	local L0_17, L1_18
	L0_17 = _ENV
	L1_18 = {}
	L0_17.season_info = L1_18
	L0_17 = _ENV
	L1_18 = {}
	L0_17.season_rank = L1_18
	L0_17 = _ENV
	L1_18 = {}
	L0_17.k_v = L1_18
	L0_17 = _ENV
	L1_18 = {}
	L0_17.player_info = L1_18
	L0_17 = _ENV
	L0_17.rally_wait_count = 0
	L0_17 = _ENV
	L1_18 = {}
	L0_17.has_get_rank_dic = L1_18
	L0_17 = _ENV
	L1_18 = {}
	L0_17.has_get_season_rank_dic = L1_18
	L0_17 = _ENV
	L1_18 = {}
	L0_17.open_battle_map = L1_18
	L0_17 = _ENV
	L1_18 = {}
	L0_17.open_env_map = L1_18
	L0_17 = _ENV
	L1_18 = {}
	L0_17.cutivation_info = L1_18
	L0_17 = _ENV
	L1_18 = {}
	L0_17.battle_report_list = L1_18
	L0_17 = _ENV
	L1_18 = {}
	L0_17.battle_report_info = L1_18
	L0_17 = _ENV
	L0_17.season_balance_red_point = nil
end
function L13_13.set_value(A0_19, A1_20)
	local L2_21
	L2_21 = _ENV
	L2_21 = L2_21.k_v
	L2_21[A0_19] = A1_20
end
function L13_13.get_value(A0_22)
	local L1_23
	L1_23 = _ENV
	L1_23 = L1_23.k_v
	L1_23 = L1_23[A0_22]
	return L1_23
end
function L13_13.rank_has_award(A0_24, A1_25)
	local L2_26 = L2_26
	local L3_27 = L3_27
	local L2_26, L4_28 = L2_26(L3_27, A0_24), L4_28
	L3_27 = L2_26 or L3_27
	if L2_26 then
		L3_27 = L2_26.reach_reward
		if L3_27 then
			L3_27 = L2_26.reach_reward
			L3_27 = #L3_27
			L3_27 = 0 < L3_27
		end
	end
	return L3_27
end
