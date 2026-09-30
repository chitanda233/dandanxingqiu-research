-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.pvp_season_league_-2436430337016446828.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.pvp_season_league
local l_0_2 = l_0_0.ways.base
local l_0_3 = DataConfigs.team_target
local l_0_4 = Game.module.team
local l_0_5 = l_0_4.data
local l_0_6 = l_0_4.const
local l_0_7 = l_0_4.network
local l_0_8 = Game.ui_manager
local l_0_9 = BroadcastTips
local l_0_10 = Game.module.season_league
local l_0_11 = l_0_10.data
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_3.get_cfg_by_id(l_0_6.target_main_type.pvp_season_league)
end

l_0_1.get_left_btn_content = function(l_2_0)
  return "\229\183\133\229\179\176\232\129\148\232\181\155"
end

l_0_1.get_team_target_left_desc = function(l_3_0)
  return "\230\136\152\233\152\159\231\167\175\229\136\134\232\181\155", "", false
end

l_0_1.get_start_btn_desc = function(l_4_0, l_4_1)
  return "\229\188\128\229\167\139\229\140\185\233\133\141"
end

l_0_1.get_start_btn_gray_state = function(l_5_0, l_5_1)
  local l_5_2, l_5_3 = l_0_10.is_can_start_qualifier_stage_fighting()
  if not l_5_2 then
    return true, l_5_3, false
  end
  return false, nil, not l_5_2
end

l_0_1.get_team_target_right_desc = function(l_6_0, l_6_1)
  return ""
end

l_0_1.has_sub_target = function(l_7_0, l_7_1, l_7_2)
  return false
end

l_0_1.get_room_open_invite_args = function(l_8_0, l_8_1)
  local l_8_2 = {}
  l_8_2.only_show_invite_page = true
  l_8_2.invite_relation_source = l_0_6.relation_source.season_league_team_invite_fight
  return l_8_2
end

l_0_1.on_invite_role = function(l_9_0, l_9_1)
  print("\233\130\128\232\175\183\229\133\165\233\152\159", l_9_1)
  l_0_7.team_invite_c2s(l_9_1)
end

l_0_1.get_target_item_desc = function(l_10_0, l_10_1, l_10_2)
  local l_10_3 = "\231\167\175\229\136\134\232\181\155"
  local l_10_4 = l_0_6.team_target_desc_type.tips
  local l_10_5 = (string.format("\232\191\155\232\161\140\228\184\173\232\181\155\228\186\139:<color=#404040>%s</color>", l_10_3))
  local l_10_6 = nil
  local l_10_7 = true
  return l_10_4, l_10_5, l_10_6, l_10_7
end

l_0_1.get_sub_target_rank_click_handler = function(l_11_0)
  return function()
    l_0_8.open_view("SeasonLeagueTeamRankView")
   end
end

l_0_1.get_sub_target_is_hide_join = function(l_12_0, l_12_1, l_12_2)
  return true
end

l_0_1.get_sub_target_is_hide_reward = function(l_13_0, l_13_1, l_13_2)
  return true
end

l_0_1.get_confirm_btn_desc = function(l_14_0)
  if l_14_0:__in_the_same_team_target() then
    return "\229\155\158\229\136\176\233\152\159\228\188\141"
  end
  return "\229\136\155\229\187\186\233\152\159\228\188\141"
end

l_0_1.__in_the_same_team_target = function(l_15_0)
  local l_15_1, l_15_2, l_15_3 = l_0_5.get_team_type_target_args()
  return l_15_1 == l_0_6.target_main_type.pvp_season_league
end

l_0_1.could_turn_to_this_target = function(l_16_0, l_16_1, l_16_2)
  if not l_0_11.is_nat_champ_signup_success() then
    l_0_9.broadcast_tips("\232\175\183\229\133\136\230\138\165\229\144\141\229\183\133\229\179\176\232\129\148\232\181\155")
    l_16_2(false)
    return 
  end
  if not l_0_11.is_have_nat_champ_team() then
    l_0_9.broadcast_tips("\232\175\183\229\133\136\231\187\132\229\187\186/\229\138\160\229\133\165\230\136\152\233\152\159")
    l_16_2(false)
    return 
  end
  local l_16_3 = l_0_2.could_turn_to_this_target
  local l_16_4 = l_16_0
  local l_16_5 = l_16_1
  local l_16_6 = l_16_2
  return l_16_3(l_16_4, l_16_5, l_16_6)
end

l_0_1.is_team_type_open = function(l_17_0)
  if not l_0_11.is_have_nat_champ_team() then
    return false
  end
  if l_0_11.is_open_qualifier_stage() then
    return true
  end
  return false
end

l_0_1.get_target_entrance_click_handler = function(l_18_0)
  return l_0_10.on_choose_for_entrance_team_target
end

l_0_1.get_main_bg = function(l_19_0)
  return "PvpSeasonLeagueBg"
end

l_0_1.get_target_item_lock_stats = function(l_20_0)
  return false, true, nil
end

l_0_1.is_show_join_room_btn = function(l_21_0, l_21_1)
  return false
end

l_0_1.get_bgm = function(l_22_0)
  return "BattleBgm32"
end

l_0_1.is_check_camp_before_match = function(l_23_0)
  return false
end

return l_0_1

