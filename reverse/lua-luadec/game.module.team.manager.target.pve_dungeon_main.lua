-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.pve_dungeon_main_319126051688290665.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.pve_dungeon_main
local l_0_2 = Game.module.team
local l_0_3 = l_0_2.data
local l_0_4 = l_0_2.network
local l_0_5 = l_0_2.const
local l_0_6 = Game.module.season
local l_0_7 = DataConfigs.team_target
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_7.get_cfg_by_id(l_0_5.target_main_type.dungeon_rogue)
end

l_0_1.get_team_args = function(l_2_0)
  return 1, nil
end

l_0_1.team_update_target = function(l_3_0, l_3_1)
  l_0_4.team_update_target_c2s(l_3_0.target_cfg.id, l_3_1.id)
end

l_0_1.get_target_item_desc = function(l_4_0, l_4_1, l_4_2)
  local l_4_3 = Game.module.dungeon_main
  local l_4_4 = l_4_3.get_max_passed_dungeon_main()
  return l_0_5.team_target_desc_type.desc, "\229\189\147\229\137\141\229\133\179\229\141\161\239\188\154", l_4_4 and l_4_3.get_dungeon_main_dungeon_name(l_4_4) or "---"
end

l_0_1.could_turn_to_this_target = function(l_5_0, l_5_1, l_5_2)
  if not l_0_3.is_in_team() then
    l_5_2(true)
    return 
  end
  if l_0_3.is_team_matching() then
    BroadcastTips.broadcast_tips("\230\130\168\229\183\178\229\156\168\229\140\185\233\133\141\228\184\173\239\188\140\230\151\160\230\179\149\229\137\141\229\190\128\228\184\187\231\186\191\228\184\187\231\186\191\229\133\179\229\141\161")
    l_5_2(false)
    return 
  end
  l_0_6.try_confirm_enter_champion(function(l_1_0)
    l_5_0:_turn_to_this_target(l_1_0, l_5_2)
   end)
end

l_0_1._turn_to_this_target = function(l_6_0, l_6_1, l_6_2)
  if not l_6_1 then
    return 
  end
  if l_0_3.is_single() then
    l_0_3.set_value("skip_quit_team_target_set", true)
    l_0_4.team_quit_c2s()
    l_6_2(true)
    return 
  end
  local l_6_3 = Game.module.data.get_player_id()
  local l_6_4 = l_0_3.is_team_captain(l_6_3)
  local l_6_5 = require("game.module.common_view.manager.confirm")
  local l_6_6 = l_6_5.confirm
  local l_6_7 = {}
  l_6_7.content = l_6_4 and "\230\130\168\229\183\178\230\152\175\233\152\159\233\149\191\239\188\140\233\128\137\230\139\169\232\175\165\231\155\174\230\160\135\229\176\134\233\128\128\229\135\186\229\189\147\229\137\141\233\152\159\228\188\141\239\188\140\230\152\175\229\144\166\231\187\167\231\187\173\239\188\159" or "\230\130\168\229\183\178\231\187\143\229\156\168\233\152\159\228\188\141\228\184\173\239\188\140\233\128\137\230\139\169\232\175\165\231\155\174\230\160\135\229\176\134\233\128\128\229\135\186\229\189\147\229\137\141\233\152\159\228\188\141\239\188\140\230\152\175\229\144\166\231\187\167\231\187\173\239\188\159"
  l_6_7.sure_click = function()
    if l_0_3.is_in_team() then
      l_0_3.set_value("skip_quit_team_target_set", true)
      l_0_4.team_quit_c2s()
    end
    l_6_2(true)
   end
  l_6_7.cancel_click = function()
    l_6_2(false)
   end
  l_6_7.close_click = function()
    l_6_2(false)
   end
  l_6_6(l_6_7)
end

l_0_1.get_sub_target_display_reward = function(l_7_0)
  local l_7_1, l_7_2 = l_7_0:get_main_target_display_reward, l_7_0
  return l_7_1(l_7_2)
end

l_0_1.get_start_btn_desc = function(l_8_0)
  return "\229\188\128\229\167\139\230\140\145\230\136\152"
end

l_0_1.has_sub_target = function(l_9_0)
  return false
end

return l_0_1

