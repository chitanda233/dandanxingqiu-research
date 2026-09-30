local L0_0 = L0_0
local L0_0, L1_1 = L0_0(".head"), L1_1
function L1_1(A0_2)
	local L1_3
	L1_3 = _ENV
	L1_3 = L1_3.invites
	L1_3 = L1_3[A0_2]
	if not L1_3 then
		L1_3 = _ENV
		L1_3 = L1_3.invites
		L1_3 = L1_3.base
	end
	L1_3:init()
	local L2_4, L3_5 = L2_4, L3_5
	return L1_3
end
L0_0.get_invite_module = L1_1
function L1_1()
	L4_10 = _ENV
	L4_10 = L4_10.invites
	L3_9, L4_10, _FOR_ = L3_9(L4_10)
	for _FORV_3_, _FORV_4_ in L3_9, L4_10, _FOR_ do
		_FORV_4_:destroy()
	end
	L3_9 = table
	L3_9 = L3_9.clear
	L4_10 = _ENV
	L4_10 = L4_10.invites
	L3_9(L4_10)
end
L0_0.clear = L1_1
