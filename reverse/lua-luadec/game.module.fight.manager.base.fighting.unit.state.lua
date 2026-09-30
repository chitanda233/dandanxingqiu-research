-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.unit.state_-1315870785431661937.bin 

local l_0_0 = Game.events
local l_0_1 = string.format
local l_0_2 = Game.module.fight
local l_0_3 = l_0_2.ways.base
local l_0_4 = l_0_2.role_status
local l_0_5 = l_0_4.idle
local l_0_6 = l_0_4.moving
local l_0_7 = l_0_4.falling
local l_0_8 = l_0_4.push_out_land
l_0_3.set_unit_state = function(l_1_0, l_1_1, l_1_2, l_1_3)
  if l_1_1.state == l_1_2 then
    return 
  end
  local l_1_4 = l_1_1.state
  l_1_1.state = l_1_2
  if l_1_4 then
    local l_1_5 = assert(l_0_2.role_status_str[l_1_4], l_1_4)
    local l_1_6 = l_0_1("on_unit_exit_state_%s", l_1_5)
    local l_1_7 = l_1_0[l_1_6]
    if l_1_7 then
      l_1_7(l_1_0, l_1_1, l_1_2, l_1_3)
    end
  end
  local l_1_8 = assert(l_0_2.role_status_str[l_1_2], l_1_2)
  local l_1_9 = l_0_1("on_unit_enter_state_%s", l_1_8)
  local l_1_10 = l_1_0[l_1_9]
  if l_1_10 then
    l_1_10(l_1_0, l_1_1, l_1_4, l_1_3)
  end
  l_0_0.brocast("fight_unit_state_changed", l_1_1, l_1_4)
  if l_1_2 ~= l_0_5 and l_1_1 == l_1_0.round.camera_follow_target then
    l_1_0:camera_follow_target_unit(l_1_1)
  end
end

local l_0_9 = {}
l_0_9.hurt = true
l_0_9.die = true
l_0_9.born = true
l_0_9.skill1 = true
l_0_9.skill2 = true
l_0_9.skill3 = true
l_0_9.attack = true
l_0_9.attack_1 = true
l_0_9.attack_2 = true
l_0_9.attack_3 = true
l_0_9.throw = true
l_0_9.throw_1 = true
l_0_9.throw_2 = true
l_0_9.throw_3 = true
l_0_3.on_unit_enter_state_idle = function(l_2_0, l_2_1, l_2_2)
  if l_0_9[l_2_1.ani_trigger] then
    return 
  end
  if l_2_1.move_end_holding_fire and (l_2_2 == l_0_6 or l_2_2 == l_0_7) then
    l_2_0:do_fire_ready_action(l_2_1)
    l_2_1.move_end_holding_fire = false
  else
    l_2_0:set_unit_ani_trigger(l_2_1, "idle")
  end
end

l_0_3.on_unit_exit_state_idle = function(l_3_0, l_3_1, l_3_2)
end

l_0_3.on_unit_enter_state_moving = function(l_4_0, l_4_1, l_4_2)
  if not l_4_0:is_unit_has_buff_state(l_4_1, l_0_2.buff_states.move_lift) and not l_4_0:is_unit_has_buff_state(l_4_1, l_0_2.buff_states.fly_free) then
    l_4_0:set_unit_ani_trigger(l_4_1, "walk")
  end
  l_4_0:try_to_play_move_sound(l_4_1)
end

l_0_3.on_unit_exit_state_moving = function(l_5_0, l_5_1, l_5_2)
  if not l_5_0:is_unit_has_buff_state(l_5_1, l_0_2.buff_states.move_lift) and not l_5_0:is_unit_has_buff_state(l_5_1, l_0_2.buff_states.fly_free) and l_5_1.comp_scene_obj then
    l_5_1.comp_scene_obj:ApplyMoveImpulse()
  end
  l_5_0:try_to_stop_move_sound()
end

l_0_3.on_unit_enter_state_falling = function(l_6_0, l_6_1, l_6_2)
  if l_6_2 == l_0_8 then
    l_6_1.fall_speed = l_6_1.push_out_land_speed
    l_6_1.push_out_land_speed = nil
  end
  l_6_1.start_falling_y = l_6_1.pos.y
  if l_6_0.round and l_6_0.round.cur_first_attacker then
    local l_6_3, l_6_4 = l_6_0:try_trigger_reply, l_6_0
    local l_6_5 = l_0_2.reply_trigger_type.force_move
    local l_6_6 = {}
    l_6_6.target = l_6_0.round.cur_first_attacker
    l_6_6.to = l_6_1
    l_6_3(l_6_4, l_6_5, l_6_6)
  end
end

l_0_3.on_unit_exit_state_falling = function(l_7_0, l_7_1, l_7_2)
  if l_7_2 == l_0_5 then
    l_7_0:fix_unit_angle(l_7_1)
  end
  local l_7_3 = l_7_1.cf_info
  if l_7_3 and l_7_3.effect_falled and l_7_1.start_falling_y then
    local l_7_4 = math.abs(l_7_1.start_falling_y - l_7_1.pos.y)
    if l_7_4 > 200 then
      l_7_0:play_unit_effect(l_7_1, l_7_3.effect_falled, true, l_7_3.eff_falled_path, nil, nil, true, nil, nil, true, true, nil, nil, nil)
    end
  end
  l_7_1.start_falling_y = nil
end

l_0_3.on_unit_enter_state_blowing = function(l_8_0, l_8_1, l_8_2)
end

l_0_3.on_unit_exit_state_blowing = function(l_9_0, l_9_1, l_9_2)
  l_9_1.blow_info = nil
  l_9_1.fly_time = nil
  l_9_1.v0_x = nil
  l_9_1.v0_y = nil
  l_9_1.v_x = nil
  l_9_1.v_y = nil
  l_9_1.a_x = nil
  l_9_1.a_y = nil
  l_9_1.from_pos = nil
end

l_0_3.on_unit_enter_state_push_out_land = function(l_10_0, l_10_1, l_10_2)
  l_10_1.push_out_land_speed = 0
end

l_0_3.on_unit_exit_state_push_out_land = function(l_11_0, l_11_1, l_11_2)
  if l_11_2 ~= l_0_7 then
    l_11_1.push_out_land_speed = nil
  end
  if l_11_0:is_physics_env() then
    l_11_0:try_to_reset_unit_physics_state(l_11_1)
  end
end

l_0_3.on_unit_enter_state_hook_rope = function(l_12_0, l_12_1, l_12_2, l_12_3)
  l_12_1.hook_rope_time = 0
  l_12_1.hook_rope_from_pos = clone(l_12_1.pos)
  l_12_1.hook_rope_to_pos = clone(l_12_3.fall_pos)
  l_12_1.hook_rope_end_pos = l_12_3.pos
  l_12_1.hook_rope_perform_id = l_12_0:add_perform()
end

l_0_3.on_unit_exit_state_hook_rope = function(l_13_0, l_13_1, l_13_2)
  l_13_0:try_to_destroy_hook_rope_by_unit_id(l_13_1.id)
  if l_13_1.hook_rope_to_pos.y <= l_13_1.hook_rope_end_pos.y then
    l_13_0:set_unit_land_pos(l_13_1, l_13_1.hook_rope_end_pos, nil, false, true)
  elseif l_13_1.hook_rope_perform_id then
    l_13_0:del_perform(l_13_1.hook_rope_perform_id)
    l_13_1.hook_rope_perform_id = nil
  end
end

l_0_3.check_all_unit_is_falling = function(l_14_0)
  for l_14_4,l_14_5 in pairs(l_14_0.id_to_unit) do
    if not l_14_5.hidden_units then
      l_14_0:update_unit_falling_state(l_14_5)
    end
  end
end

l_0_3.update_unit_falling_state = function(l_15_0, l_15_1)
  local l_15_2 = l_15_0:check_unit_is_falling(l_15_1)
  if l_15_2 then
    l_15_0:set_unit_state(l_15_1, l_0_7)
  else
    if l_15_1.state ~= l_0_8 then
      l_15_1.fall_speed = 0
      if l_15_1.wait_move_len ~= nil then
        l_15_0:set_unit_state(l_15_1, l_0_6)
      else
        l_15_0:set_unit_state(l_15_1, l_0_5)
      end
    end
  end
end

l_0_3.check_unit_is_falling = function(l_16_0, l_16_1)
  if l_16_1.is_dead and l_16_1.is_active == false then
    return false
  end
  if l_16_1.agravity then
    return false
  end
  if l_16_0:is_unit_has_buff_state(l_16_1, l_0_2.buff_states.move_ground_paste) then
    return false
  end
  local l_16_2 = assert(l_16_1.pos)
  if l_16_0.land_data:is_land_pos_empty(l_16_2.x, l_16_2.y) then
    return true
  else
    if not l_16_0.land_data:is_land_pos_empty(l_16_2.x, l_16_2.y + 1) and l_16_0.land_data:is_land_pos_empty(l_16_2.x, l_16_2.y - 1) then
      return true
    else
      return false
    end
  end
end

l_0_3.is_has_unit_falling = function(l_17_0)
  for l_17_4,l_17_5 in pairs(l_17_0.id_to_unit) do
    if l_17_0:unit_is_falling(l_17_5) then
      return true
    end
  end
  return false
end

l_0_3.unit_is_falling = function(l_18_0, l_18_1)
  if l_18_1.hidden_units then
    return false
  end
  if l_18_1.is_dead then
    return false
  end
  if l_18_1.state == l_0_7 then
    return true
  end
  return false
end

l_0_3.is_still_unit_moving = function(l_19_0)
  for l_19_4,l_19_5 in pairs(l_19_0.id_to_unit) do
    if l_19_5.hidden_units then
      for l_19_4,l_19_5 in l_19_1 do
      end
      if l_19_5.is_dead then
        for l_19_4,l_19_5 in l_19_1 do
        end
        if l_19_5.state == l_0_6 then
          return true
        end
      end
      return false
       -- Warning: missing end command somewhere! Added here
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_3.is_this_unit_falling = function(l_20_0, l_20_1)
  if l_20_1.state == l_0_7 then
    return true
  end
  return false
end


