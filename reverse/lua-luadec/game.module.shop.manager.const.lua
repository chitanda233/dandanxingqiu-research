-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.shop.manager.const_4617049706645367079.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.const
local l_0_2 = {}
l_0_2.discount = 1
l_0_2.looks = 2
l_0_2.reputation = 3
l_0_2.liveliness = 4
l_0_2.recharge = 5
l_0_2.trade_shop = 6
l_0_2.auction = 7
l_0_2.point = 101
l_0_2.coin = 102
l_0_2.home = 114
l_0_2.special_supply = 123
l_0_2.appointment = 124
l_0_1.shop_type = l_0_2
l_0_2 = {1 = "\228\187\138\230\151\165\233\153\144\232\180\173", 2 = "\230\156\172\229\145\168\233\153\144\232\180\173", 3 = "\230\156\172\230\156\136\233\153\144\232\180\173", 4 = "\231\187\136\232\186\171\233\153\144\232\180\173"}
l_0_2[5] = "\233\153\144\232\180\173"
l_0_2[6] = "\233\153\144\232\180\173"
l_0_2[7] = "\232\181\155\229\173\163\233\153\144\232\180\173"
l_0_2[8] = "\233\153\144\232\180\173"
l_0_2[9] = "\233\153\144\232\180\173"
l_0_2[10] = "\233\153\144\232\180\173"
l_0_1.limit_type_to_name = l_0_2
l_0_2 = {shop = 1, black_market = 2, trade_shop = 3, alliance_shop = 4, alliance_raid_buff = 5}
l_0_1.buy_type = l_0_2
l_0_2 = {trade_shop = 1}
l_0_1.sell_type = l_0_2
l_0_1.open_clip_name = "Container@item_tongyong"
l_0_1.buy_clip_name = "Container@shop_item_in"
l_0_2 = {l_0_1.shop_type.discount = true, l_0_1.shop_type.looks = true, l_0_1.shop_type.recharge = true, l_0_1.shop_type.trade_shop = true}
l_0_1.recharge_close_shop_type = l_0_2
l_0_2 = {default = 0, grand_glory = 3004}
l_0_1.black_market_type = l_0_2
return l_0_1

