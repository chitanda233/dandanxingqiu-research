-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.pve_4484793919154627548.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.pve
local l_0_2 = Game.module.dungeon_team.data
local l_0_3 = DataConfigs.multi_series
local l_0_4 = DataConfigs.language_define
local l_0_5 = Game.module.team
local l_0_6 = assert(l_0_5.network)
local l_0_7 = assert(l_0_5.data)
local l_0_8 = l_0_5.const
local l_0_9 = DataConfigs.team_target
local l_0_10 = Game.module.open_func
local l_0_11 = Game.module.data
local l_0_12 = Game.module.dungeon_team
local l_0_13 = l_0_12.data
local l_0_14 = l_0_0.ways.base
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_9.get_cfg_by_id(l_0_8.target_main_type.pve)
end

l_0_1.get_team_args = function(l_2_0, l_2_1)
  return l_0_9.get_one_sub_target_id_by_type(l_2_0.target_cfg.id), l_2_1
end

l_0_1.get_award_left_times = function(l_3_0)
  return l_0_13.get_common_award_left_times()
end

l_0_1.can_get_concentric = function(l_4_0)
  local l_4_1, l_4_2 = l_0_13.get_common_award_left_times()
  if l_4_1 == 0 then
    local l_4_3 = not l_0_14.is_max_concentric()
  else
    return false
  end
end

l_0_1.get_award_left_times_desc = function(l_5_0)
  local l_5_1, l_5_2 = l_0_13.get_common_award_left_times()
  local l_5_3 = string.format
  local l_5_4 = "\229\165\150\229\138\177\230\172\161\230\149\176\239\188\154<color=%s>%s</color>/%s"
  local l_5_5 = string.get_color_with_cost_info
  local l_5_6 = l_5_1
  local l_5_7 = l_5_2
  local l_5_11 = l_5_1 > 0
  l_5_5 = l_5_5(l_5_6, l_5_7, l_5_11, true)
  l_5_6 = l_5_1
  l_5_7 = l_5_2
  return l_5_3(l_5_4, l_5_5, l_5_6, l_5_7)
end

l_0_1.is_player_limit = function(l_6_0, l_6_1, l_6_2, l_6_3)
  local l_6_4, l_6_5, l_6_6 = l_0_12.check_dungeon_unlock(l_6_2, l_6_3)
  return not l_6_4, l_0_7.get_team_lock_desc(l_6_5, l_6_6), l_0_11.raw_get_player_info(l_6_3)
end

l_0_1.is_limit = function(l_7_0, l_7_1, l_7_2)
  local l_7_3 = l_0_14.is_limit
  local l_7_4 = l_7_1
  local l_7_5 = l_7_2
  local l_7_6 = l_7_0.is_player_limit
  return l_7_3(l_7_4, l_7_5, l_7_6)
end

l_0_1.get_team_target_arg_by_sub_config = function(l_8_0, l_8_1)
  return 1, l_8_1.id
end

l_0_1.get_min_max_count = function(l_9_0, l_9_1, l_9_2)
  local l_9_3 = l_0_9.get_cfg_by_type_target(l_9_0.target_cfg.id, 1)
  return l_9_3.min_count, l_9_3.max_count
end

l_0_1.get_target_list = function(l_10_0)
  local l_10_1 = {}
  local l_10_2 = l_10_0.target_cfg.sub_target[1]
  for l_10_6,l_10_7 in pairs(l_10_2.series) do
    local l_10_8 = l_0_3.get_config(l_10_7)
    local l_10_9 = {}
    l_10_9.cfg = l_10_8
    l_10_9.target_id = l_10_0.target_cfg.id
    l_10_9.name = l_10_8.name
    l_10_9.display_reward = l_10_8.display_reward
    l_10_9.rec_pow = l_10_8.rec_pow
    l_10_9.id = l_10_8.id
    table.insert(l_10_1, l_10_9)
  end
  table.sort(l_10_1, function(l_1_0, l_1_1)
    return l_1_0.cfg.id < l_1_1.cfg.id
   end)
  return l_10_1
end

l_0_1.team_update_target = function(l_11_0, l_11_1)
  l_0_6.team_update_target_c2s(l_11_0.target_cfg.id, l_11_1.id)
end

l_0_1.get_target_item_desc = function(l_12_0, l_12_1, l_12_2)
  local l_12_3, l_12_4 = l_0_13.get_common_award_left_times()
  local l_12_5 = string.format
  local l_12_6 = "<color=%s>%s</color>/%s"
  local l_12_7 = string.get_color_with_cost_info
  local l_12_8 = l_12_3
  local l_12_9 = l_12_4
  l_12_7 = l_12_7(l_12_8, l_12_9, l_12_3 > 0, true)
  l_12_8 = l_12_3
  l_12_9 = l_12_4
  l_12_5 = l_12_5(l_12_6, l_12_7, l_12_8, l_12_9)
  l_12_6 = l_0_8
  l_12_6 = l_12_6.team_target_desc_type
  l_12_6 = l_12_6.desc
  l_12_7 = "\229\165\150\229\138\177\230\172\161\230\149\176\239\188\154"
  l_12_8 = l_12_5
  return l_12_6, l_12_7, l_12_8
end

l_0_1.get_sub_target_item_lock_stats = function(l_13_0, l_13_1, l_13_2, l_13_3)
  local l_13_4 = l_13_0.target_cfg.sub_target[1]
  local l_13_5, l_13_6, l_13_7 = l_13_0:is_team_target_open(l_13_4.id, l_13_2, l_13_3)
  local l_13_8 = ""
  if not l_13_5 then
    if l_13_6 == l_0_8.target_lock_type.pre_dungeon then
      l_13_8 = string.format("\233\128\154\232\191\135\227\128\144<color=#FEAB46>%s</color>\227\128\145\232\167\163\233\148\129", l_0_4.get_string(l_0_3.get_config(l_13_2).name))
    else
      if l_13_6 == l_0_8.target_lock_type.level_limit then
        l_13_8 = string.format("<color=#FEAB46>%d</color>\231\186\167\229\188\128\229\144\175\229\137\175\230\156\172", l_13_7)
      else
        if l_13_6 == l_0_8.target_lock_type.server_day then
          l_13_8 = string.format("\229\188\128\230\156\141\231\172\172<color=#FEAB46>%d</color>\229\164\169\232\167\163\233\148\129", l_13_7)
        else
          if l_13_6 == l_0_8.target_lock_type.lock then
            l_13_8 = string.format("\230\136\144\229\145\152<color=#FEAB46>%s</color>\230\156\170\232\167\163\233\148\129\232\175\165\229\137\175\230\156\172", l_13_7)
          end
        end
      end
    end
  end
  return true, l_13_5, l_13_8
end

l_0_1.is_team_type_open = function(l_14_0)
  local l_14_1 = l_14_0.target_cfg
  if l_14_1.is_open == 0 then
    return false
  end
  local l_14_2 = l_14_1.sub_target[1]
  for l_14_6,l_14_7 in ipairs(l_14_2.series) do
    if l_14_0:is_team_target_open(l_14_2.id, l_14_7) then
      return true
    end
  end
  return false
end

l_0_1.is_team_target_open = function(l_15_0, l_15_1, l_15_2, l_15_3)
  local l_15_4 = l_15_0.target_cfg
  if l_15_4.is_open == 0 then
    return false
  end
  if not l_15_3 then
    l_15_3 = l_0_11.get_player_id()
  end
  local l_15_5 = l_0_11.raw_get_player_info(l_15_3)
  if not l_15_5 then
    return false
  end
  local l_15_6 = l_0_9.get_cfg_by_type_target(l_15_4.id, l_15_1)
  if l_15_6.open_func and not l_0_11.is_role_cross_func_open(l_15_3, l_15_6.open_func) then
    return false
  end
  if l_15_6.if_show == 0 then
    return false
  end
  local l_15_7 = l_0_12.check_dungeon_unlock
  local l_15_8 = l_15_2
  local l_15_9 = l_15_3
  return l_15_7(l_15_8, l_15_9)
end

l_0_1.get_team_target_reward_desc = function(l_16_0)
  local l_16_1, l_16_2 = l_0_13.get_common_award_left_times()
  local l_16_3 = string.format
  local l_16_4 = "<color=%s>%s</color>/%s"
  local l_16_5 = string.get_color_with_cost_info
  local l_16_6 = l_16_1
  local l_16_7 = l_16_2
  l_16_5 = l_16_5(l_16_6, l_16_7, l_16_1 > 0, true)
  l_16_6 = l_16_1
  l_16_7 = l_16_2
  l_16_3 = l_16_3(l_16_4, l_16_5, l_16_6, l_16_7)
  l_16_4 = "\229\165\150\229\138\177\230\172\161\230\149\176:"
  l_16_5 = l_16_3
  l_16_4 = l_16_4 .. l_16_5
  l_16_5 = l_16_3
  return l_16_4, l_16_5
end

l_0_1.get_team_target_icon = function(l_17_0, l_17_1, l_17_2)
  local l_17_3 = l_0_3.get_config(l_17_2)
  local l_17_4 = "Icon/Team"
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    if l_17_3 then
      return l_17_4, l_17_3.banner
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
end

l_0_1.get_team_target_right_desc = function(l_18_0)
  local l_18_1, l_18_2, l_18_3 = l_0_7.get_team_type_target_args()
  local l_18_4 = l_0_7.get_team_target_name
  local l_18_5 = l_18_1
  local l_18_6 = l_18_2
  local l_18_7 = l_18_3
  return l_18_4(l_18_5, l_18_6, l_18_7)
end

l_0_1.get_monster_head_icon = function(l_19_0, l_19_1)
  return "Icon/Team", l_19_1.icon
end

l_0_1.get_battle_win_info = function(l_20_0, l_20_1, l_20_2)
  local l_20_3 = l_0_3.get_config(l_20_2)
  return l_20_3 and l_0_4.get_string(l_20_3.battle_win_info) or "\230\151\160\232\142\183\232\131\156\230\157\161\228\187\182\239\188\140\232\175\183\230\163\128\230\159\165"
end

l_0_1.is_show_down_desc = function(l_21_0)
  return true
end

l_0_1.get_rec_size = function(l_22_0)
  return l_22_0.target_cfg.sub_target[1].max_count
end

l_0_1.get_detail_title = function(l_23_0, l_23_1, l_23_2)
  local l_23_3 = l_0_3.get_config(l_23_2)
  return l_23_3 and l_0_4.get_string(l_23_3.name) or ""
end

l_0_1.get_sub_target_display_reward = function(l_24_0, l_24_1, l_24_2)
  if not l_24_2 then
    return {}
  end
  local l_24_3 = l_0_3.get_config(l_24_2)
  if not l_24_3 or not l_24_3.display_reward then
    return {}
  end
end

l_0_1.check_reward_before_match = function(l_25_0)
  local l_25_1 = l_25_0:get_award_left_times()
  local l_25_2 = l_0_5.is_team_mate_all_robot()
  local l_25_3 = not l_25_2
  return l_25_3, l_25_1 > 0
end

l_0_1.get_start_btn_desc = function(l_26_0)
  return "\229\188\128\229\167\139\230\140\145\230\136\152"
end

l_0_1.get_start_btn_gray_state = function(l_27_0)
  local l_27_1, l_27_2, l_27_3 = l_0_7.get_team_type_target_args()
  local l_27_4, l_27_5, l_27_6 = l_27_0:is_limit(l_27_2, l_27_3)
  if l_27_4 then
     -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

  end
  return true, string.format("%s\229\176\154\230\156\170\229\188\128\229\144\175%s", l_27_6.name, l_0_4.get_string(l_0_3.get_config(l_27_3).name))
end
return false
end

l_0_1.need_fill_member_before_match = function(l_28_0, l_28_1)
  return true, true
end

return l_0_1

