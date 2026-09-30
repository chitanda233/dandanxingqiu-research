-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.network_5906234710675851519.bin 

local l_0_0 = require("game.network.network_utils")
local l_0_1 = require("game.utils.events")
local l_0_2 = string.format
local l_0_3 = GameFunctions
local l_0_4 = Game.server_time
local l_0_5 = Game.module.fight
local l_0_6 = l_0_5.ways.base
local l_0_7 = {}
l_0_7.battle_pause_c2s = true
l_0_7.battle_reconnect_enter_c2s = true
l_0_6.custom_loading_stop_c2s = function(l_1_0, l_1_1, l_1_2)
   -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

end
return true
end

l_0_6.send_network_msg = function(l_2_0, l_2_1, l_2_2, l_2_3)
  if l_2_0.client_type_handler:send_network_msg(l_2_1, l_2_2, l_2_3) then
    return 
  end
  l_2_0:raw_send_network_msg(l_2_1, l_2_2, l_2_3)
end

l_0_6.raw_send_network_msg = function(l_3_0, l_3_1, l_3_2, l_3_3)
  if l_3_0.game_state == "loading" and l_3_0.need_stop_fight and not l_3_0:custom_loading_stop_c2s(l_3_0, l_3_1, l_3_2) then
    return 
  end
  if l_0_3.get_time_is_pause() and not l_0_7[l_3_1] then
    return 
  end
  if l_3_0.is_reconnecting_from_replay then
    return 
  end
  l_0_0.send(l_3_1, l_3_2, l_3_3)
end

end
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

 -- Warning: undefined locals caused missing assignments!

