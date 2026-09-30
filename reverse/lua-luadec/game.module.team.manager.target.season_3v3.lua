-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.season_3v3_3387615155219091600.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.season_3v3
local l_0_2 = Game.module.season
local l_0_3 = l_0_2.data_3v3
local l_0_4 = Game.module.team
local l_0_5 = l_0_4.data
local l_0_6 = l_0_4.const
local l_0_7 = l_0_4.network
local l_0_8 = DataConfigs.team_target
local l_0_9 = DataConfigs.language_define
local l_0_10 = Game.module.main_view
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_8.get_cfg_by_id(l_0_6.target_main_type.season_3v3)
end

l_0_1.get_team_args = function(l_2_0, l_2_1)
  return 1, nil
end

l_0_1.get_team_panel_type = function(l_3_0)
  return l_0_6.panel_type.team_2v2
end

l_0_1.has_sub_target = function(l_4_0)
  return false
end

l_0_1.get_team_target_right_desc = function(l_5_0)
  local l_5_1 = l_0_3.get_player_info()
  local l_5_2 = l_5_1.day_win_num
  if not l_5_2 or l_5_2 == 0 then
    return ""
  end
  local l_5_3 = string.format
  local l_5_4 = "%s\232\191\158\232\131\156"
  local l_5_5 = l_5_2
  return l_5_3(l_5_4, l_5_5)
end

l_0_1.could_turn_to_this_target = function(l_6_0, l_6_1, l_6_2)
  if l_6_0:__in_the_same_team_target() then
    l_0_10.show_sub_panel("team")
    return 
  end
  if not l_0_5.is_in_team() then
    if l_6_0.target_cfg.is_public == 1 then
      l_0_7.team_create_c2s(l_6_0.target_cfg.id, l_6_1.sub_team_target)
    end
    l_6_2(true)
    return 
  end
  if l_0_5.is_team_matching() then
    local l_6_3 = l_0_8.get_cfg_by_id(l_0_6.target_main_type.season_3v3)
    local l_6_4 = l_0_9.get_string(l_6_3.name)
    BroadcastTips.broadcast_tips(string.format("\230\130\168\229\183\178\229\156\168\229\140\185\233\133\141\228\184\173\239\188\140\230\151\160\230\179\149\229\137\141\229\190\128%s", l_6_4))
    l_6_2(false)
    return 
  end
  local l_6_5 = Game.module.data.get_player_id()
  local l_6_6 = l_0_5.is_team_captain(l_6_5)
  if l_6_6 then
    l_6_2(true)
    return 
  end
  local l_6_7 = require("game.module.common_view.manager.confirm")
  local l_6_8 = l_6_7.confirm
  local l_6_9 = {}
  l_6_9.content = "\229\189\147\229\137\141\228\189\141\228\186\142\233\152\159\228\188\141\228\184\173\239\188\140\230\152\175\229\144\166\233\128\128\229\135\186\233\152\159\228\188\141\229\185\182\233\128\137\230\139\169\232\175\165\231\142\169\230\179\149\239\188\159"
  l_6_9.sure_click = function()
    l_0_5.set_alone_type_target_args(l_6_1.team_target, l_6_1.sub_team_target, l_6_1.team_args)
    l_0_5.set_value("skip_quit_team_target_set", true)
    l_0_7.team_quit_c2s()
    Game.module.main_view.show_sub_panel("team")
   end
  l_6_9.cancel_click = function()
    l_6_2(false)
   end
  l_6_9.close_click = function()
    l_6_2(false)
   end
  l_6_8(l_6_9)
end

l_0_1.get_rank_type = function(l_7_0)
end

l_0_1.__in_the_same_team_target = function(l_8_0)
  local l_8_1, l_8_2, l_8_3 = l_0_5.get_team_type_target_args()
  return l_8_1 == l_0_6.target_main_type.season_3v3
end

l_0_1.get_confirm_btn_desc = function(l_9_0)
  if l_9_0:__in_the_same_team_target() then
    return "\229\155\158\229\136\176\233\152\159\228\188\141"
  end
  return "\229\136\155\229\187\186\230\136\191\233\151\180"
end

return l_0_1

