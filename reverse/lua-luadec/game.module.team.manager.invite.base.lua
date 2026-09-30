-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.invite.base_-160198768679745823.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.invites.base
local l_0_2 = Game.module.team
local l_0_3 = assert(l_0_2.network)
local l_0_4 = assert(l_0_2.data)
local l_0_5 = assert(l_0_2.const)
local l_0_6 = Game.module.open_func
local l_0_7 = l_0_6.const
local l_0_8 = DataConfigs.team_target
local l_0_9 = Game.module.data
local l_0_10 = Game.server_time
local l_0_11 = Game.events
local l_0_12 = 20
l_0_1.init = function(l_1_0)
  if l_1_0.__init then
    return 
  end
  l_1_0.relation_source = l_0_5.relation_source.normal
  l_1_0.relation_req_next_valid_time = {}
  l_1_0.next_invite_all_time = 0
  l_1_0:setup_events()
  l_1_0.__init = true
end

local l_0_13 = {}
 -- DECOMPILER ERROR: No list found. Setlist fails

 -- DECOMPILER ERROR: Overwrote pending register.

l_0_1.get_events = "team_get_relation_role"
l_0_1.setup_events = function(l_3_0)
  if l_3_0.__has_setup_events then
    return 
  end
  l_3_0.__has_setup_events = true
  local l_3_1 = l_3_0:get_events()
  if not next(l_3_1) then
    return 
  end
  for l_3_5,l_3_6 in ipairs(l_3_1) do
    local l_3_7 = l_3_0[string.format("on_%s", l_3_6)]
    if l_3_7 then
      l_0_11.add_listener(l_3_6, l_3_7, l_3_0)
    end
  end
end

l_0_1.clear_events = function(l_4_0)
  if not l_4_0.__has_setup_events then
    return 
  end
  l_4_0.__has_setup_events = false
  local l_4_1 = l_4_0:get_events()
  if not next(l_4_1) then
    return 
  end
  for l_4_5,l_4_6 in ipairs(l_4_1) do
    local l_4_7 = l_4_0[string.format("on_%s", l_4_6)]
    if l_4_7 then
      l_0_11.remove_listener(l_4_6, l_4_7, l_4_0)
    end
  end
end

l_0_1.get_bg = function(l_5_0)
  return "UI/BigPic/team_bg_zudui.ab"
end

l_0_1.get_title = function(l_6_0)
  return "\231\187\132<size=60>\233\152\159</size>"
end

l_0_1.get_title_desc = function(l_7_0)
  return "\230\136\152\229\138\155"
end

l_0_1.invite_all = function(l_8_0, l_8_1)
  local l_8_2 = l_0_10.get_server_time()
  if l_8_2 < l_8_0.next_invite_all_time then
    BroadcastTips.broadcast_tips(string.format("\229\137\169\228\189\153%sscd", l_8_0.next_invite_all_time - l_8_2))
    return 
  end
  l_8_0.next_invite_all_time = l_8_2 + 10
  if not l_8_1 or not next(l_8_1) then
    return 
  end
  for l_8_6,l_8_7 in ipairs(l_8_1) do
    l_8_0:invite_role(l_8_7, true)
  end
end

l_0_1.invite_role = function(l_9_0, l_9_1, l_9_2)
  if not l_9_1 then
    return 
  end
  local l_9_3 = l_9_1.role_id
  local l_9_4 = l_0_9.is_role_cross_func_open(l_9_3, l_0_7.type.team)
  if not l_9_4 and not l_9_2 then
    BroadcastTips.broadcast_tips("\229\175\185\230\150\185\229\176\154\230\156\170\229\188\128\229\144\175\231\187\132\233\152\159\229\138\159\232\131\189")
  end
  return 
  local l_9_5 = l_0_9.is_role_cross_func_open(l_9_3, l_0_7.type.team)
  if not l_9_5 and not l_9_2 then
    BroadcastTips.broadcast_tips("\229\188\128\229\144\175\231\187\132\233\152\159\229\138\159\232\131\189\229\144\142\230\137\141\232\131\189\233\130\128\232\175\183")
  end
  return 
  local l_9_6 = l_0_4.get_send_invite_cd(l_9_3)
  if l_9_6 > 0 then
    if not l_9_2 then
      BroadcastTips.broadcast_tips("\232\175\183\230\177\130\232\191\135\228\186\142\233\162\145\231\185\129")
    end
    return 
  end
  local l_9_7, l_9_8, l_9_9 = l_0_4.get_team_type_target_args()
  local l_9_10, l_9_11 = l_0_4.get_can_invite_role(l_9_7, l_9_8, l_9_9, l_9_1, l_9_3)
  if not l_9_10 and not l_9_2 then
    BroadcastTips.broadcast_tips(l_9_11)
  end
  return 
  l_0_3.team_invite_c2s(l_9_3)
end

l_0_1.get_invite_all_cd = function(l_10_0)
  return l_10_0.next_invite_all_time - l_0_10.get_server_time()
end

l_0_1.is_btn_invite_all_active = function(l_11_0, l_11_1)
  return l_11_1 ~= l_0_5.relation_type.online
end

l_0_1.is_btn_zhaoji_active = function(l_12_0, l_12_1)
  return false
end

l_0_1.is_wechat_share_active = function(l_13_0)
  return false
end

l_0_1.get_active_objs = function(l_14_0)
end

l_0_1.get_inactive_objs = function(l_15_0)
end

l_0_1.get_role_score = function(l_16_0, l_16_1)
  local l_16_2 = l_0_9.raw_get_player_info(l_16_1.role_id)
  return l_16_2 and l_16_2.season_rank and l_16_2.season_rank.cup or 0
end

l_0_1.get_role_score_icon = function(l_17_0, l_17_1)
end

l_0_1.get_role_status = function(l_18_0, l_18_1)
  return l_18_1.status
end

l_0_1.get_role_invite_status = function(l_19_0, l_19_1)
  local l_19_2, l_19_3 = l_0_4.get_can_invite_role(nil, nil, nil, l_19_1, l_19_1.role_id)
  return l_19_2, l_19_3
end

l_0_1.get_role_invite_cd = function(l_20_0, l_20_1)
  local l_20_2 = l_0_4.get_send_invite_cd
  local l_20_3 = l_20_1.role_id
  return l_20_2(l_20_3)
end

l_0_1.get_alliance_addition = function(l_21_0, l_21_1)
end

l_0_1.get_tab_config = function(l_22_0)
  do
    local l_22_1 = {}
     -- DECOMPILER ERROR: No list found. Setlist fails

    return l_22_1
  end
   -- Warning: undefined locals caused missing assignments!
end

l_0_1.on_click_tab = function(l_23_0, l_23_1)
  if l_23_1 == 1 then
    local l_23_2 = l_0_5.relation_type.friend
  elseif l_23_1 == 2 then
    do return end
  end
   -- DECOMPILER ERROR: Overwrote pending register.

  if l_23_1 == 3 then
    local l_23_3, l_23_4, l_23_5 = l_0_5.relation_type.alliance
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_23_3 then
    return 
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_23_0:get_relation(l_23_3)
   -- DECOMPILER ERROR: Confused about usage of registers!

  return l_23_3
end

l_0_1.get_relation = function(l_24_0, l_24_1)
  local l_24_2 = l_24_0:get_relation_show_info(l_24_1)
  if l_24_0:is_invite_cd(l_24_1) and l_24_2 then
    l_0_11.brocast("team_update_relation_role", l_24_2)
    return 
  end
  if l_24_2 then
    l_24_0:set_invite_next_valid_time(l_24_1)
  end
  l_0_3.role_list_c2s(l_24_1, l_24_0.relation_source)
end

l_0_1.get_relation_show_info = function(l_25_0, l_25_1)
  local l_25_2 = l_0_4.get_relation_role(l_25_1, true)
  local l_25_3 = {}
  if not l_25_2 or #l_25_2 < 1 then
    return l_25_3
  end
  if l_25_1 == l_0_5.relation_type.online then
    for l_25_7 = 1, l_0_12 do
      if #l_25_2 == 0 then
        do return end
      end
      local l_25_8 = math.random(1, #l_25_2)
      table.insert(l_25_3, l_25_2[l_25_8])
      table.remove(l_25_2, l_25_8)
    end
    return l_25_3
  else
    return l_25_2
  end
end

l_0_1.set_invite_next_valid_time = function(l_26_0, l_26_1)
  l_26_0.relation_req_next_valid_time[l_26_1] = l_0_10.get_server_time() + 10
end

l_0_1.get_invite_cd = function(l_27_0, l_27_1)
  if l_27_0.relation_req_next_valid_time[l_27_1] then
    return l_27_0.relation_req_next_valid_time[l_27_1] - l_0_10.get_server_time()
  end
  return 0
end

l_0_1.is_invite_cd = function(l_28_0, l_28_1)
  local l_28_2 = l_28_0:get_invite_cd(l_28_1)
  return l_28_2 > 0
end

l_0_1.get_role_invite_cd = function(l_29_0, l_29_1)
  if l_0_4.send_invite_cd[l_29_1.role_id] then
    return l_0_4.send_invite_cd[l_29_1.role_id] - l_0_10.get_server_time()
  end
  return 0
end

l_0_1.on_team_get_relation_role = function(l_30_0, l_30_1, l_30_2, l_30_3)
  if l_30_2 ~= l_30_0.relation_source then
    return 
  end
  local l_30_4 = l_30_0:get_relation_show_info(l_30_3)
  l_0_11.brocast("team_update_relation_role", l_30_4)
end

l_0_1.destroy = function(l_31_0)
  l_31_0:clear_events()
end

return l_0_1

