-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.air_race_-571052718900742292.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.air_race
local l_0_2 = l_0_0.ways.base
local l_0_3 = DataConfigs.team_target
local l_0_4 = Game.module.team
local l_0_5 = l_0_4.data
local l_0_6 = l_0_4.const
local l_0_7 = l_0_4.network
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_3.get_cfg_by_id(l_0_6.target_main_type.paper_air_panel)
end

l_0_1.get_start_btn_desc = function(l_2_0)
  return "\229\188\128\229\167\139\229\175\185\230\136\152"
end

l_0_1.get_team_panel_type = function(l_3_0)
  return l_0_6.panel_type.team_paper_air_plane
end

l_0_1.get_start_btn_gray_state = function(l_4_0)
  if not l_0_5.get_team_info() then
    return false, "\230\151\160\233\152\159\228\188\141\228\191\161\230\129\175"
  end
  if not l_0_5.is_members_all_ready() then
    return true, "\230\136\191\233\151\180\229\134\133\230\156\137\230\136\144\229\145\152\229\176\154\230\156\170\229\135\134\229\164\135"
  end
  return false
end

l_0_1.could_turn_to_this_target = function(l_5_0, l_5_1, l_5_2)
  if not l_0_5.is_in_team() and l_5_1 then
    l_0_7.team_create_c2s(l_0_6.target_main_type.paper_air_panel, 1)
    l_0_7.team_set_condition_c2s({})
    l_0_7.team_set_setting_c2s({})
  end
  if l_5_2 then
    l_5_2(true)
  end
end

l_0_1.has_sub_target = function(l_6_0, l_6_1, l_6_2)
  return false
end

return l_0_1

