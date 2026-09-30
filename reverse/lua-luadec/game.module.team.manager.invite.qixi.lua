-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.invite.qixi_7784907361020511140.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.invites.team
local l_0_2 = l_0_0.invites.qixi
local l_0_3 = Game.module.team
local l_0_4 = l_0_3.network
local l_0_5 = l_0_3.data
local l_0_6 = l_0_3.const
local l_0_7 = Game.module.activity_role
local l_0_8 = l_0_7.data
local l_0_9 = l_0_7.const
l_0_2.init = function(l_1_0)
  if l_1_0.__init then
    return 
  end
  l_0_1.init(l_1_0)
  l_1_0.relation_source = l_0_6.relation_source.qixi_team_invite
end

l_0_2.get_bg = function(l_2_0)
  return "UI/BigPic/team_bg_zudui2.ab"
end

l_0_2.get_active_objs = function(l_3_0)
  do
    local l_3_1 = {}
     -- DECOMPILER ERROR: No list found. Setlist fails

    return l_3_1
  end
   -- Warning: undefined locals caused missing assignments!
end

l_0_2.get_inactive_objs = function(l_4_0)
  do
    local l_4_1 = {}
     -- DECOMPILER ERROR: No list found. Setlist fails

    return l_4_1
  end
   -- Warning: undefined locals caused missing assignments!
end

l_0_2.is_open = function(l_5_0)
  local l_5_1 = l_0_8.is_activity_open
  local l_5_2 = l_0_9.act_cid.qixi_team
  return l_5_1(l_5_2)
end

return l_0_2

