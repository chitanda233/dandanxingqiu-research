-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.pve_material_-9187211700753863828.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.pve_material
local l_0_2 = l_0_0.ways.base
local l_0_3 = Game.module.dungeon_material
local l_0_4 = l_0_3.data
local l_0_5 = Game.module.data
local l_0_6 = Game.module.team
local l_0_7 = l_0_6.data
local l_0_8 = assert(l_0_6.const)
local l_0_9 = Game.module.month_card
local l_0_10 = Game.module.open_func
local l_0_11 = DataConfigs.team_target
local l_0_12 = DataConfigs.dungeon_material_series
local l_0_13 = DataConfigs.language_define
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_11.get_cfg_by_id(l_0_8.target_main_type.pve_material)
end

l_0_1.get_target_list = function(l_2_0)
  local l_2_1 = {}
  for l_2_5,l_2_6 in pairs(l_2_0.target_cfg.sub_target) do
    local l_2_7 = l_0_12.get_config(l_2_6.series_id)
    local l_2_8 = {}
    l_2_8.cfg = l_2_7
    l_2_8.target_id = l_2_0.target_cfg.id
    l_2_8.id = l_2_6.id
    l_2_8.name = l_2_6.name
    l_2_8.display_reward = l_2_7.display_reward
    table.insert(l_2_1, l_2_8)
  end
  table.sort(l_2_1, function(l_1_0, l_1_1)
    return l_1_0.id < l_1_1.id
   end)
  return l_2_1
end

l_0_1.is_team_target_open = function(l_3_0, l_3_1, l_3_2, l_3_3)
  local l_3_4 = l_3_0.target_cfg
  if l_3_4.is_open == 0 then
    return false
  end
  if not l_3_3 then
    l_3_3 = l_0_5.get_player_id()
  end
  local l_3_5 = l_0_5.raw_get_player_info(l_3_3)
  if not l_3_5 then
    return false
  end
  local l_3_6 = l_0_11.get_cfg_by_type_target(l_3_4.id, l_3_1)
  if l_3_6.open_func and not l_0_5.is_role_cross_func_open(l_3_5.role_id, l_3_6.open_func) and l_3_6.no_open_desc then
    return false, l_0_13.get_string(l_3_6.no_open_desc)
  end
  local l_3_7 = l_3_0.target_cfg.sub_target[l_3_1]
  local l_3_8, l_3_9, l_3_10 = l_0_3.check_series_unlock(l_3_7.series_id, l_3_2, l_3_3)
  return l_3_8, l_0_3.get_lock_tips(l_3_9, l_3_10)
end

l_0_1.can_get_concentric = function(l_4_0, l_4_1)
  local l_4_2 = l_4_0.target_cfg.sub_target[l_4_1]
  if not l_4_2 then
    return false
  end
  local l_4_3, l_4_4 = l_0_4.get_award_left_times(l_4_2.series_id)
  if l_4_3 == 0 then
    local l_4_5 = not l_0_2.is_max_concentric()
  else
    return false
  end
end

l_0_1.get_sub_target_item_lock_stats = function(l_5_0, l_5_1, l_5_2)
  local l_5_3 = l_0_5.get_player_id()
  local l_5_4 = false
  local l_5_5 = false
  local l_5_6 = nil
  local l_5_7 = l_0_7.get_team_info()
  if l_5_7 then
    table.sort(l_5_7.members, l_0_7.member_sort_func)
    for l_5_11,l_5_12 in ipairs(l_5_7.members) do
      if not l_5_12.is_robot or l_5_12.is_robot ~= 1 then
        l_5_4, l_5_5, l_5_6 = l_5_0:get_sub_target_item_lock_stats_by_role(l_5_1, l_5_2, l_5_12.role_id)
         -- DECOMPILER ERROR: unhandled construct in 'if'

        if not l_5_5 and l_5_12.role_id ~= l_5_3 then
          l_5_6 = string.format("\233\152\159\229\145\152<color=#feab46>%s</color>\229\176\154\230\156\170\232\167\163\233\148\129\230\156\172\231\142\169\230\179\149", l_5_12.role_name)
      else
        end
      end
    else
      l_5_4, l_5_5, l_5_6 = l_5_0:get_sub_target_item_lock_stats_by_role(l_5_1, l_5_2, l_5_3)
    end
  end
end
return l_5_4, l_5_5, l_5_6
end

l_0_1.get_sub_target_item_lock_stats_by_role = function(l_6_0, l_6_1, l_6_2, l_6_3)
  local l_6_4, l_6_5 = l_6_0:is_team_target_open(l_6_1, l_6_2, l_6_3)
  return true, l_6_4, l_6_5
end

l_0_1.get_team_target_icon = function(l_7_0, l_7_1)
  return "Icon/Team", l_0_12.get_config(l_7_0.target_cfg.sub_target[l_7_1].series_id).banner
end

l_0_1.get_target_desc = function(l_8_0, l_8_1)
  local l_8_2 = l_0_12.get_config(l_8_1.series_id)
  local l_8_3 = l_0_13.get_string
  local l_8_4 = l_8_2.battle_info
  return l_8_3(l_8_4)
end

l_0_1.get_battle_win_info = function(l_9_0, l_9_1, l_9_2)
  local l_9_3 = l_0_12.get_config(l_9_1.series_id)
  return l_9_3 and l_0_13.get_string(l_9_3.battle_win_info) or "\230\151\160\232\142\183\232\131\156\230\157\161\228\187\182\239\188\140\232\175\183\230\163\128\230\159\165"
end

l_0_1.get_sub_target_display_reward = function(l_10_0, l_10_1)
  local l_10_2 = l_0_12.get_config(l_10_1.series_id)
  if not l_10_2 or not l_10_2.display_reward then
    return {}
  end
end

l_0_1.get_start_btn_desc = function(l_11_0)
  return "\229\188\128\229\167\139\230\140\145\230\136\152"
end

l_0_1.get_target_item_desc = function(l_12_0, l_12_1, l_12_2)
  local l_12_3 = l_12_0.target_cfg.sub_target[l_12_1]
  local l_12_4 = l_12_3.series_id
  local l_12_5 = l_0_4.get_has_first_reward(l_12_4)
  local l_12_6 = l_0_3.is_heroic_type_by_series_id(l_12_4)
  if l_12_5 and not l_12_6 then
    return l_0_8.team_target_desc_type.tips, "\233\154\190\229\186\166\233\166\150\233\128\154\228\184\141\230\182\136\232\128\151\230\172\161\230\149\176"
  else
    if l_0_9.is_have_free_cnt_to_risk_pve_privilege() and not l_12_6 then
      return l_0_8.team_target_desc_type.tips, "\230\156\136\229\141\161\231\137\185\230\157\131:\228\184\141\230\182\136\232\128\151\230\172\161\230\149\176"
    else
      local l_12_7, l_12_8 = l_0_4.get_award_left_times(l_12_4)
      local l_12_9 = string.format
      local l_12_10 = "<color=%s>%s</color>/%s"
      local l_12_11 = string.get_color_with_cost_info
      local l_12_12 = l_12_7
      local l_12_13 = l_12_8
      l_12_11 = l_12_11(l_12_12, l_12_13, l_12_7 > 0, true)
      l_12_12 = l_12_7
      l_12_13 = l_12_8
      l_12_9 = l_12_9(l_12_10, l_12_11, l_12_12, l_12_13)
      l_12_10 = l_0_8
      l_12_10 = l_12_10.team_target_desc_type
      l_12_10 = l_12_10.desc
      l_12_11 = string
      l_12_11 = l_12_11.format
      l_12_12 = "\229\165\150\229\138\177\230\172\161\230\149\176:%s"
      l_12_13 = l_12_9
      l_12_11 = l_12_11(l_12_12, l_12_13)
      return l_12_10, l_12_11, l_12_12, l_12_13
    end
  end
end

l_0_1.get_team_target_reward_desc = function(l_13_0)
  local l_13_1, l_13_2 = l_0_3.get_total_reward_count_and_max(l_13_0.target_cfg.sub_target)
  local l_13_3 = string.format
  local l_13_4 = "<color=%s>%s</color>/%s"
  local l_13_5 = string.get_color_with_cost_info
  local l_13_6 = l_13_1
  local l_13_7 = l_13_2
  local l_13_11 = l_13_1 > 0
  l_13_5 = l_13_5(l_13_6, l_13_7, l_13_11, true)
  l_13_6 = l_13_1
  l_13_7 = l_13_2
  l_13_3 = l_13_3(l_13_4, l_13_5, l_13_6, l_13_7)
  l_13_4 = string
  l_13_4 = l_13_4.format
  l_13_5 = "\229\165\150\229\138\177\230\172\161\230\149\176:%s"
  l_13_6 = l_13_3
  return l_13_4(l_13_5, l_13_6)
end

l_0_1.get_team_target_left_desc = function(l_14_0)
  local l_14_1, l_14_2, l_14_3 = l_0_7.get_team_type_target_args()
  local l_14_4 = l_0_7.get_team_target_name
  local l_14_5 = l_14_1
  local l_14_6 = l_14_2
  local l_14_7 = l_14_3
  return l_14_4(l_14_5, l_14_6, l_14_7)
end

l_0_1.get_team_target_right_desc = function(l_15_0, l_15_1, l_15_2)
  if not l_15_1 then
    local l_15_3, l_15_4, l_15_6, l_15_7 = l_0_7.get_team_type_target_args()
    l_15_7 = l_15_0.target_cfg
    l_15_7 = l_15_7.sub_target
    l_15_1 = l_15_7[l_15_4]
  end
  local l_15_5 = l_15_1.series_id
  local l_15_8 = l_0_4.get_has_first_reward(l_15_5)
  if l_15_8 and not l_0_3.is_heroic_type_by_series_id(l_15_5) then
    return "<size=30>\233\154\190\229\186\166\233\166\150\233\128\154\228\184\141\230\182\136\232\128\151\230\172\161\230\149\176</size>", nil, true
  else
    if l_0_9.is_have_free_cnt_to_risk_pve_privilege() and not l_0_3.is_heroic_type_by_series_id(l_15_5) then
      return "<size=30>\230\156\136\229\141\161\231\137\185\230\157\131:\228\184\141\230\182\136\232\128\151\230\172\161\230\149\176</size>", nil, true
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

      else
        return (string.format("<size=30>\229\165\150\229\138\177\230\172\161\230\149\176:%s</size>", string.format("<color=%s>%s</color>/%s", string.get_color_with_cost_info(l_0_4.get_award_left_times(l_15_5), , l_0_4.get_award_left_times(l_15_5) > 0, true), l_0_4.get_award_left_times(l_15_5), ))), nil, l_0_4.get_award_left_times(l_15_5) > 0
      end
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
  end
end

l_0_1.is_player_limit = function(l_16_0, l_16_1, l_16_2, l_16_3)
  local l_16_4 = l_16_0.target_cfg.sub_target[l_16_1]
  if l_16_3 == l_0_5.get_player_id() and l_16_4 then
    return not l_0_3.check_series_unlock(l_16_4.series_id), "\231\142\169\230\179\149\230\156\170\229\188\128\229\144\175\239\188\140\230\151\160\230\179\149\229\135\134\229\164\135"
  end
  return false
end

l_0_1.check_reward_before_match = function(l_17_0)
  local l_17_1, l_17_2, l_17_3 = l_0_7.get_team_type_target_args()
  local l_17_4 = l_17_0.target_cfg.sub_target[l_17_2]
  local l_17_5 = l_17_4.series_id
  local l_17_6 = l_0_6.is_team_mate_all_robot()
  local l_17_7 = l_0_4.get_has_first_reward(l_17_5)
  local l_17_8 = l_0_3.is_heroic_type_by_series_id(l_17_5)
  if l_17_7 and not l_17_8 then
    return not l_17_6, true
  end
  if l_0_9.is_have_free_cnt_to_risk_pve_privilege() and not l_17_8 then
    return not l_17_6, true
  end
  local l_17_9, l_17_10 = l_0_4.get_award_left_times(l_17_5)
  local l_17_11 = not l_17_6
  return l_17_11, l_17_9 > 0
end

l_0_1.open_detail_view = function(l_18_0, l_18_1, l_18_2, l_18_3)
  local l_18_4 = l_18_0.target_cfg.sub_target[l_18_2]
  local l_18_5 = Game.ui_manager.open_view
  local l_18_6 = "DungeonMaterialInfoView"
  local l_18_7 = {}
  l_18_7.series_id = l_18_4.series_id
  l_18_5(l_18_6, l_18_7)
end

l_0_1.can_join_other_team = function(l_19_0, l_19_1, l_19_2)
  do
    local l_19_3 = l_0_11.get_cfg_by_type_target(l_0_8.target_main_type.pve_material, l_19_1)
    return l_19_3
  end
   -- Warning: undefined locals caused missing assignments!
end

l_0_1.need_fill_member_before_match = function(l_20_0, l_20_1)
  return true, true
end

return l_0_1

