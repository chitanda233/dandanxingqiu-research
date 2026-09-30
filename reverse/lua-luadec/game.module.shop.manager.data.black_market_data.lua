-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.shop.manager.data.black_market_data_-8639582007996104789.bin 

local l_0_0 = import("..head")
local l_0_1 = l_0_0.data
local l_0_2 = l_0_0.const
l_0_1.init_black_market = function()
  l_0_1.reset_black_market()
end

l_0_1.clear_black_market = function()
  l_0_1.reset_black_market()
end

l_0_1.reset_black_market = function()
  l_0_1.black_market_info_dict = {}
  for l_3_3,l_3_4 in pairs(l_0_2.black_market_type) do
    local l_3_5 = l_0_1.black_market_info_dict
    local l_3_6 = {}
    l_3_6.type = l_3_4
    l_3_6.black_market_list = nil
    l_3_6.black_market_brush_time = 0
    l_3_6.black_market_red_point = false
    l_3_5[l_3_4] = l_3_6
  end
end

l_0_1.set_black_market_info = function(l_4_0, l_4_1, l_4_2, l_4_3)
  if l_4_0 == nil then
    return 
  end
  if not l_0_1.get_black_market_info(l_4_0) then
    local l_4_4 = {}
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_4_4.black_market_list = l_4_1
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_4_4.black_market_brush_time = l_4_2 or 0
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_4_4.black_market_brush_count = l_4_3 or 0
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_0_1.black_market_info_dict[l_4_0] = l_4_4
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.set_black_market_red_point = function(l_5_0, l_5_1)
  local l_5_2 = l_0_1.get_black_market_info(l_5_0)
  if not l_5_2 then
    return 
  end
  l_5_2.black_market_red_point = l_5_1
end

l_0_1.get_black_market_info = function(l_6_0)
  if l_6_0 == nil then
    error("data.get_black_market_info error: type is nil")
    return nil
  end
  return l_0_1.black_market_info_dict[l_6_0]
end

l_0_1.get_black_market_list = function(l_7_0)
  local l_7_1 = l_0_1.get_black_market_info(l_7_0)
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    if l_7_1 then
      return l_7_1.black_market_list
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
end

l_0_1.get_black_market_brush_time = function(l_8_0)
  local l_8_1 = l_0_1.get_black_market_info(l_8_0)
  return l_8_1 and l_8_1.black_market_brush_time or 0
end

l_0_1.get_black_market_red_point = function(l_9_0)
  local l_9_1 = l_0_1.get_black_market_info(l_9_0)
  if l_9_1 and l_9_1.black_market_red_point then
    return true
  end
  return false
end

l_0_1.get_black_market_brush_count = function(l_10_0)
  local l_10_1 = l_0_1.get_black_market_info(l_10_0)
  return l_10_1 and l_10_1.black_market_brush_count or 0
end


