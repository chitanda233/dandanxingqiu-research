-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.invite.marriage_-1559282295151813444.bin 

local l_0_0 = import(".head")
local l_0_1 = Game.module.team
local l_0_2 = l_0_1.network
local l_0_3 = l_0_1.data
local l_0_4 = l_0_1.const
local l_0_5 = l_0_0.invites.base
local l_0_6 = l_0_0.invites.marriage
local l_0_7 = Game.module.marriage
local l_0_8 = l_0_7.data
local l_0_9 = l_0_7.network
local l_0_10 = Game.events
local l_0_11 = Game.server_time
local l_0_12 = Game.module.big_scene
local l_0_13 = l_0_12.data
local l_0_14 = 10
l_0_6.init = function(l_1_0)
  if l_1_0.__init then
    return 
  end
  l_0_5.init(l_1_0)
  l_1_0.relation_source = l_0_4.relation_source.marriage
  l_1_0.next_invite_time = {}
end

l_0_6.get_bg = function(l_2_0)
  return "UI/BigPic/team_bg_zudui.ab"
end

l_0_6.invite_role = function(l_3_0, l_3_1, l_3_2)
  if not l_3_1 then
    return 
  end
  local l_3_3 = l_0_11.get_server_time()
  local l_3_4 = l_3_0.next_invite_time
  local l_3_5 = l_3_1.role_id
  l_3_4[l_3_5] = l_3_3 + l_0_14
  l_3_4 = l_0_9
  l_3_4 = l_3_4.marriage_invite_c2s
  l_3_5 = l_3_1.role_id
  l_3_4(l_3_5)
end

l_0_6.get_role_invite_cd = function(l_4_0, l_4_1)
  local l_4_2 = l_0_11.get_server_time()
  do
    local l_4_3 = l_4_0.next_invite_time[l_4_1.role_id]
    if l_4_3 then
      local l_4_4 = l_4_3 - l_4_2
      do
         -- DECOMPILER ERROR: Confused at declaration of local variable

      end
      return l_4_4 > 0 and l_4_4 or 0
    end
    return 0
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_6.invite_all = function(l_5_0, l_5_1)
  if l_5_1 and next(l_5_1) then
    local l_5_2 = l_0_11.get_server_time()
    for l_5_6,l_5_7 in ipairs(l_5_1) do
      local l_5_8 = l_5_0.next_invite_time
      local l_5_9 = l_5_7.role_id
      l_5_8[l_5_9] = l_5_2 + l_0_14
      l_5_8 = l_0_9
      l_5_8 = l_5_8.marriage_invite_c2s
      l_5_9 = l_5_7.role_id
      l_5_8(l_5_9)
    end
  end
end

do
  return l_0_6
end
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

 -- Warning: undefined locals caused missing assignments!

