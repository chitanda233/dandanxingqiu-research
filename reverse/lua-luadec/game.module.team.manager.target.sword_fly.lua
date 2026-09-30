-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.sword_fly_-3704134022514061780.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.sword_fly
local l_0_2 = l_0_0.ways.base
local l_0_3 = DataConfigs.team_target
local l_0_4 = Game.module.team
local l_0_5 = l_0_4.data
local l_0_6 = l_0_4.const
local l_0_7 = l_0_4.network
local l_0_8 = DataConfigs.language_define
local l_0_9 = Game.module.activity
local l_0_10 = l_0_9.data
local l_0_11 = l_0_9.const
local l_0_12 = require("game.other.game_time.init")
local l_0_13 = Game.module.red_cat_blue_rabbit
local l_0_14 = l_0_13.data
local l_0_15 = Game.ui_manager
local l_0_16 = Game.ui_const
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_3.get_cfg_by_id(l_0_6.target_main_type.sword_fly)
end

l_0_1.get_start_btn_desc = function(l_2_0)
  return "\229\141\149\228\186\186\229\140\185\233\133\141"
end

l_0_1.get_start_btn_desc = function(l_3_0)
  return "\232\189\187\229\138\159\229\164\167\232\181\155"
end

l_0_1.get_sub_target_display_reward = function(l_4_0)
  local l_4_1 = l_4_0.target_cfg.sub_target[1]
  local l_4_2 = {}
  local l_4_3 = l_0_14.get_sword_fly_daily_reward_times()
  for l_4_7,l_4_8 in ipairs(l_4_1.reward) do
    l_4_8.has_get = l_4_3 > 0
    l_4_8.is_daily = true
    table.insert(l_4_2, l_4_8)
  end
  return l_4_2
end

l_0_1.get_start_btn_desc = function(l_5_0, l_5_1)
  return "\229\188\128\229\167\139\229\140\185\233\133\141"
end

l_0_1.get_team_target_left_desc = function(l_6_0)
  return "\229\141\149\228\186\186\229\140\185\233\133\141"
end

l_0_1.get_main_bg = function(l_7_0, l_7_1)
  return "PveBg"
end

l_0_1.get_team_target_right_desc = function(l_8_0, l_8_1)
  local l_8_2, l_8_3 = l_0_14.get_score(l_0_6.target_main_type.sword_fly)
  local l_8_4 = l_0_14.get_score_item_name()
  local l_8_5 = string.format
  local l_8_6 = "%s:%s/%s"
  local l_8_7 = l_8_4
  local l_8_8 = l_8_2
  local l_8_9 = l_8_3
  return l_8_5(l_8_6, l_8_7, l_8_8, l_8_9)
end

l_0_1.has_sub_target = function(l_9_0, l_9_1, l_9_2)
  return false
end

l_0_1.get_target_desc = function(l_10_0, l_10_1)
  local l_10_2 = l_0_8.get_string
  local l_10_3 = l_10_1.target_desc
  return l_10_2(l_10_3)
end

l_0_1.is_team_type_open = function(l_11_0)
  if not l_0_13.is_open() then
    return 
  end
  if not l_0_10.is_activity_open(l_0_11.act_id.red_cat_blue_rabbit_sword_fly) then
    return false
  end
  local l_11_1 = l_0_2.is_team_type_open
  local l_11_2 = l_11_0
  return l_11_1(l_11_2)
end

l_0_1.is_team_target_open = function(l_12_0, l_12_1, l_12_2, l_12_3)
  if not l_0_13.is_open() then
    return 
  end
  if not l_0_10.is_activity_open(l_0_11.act_id.red_cat_blue_rabbit_sword_fly) then
    return false
  end
  local l_12_4 = l_0_2.is_team_target_open
  local l_12_5 = l_12_0
  local l_12_6 = l_12_1
  local l_12_7 = l_12_2
  local l_12_8 = l_12_3
  return l_12_4(l_12_5, l_12_6, l_12_7, l_12_8)
end

l_0_1.open_detail_view = function(l_13_0, l_13_1, l_13_2, l_13_3)
  local l_13_4 = l_0_15.open_view
  local l_13_5 = l_0_16.RedCatMartialSwordFlyView.name
  local l_13_6 = {}
  l_13_6.target_id = l_0_6.target_main_type.sword_fly
  l_13_4(l_13_5, l_13_6)
end

return l_0_1

