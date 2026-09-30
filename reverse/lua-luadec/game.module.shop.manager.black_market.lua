-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.shop.manager.black_market_-8825925870182411331.bin 

local l_0_0 = DataConfigs
local l_0_1 = l_0_0.language_define
local l_0_2 = l_0_0.misc
local l_0_3 = l_0_2.black_market_brush_item.val
local l_0_4 = l_0_0.black_market_goods
local l_0_5 = l_0_0.black_market_value_goods
local l_0_6 = l_0_0.item
local l_0_7 = BroadcastTips
local l_0_8 = Game.events
local l_0_9 = Game.module.open_func
local l_0_10 = l_0_9.const
local l_0_11 = l_0_9.event
local l_0_12 = TimeUtils
local l_0_13 = Game.server_time
local l_0_14 = require("game.other.game_time.init")
local l_0_15 = require("game.other.player_prefs")
local l_0_16 = require("game.module.tips.view.try_to_cost.core")
local l_0_17 = Game.module.common_view
local l_0_18 = Game.ui_manager
local l_0_19 = import(".head")
local l_0_20 = l_0_19.data
local l_0_21 = l_0_19.network
local l_0_22 = l_0_19.const
l_0_19.init_black_market = function()
  l_0_20.init_black_market()
  l_0_21.init_black_market()
  l_0_19.setup_black_market_events()
end

l_0_19.clear_black_market = function()
  l_0_19.clear_black_market_events()
  l_0_21.clear_black_market()
  l_0_20.clear_black_market()
end

l_0_19.black_market_get_shop_cfg = function(l_3_0)
  local l_3_1 = nil
  if l_3_0.type == 0 then
    l_3_1 = l_0_4.get_config(l_3_0.cid)
  else
    l_3_1 = l_0_5.get_config(l_3_0.cid)
  end
  return l_3_1
end

l_0_19.black_market_get_shop_item_cid = function(l_4_0)
  return l_4_0.item_id
end

l_0_19.black_market_get_shop_item_num = function(l_5_0)
  local l_5_1 = l_0_19.black_market_get_shop_cfg(l_5_0)
  return l_5_1 and l_5_1.num or 0
end

l_0_19.black_market_is_sell_out = function(l_6_0)
  return l_6_0.sell_flag == 1
end

l_0_19.black_market_get_rebate = function(l_7_0)
  return l_7_0.rebate
end

l_0_19.black_market_get_rebate_info = function(l_8_0)
  local l_8_1 = math.round(l_0_19.black_market_get_rebate(l_8_0) / 10)
  return l_8_1 .. "\230\138\152"
end

l_0_19.black_market_get_price = function(l_9_0)
  return l_9_0.price
end

l_0_19.black_market_get_cost_item_cid = function(l_10_0)
  return l_0_19.black_market_get_shop_cfg(l_10_0).cur
end

l_0_19.black_market_get_brush_cd = function(l_11_0)
  return math.max(0, l_0_20.get_black_market_brush_time(l_11_0) - l_0_13.get_server_time())
end

l_0_19.black_market_get_brush_cd_after_format = function(l_12_0, l_12_1)
  local l_12_2 = l_0_19.black_market_get_brush_cd(l_12_0)
  local l_12_3 = ""
  local l_12_4, l_12_5, l_12_6, l_12_7 = l_0_14.get_d_h_m_s(l_12_2)
  if l_12_2 < 0 then
    return ""
  elseif l_12_2 < 3600 then
    l_12_3 = string.format("%d\229\136\134\233\146\159%d\231\167\146", l_12_6, l_12_7)
  else
    l_12_3 = string.format("%d\229\176\143\230\151\182%d\229\136\134\233\146\159", l_12_5, l_12_6)
  end
  if l_12_1 then
    return l_12_3 .. "\229\144\142\229\136\183\230\150\176"
  end
  return l_12_3 .. " <color=#EAEAFF>\229\144\142\229\136\183\230\150\176</color>"
end

l_0_19.black_market_try_to_buy = function(l_13_0, l_13_1)
  if l_0_19.black_market_is_sell_out(l_13_0) then
    l_0_7.broadcast_tips(l_0_1.get_string("TID_trade_system_sell_out_tips"))
    return 
  end
  local l_13_2 = l_0_18.open_view
  local l_13_3 = "ShopBuyView"
  local l_13_4 = {}
  l_13_4.buy_type = l_0_22.buy_type.black_market
  l_13_4.shop_info = l_13_0
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    if not l_13_1 then
      l_13_4.black_market_type = l_0_22.black_market_type.default
      l_13_2(l_13_3, l_13_4)
    end
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_19.black_market_sort_list = function(l_14_0)
  local l_14_1 = l_0_20.get_black_market_list(l_14_0)
  if not l_14_1 then
    return 
  end
  for l_14_5,l_14_6 in ipairs(l_14_1) do
    l_14_6.sort_index = l_14_5
  end
  table.sort(l_14_1, function(l_1_0, l_1_1)
    local l_15_2 = l_0_19.black_market_get_rebate(l_1_0)
    local l_15_3 = l_0_19.black_market_get_rebate(l_1_1)
    if l_15_2 >= l_15_3 then
      return l_15_2 == l_15_3
    end
    return l_1_0.sort_index < l_1_1.sort_index
   end)
end

l_0_19.black_market_has_red_point = function()
  local l_15_0 = l_0_20.get_black_market_red_point
  local l_15_1 = l_0_22.black_market_type.default
  return l_15_0(l_15_1)
end

l_0_19.black_market_get_save_info = function()
  local l_16_0 = l_0_2.black_market_brush_hour.val
  local l_16_1 = 0
  local l_16_2 = l_0_13.get_server_time()
  local l_16_3 = l_0_12.getDateTime(l_16_2)
  local l_16_4 = l_0_14.get_days(l_16_2)
  do
    local l_16_5 = ((l_16_0 < l_16_3.Hour or l_16_3.Hour == l_16_0) and l_16_1 <= l_16_3.Minute and 1) or 0
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  return l_16_4, l_16_5
end

l_0_19.black_market_save_info = function()
  local l_17_0, l_17_1 = l_0_19.black_market_get_save_info()
  l_0_15.set_player_data("black_market_refresh_prefs", string.format("%s%s", l_17_0, l_17_1))
end

l_0_19.black_market_check_red_point = function()
  if not l_0_9.is_open(l_0_10.type.black_market) then
    l_0_19.black_market_try_change_red_point(false)
    return 
  end
  local l_18_0 = l_0_15.get_player_data("black_market_refresh_prefs", "string")
  if not l_18_0 then
    l_0_19.black_market_try_change_red_point(true)
    return 
  end
  local l_18_1 = string.sub(l_18_0, 1, -2)
  local l_18_2 = string.sub(l_18_0, -1, -1)
  local l_18_3, l_18_4 = l_0_19.black_market_get_save_info()
  if tonumber(l_18_1) == l_18_3 and tonumber(l_18_2) == l_18_4 then
    l_0_19.black_market_try_change_red_point(false)
  else
    l_0_19.black_market_try_change_red_point(true)
  end
end

l_0_19.black_market_try_change_red_point = function(l_19_0)
  if not l_0_9.is_open(l_0_10.type.black_market) then
    l_19_0 = false
  end
  if l_0_20.get_black_market_red_point(l_0_22.black_market_type.default) ~= l_19_0 then
    l_0_20.set_black_market_red_point(l_0_22.black_market_type.default, l_19_0)
    l_0_19.update_shop_red_points()
  end
end

l_0_19.setup_black_market_events = function()
  l_0_8.add_listener(l_0_11.update_all, l_0_19.on_black_market_open_func_event_update_all)
  l_0_8.add_listener(l_0_11.update_item, l_0_19.on_black_market_open_func_event_update_item)
end

l_0_19.clear_black_market_events = function()
  l_0_8.remove_listener(l_0_11.update_all, l_0_19.on_black_market_open_func_event_update_all)
  l_0_8.remove_listener(l_0_11.update_item, l_0_19.on_black_market_open_func_event_update_item)
end

l_0_19.on_black_market_open_func_event_update_all = function()
  l_0_19.black_market_check_red_point()
end

l_0_19.on_black_market_open_func_event_update_item = function(l_23_0, l_23_1)
  if l_23_1 and l_23_0 == l_0_10.type.black_market then
    l_0_19.black_market_try_change_red_point(true)
  end
end


