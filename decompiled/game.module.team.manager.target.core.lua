local L0_0
L0_0 = DataConfigs
local L0_0, L3_3 = L0_0.team_target, L3_3
L3_3 = import
local L3_3, L2_2 = L3_3(".head"), L2_2
L2_2 = {}
function L3_3.get_target_module(A0_4)
	if _ENV[A0_4] then
		return _ENV[A0_4]
	end
	assert(A0_4)
	local L1_5 = L1_5
	local L1_5, L2_6 = L1_5(A0_4), L2_6
	L2_6 = L1_1
	L2_6 = L2_6.ways
	L2_6 = L2_6[L1_5.macro_key]
	if not L2_6 then
		L2_6 = L1_1
		L2_6 = L2_6.ways
		L2_6 = L2_6.base
	end
	local L3_7, L4_8 = L3_7, L4_8
	L3_7(L4_8, A0_4)
	local L5_9 = L5_9
	L3_7 = _ENV
	L3_7[A0_4] = L2_6
	return L2_6
end
