-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.invite.core_6781678252388602605.bin 

local l_0_0 = import(".head")
l_0_0.get_invite_module = function(l_1_0)
  if not l_0_0.invites[l_1_0] then
    local l_1_1, l_1_2, l_1_3 = l_0_0.invites.base
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_1_1:init()
   -- DECOMPILER ERROR: Confused about usage of registers!

  return l_1_1
end

l_0_0.clear = function()
  for l_2_3,l_2_4 in pairs(l_0_0.invites) do
    l_2_4:destroy()
  end
  table.clear(l_0_0.invites)
end


