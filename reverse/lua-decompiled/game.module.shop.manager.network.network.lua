local L0_0, L4_4, L5_5 = L0_0, "game.network.network_utils", L5_5
L0_0 = L0_0(L4_4)
L4_4 = Game
L4_4 = L4_4.events
L5_5 = import
local L5_5, L3_3 = L5_5("..head"), L3_3
L3_3 = L5_5.data
function L5_5.network.init()
	({}).shop_info_s2c = _ENV.on_shop_info_s2c
	;({}).shop_buy_s2c = _ENV.on_shop_buy_s2c
	;({}).shop_item_num_s2c = _ENV.on_shop_item_num_s2c
	;({}).shop_batch_buy_s2c = _ENV.on_shop_batch_buy_s2c
	;({}).shop_subscribe_s2c = _ENV.on_shop_subscribe_s2c
	_ENV.net_event_names, ({}).shop_update_shop_s2c = {}, _ENV.on_shop_update_shop_s2c
	local L0_6 = L0_6
	local L1_7 = L1_7
	L0_6(L1_7, "shop")
	local L2_8 = L2_8
end
function L5_5.network.clear()
	local L0_9 = L0_9
	L0_9(_UPVALUE1_.net_event_names)
	local L1_10 = L1_10
	L0_9 = _UPVALUE1_
	L0_9.net_event_names = nil
end
function L5_5.network.shop_info_c2s()
	local L1_11 = L1_11
	L1_11("shop_info_c2s", {})
	local L2_12 = L2_12
end
function L5_5.network.on_shop_info_s2c(A0_13, A1_14)
	_ENV.init_shop_list(A1_14)
	L2_2.cache_shop_list()
	L1_1.brocast("shop_info")
	local L3_15 = L3_15
	L3_15 = L2_2
	L3_15 = L3_15.update_cache_shop_red_point
	L3_15()
end
function L5_5.network.shop_buy_c2s(A0_16, A1_17, A2_18)
	local L3_19 = L3_19
	local L4_20 = L4_20
	;({}).shop_id = A0_16
	;({}).number = A1_17
	;({}).item_cid = A2_18
	L3_19(L4_20, {})
	local L5_21 = L5_21
end
function L5_5.network.on_shop_buy_s2c(A0_22, A1_23)
	if not A1_23.shop then
		return
	end
	_ENV.shop_dict[A1_23.shop.shop_id] = A1_23.shop
	L2_2.cache_shop_list()
	local L3_25 = L3_25
	L3_25("shop_buy", A1_23.shop)
	local L4_26 = L4_26
	L3_25 = L2_2
	L3_25 = L3_25.update_cache_shop_red_point
	L3_25()
end
function L5_5.network.on_shop_update_shop_s2c(A0_27, A1_28)
	if A0_27 ~= 0 then
		return
	end
	_ENV.update_shop_list(A1_28.shop_list)
	_ENV.delete_shop_list(A1_28.delete_list)
	L2_2.cache_shop_list()
	L1_1.brocast("shop_info")
	local L3_30 = L3_30
	L3_30 = L2_2
	L3_30 = L3_30.update_cache_shop_red_point
	L3_30()
end
function L5_5.network.shop_item_num_c2s()
	local L1_31 = L1_31
	L1_31("shop_item_num_c2s", {})
	local L2_32 = L2_32
end
function L5_5.network.on_shop_item_num_s2c(A0_33, A1_34)
	if A1_34.list then
		L5_38 = table
		L5_38 = L5_38.clear
		L6_39 = _ENV
		L6_39 = L6_39.collect_list
		L5_38(L6_39)
		L5_38 = ipairs
		L6_39 = A1_34.list
		L5_38, L6_39, _FOR_ = L5_38(L6_39)
		for _FORV_5_, _FORV_6_ in L5_38, L6_39, _FOR_ do
			_ENV.collect_list[_FORV_6_.item_cid] = _FORV_6_.number
		end
		L5_38 = L1_1
		L5_38 = L5_38.brocast
		L6_39 = "shop_item_num_update"
		L5_38(L6_39)
	end
end
function L5_5.network.shop_batch_buy_c2s(A0_43)
	local L1_44 = L1_44
	local L2_45 = L2_45
	;({}).buy_list = A0_43
	L1_44(L2_45, {})
	local L3_46 = L3_46
end
function L5_5.network.on_shop_batch_buy_s2c(A0_47, A1_48)
	if A1_48.shop_list then
		L5_52 = ipairs
		L6_53 = A1_48.shop_list
		L5_52, L6_53, _FOR_ = L5_52(L6_53)
		for _FORV_5_, _FORV_6_ in L5_52, L6_53, _FOR_ do
			_ENV.shop_dict[_FORV_6_.shop_id] = _FORV_6_
		end
	end
	L5_52 = L2_2
	L5_52 = L5_52.cache_shop_list
	L5_52()
	L5_52 = L1_1
	L5_52 = L5_52.brocast
	L6_53 = "shop_batch_buy"
	L8_55 = A1_48
	L5_52(L6_53, L8_55)
	L5_52 = L2_2
	L5_52 = L5_52.update_cache_shop_red_point
	L5_52()
end
function L5_5.network.shop_subscribe_c2s(A0_56)
	local L1_57 = L1_57
	local L2_58 = L2_58
	;({}).type = A0_56
	L1_57(L2_58, {})
	local L3_59 = L3_59
end
