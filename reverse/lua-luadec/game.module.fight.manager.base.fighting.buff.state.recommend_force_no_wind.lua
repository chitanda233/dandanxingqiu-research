-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.buff.state.recommend_force_no_wind_-3463959290716847027.bin 

local l_0_0 = Game.module.fight
local l_0_1 = l_0_0.ways.base
local l_0_2 = {}
l_0_1.buff_state_handlers[l_0_0.buff_states.recommend_force_no_wind] = l_0_2
l_0_2.on_active = function(l_1_0, l_1_1, l_1_2)
  if l_1_0:is_ctrl_unit(l_1_1) then
    l_1_0:req_update_recommand_forces()
  end
end

l_0_2.on_disactive = function(l_2_0, l_2_1, l_2_2)
  if l_2_0:is_ctrl_unit(l_2_1) then
    l_2_0:req_update_recommand_forces()
  end
end


