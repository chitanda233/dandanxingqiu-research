-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.pve_material_hard_1864138655619293233.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.pve_material_hard
local l_0_2 = Game.module.dungeon_material
local l_0_3 = DataConfigs.team_target
local l_0_4 = Game.module.team
local l_0_5 = l_0_4.data
local l_0_6 = l_0_4.const
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_3.get_cfg_by_id(l_0_6.target_main_type.pve_material_hard)
end

l_0_1.can_join_other_team = function(l_2_0, l_2_1, l_2_2)
  do
    local l_2_3 = l_0_3.get_cfg_by_type_target(l_0_6.target_main_type.pve_material_hard, l_2_1)
    return l_2_3
  end
   -- Warning: undefined locals caused missing assignments!
end

return l_0_1

