-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.buff.state.move_lift_1015273902192923029.bin 

local l_0_0 = Game.module.fight
local l_0_1 = l_0_0.ways.base
local l_0_2 = {}
l_0_1.buff_state_handlers[l_0_0.buff_states.move_lift] = l_0_2
l_0_2.on_active = function(l_1_0, l_1_1, l_1_2)
  if l_1_0:is_unit_has_buff_state(l_1_1, l_0_0.buff_states.fly_free) then
    local l_1_3 = l_0_1.buff_state_handlers[l_0_0.buff_states.fly_free]
    if l_1_3 and l_1_3.raw_disactive then
      l_1_3.raw_disactive(l_1_0, l_1_1, l_1_2)
    end
  end
  l_1_1.rising_attch_obj = l_1_0:attach_obj_to_unit(l_1_1, "CharacterNew/Spine/wj25005.ab", "body")
  Game.events.brocast("fight_set_unit_bottom_hud_off_y", l_1_1, -60)
  if l_1_0:is_physics_env() and l_1_1.comp_scene_obj then
    l_1_1.comp_scene_obj:SetIsSimulated(false)
  end
end

l_0_2.on_disactive = function(l_2_0, l_2_1, l_2_2)
  if l_2_1.rising_attch_obj then
    l_2_0:detach_obj_from_unit(l_2_1, l_2_1.rising_attch_obj)
    l_2_1.rising_attch_obj = nil
  end
  Game.events.brocast("fight_set_unit_bottom_hud_off_y", l_2_1, 0)
  if l_2_0:is_physics_env() then
    if not l_2_0.land_data:is_land_pos_empty(l_2_1.pos.x, l_2_1.pos.y) and not l_2_0.land_data:is_land_pos_empty(l_2_1.pos.x, l_2_1.pos.y + 1) then
      do return end
    end
    l_2_0:try_to_reset_unit_physics_state(l_2_1)
  end
  if l_2_0:is_unit_has_buff_state(l_2_1, l_0_0.buff_states.fly_free) then
    local l_2_3 = l_0_1.buff_state_handlers[l_0_0.buff_states.fly_free]
    if l_2_3 and l_2_3.raw_active then
      l_2_3.raw_active(l_2_0, l_2_1, l_2_2)
    end
  end
end


