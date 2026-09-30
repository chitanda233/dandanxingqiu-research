-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua1_573660\game.module.main_view.manager.config.bottom_btn_config_-5200976639319226144.bin 

local l_0_0 = Game.module.open_func.const
local l_0_1 = Game.module.open_func
local l_0_2 = BroadcastTips
local l_0_3 = DataConfigs.misc
local l_0_4 = Game.module.main_view
local l_0_5 = Game.module.welfare
local l_0_6 = Game.module.scene_manager
local l_0_7 = Game.events
local l_0_8 = function(l_1_0, l_1_1)
  local l_1_2 = Game.module.team
  local l_1_3 = l_1_2.data
  local l_1_4 = l_1_2.const
  local l_1_5 = l_1_3.is_in_team()
  local l_1_6 = l_1_3.get_teammate_count()
  local l_1_7 = l_1_3.get_team_member_max_count()
  local l_1_8, l_1_9, l_1_10 = l_1_3.get_team_type_target_args()
  local l_1_11 = l_1_2.get_target_module(l_1_8)
  if l_1_11:is_show_exit(l_1_9) then
    local l_1_12 = string.format("%s/%s", l_1_6, l_1_7)
    l_1_0.txts.team_num:set_text(l_1_12)
    l_1_0.txts.team_num2:set_text(l_1_12)
    l_1_0.txts.label_01:set_active(false)
    l_1_0.txts.label_02:set_active(false)
    l_1_0.objs.team_tag:set_active(true)
    l_1_0.objs.team_tag2:set_active(true)
    l_1_0.objs.exit_node:set_active(true)
    l_1_0.objs.fight_node:set_active(false)
  else
    l_1_0.txts.label_01:set_lan_text(l_1_0.__data.name)
    l_1_0.txts.label_02:set_lan_text(l_1_0.__data.name)
    l_1_0.txts.label_01:set_active(true)
    l_1_0.txts.label_02:set_active(true)
    l_1_0.objs.team_tag:set_active(false)
    l_1_0.objs.team_tag2:set_active(false)
    l_1_0.objs.exit_node:set_active(false)
    l_1_0.objs.fight_node:set_active(true)
  end
end

local l_0_9 = {}
local l_0_10 = {}
l_0_10.click_handler = function()
  if Game.module.newbie_fight_flow.is_in_multi_player_fly_race_flow() then
    l_0_2.broadcast_tips("\230\154\130\230\156\170\229\188\128\230\148\190")
    return 
  end
  if l_0_4.is_sub_panel_show("weapon") then
    return 
  end
  l_0_4.show_sub_panel("weapon")
  l_0_7.brocast("click_bottom_function_entrance", "weapon")
end

l_0_10.redpoint_id = "main_view_bottom_weapon_btn"
l_0_9.weapon = l_0_10
l_0_10 = {click_handler = function()
  if Game.module.newbie_fight_flow.is_in_multi_player_fly_race_flow() then
    l_0_2.broadcast_tips("\230\154\130\230\156\170\229\188\128\230\148\190")
    return 
  end
  if l_0_4.is_sub_panel_show("alliance") then
    return 
  end
  if not l_0_1.is_open(l_0_0.type.alliance) then
    local l_3_0 = l_0_1.get_no_open_tips(l_0_0.type.alliance)
    l_0_2.broadcast_tips(l_3_0)
    return 
  end
  l_0_4.show_sub_panel("alliance")
  l_0_7.brocast("click_bottom_function_entrance", "alliance")
end
, redpoint_id = "main_view_alliance_btn"}
l_0_9.alliance = l_0_10
l_0_10 = {redpoint_id = "main_btn_bookmark", click_handler = function()
  if Game.module.newbie_fight_flow.is_in_multi_player_fly_race_flow() then
    l_0_2.broadcast_tips("\230\154\130\230\156\170\229\188\128\230\148\190")
    return 
  end
  if l_0_4.is_sub_panel_show("skill") then
    return 
  end
  l_0_4.show_sub_panel("skill")
  l_0_7.brocast("click_bottom_function_entrance", "skill")
end
}
l_0_9.skill = l_0_10
l_0_10 = {redpoint_id = "main_btn_entrance", click_handler = function()
  if Game.module.newbie_fight_flow.is_in_multi_player_fly_race_flow() then
    l_0_2.broadcast_tips("\230\154\130\230\156\170\229\188\128\230\148\190")
    return 
  end
  if l_0_4.is_sub_panel_show("entrance") then
    return 
  end
  l_0_4.show_sub_panel("entrance")
  l_0_7.brocast("click_bottom_function_entrance", "entrance")
end
}
l_0_9.entrance = l_0_10
local l_0_11 = {}
l_0_11.team_update_team_info = l_0_8
l_0_11.update_team_leave_btn = l_0_8
l_0_10 = {redpoint_id = "main_view_bottom_team_btn", click_handler = function(l_6_0, l_6_1)
  local l_6_2 = Game.module.team
  local l_6_3 = l_6_2.data
  local l_6_4 = l_6_2.const
  local l_6_5 = l_6_2.network
  local l_6_6 = l_6_2.event
  local l_6_7 = require("game.module.common_view.manager.confirm")
  local l_6_8, l_6_9 = l_6_2.data.get_team_type_target_args()
  local l_6_10 = l_6_2.get_target_module(l_6_8)
  local l_6_11 = l_6_2.get_sub_scene_key_by_team_type(l_6_8)
  if l_0_4.is_sub_panel_show(l_6_11) then
    local l_6_12 = l_6_3.is_in_team()
    local l_6_13 = l_6_3.get_teammate_count()
    local l_6_14 = l_6_3.get_teammate_count()
    if l_6_1 then
      if l_6_12 then
        if l_6_13 > 1 then
          local l_6_15 = (l_6_10:get_exit_node_confirm_content(l_6_9))
          local l_6_16 = nil
          if Game.module.newbie_fight_flow.is_in_multi_player_fly_race_flow() then
            l_6_16 = "\232\191\155\229\133\165\229\188\185\229\188\185\230\152\159\231\144\131"
          else
            l_6_16 = "\231\161\174\229\174\154"
          end
          local l_6_17 = l_6_7.confirm
          local l_6_18 = {}
          l_6_18.content = l_6_15
          l_6_18.sure_label = l_6_16
          l_6_18.sure_click = function()
            l_6_10:exit_team(l_6_9)
               end
          l_6_17(l_6_18)
        else
          l_6_10:exit_team(l_6_9)
        end
      else
        l_6_10:exit_team(l_6_9)
      end
      return 
    end
    l_0_4.show_sub_panel(l_6_11)
    l_0_7.brocast("click_bottom_function_entrance", "team")
    local l_6_19 = Game.module.scene_manager.enter
    local l_6_20 = "scene"
    do
      local l_6_21 = {}
      l_6_21.sub_scene_type = l_6_11
      l_6_19(l_6_20, l_6_21)
    end
     -- Warning: missing end command somewhere! Added here
  end
end
, show_func = l_0_8, event_handler = l_0_11}
l_0_9.team = l_0_10
return l_0_9

