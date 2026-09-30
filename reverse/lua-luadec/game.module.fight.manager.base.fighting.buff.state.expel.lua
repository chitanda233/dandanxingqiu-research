-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.buff.state.expel_-8207034470611245119.bin 

local l_0_0 = Game.module.fight
local l_0_1 = l_0_0.ways.base
local l_0_2 = {}
l_0_1.buff_state_handlers[l_0_0.buff_states.expel] = l_0_2
local l_0_3 = function(l_1_0, l_1_1, l_1_2)
  local l_1_3 = l_1_1.owner
  if l_1_3.is_dead then
    return 
  end
  if l_1_0:is_ctrl_unit(l_1_3) or l_1_0:is_ctrl_unit_pet(l_1_3) then
    l_1_0:set_unit_model_half_transparent(l_1_3, l_1_2)
  else
    l_1_0:set_unit_active(l_1_3, not l_1_2)
  end
  if l_1_0.round.camera_follow_target == l_1_3 then
    if l_1_2 then
      l_1_0:camera_follow_target(nil)
    else
      l_1_0:camera_follow_target_unit(l_1_3)
    end
  end
  l_1_0:req_update_recommand_forces()
  local l_1_4 = require("game.utils.events")
  l_1_4.brocast("fight_unit_expel_change", l_1_3, l_1_2)
end

l_0_2.on_active = function(l_2_0, l_2_1, l_2_2)
  l_0_3(l_2_0, l_2_2, true)
end

l_0_2.on_disactive = function(l_3_0, l_3_1, l_3_2)
  l_0_3(l_3_0, l_3_2, false)
end


