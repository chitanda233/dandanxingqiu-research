-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua11_573512\game.module.open_func.manager.network.network_2511858066701623407.bin 

local l_0_0 = require("game.network.network_utils")
local l_0_1 = Game.events
local l_0_2 = Game.redpoint_helper
local l_0_3 = Game.module.main_view.event
local l_0_4 = import("..head")
local l_0_5 = assert(l_0_4.data)
local l_0_6 = assert(l_0_4.event)
local l_0_7 = assert(l_0_4.network)
l_0_7.init = function()
  local l_1_0 = l_0_7
  local l_1_1 = {}
  l_1_1.open_func_all_s2c = l_0_7.on_open_func_all_s2c
  l_1_1.open_func_update_list_s2c = l_0_7.on_open_func_update_list_s2c
  l_1_1.open_func_role_info_s2c = l_0_7.on_open_func_role_info_s2c
  l_1_1.open_func_receive_s2c = l_0_7.on_open_func_receive_s2c
  l_1_0.net_events = l_1_1
  l_1_0 = l_0_0
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_7
  l_1_1 = l_1_1.net_events
  l_1_0(l_1_1, "open_func")
end

l_0_7.clear = function()
  l_0_0.unlisten_net_events(l_0_7.net_events)
  l_0_7.net_events = nil
end

l_0_7.open_func_all_c2s = function()
  l_0_0.send("open_func_all_c2s", {})
end

l_0_7.open_func_role_info_c2s = function(l_4_0, l_4_1)
  if not l_4_0 or not next(l_4_0) or not l_4_1 then
    return 
  end
  local l_4_2 = l_0_0.send
  local l_4_3 = "open_func_role_info_c2s"
  local l_4_4 = {}
  l_4_4.role_list = l_4_0
  l_4_4.open_id = l_4_1
  l_4_2(l_4_3, l_4_4)
end

l_0_7.open_func_receive_c2s = function(l_5_0)
  local l_5_1 = l_0_0.send
  local l_5_2 = "open_func_receive_c2s"
  local l_5_3 = {}
  l_5_3.id = l_5_0
  l_5_1(l_5_2, l_5_3)
end

l_0_7.on_open_func_all_s2c = function(l_6_0, l_6_1)
  if l_6_0 ~= 0 then
    return 
  end
  l_0_4.has_open_func_all = true
  l_0_5.update_all(l_6_1)
end

l_0_7.on_open_func_update_list_s2c = function(l_7_0, l_7_1)
  if l_7_0 ~= 0 then
    return 
  end
  l_0_5.update_list(l_7_1)
end

l_0_7.on_open_func_role_info_s2c = function(l_8_0, l_8_1)
  if l_8_0 ~= 0 then
    return 
  end
  l_0_5.update_role_open_func(l_8_1)
  l_0_1.brocast(l_0_6.update_role_open_func)
end

l_0_7.on_open_func_receive_s2c = function(l_9_0, l_9_1)
  if l_9_0 ~= 0 then
    return 
  end
  l_0_5.receive_reward(l_9_1.id)
  l_0_1.brocast(l_0_6.update_preview_reward)
  l_0_2.update_red_point("open_func_preview_red_point")
end

return l_0_7

