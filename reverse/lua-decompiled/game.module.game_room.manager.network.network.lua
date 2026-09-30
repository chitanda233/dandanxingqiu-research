local L0_0, L2_2, L5_5, L6_6, L7_7, L8_8 = L0_0, "game.network.network_utils", L5_5, L6_6, L7_7, L8_8
L0_0 = L0_0(L2_2)
L2_2 = Game
L2_2 = L2_2.events
L5_5 = L2_2.brocast
L6_6 = import
L7_7 = "..head"
L6_6 = L6_6(L7_7)
L7_7 = L6_6.data
L8_8 = L6_6.network
function L8_8.init()
	_ENV.net_event_names, ({}).a_c2s = {}, _ENV.on_a_s2c
	local L0_9 = L0_9
	local L1_10 = L1_10
	L0_9(L1_10, "game_room")
	local L2_11 = L2_11
end
function L8_8.clear()
	local L0_12 = L0_12
	L0_12(L8_8.net_event_names)
	local L1_13 = L1_13
	L0_12 = L8_8
	L0_12.net_event_names = nil
end
function L8_8.a_c2s()
	local L1_14 = L1_14
	L1_14("a_c2s", {})
	local L2_15 = L2_15
end
function L8_8.on_a_s2c(A0_16, A1_17)
	if A0_16 ~= 0 then
		return
	end
end
