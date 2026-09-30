-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.martial_marriage_4348373059379382338.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.base
local l_0_2 = l_0_0.ways.martial_marriage
local l_0_3 = l_0_0.ways.base
local l_0_4 = DataConfigs.team_target
local l_0_5 = Game.module.team
local l_0_6 = l_0_5.data
local l_0_7 = l_0_5.const
local l_0_8 = l_0_5.network
local l_0_9 = Game.module.activity
local l_0_10 = l_0_9.data
local l_0_11 = l_0_9.const
local l_0_12 = Game.module.red_cat_blue_rabbit
local l_0_13 = Game.module.mid_autumn.data
local l_0_14 = Game.ui_manager
local l_0_15 = Game.ui_const
l_0_2.init = function(l_1_0)
  l_1_0.target_cfg = l_0_4.get_cfg_by_id(l_0_7.target_main_type.red_cat_martial_marriage)
end

l_0_2.get_start_btn_desc = function(l_2_0)
  return "\230\175\148\230\173\166\230\139\155\228\186\178"
end

l_0_2.get_team_target_reward_desc = function(l_3_0)
  return "\229\188\130\230\128\167\231\187\132\233\152\159"
end

l_0_2.is_team_type_open = function(l_4_0)
  if not l_0_12.is_open() then
    return 
  end
  if not l_0_10.is_activity_open(l_0_11.act_id.mid_autumn_marriage_fight) then
    return false
  end
  local l_4_1 = l_0_1.is_team_type_open
  local l_4_2 = l_4_0
  return l_4_1(l_4_2)
end

l_0_2.is_team_target_open = function(l_5_0, l_5_1, l_5_2, l_5_3)
  if not l_0_12.is_open() then
    return 
  end
  if not l_0_10.is_activity_open(l_0_11.act_id.mid_autumn_marriage_fight) then
    return false
  end
  local l_5_4 = l_0_1.is_team_target_open
  local l_5_5 = l_5_0
  local l_5_6 = l_5_1
  local l_5_7 = l_5_2
  local l_5_8 = l_5_3
  return l_5_4(l_5_5, l_5_6, l_5_7, l_5_8)
end

l_0_2.get_team_panel_type = function(l_6_0)
  return l_0_7.panel_type.team_normal
end

l_0_2.has_sub_target = function(l_7_0, l_7_1, l_7_2)
  return false
end

l_0_2.get_sub_target_display_reward = function(l_8_0)
  local l_8_1 = l_8_0.target_cfg.sub_target[1]
  local l_8_2 = {}
  for l_8_6,l_8_7 in ipairs(l_8_1.common_reward) do
    table.insert(l_8_2, l_8_7)
  end
  for l_8_11,l_8_12 in ipairs(l_8_1.reward) do
    l_8_12.has_get = l_0_13.marriage_reward_times > 0
    l_8_12.is_daily = true
    table.insert(l_8_2, l_8_12)
  end
  return l_8_2
end

l_0_2.get_main_bg = function(l_9_0, l_9_1)
  return "PveBg"
end

l_0_2.open_detail_view = function(l_10_0, l_10_1, l_10_2, l_10_3)
  l_0_14.open_view(l_0_15.RedCatMartialMarriageView.name)
end

l_0_2.need_fill_member_before_match = function(l_11_0, l_11_1)
  return true, true
end

return l_0_2

