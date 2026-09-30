-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.buff.state.cant_trigger_hit_fly_again_8738472335358933138.bin 

local l_0_0 = Game.module.fight
local l_0_1 = l_0_0.ways.base
local l_0_2 = Game.events
local l_0_3 = {}
l_0_1.buff_state_handlers[l_0_0.buff_states.cant_trigger_hit_fly_again] = l_0_3
l_0_3.on_active = function(l_1_0, l_1_1, l_1_2)
  l_0_2.brocast("can_trigger_objs_changed")
end

l_0_3.on_disactive = function(l_2_0, l_2_1, l_2_2)
  if l_2_0.id_to_area then
    for l_2_6,l_2_7 in pairs(l_2_0.id_to_area) do
      if l_2_0:is_unit_has_buff_state(l_2_7.owner, l_0_0.buff_states.hit_fly_preview) then
        l_2_0:update_area_enter_units(l_2_7)
      end
    end
  end
  l_0_2.brocast("can_trigger_objs_changed")
end


