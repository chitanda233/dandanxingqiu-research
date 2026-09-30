-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua6_573512\game.module.season.manager.actions_-1500853916411865609.bin 

local l_0_0 = BroadcastTips
local l_0_1 = GameFunctions
local l_0_2 = DataConfigs
local l_0_3 = l_0_2.team_target
local l_0_4 = require("game.ui.manager.ui_manager.init")
local l_0_5 = Game.module.data
local l_0_6 = Game.module.team
local l_0_7 = Game.module.dungeon_team
local l_0_8 = Game.module.open_func
local l_0_9 = Game.module.season
local l_0_10 = import(".head")
local l_0_11 = {}
local l_0_12 = {}
local l_0_13 = {}
l_0_13.func = "check_in_season"
local l_0_14 = {}
l_0_14.func = "check_room_free"
local l_0_15 = {}
l_0_15.func = "check_open_func_ok"
local l_0_16 = {}
l_0_16.func = "check_join_full"
local l_0_17 = {}
l_0_17.func = "check_dig_full"
local l_0_18 = {}
l_0_18.func = "check_reward_ok"
local l_0_19 = {}
l_0_19.func = "check_lvl_ok"
local l_0_20 = {}
l_0_20.func = "check_pve"
local l_0_21 = {}
l_0_21.func = "check_can_match"
local l_0_22 = {}
l_0_22.func = "check_all_ready"
local l_0_23 = {}
l_0_23.func = "check_rank_limit"
local l_0_24 = {}
l_0_24.func = "check_dungeon_power"
local l_0_25 = {}
l_0_25.func = "check_show_skill_pop"
local l_0_26 = {}
l_0_26.func = "check_room_start_action"
 -- DECOMPILER ERROR: No list found. Setlist fails

l_0_14 = {func = "check_in_season"}
l_0_15 = {func = "check_room_free"}
l_0_16 = {func = "check_open_func_ok"}
l_0_17 = {func = "check_join_full"}
l_0_18 = {func = "check_dig_full"}
l_0_19 = {func = "check_reward_ok"}
l_0_20 = {func = "check_lvl_ok"}
l_0_21 = {func = "check_pve"}
l_0_22 = {func = "check_can_match"}
l_0_23 = {func = "check_all_ready"}
l_0_24 = {func = "check_rank_limit"}
l_0_25 = {func = "check_dungeon_power"}
l_0_26 = {func = "check_pve_tower"}
local l_0_27 = {}
l_0_27.func = "room_start"
l_0_13 = {l_0_14, l_0_15, l_0_16, l_0_17, l_0_18, l_0_19, l_0_20, l_0_21, l_0_22, l_0_23, l_0_24, l_0_25, l_0_26, l_0_27}
l_0_15 = {func = "check_in_season"}
l_0_16 = {func = "check_open_func_ok"}
l_0_17 = {func = "check_join_full"}
l_0_18 = {func = "check_lvl_ok"}
l_0_19 = {func = "check_dungeon_power"}
l_0_20 = {func = "check_show_skill_pop"}
l_0_21 = {func = "check_room_ready_action"}
l_0_14 = {l_0_15, l_0_16, l_0_17, l_0_18, l_0_19, l_0_20, l_0_21}
l_0_16 = {func = "check_in_season"}
l_0_17 = {func = "check_open_func_ok"}
l_0_18 = {func = "check_join_full"}
l_0_19 = {func = "check_lvl_ok"}
l_0_20 = {func = "check_dungeon_power"}
l_0_21 = {func = "room_ready"}
l_0_15 = {l_0_16, l_0_17, l_0_18, l_0_19, l_0_20, l_0_21}
l_0_17 = {func = "check_in_season"}
l_0_18 = {func = "check_open_room_reward_ok"}
l_0_19 = {func = "check_create_room_lvl_ok"}
l_0_20 = {func = "open_room"}
l_0_16 = {l_0_17, l_0_18, l_0_19, l_0_20}
l_0_17 = true
l_0_19 = {func = "check_room_free"}
l_0_20 = {func = "check_open_func_ok"}
l_0_21 = {func = "check_join_full"}
l_0_22 = {func = "check_dig_full"}
l_0_23 = {func = "check_reward_ok"}
l_0_24 = {func = "check_all_ready"}
l_0_25 = {func = "check_can_match"}
l_0_26 = {func = "check_lvl_ok"}
l_0_27 = {func = "check_rank_limit"}
local l_0_28 = {}
l_0_28.func = "btn_is_not_gray"
l_0_18 = {l_0_19, l_0_20, l_0_21, l_0_22, l_0_23, l_0_24, l_0_25, l_0_26, l_0_27, l_0_28}
l_0_19 = true
l_0_21 = {func = "check_team_open_func"}
l_0_22 = {func = "check_open_func_ok"}
l_0_23 = {func = "check_self_join_full"}
l_0_24 = {func = "check_dig_full"}
l_0_25 = {func = "check_reward_ok"}
l_0_26 = {func = "check_max_count"}
l_0_27 = {func = "check_lvl_ok"}
l_0_28 = {func = "check_rank_limit"}
local l_0_29 = {}
l_0_29.func = "check_pve"
local l_0_30 = {}
l_0_30.func = "check_pve_tower"
local l_0_31 = {}
l_0_31.func = "recruit_btn_is_not_gray"
l_0_20 = {l_0_21, l_0_22, l_0_23, l_0_24, l_0_25, l_0_26, l_0_27, l_0_28, l_0_29, l_0_30, l_0_31}
l_0_22 = {func = "check_team_open_func"}
l_0_23 = {func = "check_open_func_ok"}
l_0_24 = {func = "check_self_join_full"}
l_0_25 = {func = "check_dig_full"}
l_0_26 = {func = "check_reward_ok"}
l_0_27 = {func = "check_max_count"}
l_0_28 = {func = "check_lvl_ok"}
l_0_29 = {func = "check_rank_limit"}
l_0_30 = {func = "check_pve"}
l_0_31 = {func = "check_pve_tower"}
local l_0_32 = {}
l_0_32.func = "on_click_recruit"
l_0_21 = {l_0_22, l_0_23, l_0_24, l_0_25, l_0_26, l_0_27, l_0_28, l_0_29, l_0_30, l_0_31, l_0_32}
l_0_23 = {func = "check_team_open_func"}
l_0_24 = {func = "check_open_func_ok"}
l_0_25 = {func = "check_self_join_full"}
l_0_26 = {func = "check_dig_full"}
l_0_27 = {func = "check_reward_ok"}
l_0_28 = {func = "check_max_count"}
l_0_29 = {func = "check_lvl_ok"}
l_0_30 = {func = "check_rank_limit"}
l_0_31 = {func = "check_pve"}
l_0_32 = {func = "on_recruit"}
l_0_22 = {l_0_23, l_0_24, l_0_25, l_0_26, l_0_27, l_0_28, l_0_29, l_0_30, l_0_31, l_0_32}
l_0_23 = function()
  local l_1_0 = {}
  l_1_0.dungeon_id = dungeon_id
  l_0_1.run_actions(l_0_11, l_0_12, l_1_0)
end

l_0_10.do_legend_fight_room_start_action = l_0_23
l_0_23 = function(l_2_0)
  local l_2_1 = {}
  l_2_1.dungeon_id = l_2_0
  l_0_1.run_actions(l_0_11, l_0_13, l_2_1)
end

l_0_10.do_room_start_action = l_0_23
l_0_23 = function(l_3_0)
  local l_3_1 = {}
  l_3_1.dungeon_id = l_3_0
  l_0_1.run_actions(l_0_11, l_0_15, l_3_1)
end

l_0_10.do_room_ready_action = l_0_23
l_0_23 = function()
  local l_4_0 = {}
  l_4_0.dungeon_id = dungeon_id
  l_0_1.run_actions(l_0_11, l_0_14, l_4_0)
end

l_0_10.do_legend_fight_ready_action = l_0_23
l_0_23 = function(l_5_0, l_5_1, l_5_2, l_5_3, l_5_4)
  local l_5_5 = {}
  l_5_5.type = l_5_0
  l_5_5.target = l_5_1
  l_5_5.args = l_5_2
  l_5_5.condition = l_5_3
  l_5_5.options = l_5_4
  l_0_1.run_actions(l_0_11, l_0_16, l_5_5)
end

l_0_10.do_open_room_action = l_0_23
l_0_23 = function(l_6_0, l_6_1, l_6_2, l_6_3)
  local l_6_4 = l_0_6.data.get_team_info()
  if l_6_4 and l_6_4.status == l_0_6.const.team_status.recruiting then
    local l_6_5 = {}
    l_6_5.need_rerecruit = l_6_3
    l_0_11.on_click_recruit(nil, l_6_5)
  else
    local l_6_6 = {}
    l_6_6.type = l_6_0
    l_6_6.target = l_6_1
    l_6_6.args = l_6_2
    l_0_1.run_actions(l_0_11, l_0_21, l_6_6)
  end
  return l_0_19
end

l_0_10.do_click_recruit_action = l_0_23
l_0_23 = function(l_7_0, l_7_1, l_7_2, l_7_3, l_7_4)
  local l_7_5 = {}
  l_7_5.type = l_7_0
  l_7_5.target = l_7_1
  l_7_5.args = l_7_2
  l_7_5.is_silent = l_7_3
  l_7_5.not_open_recruit = l_7_4
  l_0_1.run_actions(l_0_11, l_0_22, l_7_5)
  return l_0_19
end

l_0_10.do_change_recruit_action = l_0_23
l_0_23 = function()
  l_0_17 = true
  local l_8_0 = {}
  l_8_0.is_silent = true
  l_0_1.run_actions(l_0_11, l_0_18, l_8_0)
  return l_0_17
end

l_0_10.do_check_btn_gray = l_0_23
l_0_23 = function(l_9_0, l_9_1, l_9_2)
  l_0_19 = true
  local l_9_3 = l_0_6.data.get_team_info()
  local l_9_4 = {}
  l_9_4.is_silent = true
  l_9_4.type = l_9_0
  l_9_4.target = l_9_1
  l_9_4.args = l_9_2
  l_0_1.run_actions(l_0_11, l_0_20, l_9_4)
  return l_0_19
end

l_0_10.do_check_recruit_btn_gray = l_0_23
l_0_23 = function()
  l_0_10.do_room_start_action()
end

l_0_11.check_room_start_action = l_0_23
l_0_23 = function()
  l_0_10.do_room_ready_action()
end

l_0_11.check_room_ready_action = l_0_23
l_0_23 = function(l_12_0, l_12_1, l_12_2)
  l_12_2(true)
end

l_0_11.check_show_skill_pop = l_0_23
l_0_23 = function(l_13_0, l_13_1, l_13_2)
  if l_0_8.is_open(l_0_8.const.type.team) then
    l_13_2(true)
  elseif not l_13_1.is_silent then
    l_0_0.broadcast_tips(l_0_8.get_no_open_tips(l_0_8.const.type.team))
  end
end

l_0_11.check_team_open_func = l_0_23
l_0_23 = function(l_14_0, l_14_1, l_14_2)
  local l_14_3 = l_0_6.data.get_team_info()
   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

  end
  local l_14_5 = l_14_3.target
   -- DECOMPILER ERROR: Confused at declaration of local variable

  if l_14_3 and l_14_3.type == l_0_6.const.target_main_type.pve_tower then
    if Game.module.dungeon_tower_team.get_max_can_fight() + 1 == l_14_5 then
      l_14_2(true)
    elseif not l_14_1.is_silent then
      if Game.module.dungeon_tower_team.get_max_can_fight() < l_14_5 then
        l_0_0.broadcast_tips("\232\175\165\229\177\130\229\176\154\230\156\170\232\167\163\233\148\129")
      else
        l_0_0.broadcast_tips("\229\183\178\233\162\134\229\143\150\232\191\135\232\175\165\229\177\130\229\165\150\229\138\177\239\188\140\230\151\160\230\179\149\228\189\156\228\184\186\233\152\159\233\149\191\229\184\166\233\152\159\232\191\155\229\133\165\229\137\175\230\156\172")
      end
    else
      l_14_2(true)
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
end
end

l_0_11.check_pve_tower = l_0_23
l_0_23 = function(l_15_0, l_15_1, l_15_2)
   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    if not l_15_1.type and (not l_0_6.data.get_team_info() or not l_0_6.data.get_team_info().type) then
      return 
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_0_6.data.get_team_info().type == l_0_6.const.target_main_type.pvp and l_0_10.is_season_ended() then
    l_0_0.broadcast_tips("\232\175\183\231\173\137\229\190\133\230\150\176\232\181\155\229\173\163\229\188\128\229\167\139")
    return 
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_15_2(true)
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_11.check_in_season = l_0_23
l_0_23 = function(l_16_0, l_16_1, l_16_2)
  if l_0_6.data.is_team_captain() and not l_0_6.data.is_members_all_ready() and not l_16_1.is_silent then
    l_0_0.broadcast_tips("\230\156\137\233\152\159\229\145\152\230\156\170\229\135\134\229\164\135")
  end
  return 
  l_16_2(true)
end

l_0_11.check_all_ready = l_0_23
l_0_23 = function(l_17_0, l_17_1, l_17_2)
  if l_0_6.data.is_team_captain() and not l_0_6.data.is_satisfy_limit(nil, nil, not l_17_1.is_silent) then
    return 
  end
  l_17_2(true)
end

l_0_11.check_can_match = l_0_23
l_0_23 = function(l_18_0, l_18_1, l_18_2)
  local l_18_3 = l_0_6.data.get_team_info()
  if l_18_3 then
    local l_18_4 = l_0_10.get_season_type_by_team()
    if l_0_10.check_member_join_full(l_0_10.data.get_player_info(l_18_4).day_fight_num, nil, l_18_1) then
      if not l_18_1.is_silent then
        l_0_0.broadcast_tips(string.format("\230\130\168\229\183\178\229\143\130\228\184\142%d\229\156\186\239\188\140\229\174\140\230\136\144\228\186\134\230\156\172\230\172\1613V3\230\142\146\228\189\141\232\181\155\231\154\132\230\137\128\230\156\137\230\175\148\232\181\155\239\188\140\232\175\183\228\184\139\230\172\161\231\187\167\231\187\173\229\143\130\229\138\160", l_0_10.data.get_player_info(l_18_4).day_fight_num))
      end
      return 
    else
      if l_0_6.data.is_team_captain() and l_0_10.check_team_join_full(not l_18_1.is_silent, l_18_1) then
        return 
      end
    end
    l_18_2(true)
  end
end

l_0_11.check_join_full = l_0_23
l_0_23 = function(l_19_0, l_19_1, l_19_2)
  local l_19_3 = l_0_6.data.get_team_info()
  if l_19_3 then
    local l_19_4 = l_0_10.get_season_type_by_team()
    if l_0_10.check_member_join_full(l_0_10.data.get_player_info(l_19_4).day_fight_num, nil, l_19_1) and not l_19_1.is_silent then
      l_0_0.broadcast_tips(string.format("\230\130\168\229\183\178\229\143\130\228\184\142%d\229\156\186\239\188\140\229\174\140\230\136\144\228\186\134\230\156\172\230\172\1613V3\230\142\146\228\189\141\232\181\155\231\154\132\230\137\128\230\156\137\230\175\148\232\181\155\239\188\140\232\175\183\228\184\139\230\172\161\231\187\167\231\187\173\229\143\130\229\138\160", l_0_10.data.get_player_info(l_19_4).day_fight_num))
    end
    return 
    l_19_2(true)
  end
end

l_0_11.check_self_join_full = l_0_23
l_0_23 = function(l_20_0, l_20_1, l_20_2)
  local l_20_3 = l_0_6.data.get_team_info()
  if l_20_3 then
    l_20_2(true)
  end
end

l_0_11.check_dig_full = l_0_23
l_0_23 = function(l_21_0, l_21_1, l_21_2)
  local l_21_3 = l_0_6.data.get_team_info()
  if l_21_3 and not l_0_10.check_member_open_func_limit(l_0_5.get_player_id(), not l_21_1.is_silent, l_21_1) then
    l_21_2(true)
  end
end

l_0_11.check_open_func_ok = l_0_23
l_0_23 = function(l_22_0, l_22_1, l_22_2)
  local l_22_3 = l_0_6.data.get_team_info()
  if l_22_3 then
    local l_22_4 = false
    local l_22_5, l_22_6, l_22_7 = nil, nil, nil
    if l_22_1 then
      l_22_5, l_22_6, l_22_7 = l_22_1.target, l_22_1.type, l_22_1.args
    else
      l_22_5, l_22_6, l_22_7 = l_22_3.target, l_22_3.type, l_22_3.args
    end
    local l_22_8 = l_0_6.data.get_team_target_name(l_22_6, l_22_5, l_22_7)
    for l_22_12,l_22_13 in ipairs(l_22_3.members) do
      if l_22_13.role_base.role_id == l_0_5.get_player_id() and l_0_9.check_member_lvl_limit(l_22_13.role_base.level, not l_22_1.is_silent, l_22_1) then
        l_22_4 = true
        for l_22_12,l_22_13 in l_22_9 do
          local l_22_14, l_22_15 = l_0_9.check_member_lvl_limit(l_22_13.role_base.level, false, l_22_1)
          if l_22_14 and not l_22_1.is_silent then
            if l_22_15 == l_0_6.const.limit_type.level then
              BroadcastTips.broadcast_tips("\230\156\137\233\152\159\229\145\152\231\173\137\231\186\167\228\184\141\232\182\179")
            else
              if l_22_15 == l_0_6.const.limit_type.server_day then
                BroadcastTips.broadcast_tips("\230\156\137\233\152\159\229\145\152\229\176\154\230\156\170\229\188\128\229\144\175\231\142\169\230\179\149")
              else
                if l_22_15 == l_0_6.const.limit_type.power then
                  BroadcastTips.broadcast_tips("\230\156\137\233\152\159\229\145\152\230\136\152\229\138\155\228\184\141\232\182\179")
                end
              end
            end
            l_22_14 = true
          end
        end
        if not l_22_4 then
          l_22_2(true)
        end
      end
       -- Warning: missing end command somewhere! Added here
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_11.check_lvl_ok = l_0_23
l_0_23 = function(l_23_0, l_23_1, l_23_2)
  local l_23_3 = l_23_1.type
  local l_23_4 = l_23_1.target
  local l_23_5 = l_23_1.args
  local l_23_6 = l_0_6.data.get_team_info()
   -- DECOMPILER ERROR: Confused at declaration of local variable

  if not l_23_3 or not l_23_4 then
    if l_23_6 then
      local l_23_8 = l_23_6.type
    if l_23_6 then
      end
    end
    if l_23_6 then
      l_23_4, l_23_5 = l_23_6.target, l_23_6.args
    end
    l_23_3 = l_23_8
    if not l_23_3 or not l_23_4 then
      return 
    end
  end
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Overwrote pending register.

    if l_0_6.data.is_team_target_valid(l_23_3, l_23_4) then
      if l_23_3 == l_0_6.const.target_main_type.pve then
        l_23_2(true)
       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

      else
        if not l_0_6.data.is_team_captain() or l_23_3 ~= l_0_6.const.target_main_type.pve or nil and nil > 0 and l_0_7.check_common_award(nil, l_23_1.is_silent) then
          l_23_2(true)
        end
         -- DECOMPILER ERROR: Confused about usage of registers for local variables.

      end
    end
  end
end

l_0_11.check_reward_ok = l_0_23
l_0_23 = function(l_24_0, l_24_1, l_24_2)
  l_24_2(true)
end

l_0_11.check_open_room_reward_ok = l_0_23
l_0_23 = function(l_25_0, l_25_1, l_25_2)
  local l_25_3 = l_0_6.data.get_team_info()
  if l_25_3 and l_25_3.is_room == 1 then
    l_25_2(true)
    return 
  end
  local l_25_4 = l_25_1.type
  local l_25_5 = l_25_1.target
  do
    local l_25_6 = l_25_1.args
     -- DECOMPILER ERROR: Confused at declaration of local variable

    if not l_25_4 or not l_25_5 then
      if l_25_3 then
        local l_25_8 = l_25_3.type
      if l_25_3 then
        end
      end
      if l_25_3 then
        l_25_5, l_25_6 = l_25_3.target, l_25_3.args
      end
      l_25_4 = l_25_8
      if not l_25_4 or not l_25_5 then
        return 
      end
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_25_4 == l_0_6.const.target_main_type.pve and l_25_6 and l_25_6 > 0 and not l_0_7.check_can_fight(l_25_6) then
      return 
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_25_4 == l_0_6.const.target_main_type.hero_pve and l_25_6 and l_25_6 > 0 and not l_0_7.check_can_fight(l_25_6) then
      return 
    end
    l_25_2(true)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_11.check_create_room_lvl_ok = l_0_23
l_0_23 = function(l_26_0, l_26_1, l_26_2)
  local l_26_3 = l_0_6.data.get_team_info()
  if not l_26_3 or not l_26_3.type or not l_26_1.args then
    l_26_2(true)
    return 
  end
  local l_26_4 = l_0_3.get_cfg_by_type_target(l_26_3.type, l_26_3.target)
  if l_26_3.type == l_0_6.const.target_main_type.pve and l_0_7.check_power(l_26_1.args, l_26_2) then
    l_26_2(true)
    do return end
    if l_26_3.type == l_0_6.const.target_main_type.dig_star then
      local l_26_5 = Game.module.dig_star
      if l_26_5.check_power(l_26_4.dungeon, l_26_2) then
        l_26_2(true)
      else
        l_26_2(true)
      end
    end
  end
end

l_0_11.check_dungeon_power = l_0_23
l_0_23 = function(l_27_0, l_27_1, l_27_2)
  l_27_2(true)
end

l_0_11.check_rank_limit = l_0_23
l_0_23 = function(l_28_0, l_28_1, l_28_2)
  local l_28_3 = l_0_6.data.get_team_info()
  if not l_28_3 or l_28_3.type == l_0_6.const.target_main_type.free then
    if not l_28_1.is_silent then
      l_0_0.broadcast_tips("\232\175\183\233\128\137\230\139\169\233\152\159\228\188\141\231\155\174\230\160\135")
    end
    return 
  end
  l_28_2(true)
end

l_0_11.check_room_free = l_0_23
l_0_23 = function(l_29_0, l_29_1, l_29_2)
  local l_29_3 = l_0_6.data.get_team_info()
  local l_29_4 = l_29_1.type
  local l_29_5 = l_29_1.target
   -- DECOMPILER ERROR: Confused at declaration of local variable

  if not l_29_4 or not l_29_5 then
    if not l_29_3 or l_29_3 then
      l_29_4, l_29_5 = l_29_3.type, l_29_3.target
    end
    if not l_29_4 or not l_29_5 then
      return 
    end
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    if l_0_6.data.is_show_support() and (l_0_6.data.is_legend_fight() or l_0_6.data.get_support_role()) then
      if #l_29_3.members >= 4 then
        if not l_29_1.is_silent then
          l_0_0.broadcast_tips("\233\152\159\228\188\141\229\183\178\230\187\161")
        end
        return 
      else
        l_29_2(true)
        return 
      end
      if not l_29_3 or not l_0_3.get_cfg_by_type_target(l_29_4, l_29_5) or l_0_3.get_cfg_by_type_target(l_29_4, l_29_5).max_count <= #l_29_3.members then
        if not l_29_1.is_silent then
          l_0_0.broadcast_tips("\233\152\159\228\188\141\229\183\178\230\187\161")
        end
        return 
      end
      l_29_2(true)
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

     -- Warning: missing end command somewhere! Added here
  end
end

l_0_11.check_max_count = l_0_23
l_0_23 = function(l_30_0, l_30_1, l_30_2)
  l_0_10.network.req_team_open_match_c2s()
end

l_0_11.room_start = l_0_23
l_0_23 = function(l_31_0, l_31_1, l_31_2)
  l_0_10.network.req_team_ready_c2s()
end

l_0_11.room_ready = l_0_23
l_0_23 = function(l_32_0, l_32_1, l_32_2)
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

  if not l_0_6.data.is_in_team() then
    if l_32_1.options or (l_0_3.get_cfg_by_type_target(l_32_1.type, l_32_1.target).need_apply ~= 1 or l_0_3.get_cfg_by_type_target(l_32_1.type, l_32_1.target).same_guild_only) then
      for l_32_20,l_32_21 in ipairs(l_0_3.get_cfg_by_type_target(l_32_1.type, l_32_1.target).same_guild_only) do
         -- DECOMPILER ERROR: Confused at declaration of local variable

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Confused at declaration of local variable

         -- DECOMPILER ERROR: Confused at declaration of local variable

         -- DECOMPILER ERROR: Overwrote pending register.

         -- DECOMPILER ERROR: Confused about usage of registers for local variables.

        if false then
          do return end
           -- DECOMPILER ERROR: Confused about usage of registers for local variables.

        end
      end
    end
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    if not l_32_1.condition then
      if true then
        do return end
      end
       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Overwrote pending register.

       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    l_0_10.network.req_team_open_room_c2s(l_32_1.type, l_32_1.target, l_32_1.args, {{k = 3, v = 1}}, {{k = 1, v = 0}})
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Overwrote pending register.

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

  else
    if l_0_6.data.get_team_info().type ~= l_32_1.type or l_0_6.data.get_team_info().target ~= l_32_1.target or l_32_1.args and l_32_1.args > 0 and l_0_6.data.get_team_info().args ~= l_32_1.args then
      if l_0_6.data.is_team_captain() then
        l_0_6.network.team_update_target_c2s(l_32_1.type, false, l_32_1.args)
         -- DECOMPILER ERROR: Confused about usage of registers for local variables.

       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused at declaration of local variable

      else
        return l_0_0.broadcast_tips("\228\187\133\233\152\159\233\149\191\229\143\175\232\191\155\232\161\140\230\173\164\230\147\141\228\189\156")
         -- DECOMPILER ERROR: Confused about usage of registers for local variables.

      end
       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused at declaration of local variable

      if l_0_6.data.get_team_info().is_room == 1 then
        l_0_10.network.req_team_join_room_c2s()
       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

      else
        if l_0_6.data.is_team_captain() then
          if not {{k = 1, v = 0}} then
            if l_0_3.get_cfg_by_type_target(l_32_1.type, l_32_1.target).need_apply == 1 then
              do return end
            end
             -- DECOMPILER ERROR: Confused at declaration of local variable

             -- DECOMPILER ERROR: Confused at declaration of local variable

             -- DECOMPILER ERROR: Overwrote pending register.

             -- DECOMPILER ERROR: Confused about usage of registers for local variables.

          end
           -- DECOMPILER ERROR: Confused about usage of registers!

           -- DECOMPILER ERROR: Confused at declaration of local variable

           -- DECOMPILER ERROR: Confused at declaration of local variable

          if not {{k = 3, v = 1}} then
            if l_0_3.get_cfg_by_type_target(l_32_1.type, l_32_1.target).same_guild_only then
              for l_32_51,l_32_52 in ipairs(l_0_3.get_cfg_by_type_target(l_32_1.type, l_32_1.target).same_guild_only) do
                 -- DECOMPILER ERROR: Confused at declaration of local variable

                 -- DECOMPILER ERROR: Overwrote pending register.

                if false then
                  do return end
                   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

                end
              end
            end
             -- DECOMPILER ERROR: Confused at declaration of local variable

             -- DECOMPILER ERROR: Confused at declaration of local variable

             -- DECOMPILER ERROR: Confused about usage of registers for local variables.

            if true then
              do return end
            end
             -- DECOMPILER ERROR: Confused at declaration of local variable

             -- DECOMPILER ERROR: Confused at declaration of local variable

             -- DECOMPILER ERROR: Confused about usage of registers for local variables.

             -- DECOMPILER ERROR: Overwrote pending register.

             -- DECOMPILER ERROR: Confused about usage of registers for local variables.

          end
           -- DECOMPILER ERROR: Confused about usage of registers!

           -- DECOMPILER ERROR: Confused about usage of registers!

           -- DECOMPILER ERROR: Confused about usage of registers!

          l_0_10.network.req_team_open_room_c2s(l_32_1.type, l_32_1.target, l_32_1.args, {{k = 3, v = 1}}, {{k = 1, v = 0}})
           -- DECOMPILER ERROR: Confused about usage of registers for local variables.

         -- DECOMPILER ERROR: Overwrote pending register.

        else
          l_0_0.broadcast_tips(false)
           -- DECOMPILER ERROR: Confused about usage of registers for local variables.

        end
      end
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_11.open_room = l_0_23
l_0_23 = function()
  l_0_17 = false
end

l_0_11.btn_is_not_gray = l_0_23
l_0_23 = function()
  l_0_19 = false
end

l_0_11.recruit_btn_is_not_gray = l_0_23
l_0_23 = function(l_35_0, l_35_1)
  if not l_35_1 then
    l_35_1 = {}
  end
  local l_35_2 = l_0_6.data.get_team_info()
  local l_35_3 = l_35_1.type
  local l_35_4 = l_35_1.target
  local l_35_5 = l_35_1.args
   -- DECOMPILER ERROR: Confused at declaration of local variable

  if not l_35_3 or not l_35_4 then
    if l_35_2 then
      local l_35_7 = l_35_2.type
    if l_35_2 then
      end
    end
    if l_35_2 then
      l_35_4, l_35_5 = l_35_2.target, l_35_2.series
    end
    l_35_3 = l_35_7
    if not l_35_3 or not l_35_4 then
      return 
    end
  end
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    if l_35_3 <= 1 then
      l_0_0.broadcast_tips("\232\175\183\233\128\137\230\139\169\231\155\174\230\160\135")
      l_0_4.open_view("TeamTargetView")
    else
      if l_35_2.status == l_0_6.const.team_status.recruiting then
        if not l_0_6.data.get_value("update_target_not_stop_recruit") then
          l_0_6.network.team_stop_recruit_c2s()
        else
          l_0_6.data.set_value("update_target_not_stop_recruit")
        end
        if l_35_1.need_rerecruit then
          l_0_6.network.team_open_recruit_c2s()
        else
          l_0_6.network.team_open_recruit_c2s()
        end
         -- DECOMPILER ERROR: Confused about usage of registers for local variables.

      end
    end
  end
end

l_0_11.on_click_recruit = l_0_23
l_0_23 = function(l_36_0, l_36_1)
  print("on_recruit")
  if not l_36_1 then
    l_36_1 = {}
  end
  local l_36_2 = l_0_6.data.get_team_info()
  local l_36_3 = l_36_1.type
  local l_36_4 = l_36_1.target
  local l_36_5 = l_36_1.args
  do
    local l_36_6 = l_36_1.not_open_recruit
     -- DECOMPILER ERROR: Confused at declaration of local variable

    if not l_36_3 or not l_36_4 then
      if l_36_2 then
        local l_36_8 = l_36_2.type
      if l_36_2 then
        end
      end
      if l_36_2 then
        l_36_4, l_36_5 = l_36_2.target, l_36_2.series
      end
      l_36_3 = l_36_8
      if not l_36_3 or not l_36_4 then
        return 
      end
    end
    if l_36_3 <= 1 then
      l_0_0.broadcast_tips("\232\175\183\233\128\137\230\139\169\231\155\174\230\160\135")
      l_0_4.open_view("TeamTargetView")
     -- DECOMPILER ERROR: Confused about usage of registers!

    else
      if l_36_2.status ~= l_0_6.const.team_status.recruiting and not l_36_6 then
        l_0_6.network.team_open_recruit_c2s(l_36_3, l_36_4, l_36_5)
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
end

l_0_11.on_recruit = l_0_23
l_0_23 = function(l_37_0, l_37_1, l_37_2)
  local l_37_3 = l_37_1.is_silent
  if l_0_9.check_pve(l_37_3, l_37_1) then
    return 
  end
  if l_37_2 then
    l_37_2(true)
  end
end

l_0_11.check_pve = l_0_23

