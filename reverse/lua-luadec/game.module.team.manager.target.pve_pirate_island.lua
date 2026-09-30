-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.pve_pirate_island_2737343690678154145.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.pve_pirate_island
local l_0_2 = DataConfigs.pirate_island
local l_0_3 = DataConfigs.language_define
local l_0_4 = Game.module.team
local l_0_5 = l_0_4.data
local l_0_6 = l_0_4.const
local l_0_7 = l_0_4.network
local l_0_8 = Game.module.main_view
local l_0_9 = Game.module.pirate_island
local l_0_10 = Game.module.open_func
local l_0_11 = DataConfigs.team_target
local l_0_12 = l_0_0.ways.base
local l_0_13 = Game.module.data
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_11.get_cfg_by_id(l_0_6.target_main_type.pirate_island)
end

l_0_1.get_team_args = function(l_2_0, l_2_1)
  local l_2_2 = 1
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    return l_2_2, l_2_1 or 401000001
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.get_award_left_times = function(l_3_0)
  local l_3_1 = l_3_0.target_cfg
  local l_3_2 = l_3_1.sub_target[1]
  local l_3_3, l_3_4 = l_0_9.get_pass_count_and_max(l_3_2.dungeon)
  return l_3_3, l_3_4
end

l_0_1.can_get_concentric = function(l_4_0)
  local l_4_1, l_4_2 = l_4_0:get_award_left_times()
  if l_4_1 == 0 then
    local l_4_3 = not l_0_12:is_max_concentric()
  else
    return false
  end
end

l_0_1.get_award_left_times_desc = function(l_5_0)
  local l_5_1 = l_5_0.target_cfg
  local l_5_2 = l_5_1.sub_target[1]
  local l_5_3, l_5_4 = l_0_9.get_pass_count_and_max(l_5_2.dungeon)
  local l_5_5 = string.format
  local l_5_6 = "\230\156\170\232\174\168\228\188\144\229\177\130\230\149\176:<color=%s>%s</color>/%s"
  local l_5_7 = string.get_color_with_cost_info
  local l_5_8 = l_5_3
  local l_5_9 = l_5_4
  local l_5_13 = l_5_3 < l_5_4
  l_5_7 = l_5_7(l_5_8, l_5_9, l_5_13, true)
  l_5_8 = l_5_3
  l_5_9 = l_5_4
  return l_5_5(l_5_6, l_5_7, l_5_8, l_5_9)
end

l_0_1.is_player_limit = function(l_6_0, l_6_1, l_6_2, l_6_3)
  local l_6_4 = l_0_11.get_cfg_by_type_target(l_6_0.target_cfg.id, l_6_1)
  return not l_0_13.is_role_cross_func_open(l_6_3, l_6_4.open_func), l_0_3.get_string(l_6_4.no_open_desc)
end

local l_0_14 = nil
l_0_1.is_limit = function(l_7_0, l_7_1, l_7_2)
  local l_7_3, l_7_4 = l_0_12:is_limit, l_0_12
  local l_7_5 = l_7_1
  local l_7_6 = l_7_2
  local l_7_7 = l_7_0.is_player_limit
  return l_7_3(l_7_4, l_7_5, l_7_6, l_7_7)
end

l_0_1.get_target_item_desc = function(l_8_0, l_8_1, l_8_2)
  local l_8_3 = l_8_0.target_cfg
  local l_8_4 = l_8_3.sub_target[1]
  local l_8_5, l_8_6 = l_0_9.get_pass_count_and_max(l_8_4.dungeon)
  local l_8_7 = string.format
  local l_8_8 = "<color=%s>%s</color>/%s"
  local l_8_9 = string.get_color_with_cost_info
  local l_8_10 = l_8_5
  local l_8_11 = l_8_6
  l_8_9 = l_8_9(l_8_10, l_8_11, l_8_5 < l_8_6, true)
  l_8_10 = l_8_5
  l_8_11 = l_8_6
  l_8_7 = l_8_7(l_8_8, l_8_9, l_8_10, l_8_11)
  l_8_8 = l_0_6
  l_8_8 = l_8_8.team_target_desc_type
  l_8_8 = l_8_8.desc
  l_8_9 = "\230\156\170\232\174\168\228\188\144\229\177\130\230\149\176:"
  l_8_10 = l_8_7
  return l_8_8, l_8_9, l_8_10
end

l_0_1.get_sub_target_item_lock_stats = function(l_9_0, l_9_1, l_9_2)
  local l_9_3 = l_0_13.get_player_id()
  local l_9_4 = false
  local l_9_5 = false
  local l_9_6 = nil
  local l_9_7 = l_0_5.get_team_info()
  if l_9_7 then
    table.sort(l_9_7.members, l_0_5.member_sort_func)
    for l_9_11,l_9_12 in ipairs(l_9_7.members) do
      if not l_9_12.is_robot or l_9_12.is_robot ~= 1 then
        l_9_4, l_9_5, l_9_6 = l_9_0:get_sub_target_item_lock_stats_by_role(l_9_1, l_9_2, l_9_12.role_id)
         -- DECOMPILER ERROR: unhandled construct in 'if'

        if not l_9_5 and l_9_12.role_id ~= l_9_3 then
          l_9_6 = string.format("\233\152\159\229\145\152<color=#feab46>%s</color>\229\176\154\230\156\170\232\167\163\233\148\129\230\156\172\231\142\169\230\179\149", l_9_12.role_name)
      else
        end
      end
    else
      l_9_4, l_9_5, l_9_6 = l_9_0:get_sub_target_item_lock_stats_by_role(l_9_1, l_9_2, l_9_3)
    end
  end
end
return l_9_4, l_9_5, l_9_6
end

l_0_1.get_sub_target_item_lock_stats_by_role = function(l_10_0, l_10_1, l_10_2, l_10_3)
  local l_10_4, l_10_5 = l_10_0:is_team_target_open(1, nil, l_10_3)
  local l_10_6 = true
  local l_10_7 = l_10_4
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    return l_10_6, l_10_7, l_10_5 or ""
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.get_team_target_arg_by_sub_config = function(l_11_0, l_11_1)
  return 1, l_11_1.cfg.dungeon
end

l_0_1.get_target_list = function(l_12_0)
  local l_12_1 = {}
  local l_12_2 = l_12_0.target_cfg.sub_target
  for l_12_6,l_12_7 in pairs(l_12_2) do
    local l_12_8 = l_0_2.get_cfg_by_id(l_12_7.dungeon)
    local l_12_9 = {}
    l_12_9.cfg = l_12_8
    l_12_9.target_id = l_12_0.target_cfg.id
    l_12_9.name = l_12_8.name
    l_12_9.display_reward = l_12_8.show_reward_list
    l_12_9.id = l_12_8.dungeon
    table.insert(l_12_1, l_12_9)
  end
  table.sort(l_12_1, function(l_1_0, l_1_1)
    return l_1_0.cfg.dungeon < l_1_1.cfg.dungeon
   end)
  return l_12_1
end

l_0_1.get_team_target_reward_desc = function(l_13_0)
  local l_13_1 = l_13_0.target_cfg
  local l_13_2 = l_13_1.sub_target[1]
  local l_13_3, l_13_4 = l_0_9.get_pass_count_and_max(l_13_2.dungeon)
  local l_13_5 = string.format
  local l_13_6 = "<color=%s>%s</color>/%s"
  local l_13_7 = string.get_color_with_cost_info
  local l_13_8 = l_13_3
  local l_13_9 = l_13_4
  l_13_7 = l_13_7(l_13_8, l_13_9, l_13_3 < l_13_4, true)
  l_13_8 = l_13_4 - l_13_3
  l_13_9 = l_13_4
  l_13_5 = l_13_5(l_13_6, l_13_7, l_13_8, l_13_9)
  l_13_6 = "\230\156\170\232\174\168\228\188\144\229\177\130\230\149\176:"
  l_13_7 = l_13_5
  l_13_6 = l_13_6 .. l_13_7
  l_13_7 = l_13_5
  return l_13_6, l_13_7
end

l_0_1.get_team_target_right_desc = function(l_14_0)
  local l_14_1 = l_14_0.target_cfg
  local l_14_2 = l_14_1.sub_target[1]
  do
    local l_14_3, l_14_4 = l_0_9.get_pass_count_and_max(l_14_2.dungeon)
    if l_0_5.is_in_team() then
      local l_14_5 = l_0_5.get_team_info()
      for l_14_9,l_14_10 in ipairs(l_14_5.members) do
        local l_14_11 = l_0_13.raw_get_player_info(l_14_10.role_id)
        if not l_14_11.mystery_max_layer then
          local l_14_12 = not l_14_11 or 0
        end
         -- DECOMPILER ERROR: Confused about usage of registers!

        l_14_3 = math.min(l_14_3, l_14_12)
      end
    end
    l_14_5 = string
    l_14_5 = l_14_5.format
     -- DECOMPILER ERROR: Confused at declaration of local variable

    local l_14_14, l_14_21 = "<color=%s>%s</color>/%s"
    l_14_21 = string
    l_14_21 = l_14_21.get_color_with_cost_info
    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

      local l_14_16 = l_14_3
      local l_14_17 = l_14_4
      l_14_21 = l_14_21(l_14_16, l_14_17, l_14_3 < l_14_4, true)
      l_14_16 = l_14_3
      l_14_17 = l_14_4
      l_14_5 = l_14_5(l_14_14, l_14_21, l_14_16, l_14_17)
      l_14_14 = string
      l_14_14 = l_14_14.format
      l_14_21 = "\232\174\168\228\188\144\232\191\155\229\186\166:%s"
      l_14_16 = l_14_5
      l_14_14 = l_14_14(l_14_21, l_14_16)
      l_14_21 = false
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    return l_14_14, l_14_21
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.team_update_target = function(l_15_0, l_15_1)
  l_0_7.team_update_target_c2s(l_15_0.target_cfg.id, l_15_1.id)
end

l_0_1.get_rank_type = function(l_16_0)
  return require("game.module.rank.manager.const").rank_type.mystery_dungeon
end

l_0_1.get_target_desc = function(l_17_0, l_17_1)
  local l_17_2 = l_0_3.get_string
  local l_17_3 = l_17_1.target_desc
  return l_17_2(l_17_3)
end

l_0_1.get_sub_target_display_reward = function(l_18_0, l_18_1, l_18_2)
  local l_18_3 = l_0_2.get_cfg_by_id(l_18_1 and l_18_1.dungeon or l_18_2)
  if not l_18_3 or not l_18_3.show_reward_list then
    return {}
  end
end

l_0_1.check_reward_before_match = function(l_19_0)
  local l_19_1, l_19_2 = l_19_0:get_award_left_times()
  local l_19_3 = l_0_4.is_team_mate_all_robot()
  local l_19_4 = not l_19_3
  return l_19_4, l_19_1 < l_19_2
end

l_0_1.get_start_btn_desc = function(l_20_0)
  return "\229\188\128\229\167\139\230\140\145\230\136\152"
end

l_0_1.could_turn_to_this_target = function(l_21_0, l_21_1, l_21_2)
  local l_21_3, l_21_4, l_21_5 = l_0_5.get_team_type_target_args()
  if l_21_3 == l_0_6.target_main_type.pirate_island then
    l_0_8.show_sub_panel("team")
    l_21_2(true)
    return 
  end
  if not l_0_5.is_in_team() then
    if l_21_0.target_cfg.is_public == 1 then
      l_0_7.team_create_c2s(l_21_0.target_cfg.id, l_21_1.sub_team_target)
    end
    l_21_2(true)
    return 
  end
  if l_0_5.is_team_matching() then
    local l_21_6 = l_0_11.get_cfg_by_id(l_0_6.target_main_type.pirate_island)
    local l_21_7 = l_0_3.get_string(l_21_6.name)
    BroadcastTips.broadcast_tips(string.format("\230\130\168\229\183\178\229\156\168\229\140\185\233\133\141\228\184\173\239\188\140\230\151\160\230\179\149\229\137\141\229\190\128%s", l_21_7))
    l_21_2(false)
    return 
  end
  local l_21_8 = Game.module.data.get_player_id()
  local l_21_9 = l_0_5.is_team_captain(l_21_8)
  if l_21_9 then
    l_21_2(true)
    return 
  end
  local l_21_10 = require("game.module.common_view.manager.confirm")
  local l_21_11 = l_21_10.confirm
  local l_21_12 = {}
  l_21_12.content = "\229\189\147\229\137\141\228\189\141\228\186\142\233\152\159\228\188\141\228\184\173\239\188\140\230\152\175\229\144\166\233\128\128\229\135\186\233\152\159\228\188\141\229\185\182\233\128\137\230\139\169\232\175\165\231\142\169\230\179\149\239\188\159"
  l_21_12.sure_click = function()
    l_0_5.set_alone_type_target_args(l_21_1.team_target, l_21_1.sub_team_target, l_21_1.team_args)
    l_0_5.set_value("skip_quit_team_target_set", true)
    l_0_7.team_quit_c2s()
    Game.ui_manager.close_unuse_view()
    Game.module.main_view.show_sub_panel("team")
   end
  l_21_12.cancel_click = function()
    l_21_2(false)
   end
  l_21_12.close_click = function()
    l_21_2(false)
   end
  l_21_11(l_21_12)
end

l_0_1.can_join_other_team = function(l_22_0, l_22_1, l_22_2)
  local l_22_3 = l_0_11.get_cfg_by_type_target(l_0_6.target_main_type.pirate_island, 1)
  local l_22_4, l_22_5 = l_0_9.get_pass_count_and_max(l_22_3.dungeon)
  return l_22_4 < l_22_5
end

l_0_1.has_sub_target = function(l_23_0, l_23_1, l_23_2)
  return false
end

l_0_1.need_fill_member_before_match = function(l_24_0, l_24_1)
  return true, false
end

return l_0_1

