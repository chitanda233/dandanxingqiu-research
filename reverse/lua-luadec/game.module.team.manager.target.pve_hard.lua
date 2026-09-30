-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.pve_hard_-6032796066760019451.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.pve_hard
local l_0_2 = l_0_0.ways.base
local l_0_3 = Game.module.dungeon_team.data
local l_0_4 = DataConfigs.team_target
local l_0_5 = DataConfigs.multi_series
local l_0_6 = DataConfigs.language_define
local l_0_7 = Game.module.team
local l_0_8 = l_0_7.const
local l_0_9 = l_0_7.data
local l_0_10 = Game.module.data
local l_0_11 = Game.module.open_func
local l_0_12 = Game.module.dungeon_team
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_4.get_cfg_by_id(l_0_8.target_main_type.hero_pve)
end

l_0_1.get_award_left_times = function(l_2_0)
  return l_0_3.get_heroic_award_left_times()
end

l_0_1.get_award_left_times_desc = function(l_3_0)
  local l_3_1, l_3_2 = l_0_3.get_heroic_award_left_times()
  local l_3_3 = string.format
  local l_3_4 = "\230\156\172\229\145\168\229\165\150\229\138\177\230\172\161\230\149\176\239\188\154<color=%s>%s</color>/%s"
  local l_3_5 = string.get_color_with_cost_info
  local l_3_6 = l_3_1
  local l_3_7 = l_3_2
  l_3_5 = l_3_5(l_3_6, l_3_7, l_3_1 > 0)
  l_3_6 = l_3_1
  l_3_7 = l_3_2
  return l_3_3(l_3_4, l_3_5, l_3_6, l_3_7)
end

l_0_1.can_get_concentric = function(l_4_0)
  local l_4_1 = l_0_2:is_max_concentric()
  local l_4_2, l_4_3 = l_0_3.get_heroic_award_left_times()
  return not l_4_1 and l_4_2 == 0
end

l_0_1.get_target_item_desc = function(l_5_0, l_5_1, l_5_2)
  local l_5_3, l_5_4 = l_0_3.get_heroic_award_left_times()
  local l_5_5 = string.format
  local l_5_6 = "<color=%s>%s</color>/%s"
  local l_5_7 = string.get_color_with_cost_info
  local l_5_8 = l_5_3
  local l_5_9 = l_5_4
  l_5_7 = l_5_7(l_5_8, l_5_9, l_5_3 > 0, true)
  l_5_8 = l_5_3
  l_5_9 = l_5_4
  l_5_5 = l_5_5(l_5_6, l_5_7, l_5_8, l_5_9)
  l_5_6 = l_0_8
  l_5_6 = l_5_6.team_target_desc_type
  l_5_6 = l_5_6.desc
  l_5_7 = "\230\156\172\229\145\168\229\165\150\229\138\177\230\172\161\230\149\176\239\188\154"
  l_5_8 = l_5_5
  return l_5_6, l_5_7, l_5_8
end

l_0_1.get_team_target_arg_by_sub_config = function(l_6_0, l_6_1)
  return 1, l_6_1.id
end

l_0_1.get_min_max_count = function(l_7_0, l_7_1, l_7_2)
  local l_7_3 = l_0_4.get_cfg_by_type_target(l_7_0.target_cfg.id, 1)
  return l_7_3.min_count, l_7_3.max_count
end

l_0_1.get_team_target_reward_desc = function(l_8_0)
  local l_8_1, l_8_2 = l_0_3.get_heroic_award_left_times()
  local l_8_3 = string.format
  local l_8_4 = "<color=%s>%s</color>/%s"
  local l_8_5 = string.get_color_with_cost_info
  local l_8_6 = l_8_1
  local l_8_7 = l_8_2
  l_8_5 = l_8_5(l_8_6, l_8_7, l_8_1 > 0, true)
  l_8_6 = l_8_1
  l_8_7 = l_8_2
  l_8_3 = l_8_3(l_8_4, l_8_5, l_8_6, l_8_7)
  l_8_4 = "\230\156\172\229\145\168\229\165\150\229\138\177\230\172\161\230\149\176:"
  l_8_5 = l_8_3
  l_8_4 = l_8_4 .. l_8_5
  l_8_5 = l_8_3
  return l_8_4, l_8_5
end

l_0_1.is_player_limit = function(l_9_0, l_9_1, l_9_2, l_9_3)
  local l_9_4, l_9_5, l_9_6 = l_0_12.check_dungeon_unlock(l_9_2, l_9_3)
  return not l_9_4, l_0_9.get_team_lock_desc(l_9_5, l_9_6), l_0_10.raw_get_player_info(l_9_3)
end

local l_0_13 = nil
l_0_1.is_limit = function(l_10_0, l_10_1, l_10_2)
  local l_10_3, l_10_4 = l_0_2:is_limit, l_0_2
  local l_10_5 = l_10_1
  local l_10_6 = l_10_2
  local l_10_7 = l_10_0.is_player_limit
  return l_10_3(l_10_4, l_10_5, l_10_6, l_10_7)
end

l_0_1.is_team_target_open = function(l_11_0, l_11_1, l_11_2, l_11_3)
  local l_11_4 = l_11_0.target_cfg
  if l_11_4.is_open == 0 then
    return false
  end
  if not l_11_3 then
    l_11_3 = l_0_10.get_player_id()
  end
  local l_11_5 = l_0_10.raw_get_player_info(l_11_3)
  if not l_11_5 then
    return false
  end
  local l_11_6 = l_0_4.get_cfg_by_type_target(l_11_4.id, l_11_1)
  if l_11_6.open_func and not l_0_10.is_role_cross_func_open(l_11_3, l_11_6.open_func) then
    return false
  end
  if l_11_6.if_show == 0 then
    return false
  end
  local l_11_7 = l_0_12.check_dungeon_unlock
  local l_11_8 = l_11_2
  local l_11_9 = l_11_3
  return l_11_7(l_11_8, l_11_9)
end

l_0_1.get_sub_target_item_lock_stats = function(l_12_0, l_12_1, l_12_2, l_12_3)
  local l_12_4 = l_12_0.target_cfg.sub_target[1]
  local l_12_5, l_12_6, l_12_7 = l_12_0:is_team_target_open(l_12_4.id, l_12_2, l_12_3)
  local l_12_8 = ""
  if not l_12_5 then
    if l_12_6 == l_0_8.target_lock_type.pre_dungeon then
      l_12_8 = string.format("\233\128\154\232\191\135\227\128\144<color=#FEAB46>%s</color>\227\128\145\232\167\163\233\148\129", l_0_6.get_string(l_0_5.get_config(l_12_2).name))
    else
      if l_12_6 == l_0_8.target_lock_type.level_limit then
        l_12_8 = string.format("<color=#FEAB46>%d</color>\231\186\167\229\188\128\229\144\175\229\137\175\230\156\172", l_12_7)
      else
        if l_12_6 == l_0_8.target_lock_type.server_day then
          l_12_8 = string.format("\229\188\128\230\156\141\231\172\172<color=#FEAB46>%d</color>\229\164\169\232\167\163\233\148\129", l_12_7)
        else
          if l_12_6 == l_0_8.target_lock_type.lock then
            l_12_8 = string.format("\230\136\144\229\145\152<color=#FEAB46>%s</color>\230\156\170\232\167\163\233\148\129\232\175\165\229\137\175\230\156\172", l_12_7)
          end
        end
      end
    end
  end
  return true, l_12_5, l_12_8
end

l_0_1.get_start_btn_desc = function(l_13_0)
  return "\229\188\128\229\167\139\230\140\145\230\136\152"
end

l_0_1.check_reward_before_match = function(l_14_0)
  local l_14_1 = l_14_0:get_award_left_times()
  local l_14_2 = l_0_7.is_team_mate_all_robot()
  local l_14_3 = not l_14_2
  return l_14_3, l_14_1 > 0
end

l_0_1.need_fill_member_before_match = function(l_15_0, l_15_1)
  return true, true
end

return l_0_1

