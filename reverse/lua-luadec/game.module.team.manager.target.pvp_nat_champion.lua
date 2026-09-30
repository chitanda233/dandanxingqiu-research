-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.pvp_nat_champion_774257338760555916.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.pvp_nat_champion
local l_0_2 = l_0_0.ways.base
local l_0_3 = DataConfigs.team_target
local l_0_4 = Game.module.team
local l_0_5 = l_0_4.data
local l_0_6 = l_0_4.const
local l_0_7 = l_0_4.network
local l_0_8 = Game.ui_manager
local l_0_9 = BroadcastTips
local l_0_10 = Game.module.nat_champ
local l_0_11 = l_0_10.data
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_3.get_cfg_by_id(l_0_6.target_main_type.nat_champion)
end

l_0_1.get_left_btn_content = function(l_2_0)
  return "\230\181\183\233\128\137\230\168\161\229\188\143"
end

l_0_1.get_start_btn_desc = function(l_3_0, l_3_1)
  return "\229\188\128\229\167\139\229\140\185\233\133\141"
end

l_0_1.get_start_btn_gray_state = function(l_4_0, l_4_1)
  local l_4_2, l_4_3 = l_0_10.is_can_start_qualifier_stage_fighting()
  if not l_4_2 then
    return true, l_4_3, false
  end
  return false, nil, not l_4_2
end

l_0_1.get_team_target_right_desc = function(l_5_0, l_5_1)
  return ""
end

l_0_1.has_sub_target = function(l_6_0, l_6_1, l_6_2)
  return false
end

l_0_1.get_room_open_invite_args = function(l_7_0, l_7_1)
  local l_7_2 = {}
  l_7_2.only_show_invite_page = true
  l_7_2.invite_relation_source = l_0_6.relation_source.nat_champ_team_invite_fight
  return l_7_2
end

l_0_1.on_invite_role = function(l_8_0, l_8_1)
  print("\233\130\128\232\175\183\229\133\165\233\152\159", l_8_1)
  l_0_7.team_invite_c2s(l_8_1)
end

l_0_1.get_target_item_desc = function(l_9_0, l_9_1, l_9_2)
  local l_9_3 = "\230\181\183\233\128\137\232\181\155"
  local l_9_4 = l_0_6.team_target_desc_type.tips
  local l_9_5 = (string.format("\232\191\155\232\161\140\228\184\173\232\181\155\228\186\139:<color=#404040>%s</color>", l_9_3))
  local l_9_6 = nil
  local l_9_7 = true
  return l_9_4, l_9_5, l_9_6, l_9_7
end

l_0_1.get_sub_target_rank_click_handler = function(l_10_0)
  return function()
    l_0_8.open_view("NatChampTeamRankView")
   end
end

l_0_1.get_sub_target_is_hide_join = function(l_11_0, l_11_1, l_11_2)
  return true
end

l_0_1.get_sub_target_is_hide_reward = function(l_12_0, l_12_1, l_12_2)
  return true
end

l_0_1.get_confirm_btn_desc = function(l_13_0)
  if l_13_0:__in_the_same_team_target() then
    return "\229\155\158\229\136\176\233\152\159\228\188\141"
  end
  return "\229\136\155\229\187\186\233\152\159\228\188\141"
end

l_0_1.__in_the_same_team_target = function(l_14_0)
  local l_14_1, l_14_2, l_14_3 = l_0_5.get_team_type_target_args()
  return l_14_1 == l_0_6.target_main_type.nat_champion
end

l_0_1.could_turn_to_this_target = function(l_15_0, l_15_1, l_15_2)
  if not l_0_11.is_nat_champ_signup_success() then
    l_0_9.broadcast_tips("\232\175\183\229\133\136\230\138\165\229\144\141\229\133\168\229\155\189\233\148\166\230\160\135\232\181\155")
    l_15_2(false)
    return 
  end
  if not l_0_11.is_have_nat_champ_team() then
    l_0_9.broadcast_tips("\232\175\183\229\133\136\231\187\132\229\187\186/\229\138\160\229\133\165\230\136\152\233\152\159")
    l_15_2(false)
    return 
  end
  local l_15_3 = l_0_2.could_turn_to_this_target
  local l_15_4 = l_15_0
  local l_15_5 = l_15_1
  local l_15_6 = l_15_2
  return l_15_3(l_15_4, l_15_5, l_15_6)
end

l_0_1.is_team_type_open = function(l_16_0)
  if not l_0_11.is_have_nat_champ_team() then
    return false
  end
  if l_0_11.is_open_qualifier_stage() then
    return true
  end
  return false
end

l_0_1.get_target_entrance_click_handler = function(l_17_0)
  return l_0_10.on_choose_for_entrance_team_target
end

l_0_1.get_main_bg = function(l_18_0)
  return "NationalChampionshipBg"
end

l_0_1.get_target_item_lock_stats = function(l_19_0)
  return false, true, nil
end

l_0_1.is_show_join_room_btn = function(l_20_0, l_20_1)
  return false
end

l_0_1.get_bgm = function(l_21_0)
  return "BattleBgm32"
end

l_0_1.is_check_camp_before_match = function(l_22_0)
  return false
end

return l_0_1

