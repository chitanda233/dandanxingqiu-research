-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.invite.nat_champion_fight_7605602232777236060.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.invites.base
local l_0_2 = l_0_0.invites.nat_champion_fight
local l_0_3 = Game.module.team
local l_0_4 = l_0_3.network
local l_0_5 = l_0_3.data
local l_0_6 = l_0_3.const
local l_0_7 = Game.module.friend.const
local l_0_8 = Game.module.nat_champ
local l_0_9 = l_0_8.data
local l_0_10 = l_0_8.network
local l_0_11 = Game.events
local l_0_12 = Game.module.data
local l_0_13 = Game.server_time
l_0_2.init = function(l_1_0)
  if l_1_0.__init then
    return 
  end
  l_0_1.init(l_1_0)
  l_1_0.next_invite_time = {}
  l_1_0.relation_source = l_0_6.relation_source.nat_champ_team_invite_fight
end

l_0_2.get_bg = function(l_2_0)
  return "UI/BigPic/team_bg_zudui3.ab"
end

l_0_2.on_click_tab = function(l_3_0)
  local l_3_1 = l_0_6.relation_type.nat_champ_match
  l_3_0:get_relation(l_3_1)
  return l_3_1
end

l_0_2.invite_role = function(l_4_0, l_4_1)
  local l_4_2 = l_0_13.get_server_time()
  local l_4_3 = l_4_0.next_invite_time
  local l_4_4 = l_4_1.role_id
  l_4_3[l_4_4] = l_4_2 + 10
  l_4_3 = l_0_1
  l_4_3 = l_4_3.invite_role
  l_4_4 = l_4_0
  l_4_3(l_4_4, l_4_1)
end

l_0_2.get_role_invite_cd = function(l_5_0, l_5_1)
  local l_5_2 = l_0_13.get_server_time()
  local l_5_3 = l_5_0.next_invite_time[l_5_1.role_id]
  if l_5_3 then
    return l_5_3 - l_5_2
  end
  return 0
end

l_0_1.get_title_desc = function(l_6_0)
  return "\231\167\175\229\136\134"
end

l_0_2.get_tab_config = function(l_7_0)
  do
    local l_7_1 = {}
     -- DECOMPILER ERROR: No list found. Setlist fails

    return l_7_1
  end
   -- Warning: undefined locals caused missing assignments!
end

l_0_2.get_role_status = function(l_8_0, l_8_1)
  if l_8_1.status ~= l_0_7.role_status.offline then
    return l_0_7.role_status.online
  end
end

l_0_2.get_role_invite_status = function(l_9_0, l_9_1)
  return true
end

l_0_2.get_role_score = function(l_10_0, l_10_1)
  local l_10_2 = l_0_12.raw_get_player_info(l_10_1.role_id)
  return l_10_2 and l_10_2.season_max_rank or 0
end

l_0_2.get_relation_show_info = function(l_11_0, l_11_1)
  local l_11_2 = l_0_5.get_relation_role(l_11_1)
  if not l_11_2 then
    return 
  end
  local l_11_3 = {}
  for l_11_7,l_11_8 in ipairs(l_11_2) do
    if l_0_8.check_is_can_show_invite_nat_champ_fight_role(l_11_8) then
      table.insert(l_11_3, l_11_8)
    end
  end
  return l_11_3
end

l_0_2.invite_role = function(l_12_0, l_12_1)
  if not l_12_1 or l_12_1.role_id == nil then
    return 
  end
  local l_12_2 = l_0_13.get_server_time()
  local l_12_3 = l_12_0.next_invite_time
  local l_12_4 = l_12_1.role_id
  l_12_3[l_12_4] = l_12_2 + 10
  l_12_3 = l_0_9
  l_12_3 = l_12_3.is_knockout_fighting_stage
  l_12_3 = l_12_3()
  if not l_12_3 then
    l_12_3 = l_0_9
    l_12_3 = l_12_3.is_finals_fighting_stage
    l_12_3 = l_12_3()
  if l_12_3 then
    end
    l_12_3 = l_0_10
    l_12_3 = l_12_3.req_national_match_invite_battle_ready_c2s
    l_12_4 = l_12_1.role_id
    l_12_3(l_12_4)
  else
    l_12_3 = l_0_4
    l_12_3 = l_12_3.team_invite_c2s
    l_12_4 = l_12_1.role_id
    l_12_3(l_12_4)
  end
end

l_0_2.get_role_invite_cd = function(l_13_0, l_13_1)
  local l_13_2 = l_0_13.get_server_time()
  local l_13_3 = l_13_0.next_invite_time[l_13_1.role_id]
  if l_13_3 then
    return l_13_3 - l_13_2
  end
  return 0
end

l_0_2.get_role_score_icon = function(l_14_0, l_14_1)
  return "Icon/Rank", "cup_256"
end

return l_0_2

