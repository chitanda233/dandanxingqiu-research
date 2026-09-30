-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.sub_dungeon_star_-6641137023807980324.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.sub_dungeon_star
local l_0_2 = l_0_0.ways.base
local l_0_3 = Game.module.dungeon_team.data
local l_0_4 = Game.module.team
local l_0_5 = l_0_4.const
local l_0_6 = DataConfigs.team_target
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_6.get_cfg_by_id(l_0_5.target_main_type.dungeon_star)
end

l_0_1.get_award_left_times = function(l_2_0)
  return l_0_3.get_star_award_left_times()
end

l_0_1.get_award_left_times_desc = function(l_3_0)
  local l_3_1, l_3_2 = l_0_3.get_star_award_left_times()
  local l_3_3 = string.format
  local l_3_4 = "\229\165\150\229\138\177\230\172\161\230\149\176\239\188\154<color=%s>%s</color>/%s"
  local l_3_5 = string.get_color_with_cost_info
  local l_3_6 = l_3_1
  local l_3_7 = l_3_2
  local l_3_11 = l_3_1 > 0
  l_3_5 = l_3_5(l_3_6, l_3_7, l_3_11, true)
  l_3_6 = l_3_1
  l_3_7 = l_3_2
  return l_3_3(l_3_4, l_3_5, l_3_6, l_3_7)
end

l_0_1.get_target_item_desc = function(l_4_0)
  local l_4_1, l_4_2 = l_0_3.get_star_award_left_times()
  local l_4_3 = string.format
  local l_4_4 = "<color=%s>%s</color>/%s"
  local l_4_5 = string.get_color_with_cost_info
  local l_4_6 = l_4_1
  local l_4_7 = l_4_2
  l_4_5 = l_4_5(l_4_6, l_4_7, l_4_1 > 0, true)
  l_4_6 = l_4_1
  l_4_7 = l_4_2
  l_4_3 = l_4_3(l_4_4, l_4_5, l_4_6, l_4_7)
  l_4_4 = l_0_5
  l_4_4 = l_4_4.team_target_desc_type
  l_4_4 = l_4_4.desc
  l_4_5 = "\229\165\150\229\138\177\230\172\161\230\149\176:"
  l_4_6 = l_4_3
  return l_4_4, l_4_5, l_4_6
end

l_0_1.can_get_concentric = function(l_5_0)
  local l_5_1, l_5_2 = l_0_3.get_star_award_left_times()
  if l_5_1 == 0 then
    local l_5_3 = not l_0_2:is_max_concentric()
  else
    return false
  end
end

l_0_1.get_team_target_reward_desc = function(l_6_0)
  local l_6_1, l_6_2 = l_0_3.get_star_award_left_times()
  local l_6_3 = string.format
  local l_6_4 = "<color=%s>%s</color>/%s"
  local l_6_5 = string.get_color_with_cost_info
  local l_6_6 = l_6_1
  local l_6_7 = l_6_2
  l_6_5 = l_6_5(l_6_6, l_6_7, l_6_1 > 0, true)
  l_6_6 = l_6_1
  l_6_7 = l_6_2
  l_6_3 = l_6_3(l_6_4, l_6_5, l_6_6, l_6_7)
  l_6_4 = "\229\165\150\229\138\177\230\172\161\230\149\176:"
  l_6_5 = l_6_3
  l_6_4 = l_6_4 .. l_6_5
  l_6_5 = l_6_3
  return l_6_4, l_6_5
end

l_0_1.get_start_btn_desc = function(l_7_0)
  return "\229\188\128\229\167\139\230\140\145\230\136\152"
end

l_0_1.check_reward_before_match = function(l_8_0)
  local l_8_1 = l_8_0:get_award_left_times()
  local l_8_2 = l_0_4.is_team_mate_all_robot()
  local l_8_3 = not l_8_2
  return l_8_3, l_8_1 > 0
end

l_0_1.need_fill_member_before_match = function(l_9_0, l_9_1)
  return true, true
end

return l_0_1

