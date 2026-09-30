-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.pvp_2618032798309447470.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.base
local l_0_2 = l_0_0.ways.pvp
local l_0_3 = Game.module.team
local l_0_4 = l_0_3.data
local l_0_5 = l_0_3.network
local l_0_6 = l_0_3.const
local l_0_7 = Game.module.season
local l_0_8 = Game.module.open_func
local l_0_9 = l_0_8.const
local l_0_10 = l_0_7.data
local l_0_11 = l_0_7.const
local l_0_12 = Game.module.data
local l_0_13 = DataConfigs.season_misc
local l_0_14 = DataConfigs.rank_define
local l_0_15 = l_0_14.pvp_not_open_time.val
local l_0_16 = l_0_14.server_open_time_ignore_time_limit.val
local l_0_17 = DataConfigs.team_target
local l_0_18 = DataConfigs.demo_plan
local l_0_19 = DataConfigs.weapon_sit
local l_0_20 = DataConfigs.season_newbie
local l_0_21 = DataConfigs.preset_rank_battle
local l_0_22 = DataConfigs.language_define
local l_0_23 = Game.module.main_view
local l_0_24 = require("game.other.server_time")
local l_0_25 = require("game.other.game_time.init")
local l_0_26 = DataConfigs.character_rating
local l_0_27 = DataConfigs.open_func
local l_0_28 = require("game.module.common_view.manager.confirm")
local l_0_29 = Game.module.common_view
local l_0_30 = (assert(l_0_29.const))
local l_0_31 = nil
local l_0_32 = Game.module.score
local l_0_33 = Game.ui_const
local l_0_34 = Game.module.halloween
l_0_2.init = function(l_1_0)
  l_1_0.target_cfg = l_0_17.get_cfg_by_id(l_0_6.target_main_type.pvp)
end

l_0_2.get_main_bg = function(l_2_0, l_2_1)
  local l_2_2 = l_0_1.get_main_bg(l_2_0, l_2_1)
  if l_0_34.is_open() and l_0_34.is_in_halloween_hour() then
    l_2_2 = "HalloweenBg"
  end
  return l_2_2
end

l_0_2.get_bgm = function(l_3_0)
  return l_0_1.get_bgm(l_3_0)
end

l_0_2.get_team_args = function(l_4_0)
  local l_4_1 = l_0_6.pvp_target_type.match
  return l_4_1, nil
end

l_0_2.get_rank_type = function(l_5_0)
  return require("game.module.rank.manager.const").rank_type.pvp_common
end

l_0_2.get_target_item_desc = function(l_6_0)
  local l_6_1, l_6_2 = l_0_10.get_season_reward_left_times()
  local l_6_3 = string.format("%s/%s", l_6_1, l_6_2)
  return l_0_6.team_target_desc_type.desc, "\231\166\143\232\162\139\229\165\150\229\138\177:", l_6_3, true
end

l_0_2.get_team_target_reward_desc = function(l_7_0)
  local l_7_1 = l_0_10.get_player_info()
  local l_7_2 = l_0_12.get_player()
  local l_7_3, l_7_4 = l_0_10.get_season_reward_left_times()
  local l_7_5 = string.format
  local l_7_6 = "\231\166\143\232\162\139\229\165\150\229\138\177:<color=%s>%s</color>/%s"
  local l_7_7 = string.get_color_with_cost_info
   -- DECOMPILER ERROR: Confused at declaration of local variable

  l_7_7 = l_7_7(l_7_3 or 0, 1, nil, true)
  do
    local l_7_9 = l_7_3 or 0
    if not l_7_4 then
      l_7_5 = l_7_5(l_7_6, l_7_7, l_7_9, 0)
    end
    l_7_6 = ""
    l_7_7 = true
    return l_7_5, l_7_6, l_7_7
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_2.get_start_btn_gray_state = function(l_8_0)
  local l_8_1 = l_8_0:check_need_time_limit()
  local l_8_2 = l_0_24.get_server_time()
  local l_8_3 = l_0_25.get_date_time(l_8_2)
  local l_8_4 = l_8_3.hour
  local l_8_5 = l_8_3.min
  local l_8_6 = l_0_15[1][1]
  local l_8_7 = l_0_15[1][2]
  local l_8_8 = l_0_15[2][1]
  local l_8_9 = l_0_15[2][2]
  local l_8_10 = l_8_6 * 60 + l_8_7
  local l_8_11 = l_8_8 * 60 + l_8_9
  local l_8_12 = l_8_4 * 60 + l_8_5
  if l_8_10 <= l_8_12 and l_8_12 <= l_8_11 and l_8_1 then
    return true, string.format("%s:%s-%s:%s\229\133\179\233\151\173", l_8_6, l_8_7, l_8_8, l_8_9)
  end
  return false
end

l_0_2.check_need_time_limit = function(l_9_0)
  local l_9_1 = l_0_15[1][1]
  local l_9_2 = l_0_15[1][2]
  local l_9_3 = l_0_24.get_server_time()
  local l_9_4 = l_0_25.get_date_time(l_9_3)
  local l_9_5 = os.time
  local l_9_6 = {}
  l_9_6.year = l_9_4.year
  l_9_6.month = l_9_4.month
  l_9_6.day = l_9_4.day
  l_9_6.hour = l_9_1
  l_9_6.min = l_9_2
  l_9_6.sec = 0
  l_9_5 = l_9_5(l_9_6)
  l_9_6 = l_0_24
  l_9_6 = l_9_6.get_server_open_time
  l_9_6 = l_9_6()
  if l_9_5 - (l_0_16 or 24) * 60 * 60 <= l_9_6 then
    return false
  end
  local l_9_7 = l_0_14.pvp_not_open_time_cup.val
  do
    local l_9_8 = l_0_3.data.get_max_newbie_fight_num()
    if l_0_4.is_in_team() then
      local l_9_9 = l_0_4.get_team_info()
      do
        local l_9_10 = l_0_4.get_team_size()
        for l_9_14 = 1, l_9_10 do
          local l_9_15 = l_9_9.members[l_9_14]
          if l_9_15 then
            local l_9_16 = l_0_12.raw_get_player_info(l_9_15.role_id)
             -- DECOMPILER ERROR: Confused at declaration of local variable

            local l_9_18 = not l_9_16 or not l_9_16.season_rank or l_9_7 < l_9_16.season_rank.cup
            if l_9_18 and not l_9_16 or not l_9_16.season_record or l_9_8 <= l_9_16.season_record.battle_num then
              return true
            end
          end
        end
    end
     -- DECOMPILER ERROR: Confused at declaration of local variable

    else
      do
         -- DECOMPILER ERROR: Confused at declaration of local variable

      end
       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

      do
         -- DECOMPILER ERROR: Confused at declaration of local variable

      end
      return (l_9_7 < l_0_10.get_player_info().rank and l_0_10.get_player_info().rank.cup or 0 and not l_0_10.get_player_info() or not l_0_10.get_player_info().fight_num or l_9_8 <= l_0_10.get_player_info().fight_num)
    end
    return false
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_2.get_start_btn_desc = function(l_10_0)
  return "\230\142\146\228\189\141\229\175\185\230\136\152"
end

l_0_2.get_team_target_right_desc = function(l_11_0)
  local l_11_1 = l_0_4.is_using_demo_plan()
  if l_11_1 then
    local l_11_2 = l_0_4.get_demo_plan_id()
    local l_11_3 = l_0_18.get_config(l_11_2)
    local l_11_4 = l_11_3.type
    local l_11_5 = l_0_19.get_cfg_by_id(l_11_4)
    local l_11_6 = string.format
    local l_11_7 = "\230\181\129\230\180\190\232\175\149\231\142\169\239\188\154%s"
    local l_11_8, l_11_9, l_11_10, l_11_11, l_11_12, l_11_13, l_11_14, l_11_15, l_11_16, l_11_17, l_11_18, l_11_19 = l_0_22.get_string(l_11_5.name)
    return l_11_6(l_11_7, l_11_8, l_11_9, l_11_10, l_11_11, l_11_12, l_11_13, l_11_14, l_11_15, l_11_16, l_11_17, l_11_18, l_11_19)
  end
  local l_11_20 = l_11_0:check_need_time_limit()
  local l_11_21 = l_0_24.get_server_time()
  local l_11_22 = l_0_25.get_date_time(l_11_21)
  local l_11_23 = l_11_22.hour
  local l_11_24 = l_11_22.min
  local l_11_25 = l_0_15[1][1]
  local l_11_26 = l_0_15[1][2]
  local l_11_27 = l_0_15[2][1]
  local l_11_28 = l_0_15[2][2]
  local l_11_29 = l_11_25 * 60 + l_11_26
  local l_11_30 = l_11_27 * 60 + l_11_28
  local l_11_31 = l_11_23 * 60 + l_11_24
  if l_11_29 <= l_11_31 and l_11_31 <= l_11_30 and l_11_20 then
    local l_11_32 = string.format
    local l_11_33 = "%s:%s-%s:%s\229\133\179\233\151\173"
    local l_11_34 = l_11_25
    local l_11_35 = l_11_26
    local l_11_36 = l_11_27
    local l_11_37, l_11_43 = l_11_28
    return l_11_32(l_11_33, l_11_34, l_11_35, l_11_36, l_11_37)
  end
  local l_11_38 = l_0_10.get_player_info(l_0_11.season_type.common)
  local l_11_39 = l_11_38.continuity_win_num
  if not l_11_39 or l_11_39 == 0 then
    return ""
  end
  local l_11_40 = string.format
  local l_11_41 = "%s\232\191\158\232\131\156"
  local l_11_42 = l_11_39
  return l_11_40(l_11_41, l_11_42)
end

l_0_2.get_sub_target_display_reward = function(l_12_0)
  local l_12_1 = l_0_10.get_player_info()
  local l_12_2 = l_0_12.get_player()
  local l_12_3 = l_0_20.get_cfg_by_num_and_lv(l_12_1.fight_num + 1, l_12_2.level)
  do
    local l_12_4 = {}
    if not l_12_3 then
      l_12_4 = l_0_10.get_rank_daily_reward()
    else
      local l_12_5 = l_0_21.get_cfg_by_id(l_12_3.preset_id)
      l_12_4 = clone(l_12_5.reward)
      local l_12_6 = table.insert
      local l_12_7 = l_12_4
      local l_12_8 = {}
       -- DECOMPILER ERROR: No list found. Setlist fails

      l_12_6(l_12_7, l_12_8)
    end
    return l_12_4
  end
   -- Warning: undefined locals caused missing assignments!
end

l_0_2.get_main_target_display_reward = function(l_13_0)
  local l_13_1 = l_13_0:get_sub_target_display_reward()
  for l_13_5,l_13_6 in ipairs(l_13_1) do
    l_13_1[l_13_5][2] = 1
  end
  return l_13_1
end

l_0_2.has_sub_target = function(l_14_0)
  return false
end

l_0_2.could_turn_to_this_target = function(l_15_0, l_15_1, l_15_2)
  if l_15_0:__in_the_same_team_target() then
    l_15_2(true)
    l_0_23.show_sub_panel("team")
    return 
  end
  if not l_0_4.is_in_team() then
    if l_15_0.target_cfg.is_public == 1 then
      l_0_5.team_create_c2s(l_15_0.target_cfg.id, l_15_1.sub_team_target)
    end
    l_15_2(true)
    return 
  end
  if l_0_4.is_team_matching() then
    local l_15_3 = l_0_17.get_cfg_by_id(l_0_6.target_main_type.pvp)
    local l_15_4 = l_0_22.get_string(l_15_3.name)
    BroadcastTips.broadcast_tips(string.format("\230\130\168\229\183\178\229\156\168\229\140\185\233\133\141\228\184\173\239\188\140\230\151\160\230\179\149\229\137\141\229\190\128%s", l_15_4))
    l_15_2(false)
    return 
  end
  local l_15_5 = l_0_4.is_team_captain()
  if l_15_5 then
    l_15_2(true)
    return 
  end
  local l_15_6 = require("game.module.common_view.manager.confirm")
  local l_15_7 = Game.module.data.get_player_id()
  local l_15_8 = l_0_4.is_team_captain(l_15_7)
  local l_15_9 = Game.module.common_view.const
  local l_15_10 = l_15_6.confirm
  local l_15_11 = {}
  l_15_11.content = "\229\189\147\229\137\141\228\189\141\228\186\142\233\152\159\228\188\141\228\184\173\239\188\140\230\152\175\229\144\166\233\128\128\229\135\186\233\152\159\228\188\141\229\185\182\233\128\137\230\139\169\232\175\165\231\142\169\230\179\149\239\188\159"
  l_15_11.sure_click = function()
    l_0_4.set_alone_type_target_args(l_15_1.team_target, l_15_1.sub_team_target, l_15_1.team_args)
    l_0_4.set_value("skip_quit_team_target_set", true)
    l_0_5.team_quit_c2s()
    Game.module.main_view.show_sub_panel("team")
   end
  l_15_11.cancel_click = function()
    l_15_2(false)
   end
  l_15_11.close_click = function()
    l_15_2(false)
   end
  l_15_10(l_15_11)
end

l_0_2.__in_the_same_team_target = function(l_16_0)
  local l_16_1, l_16_2, l_16_3 = l_0_4.get_team_type_target_args()
  local l_16_4 = l_16_0:get_team_args()
  return l_16_1 == l_0_6.target_main_type.pvp and l_16_2 == l_16_4
end

l_0_2.get_confirm_btn_desc = function(l_17_0)
  if l_17_0:__in_the_same_team_target() then
    return "\229\155\158\229\136\176\233\152\159\228\188\141"
  end
  return "\229\136\155\229\187\186\230\136\191\233\151\180"
end

l_0_2.need_fair_tips = function(l_18_0)
  return true
end

l_0_2.check_match_time_before_match = function(l_19_0)
  local l_19_1 = l_0_3.data.get_max_newbie_fight_num()
  local l_19_2 = l_0_10.get_player_info()
  do
    local l_19_3 = l_19_2.rank and l_19_2.rank.cup or 0
  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

  if not not l_19_2 or not l_19_2.fight_num or l_19_1 <= l_19_2.fight_num then
    return false
  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_0_14.lang_match_time_range.val[1][1] * 60 + l_0_14.lang_match_time_range.val[1][2] <= l_0_25.get_date_time(l_0_24.get_server_time()).hour * 60 + l_0_25.get_date_time(l_0_24.get_server_time()).min and l_0_25.get_date_time(l_0_24.get_server_time()).hour * 60 + l_0_25.get_date_time(l_0_24.get_server_time()).min <= l_0_14.lang_match_time_range.val[2][1] * 60 + l_0_14.lang_match_time_range.val[2][2] then
      return true
    end
    return false
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_2.check_match_long_time_mention = function(l_20_0)
  return "\229\183\178\230\137\169\229\164\167\229\140\185\233\133\141\232\140\131\229\155\180\239\188\140\229\176\134\228\184\186\230\130\168\228\188\152\229\133\136\229\175\187\230\137\190\229\175\185\229\177\128"
end

l_0_2.get_is_show_attr_button = function(l_21_0, l_21_1)
  local l_21_2 = Game.module.season.is_show_balance
  return l_21_2()
end

local l_0_35 = function(l_22_0, l_22_1)
  return l_22_0.sequence < l_22_1.sequence
end

l_0_2.check_start_match = function(l_23_0, l_23_1, l_23_2, l_23_3)
  if not l_0_8.is_open(l_0_9.type.char_rating_check) then
    return true
  end
  if l_0_4.is_using_demo_plan() then
    return true
  end
  local l_23_4 = {}
  do
    local l_23_5 = {}
    for l_23_9,l_23_10 in ipairs(l_0_26.get_configs()) do
      if l_23_10.is_pvp_suggest == 1 then
        local l_23_11 = l_23_10.condition
        local l_23_12 = true
        if l_23_11 and l_23_11[1] == 2 then
          local l_23_13 = l_23_11[2]
          l_23_12 = l_0_8.is_server_day_open(l_23_13)
        end
        if l_23_12 then
          local l_23_14, l_23_15 = l_0_32.get_rating_by_type(l_23_10.id)
          local l_23_16 = nil
          if l_23_10.type == 2 then
            l_23_16, l_23_15 = l_0_32.get_recommend_score(l_23_10)
          end
          if l_23_14 == 0 then
            table.insert(l_23_4, l_23_10)
            for l_23_9,l_23_10 in l_23_6 do
            end
            if l_23_14 < l_23_15 * 0.1 then
              table.insert(l_23_5, l_23_10)
            end
          end
        end
      end
      if not next(l_23_4) and not next(l_23_5) then
        return true
      end
      if next(l_23_4) then
        table.sort(l_23_4, l_0_35)
      end
      if next(l_23_5) then
        table.sort(l_23_5, l_0_35)
      end
      if not l_0_31 then
        upvalue_3072 = require("game.module.team.view.item.character_rating_custom_item")
      end
      local l_23_17, l_23_18 = nil, nil
      if next(l_23_4) then
        l_23_17 = "\230\163\128\230\181\139\229\136\176\230\130\168\229\176\154\230\156\170\230\191\128\230\180\187\229\166\130\228\184\139\229\133\187\230\136\144\239\188\140\230\151\160\230\179\149\228\189\191\231\148\168\229\175\185\229\186\148\231\179\187\231\187\159\231\139\172\230\156\137\230\136\152\230\150\151\230\156\186\229\136\182\239\188\140\230\152\175\229\144\166\231\187\167\231\187\173\229\140\185\233\133\141\239\188\159"
        l_23_18 = l_23_4
      else
        l_23_17 = "\230\163\128\230\181\139\229\136\176\230\130\168\229\166\130\228\184\139\229\133\187\230\136\144\229\164\167\229\185\133\232\144\189\229\144\142\239\188\140\229\175\185\229\186\148\231\179\187\231\187\159\231\139\172\230\156\137\230\136\152\230\150\151\230\156\186\229\136\182\229\143\175\232\131\189\230\151\160\230\179\149\231\148\159\230\149\136\239\188\140\230\152\175\229\144\166\231\187\167\231\187\173\229\140\185\233\133\141\239\188\159"
        l_23_18 = l_23_5
      end
      local l_23_19 = {}
      l_23_19.content = l_23_17
      l_23_19.item_cls = l_0_31
      l_23_19.item_list = l_23_18
      l_23_19.sure_label = "\231\187\167\231\187\173"
      l_23_19.sure_click = function()
      if l_23_3 then
        l_23_3()
      end
      end
      l_23_19.layer = l_0_33.sorting_layer_type.NormalView
      l_23_19.toggle_tips = "\228\187\138\230\151\165\228\184\141\229\134\141\230\143\144\231\164\186"
      l_23_19.toggle_key = "pvp_cha_rating_check"
      l_23_19.cur_day = true
      l_23_19.toggle_item_pos_y = -30
      do
        local l_23_20 = l_0_28.check_show_confirm(l_23_19)
        if l_23_20 then
          l_0_28.confirm_with_custom_list(l_23_19)
        end
      end
      return not l_23_20
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_2.get_detail_info = function(l_24_0)
  local l_24_1 = l_0_10.get_player_info()
  local l_24_2 = l_0_12.get_player()
  local l_24_3 = l_0_20.get_cfg_by_num_and_lv(l_24_1.fight_num + 1, l_24_2.level)
  if l_24_3 then
    return 
  end
  local l_24_4 = {}
  local l_24_5 = l_0_10.get_rank_reward_info()
  if not next(l_24_5) then
    return 
  end
  local l_24_6 = table.insert
  local l_24_7 = l_24_4
  local l_24_8 = {}
  l_24_8.title = "\229\155\186\229\174\154\229\165\150\229\138\177"
  l_24_8.desc = "\233\171\152\233\162\157\229\165\150\229\138\177\229\174\140\230\136\144\229\144\142\230\175\143\229\156\186\229\155\186\229\174\154\232\142\183\229\143\150"
  l_24_8.hint = "rank_reward_rule1"
  l_24_8.reward = l_24_5[1]
  l_24_6(l_24_7, l_24_8)
  l_24_6 = l_0_10
  l_24_6 = l_24_6.get_season_reward_left_times
  l_24_6 = l_24_6()
  l_24_8 = string
  l_24_8 = l_24_8.format
  local l_24_9 = "\230\175\143\229\156\186\230\136\152\230\150\151\229\143\175\233\162\134\229\143\150:<color=%s>%s</color>/%s"
  local l_24_10 = string.get_color_with_cost_info
   -- DECOMPILER ERROR: Confused at declaration of local variable

  l_24_10 = l_24_10(l_24_6 or 0, 1, nil)
  do
    local l_24_12 = l_24_6 or 0
    if not l_24_7 then
      l_24_8 = l_24_8(l_24_9, l_24_10, l_24_12, 0)
    end
    l_24_9 = table
    l_24_9 = l_24_9.insert
    l_24_10 = l_24_4
    l_24_12 = {title = "\230\175\143\230\151\165\233\171\152\233\162\157\229\165\150\229\138\177", desc = l_24_8, hint = "rank_reward_rule2", reward = l_24_5[2]}
    l_24_9(l_24_10, l_24_12)
    return l_24_4
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_2.is_check_camp_before_match = function(l_25_0)
  return true
end

return l_0_2

