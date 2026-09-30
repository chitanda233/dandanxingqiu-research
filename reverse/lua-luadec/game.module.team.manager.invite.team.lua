-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.invite.team_7406190794892166361.bin 

local l_0_0 = import(".head")
local l_0_1 = Game.module.team
local l_0_2 = assert(l_0_1.network)
local l_0_3 = assert(l_0_1.data)
local l_0_4 = assert(l_0_1.const)
local l_0_5 = l_0_0.invites.base
local l_0_6 = l_0_0.invites.team
local l_0_7 = Game.module.alliance.data
local l_0_8 = Game.module.data
l_0_6.init = function(l_1_0)
  if l_1_0.__init then
    return 
  end
  l_0_5.init(l_1_0)
  l_1_0.relation_source = l_0_4.relation_source.team_invite
end

l_0_6.get_bg = function(l_2_0)
  return "UI/BigPic/team_bg_zudui.ab"
end

l_0_6.get_title = function(l_3_0)
  return "\233\130\128<size=60>\232\175\183</size>"
end

l_0_6.is_btn_zhaoji_active = function(l_4_0, l_4_1)
  return true
end

l_0_6.is_wechat_share_active = function(l_5_0, l_5_1)
  if l_5_1 ~= l_0_4.relation_type.online then
    return 
  end
  local l_5_2 = l_0_3.is_show_wechat_share
  return l_5_2()
end

l_0_6.get_alliance_addition = function(l_6_0, l_6_1)
  if l_6_1 ~= l_0_4.relation_type.alliance then
    return 
  end
  local l_6_2, l_6_3 = l_0_7.get_daily_extra_contribution_info()
  return string.format("\229\144\140\229\133\172\228\188\154\231\187\132\233\152\159\229\138\160\230\136\144:<color=#339A3A>%d</color><color=#404040>/%d</color>", l_6_2, l_6_3)
end

l_0_6.on_click_tab = function(l_7_0, l_7_1)
  if l_7_1 == 1 then
    local l_7_2 = l_0_4.relation_type.online
  elseif l_7_1 == 2 then
    do return end
  end
   -- DECOMPILER ERROR: Overwrote pending register.

  if l_7_1 == 3 then
    local l_7_3, l_7_4, l_7_5, l_7_6, l_7_7 = l_0_4.relation_type.friend
  elseif l_7_1 ~= 4 or not l_0_4.relation_type.recent then
    return 
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_7_0:get_relation(l_0_4.relation_type.recent)
   -- DECOMPILER ERROR: Confused about usage of registers!

  return l_0_4.relation_type.recent
end

l_0_6.get_tab_config = function(l_8_0)
  do
    local l_8_1 = {}
     -- DECOMPILER ERROR: No list found. Setlist fails

    return l_8_1
  end
   -- Warning: undefined locals caused missing assignments!
end

l_0_6.get_role_score = function(l_9_0, l_9_1)
  local l_9_2 = l_0_3.get_team_type_target_args()
  local l_9_3 = l_0_8.raw_get_player_info(l_9_1.role_id)
  if not l_9_3 or not l_9_3.season_rank or not l_9_3.season_rank.cup then
    return l_9_2 ~= l_0_4.target_main_type.pvp or 0
    do return end
  end
  return l_9_3 and l_9_3.power or 0
end

l_0_6.get_role_score_icon = function(l_10_0, l_10_1)
  if l_0_3.get_team_type_target_args() == l_0_4.target_main_type.pvp then
    return "Common", "common_icon_pingfen"
  else
    return "Icon/Rank", "cup_256"
  end
end

l_0_6.get_title_desc = function(l_11_0)
  return "\230\157\175\230\149\176"
end

return l_0_6

