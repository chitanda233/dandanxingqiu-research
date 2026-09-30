-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.shop.manager.network.network_-6234670059096265269.bin 

local l_0_0 = require("game.network.network_utils")
local l_0_1 = Game.events
local l_0_2 = import("..head")
local l_0_3 = l_0_2.data
local l_0_4 = l_0_2.network
l_0_4.init = function()
  local l_1_0 = l_0_4
  local l_1_1 = {}
  l_1_1.shop_info_s2c = l_0_4.on_shop_info_s2c
  l_1_1.shop_buy_s2c = l_0_4.on_shop_buy_s2c
  l_1_1.shop_item_num_s2c = l_0_4.on_shop_item_num_s2c
  l_1_1.shop_batch_buy_s2c = l_0_4.on_shop_batch_buy_s2c
  l_1_1.shop_subscribe_s2c = l_0_4.on_shop_subscribe_s2c
  l_1_1.shop_update_shop_s2c = l_0_4.on_shop_update_shop_s2c
  l_1_0.net_event_names = l_1_1
  l_1_0 = l_0_0
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_4
  l_1_1 = l_1_1.net_event_names
  l_1_0(l_1_1, "shop")
end

l_0_4.clear = function()
  l_0_0.unlisten_net_events(l_0_4.net_event_names)
  l_0_4.net_event_names = nil
end

l_0_4.shop_info_c2s = function()
  l_0_0.send("shop_info_c2s", {})
end

l_0_4.on_shop_info_s2c = function(l_4_0, l_4_1)
  l_0_3.init_shop_list(l_4_1)
  l_0_2.cache_shop_list()
  l_0_1.brocast("shop_info")
  l_0_2.update_cache_shop_red_point()
end

l_0_4.shop_buy_c2s = function(l_5_0, l_5_1, l_5_2)
  local l_5_3 = l_0_0.send
  local l_5_4 = "shop_buy_c2s"
  local l_5_5 = {}
  l_5_5.shop_id = l_5_0
  l_5_5.number = l_5_1
  l_5_5.item_cid = l_5_2
  l_5_3(l_5_4, l_5_5)
end

l_0_4.on_shop_buy_s2c = function(l_6_0, l_6_1)
  if not l_6_1.shop then
    return 
  end
  local l_6_2 = l_0_3.shop_dict
  local l_6_3 = l_6_1.shop.shop_id
  l_6_2[l_6_3] = l_6_1.shop
  l_6_2 = l_0_2
  l_6_2 = l_6_2.cache_shop_list
  l_6_2()
  l_6_2 = l_0_1
  l_6_2 = l_6_2.brocast
  l_6_3 = "shop_buy"
  l_6_2(l_6_3, l_6_1.shop)
  l_6_2 = l_0_2
  l_6_2 = l_6_2.update_cache_shop_red_point
  l_6_2()
end

l_0_4.on_shop_update_shop_s2c = function(l_7_0, l_7_1)
  if l_7_0 ~= 0 then
    return 
  end
  l_0_3.update_shop_list(l_7_1.shop_list)
  l_0_3.delete_shop_list(l_7_1.delete_list)
  l_0_2.cache_shop_list()
  l_0_1.brocast("shop_info")
  l_0_2.update_cache_shop_red_point()
end

l_0_4.shop_item_num_c2s = function()
  l_0_0.send("shop_item_num_c2s", {})
end

l_0_4.on_shop_item_num_s2c = function(l_9_0, l_9_1)
  if l_9_1.list then
    table.clear(l_0_3.collect_list)
    for l_9_5,l_9_6 in ipairs(l_9_1.list) do
      local l_9_7 = l_0_3.collect_list
      local l_9_8 = l_9_6.item_cid
      l_9_7[l_9_8] = l_9_6.number
    end
    l_0_1.brocast("shop_item_num_update")
  end
end

l_0_4.shop_batch_buy_c2s = function(l_10_0)
  local l_10_1 = l_0_0.send
  local l_10_2 = "shop_batch_buy_c2s"
  local l_10_3 = {}
  l_10_3.buy_list = l_10_0
  l_10_1(l_10_2, l_10_3)
end

l_0_4.on_shop_batch_buy_s2c = function(l_11_0, l_11_1)
  if l_11_1.shop_list then
    for l_11_5,l_11_6 in ipairs(l_11_1.shop_list) do
      l_0_3.shop_dict[l_11_6.shop_id] = l_11_6
    end
  end
  l_0_2.cache_shop_list()
  l_0_1.brocast("shop_batch_buy", l_11_1)
  l_0_2.update_cache_shop_red_point()
end

l_0_4.shop_subscribe_c2s = function(l_12_0)
  local l_12_1 = l_0_0.send
  local l_12_2 = "shop_subscribe_c2s"
  local l_12_3 = {}
  l_12_3.type = l_12_0
  l_12_1(l_12_2, l_12_3)
end

l_0_4.on_shop_subscribe_s2c = function(l_13_0, l_13_1)
end


