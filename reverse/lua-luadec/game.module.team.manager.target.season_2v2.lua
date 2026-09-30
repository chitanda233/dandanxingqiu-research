-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.season_2v2_-9194463836191210867.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.season_2v2
local l_0_2 = Game.module.season
local l_0_3 = l_0_2.const
local l_0_4 = l_0_2.data_2v2
local l_0_5 = Game.module.team
local l_0_6 = l_0_5.data
local l_0_7 = l_0_5.const
local l_0_8 = l_0_5.network
local l_0_9 = require("game.module.common_view.manager.confirm")
local l_0_10 = DataConfigs.team_target
local l_0_11 = DataConfigs.language_define
local l_0_12 = Game.module.main_view
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_10.get_cfg_by_id(l_0_7.target_main_type.season_2v2)
end

l_0_1.get_team_args = function(l_2_0, l_2_1)
  return 1, nil
end

l_0_1.get_team_panel_type = function(l_3_0)
  return l_0_7.panel_type.team_2v2
end

l_0_1.has_sub_target = function(l_4_0)
  return false
end

l_0_1.get_team_target_right_desc = function(l_5_0)
  local l_5_1 = l_0_4.get_player_info()
  local l_5_2 = l_5_1.day_win_num
  if not l_5_2 or l_5_2 == 0 then
    return ""
  end
  local l_5_3 = string.format
  local l_5_4 = "%s\232\191\158\232\131\156"
  local l_5_5 = l_5_2
  return l_5_3(l_5_4, l_5_5)
end

do
  return l_0_1
end
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

 -- Warning: undefined locals caused missing assignments!

