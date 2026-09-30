-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.unit.move.direction_5835144460373031733.bin 

local l_0_0 = require("game.utils.events")
local l_0_1 = Game.module.fight
local l_0_2 = l_0_1.ways.base
local l_0_3 = l_0_1.role_directions.left
local l_0_4 = l_0_1.role_directions.right
l_0_2.req_turn_unit_move_direction = function(l_1_0, l_1_1, l_1_2)
  l_1_0.round.oped = true
  if not l_1_0:could_turn_unit_move_direction(l_1_1, l_1_2) then
    return false
  end
  if l_1_1.role and l_1_1.role.is_auto_battle then
    return false
  end
  l_1_0:try_to_turn_unit_move_direction(l_1_1, l_1_2)
  if l_1_2 == l_0_3 or l_1_2 == l_0_4 then
    local l_1_3, l_1_4 = l_1_0:send_network_msg, l_1_0
    local l_1_5 = "battle_update_direction_c2s"
    local l_1_6 = {}
    l_1_6.direction = l_1_2
    l_1_3(l_1_4, l_1_5, l_1_6)
  end
  return true
end

l_0_2.on_msg_battle_update_direction_s2c = function(l_2_0, l_2_1, l_2_2)
  local l_2_3 = l_2_0:get_unit_by_id(l_2_2.object_id)
  l_2_0:try_to_turn_unit_move_direction(l_2_3, l_2_2.direction)
end

l_0_2.try_to_turn_unit_move_direction = function(l_3_0, l_3_1, l_3_2, l_3_3)
  if not l_3_0:could_turn_unit_move_direction(l_3_1, l_3_2) and not force then
    return 
  end
  l_3_0:set_unit_has_operated(l_3_1)
  l_3_1.move_direction = l_3_2
  l_3_0:try_to_turn_unit_face(l_3_1, l_3_2, force)
end

l_0_2.could_turn_unit_move_direction = function(l_4_0, l_4_1, l_4_2)
  if l_4_1.is_dead then
    return false
  end
  if l_4_1.move_direction == l_4_2 then
    return false
  end
  return true
end

l_0_2.try_to_turn_unit_face = function(l_5_0, l_5_1, l_5_2, l_5_3, l_5_4)
  assert(l_5_1)
  if not l_5_0:could_turn_unit_direction(l_5_1, l_5_2) and not l_5_3 then
    return 
  end
  do
    local l_5_5 = l_5_1.direction
    l_5_1.direction = l_5_2
    l_5_1.move_direction = l_5_2
    if not l_5_4 then
      l_5_0:set_unit_has_operated(l_5_1)
    end
    do
      local l_5_6, l_5_7, l_5_8, l_5_9, l_5_10, l_5_12, l_5_13 = l_5_2 == l_0_4 and 1 or -1
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_5_0:set_unit_skin_dir(l_5_1, l_5_6)
    if not l_5_1.agravity or l_5_0:is_unit_has_buff_state(l_5_1, l_0_1.buff_states.move_ground_paste) or l_5_0:is_unit_has_buff_state(l_5_1, l_0_1.buff_states.move_lift) or l_5_0:is_unit_has_buff_state(l_5_1, l_0_1.buff_states.fly_free) then
      l_5_0:fix_unit_angle(l_5_1)
    end
    if l_5_0.round.round_count > 0 and l_5_1.id == l_5_0.ctrl_unit_id then
      l_5_0:req_update_recommand_forces()
       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused about usage of registers!

      Game.module.guide_system.trigger(Game.module.guide_system.const.trigger_type.player_change_toward)
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_0_0.brocast("fight_unit_direction_changed", l_5_1, l_5_5)
    l_5_0:try_to_adjust_pet_land_pos_by_owner(l_5_1, l_5_3)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_2.could_turn_unit_direction = function(l_6_0, l_6_1, l_6_2)
  if l_6_2 ~= l_0_3 and l_6_2 ~= l_0_4 then
    return false
  end
  if l_6_1.direction == l_6_2 then
    return false
  end
  if l_6_1.is_dead then
    return false
  end
  return true
end


