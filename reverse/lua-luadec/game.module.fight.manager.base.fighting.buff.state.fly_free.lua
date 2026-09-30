-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.buff.state.fly_free_-6910042175340343475.bin 

local l_0_0 = Game.module.fight
local l_0_1 = l_0_0.ways.base
local l_0_2 = {}
l_0_1.buff_state_handlers[l_0_0.buff_states.fly_free] = l_0_2
l_0_2.on_active = function(l_1_0, l_1_1, l_1_2)
  if l_1_0:is_unit_has_buff_state(l_1_1, l_0_0.buff_states.move_lift) then
    return 
  end
  l_0_2.raw_active(l_1_0, l_1_1, l_1_2)
end

l_0_2.raw_active = function(l_2_0, l_2_1, l_2_2)
  l_2_1.fly_attch_obj = l_2_0:attach_obj_to_unit(l_2_1, "CharacterNew/Spine/wj23091.ab", "body")
  Game.events.brocast("fight_set_unit_bottom_hud_off_y", l_2_1, -30)
  if l_2_0:is_physics_env() then
    l_2_0:try_to_reset_unit_physics_state(l_2_1)
  end
end

l_0_2.on_disactive = function(l_3_0, l_3_1, l_3_2)
  if l_3_0:is_unit_has_buff_state(l_3_1, l_0_0.buff_states.move_lift) then
    return 
  end
  l_0_2.raw_disactive(l_3_0, l_3_1, l_3_2)
end

l_0_2.raw_disactive = function(l_4_0, l_4_1, l_4_2)
  if l_4_1.fly_attch_obj then
    l_4_0:detach_obj_from_unit(l_4_1, l_4_1.fly_attch_obj)
    l_4_1.fly_attch_obj = nil
  end
  Game.events.brocast("fight_set_unit_bottom_hud_off_y", l_4_1, 0)
  if l_4_0:is_physics_env() then
    l_4_0:try_to_reset_unit_physics_state(l_4_1)
  end
end


