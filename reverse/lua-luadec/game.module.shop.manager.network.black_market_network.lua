-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.shop.manager.network.black_market_network_8604744803887145362.bin 

local l_0_0 = require("game.network.network_utils")
local l_0_1 = Game.events
local l_0_2 = import("..head")
local l_0_3 = l_0_2.data
local l_0_4 = l_0_2.network
local l_0_5 = l_0_2.const
l_0_4.init_black_market = function()
  local l_1_0 = l_0_4
  local l_1_1 = {}
  l_1_1.black_market_info_s2c = l_0_4.on_black_market_info_s2c
  l_1_1.black_market_buy_s2c = l_0_4.on_black_market_buy_s2c
  l_1_1.black_market_brush_s2c = l_0_4.on_black_market_brush_s2c
  l_1_1.black_market_brush_notice_s2c = l_0_4.on_black_market_brush_notice_s2c
  l_1_0.black_market_net_event_names = l_1_1
  l_1_0 = l_0_0
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_4
  l_1_1 = l_1_1.black_market_net_event_names
  l_1_0(l_1_1, "black_market")
end

l_0_4.clear_black_market = function()
  l_0_0.unlisten_net_events(l_0_4.black_market_net_event_names)
  l_0_4.black_market_net_event_names = nil
end

l_0_4.black_market_info_c2s = function(l_3_0)
  if not l_3_0 then
    l_3_0 = l_0_5.black_market_type.default
  end
  local l_3_1 = l_0_0.send
  local l_3_2 = "black_market_info_c2s"
  local l_3_3 = {}
  l_3_3.type = l_3_0
  l_3_1(l_3_2, l_3_3)
end

l_0_4.on_black_market_info_s2c = function(l_4_0, l_4_1)
  if l_4_0 ~= 0 then
    return 
  end
  local l_4_2 = l_4_1.type
  if l_4_2 == nil then
    return 
  end
  l_0_3.set_black_market_info(l_4_2, l_4_1.info, l_4_1.brush_time, l_4_1.brush_count)
  l_0_2.black_market_sort_list(l_4_2)
  l_0_1.brocast("update_black_market_info", l_4_2)
end

l_0_4.black_market_buy_c2s = function(l_5_0, l_5_1)
  if not l_5_1 then
    l_5_1 = l_0_5.black_market_type.default
  end
  local l_5_2 = l_0_0.send
  local l_5_3 = "black_market_buy_c2s"
  local l_5_4 = {}
  l_5_4.uid = l_5_0
  l_5_4.type = l_5_1
  l_5_2(l_5_3, l_5_4)
end

l_0_4.on_black_market_buy_s2c = function(l_6_0, l_6_1)
  if l_6_0 ~= 0 then
    return 
  end
  local l_6_2 = l_6_1.type
  local l_6_3 = l_0_3.get_black_market_list(l_6_2)
  if not l_6_3 then
    print("network.on_black_market_buy_s2c error: data_list is nil")
    return 
  end
  for l_6_7,l_6_8 in pairs(l_6_3) do
    if l_6_8.uid == l_6_1.uid then
      l_6_8.sell_flag = 1
  else
    end
  end
  l_0_1.brocast("black_market_buy", l_6_2, l_6_1.uid)
end

l_0_4.black_market_brush_c2s = function(l_7_0)
  if not l_7_0 then
    l_7_0 = l_0_5.black_market_type.default
  end
  local l_7_1 = l_0_0.send
  local l_7_2 = "black_market_brush_c2s"
  local l_7_3 = {}
  l_7_3.type = l_7_0
  l_7_1(l_7_2, l_7_3)
end

l_0_4.on_black_market_brush_s2c = function(l_8_0, l_8_1)
  if l_8_0 ~= 0 then
    return 
  end
  BroadcastTips.broadcast_tips("\229\136\183\230\150\176\230\136\144\229\138\159")
end

l_0_4.on_black_market_brush_notice_s2c = function(l_9_0, l_9_1)
  if l_9_0 ~= 0 then
    return 
  end
  l_0_2.black_market_try_change_red_point(true)
end


