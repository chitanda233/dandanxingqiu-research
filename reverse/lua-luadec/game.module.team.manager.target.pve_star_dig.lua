-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.pve_star_dig_-8792082500739670946.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.pve_star_dig
local l_0_2 = Game.module.dig_star
local l_0_3 = Game.module.data
local l_0_4 = DataConfigs.star_digging
local l_0_5 = DataConfigs.language_define
local l_0_6 = Game.module.open_func
local l_0_7 = DataConfigs.team_target
local l_0_8 = Game.module.team
local l_0_9 = assert(l_0_8.data)
local l_0_10 = assert(l_0_8.const)
local l_0_11 = assert(l_0_8.network)
local l_0_12 = l_0_0.ways.base
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_7.get_cfg_by_id(l_0_10.target_main_type.dig_star)
end

l_0_1.get_award_left_times = function(l_2_0)
  return l_0_2.get_fight_count_and_max()
end

l_0_1.get_award_left_times_desc = function(l_3_0)
  local l_3_1, l_3_2 = l_0_2.get_fight_count_and_max()
  local l_3_3 = string.format
  local l_3_4 = "\229\137\169\228\189\153\229\165\150\229\138\177\230\172\161\230\149\176\239\188\154<color=%s>%s</color>/%s"
  local l_3_5 = string.get_color_with_cost_info
  local l_3_6 = l_3_1
  local l_3_7 = l_3_2
  local l_3_11 = l_3_1 > 0
  l_3_5 = l_3_5(l_3_6, l_3_7, l_3_11, true)
  l_3_6 = l_3_1
  l_3_7 = l_3_2
  return l_3_3(l_3_4, l_3_5, l_3_6, l_3_7)
end

l_0_1.get_target_item_desc = function(l_4_0, l_4_1, l_4_2)
  local l_4_3, l_4_4 = l_0_2.get_fight_count_and_max()
  local l_4_5 = string.format
  local l_4_6 = "<color=%s>%s</color>/%s"
  local l_4_7 = string.get_color_with_cost_info
  local l_4_8 = l_4_3
  local l_4_9 = l_4_4
  l_4_7 = l_4_7(l_4_8, l_4_9, l_4_3 > 0, true)
  l_4_8 = l_4_3
  l_4_9 = l_4_4
  l_4_5 = l_4_5(l_4_6, l_4_7, l_4_8, l_4_9)
  l_4_6 = l_0_10
  l_4_6 = l_4_6.team_target_desc_type
  l_4_6 = l_4_6.desc
  l_4_7 = "\229\137\169\228\189\153\229\165\150\229\138\177\230\172\161\230\149\176\239\188\154"
  l_4_8 = l_4_5
  return l_4_6, l_4_7, l_4_8
end

l_0_1.can_get_concentric = function(l_5_0)
  local l_5_1, l_5_2 = l_0_2.get_fight_count_and_max()
  if l_5_1 == 0 then
    local l_5_3 = not l_0_12:is_max_concentric()
  else
    return false
  end
end

l_0_1.is_player_limit = function(l_6_0, l_6_1, l_6_2, l_6_3)
  local l_6_4 = l_0_7.get_cfg_by_type_target(l_6_0.target_cfg.id, l_6_1)
  return not l_0_3.is_role_cross_func_open(l_6_3, l_6_4.open_func), l_0_5.get_string(l_6_4.no_open_desc)
end

l_0_1.is_limit = function(l_7_0, l_7_1, l_7_2)
  local l_7_3, l_7_4 = l_0_12:is_limit, l_0_12
  local l_7_5 = l_7_1
  local l_7_6 = l_7_2
  local l_7_7 = l_7_0.is_player_limit
  return l_7_3(l_7_4, l_7_5, l_7_6, l_7_7)
end

l_0_1.get_target_list = function(l_8_0)
  local l_8_1 = {}
  local l_8_2 = l_8_0.target_cfg.sub_target
  for l_8_6,l_8_7 in pairs(l_8_0.target_cfg.sub_target) do
    local l_8_8 = l_8_7
    if l_0_9.is_team_target_open(l_8_0.target_cfg.id, l_8_8.id) then
      local l_8_9 = l_0_4.get_config(l_8_8.dungeon)
      local l_8_10 = {}
      l_8_10.cfg = l_8_8
      l_8_10.target_id = l_8_0.target_cfg.id
      l_8_10.id = l_8_8.id
      l_8_10.name = l_8_8.name
      l_8_10.display_reward = l_8_9.display_reward
      table.insert(l_8_1, l_8_10)
    end
  end
  table.sort(l_8_1, function(l_1_0, l_1_1)
    return l_1_0.cfg.id < l_1_1.cfg.id
   end)
  return l_8_1
end

l_0_1.get_monster_head_icon = function(l_9_0, l_9_1)
  return "Icon/Team", l_0_4.get_config(l_9_1.dungeon).icon
end

l_0_1.get_target_item_lock_stats = function(l_10_0)
  local l_10_1, l_10_2 = l_10_0:is_team_main_target_open()
  return true, l_10_1, l_10_2
end

l_0_1.get_team_target_reward_desc = function(l_11_0)
  local l_11_1, l_11_2 = l_0_2.get_fight_count_and_max()
  local l_11_3 = string.format
  local l_11_4 = "<color=%s>%s</color>/%s"
  local l_11_5 = string.get_color_with_cost_info
  local l_11_6 = l_11_1
  local l_11_7 = l_11_2
  l_11_5 = l_11_5(l_11_6, l_11_7, l_11_1 > 0, true)
  l_11_6 = l_11_1
  l_11_7 = l_11_2
  l_11_3 = l_11_3(l_11_4, l_11_5, l_11_6, l_11_7)
  l_11_4 = "\229\137\169\228\189\153\229\165\150\229\138\177\230\172\161\230\149\176:"
  l_11_5 = l_11_3
  l_11_4 = l_11_4 .. l_11_5
  l_11_5 = l_11_3
  return l_11_4, l_11_5
end

l_0_1.get_team_target_right_desc = function(l_12_0)
  local l_12_1, l_12_2, l_12_3 = l_0_9.get_team_type_target_args()
  local l_12_4 = l_0_9.get_team_target_name
  local l_12_5 = l_12_1
  local l_12_6 = l_12_2
  local l_12_7 = l_12_3
  return l_12_4(l_12_5, l_12_6, l_12_7)
end

l_0_1.team_update_target = function(l_13_0, l_13_1)
  l_0_11.team_update_target_c2s(l_13_0.target_cfg.id, l_13_1.id)
end

l_0_1.get_terrain_hardness_dungeon_id = function(l_14_0, l_14_1)
  return l_14_1.dungeon
end

l_0_1.get_target_desc = function(l_15_0, l_15_1)
  local l_15_2 = l_0_5.get_string
  local l_15_3 = l_15_1.target_desc
  return l_15_2(l_15_3)
end

l_0_1.get_battle_win_info = function(l_16_0, l_16_1)
  local l_16_2 = l_0_4.get_config(l_16_1.dungeon)
  local l_16_3 = l_0_5.get_string
  local l_16_4 = l_16_2.battle_info
  return l_16_3(l_16_4)
end

l_0_1.get_sub_target_display_reward = function(l_17_0, l_17_1)
  if not l_17_1 then
    return {}
  end
  local l_17_2 = l_0_4.get_config(l_17_1.dungeon)
  if not l_17_2 or not l_17_2.display_reward then
    return {}
  end
end

l_0_1.check_reward_before_match = function(l_18_0)
  local l_18_1 = l_18_0:get_award_left_times()
  local l_18_2 = l_0_8.is_team_mate_all_robot()
  local l_18_3 = not l_18_2
  return l_18_3, l_18_1 > 0
end

l_0_1.get_start_btn_desc = function(l_19_0)
  return "\229\188\128\229\167\139\230\140\145\230\136\152"
end

l_0_1.need_fill_member_before_match = function(l_20_0, l_20_1)
  return true, true
end

return l_0_1

