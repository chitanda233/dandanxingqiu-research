-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua1_573660\game.module.data.manager.player.local_player_-3483996038065972559.bin 

local l_0_0 = import(".player")
local l_0_1 = class("local_player", l_0_0)
l_0_1.ctor = function(l_1_0)
  l_0_0.ctor(l_1_0)
  l_1_0.server_name = ""
  l_1_0.create_time = 0
  l_1_0.status = 0
end

l_0_1.init_local = function(l_2_0, l_2_1)
  l_2_0:init(l_2_1)
end

return l_0_1

