-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.unit.animation_2711413189864627951.bin 

local l_0_0 = string.format
local l_0_1 = DataConfigs
local l_0_2 = l_0_1.fight_misc
local l_0_3 = l_0_2.unit_ani_to_eff.value
local l_0_4 = l_0_2.unit_special_loop_anis.value
local l_0_5 = Game.module.fight
local l_0_6 = l_0_5.ways.base
local l_0_7 = {}
l_0_7.idle = "idle"
l_0_7.sp_idle = "sp_idle"
l_0_7.hurt = "hurt"
l_0_7.walk = "walk"
l_0_7.prop = "prop"
l_0_7.ready_attack = "ready_attack"
l_0_7.attack = "attack"
l_0_7.finish_attack = "finish_attack"
l_0_7.ready_throw = "ready_throw"
l_0_7.throw = "throw"
l_0_7.finish_throw = "finish_throw"
l_0_7.born = "born"
l_0_7.die = "die"
local l_0_8 = {}
l_0_8.idle = true
l_0_8.walk = true
local l_0_9 = {}
local l_0_10 = {}
l_0_10.die = true
l_0_10.ready_attack = true
l_0_10.attack = true
l_0_10.ready_throw = true
l_0_10.ready_throw2 = true
l_0_10.throw = true
l_0_10.ready_fire = true
l_0_9.role = l_0_10
l_0_10 = {die = true}
l_0_9.monster = l_0_10
l_0_10 = function(l_1_0, l_1_1)
  l_1_1.trigger_to_ani_name = from(l_0_7)
end

l_0_6.init_unit_ani_map = l_0_10
l_0_10 = function(l_2_0, l_2_1, l_2_2, l_2_3)
  assert(l_2_2)
  for l_2_7,l_2_8 in pairs(l_2_2) do
    if not l_2_3 and not l_2_0:unit_is_has_animation(l_2_1, l_2_8, true) then
      for l_2_7,l_2_8 in l_2_4 do
      end
      local l_2_9 = l_2_1.trigger_to_ani_name
      do
         -- DECOMPILER ERROR: Confused at declaration of local variable

      end
       -- DECOMPILER ERROR: Confused about usage of registers!

      l_2_9[l_2_7] = l_2_3 ~= true and l_2_8 or l_2_7
      if l_2_1.ani_trigger == l_2_7 then
        l_2_0:set_unit_ani_trigger(l_2_1, l_2_7)
      end
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

     -- Warning: missing end command somewhere! Added here
  end
end

l_0_6.update_unit_ani_name_map = l_0_10
l_0_10 = function(l_3_0, l_3_1, l_3_2, l_3_3)
  do
    local l_3_4 = l_3_3 and true or false
  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_3_1.model then
    return l_3_4
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_3_1.model.loading_skin ~= false or not l_3_1.model.skin then
    return l_3_4
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    return l_3_1.model.skin:is_has_animation(l_3_2)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_6.unit_is_has_animation = l_0_10
l_0_10 = function(l_4_0, l_4_1, l_4_2, l_4_3)
  assert(l_4_1)
  assert(l_4_2)
  if l_4_2 == "hurt" and l_4_1.type == "placement" and not l_4_0:unit_is_has_animation(l_4_1, l_4_2) then
    return 
  end
  local l_4_4 = l_4_1.model
  if not l_4_4 then
    return 
  end
  if l_4_0.is_reconnecting_from_replay then
    l_4_1.temp_ani_trigger = l_4_2
    l_4_1.temp_play_cb = l_4_3
    return 
  end
  if l_4_4.loading_skin ~= false then
    l_4_4.loading_temp.trigger = l_4_2
    return 
  end
  local l_4_5 = l_4_1.ani_trigger
  if l_4_5 == "die" and l_4_4.ani_play_cb then
    local l_4_6 = l_4_4.ani_play_cb
    l_4_4.ani_play_cb = nil
    if l_4_6 then
      l_4_6()
    end
  end
  if l_4_1.pet and l_4_5 == "change" and l_4_2 == "hurt" then
    return 
  end
  l_4_1.ani_trigger = l_4_2
  do
    local l_4_7, l_4_10, l_4_11, l_4_13, l_4_15 = l_4_1.trigger_to_ani_name[l_4_2] or l_4_2
  do
    end
     -- DECOMPILER ERROR: Confused at declaration of local variable

  do
    end
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Overwrote pending register.

   -- DECOMPILER ERROR: Overwrote pending register.

  if (not l_4_1.role and l_0_4[l_4_1.cf_info.id] and l_0_4[l_4_1.cf_info.id][l_4_2]) or l_4_4.skin then
    do return end
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  print("~~~~~~~~~~set_unit_ani_trigger com3", l_4_1.id, l_4_1.name, l_4_7, l_0_8[l_4_2] or false, "trigger", l_4_2)
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_4_3 then
    l_4_3()
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if not true then
    l_4_0:fight_log_error("set_trigger err: {0}, ani_name:{1}, unit msg:{2}, trace: {3}", nil, l_4_7, table_string(l_4_1[l_4_1.type], "", 3), debug.traceback())
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_4_5 and l_4_0[l_0_0("leave_%s_ani", l_4_5)] then
      l_4_0[l_0_0("leave_%s_ani", l_4_5)](l_4_0, l_4_1, l_4_2)
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_4_0[l_0_0("enter_%s_ani", l_4_2)] then
    l_4_0[l_0_0("enter_%s_ani", l_4_2)](l_4_0, l_4_1, l_4_2)
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_4_0:try_to_play_role_ani_eff(l_4_1)
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_4_0:try_to_update_unit_weapon_ani_eff_active(l_4_1)
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- Warning: undefined locals caused missing assignments!
end

l_0_6.set_unit_ani_trigger = l_0_10
l_0_10 = function(l_5_0, l_5_1, l_5_2)
  if not l_5_1.role then
    local l_5_3 = l_5_1.cf_info
     -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

  end
  l_5_0:play_unit_effect(l_5_1, l_5_3.effect_hitted, true, not l_5_3.effect_hitted or "skin_root", nil, nil, true, nil, nil, nil, true)
end
end

l_0_6.enter_hurt_ani = l_0_10
l_0_10 = function(l_6_0, l_6_1, l_6_2)
  if not l_6_1.monster then
    return 
  end
  if l_6_1.eff_walk then
    l_6_1.timer_eff_walk = l_6_0:add_run_after_to_unit(l_6_1, 100, function()
    l_6_1.timer_eff_walk = nil
    l_6_0:del_unit_effect(l_6_1, l_6_1.eff_walk)
    l_6_1.eff_walk = nil
   end)
  end
end

l_0_6.leave_walk_ani = l_0_10
l_0_10 = function(l_7_0, l_7_1, l_7_2)
  if not l_7_1.monster then
    return 
  end
  if l_7_1.timer_eff_walk then
    l_7_0:del_unit_timer(l_7_1, l_7_1.timer_eff_walk)
    l_7_1.timer_eff_walk = nil
  end
  local l_7_3 = l_7_1.cf_info
   -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

end
l_7_1.eff_walk = l_7_0:play_unit_effect(l_7_1, l_7_3.effect_move, true, not l_7_3.effect_move or l_7_1.eff_walk or "skin_root", nil, nil, false, nil, nil, nil)
end

l_0_6.enter_walk_ani = l_0_10
l_0_10 = function(l_8_0, l_8_1, l_8_2)
  if l_8_1.id == l_8_0.ctrl_unit_id and not l_8_0:is_self_ctrled_by_commander() then
    return 
  end
  local l_8_3 = l_8_0:get_unit_power_add_speed(l_8_1)
  local l_8_4 = 0
  local l_8_5 = Time.time
  l_8_1.ready_power_timer = l_8_0:run_every_in_this_round(30, function()
    local l_9_0 = Time.time - l_8_5
    upvalue_512 = l_8_3 * l_9_0
    if l_8_4 > 2 then
      upvalue_512 = 0
      if l_8_1.ready_power_timer then
        l_8_0:del_this_round_timer(l_8_1.ready_power_timer)
        l_8_1.ready_power_timer = nil
      elseif l_8_4 > 1 then
        upvalue_512 = 1 - (l_8_4 - 1)
      end
    end
    l_8_0:set_unit_ani_frame_by_percent(l_8_1, l_8_4)
   end)
end

l_0_6.enter_ready_attack_ani = l_0_10
l_0_10 = l_0_6.enter_ready_attack_ani
l_0_6.enter_ready_attack0_ani = l_0_10
l_0_10 = l_0_6.enter_ready_attack_ani
l_0_6.enter_ready_attack1_ani = l_0_10
l_0_10 = l_0_6.enter_ready_attack_ani
l_0_6.enter_ready_attack2_ani = l_0_10
l_0_10 = l_0_6.enter_ready_attack_ani
l_0_6.enter_ready_attack3_ani = l_0_10
l_0_10 = l_0_6.enter_ready_attack_ani
l_0_6.enter_ready_throw_ani = l_0_10
l_0_10 = l_0_6.enter_ready_attack_ani
l_0_6.enter_ready_throw0_ani = l_0_10
l_0_10 = l_0_6.enter_ready_attack_ani
l_0_6.enter_ready_throw1_ani = l_0_10
l_0_10 = l_0_6.enter_ready_attack_ani
l_0_6.enter_ready_throw2_ani = l_0_10
l_0_10 = l_0_6.enter_ready_attack_ani
l_0_6.enter_ready_throw3_ani = l_0_10
l_0_10 = function(l_9_0, l_9_1, l_9_2)
  if l_9_0.ctrl_unit_id == l_9_1.id and not l_9_0:is_self_ctrled_by_commander() then
    return 
  end
  if l_9_1.ready_power_timer then
    l_9_0:del_this_round_timer(l_9_1.ready_power_timer)
    l_9_1.ready_power_timer = nil
  end
end

l_0_6.leave_ready_attack_ani = l_0_10
l_0_10 = l_0_6.leave_ready_attack_ani
l_0_6.leave_ready_attack0_ani = l_0_10
l_0_10 = l_0_6.leave_ready_attack_ani
l_0_6.leave_ready_attack1_ani = l_0_10
l_0_10 = l_0_6.leave_ready_attack_ani
l_0_6.leave_ready_attack2_ani = l_0_10
l_0_10 = l_0_6.leave_ready_attack_ani
l_0_6.leave_ready_attack3_ani = l_0_10
l_0_10 = l_0_6.leave_ready_attack_ani
l_0_6.leave_ready_throw_ani = l_0_10
l_0_10 = l_0_6.leave_ready_attack_ani
l_0_6.leave_ready_throw0_ani = l_0_10
l_0_10 = l_0_6.leave_ready_attack_ani
l_0_6.leave_ready_throw1_ani = l_0_10
l_0_10 = l_0_6.leave_ready_attack_ani
l_0_6.leave_ready_throw2_ani = l_0_10
l_0_10 = l_0_6.leave_ready_attack_ani
l_0_6.leave_ready_throw3_ani = l_0_10
l_0_10 = function(l_10_0, l_10_1, l_10_2)
  local l_10_3 = l_10_1.model
  if not l_10_3 then
    return 
  end
  if l_10_3.loading_skin ~= false then
    return 
  end
  if not l_10_3.skin then
    return 
  end
  l_10_3.skin:set_ani_frame_by_percent(l_10_2)
end

l_0_6.set_unit_ani_frame_by_percent = l_0_10
l_0_10 = function(l_11_0)
  local l_11_1 = l_11_0.id_to_unit
  for l_11_5,l_11_6 in pairs(l_11_1) do
    if not l_11_6.is_cur_round_attacker then
      l_11_0:try_to_start_unit_sp_idle_timer(l_11_6)
    end
  end
end

l_0_6.try_to_start_all_unit_sp_idle_timer = l_0_10
l_0_10 = function(l_12_0)
  for l_12_4,l_12_5 in pairs(l_12_0.id_to_unit) do
    l_12_0:try_to_stop_unit_sp_idle_timer(l_12_5)
  end
end

l_0_6.try_to_stop_all_unit_sp_idle_timer = l_0_10
l_0_10 = function(l_13_0, l_13_1)
  if l_13_1.hidden_units then
    return 
  end
  if l_13_1.is_dead then
    return 
  end
  if l_13_1.role and l_13_1.role.cf_monster then
    return 
  end
  if not l_13_1.role and not l_13_1.pet then
    return 
  end
  if l_13_1.pet then
    local l_13_2 = assert(l_13_1.owner_id)
    local l_13_3 = l_13_0:get_unit_by_id(l_13_2, true)
    if l_13_3 and l_13_3.is_cur_round_attacker then
      return 
    end
  end
  if l_13_1.timer_sp_idle then
    return 
  end
  local l_13_4 = l_0_2.interval_for_wait_to_play_sp_idle.value
  local l_13_5 = math.random(l_13_4.min, l_13_4.max)
  l_13_1.timer_sp_idle = l_13_0:add_run_after_to_unit(l_13_1, l_13_5, function()
    if l_13_1.ani_trigger ~= "idle" then
      return 
    end
    local l_14_0 = l_0_2.probability_for_play_sp_idle.value
    local l_14_1 = math.random(1, 100)
    if l_14_0 < l_14_1 then
      return 
    end
    l_13_0:set_unit_ani_trigger(l_13_1, l_13_1.pet and "idle2" or "sp_idle")
   end)
end

l_0_6.try_to_start_unit_sp_idle_timer = l_0_10
l_0_10 = function(l_14_0, l_14_1)
  if not l_14_1.timer_sp_idle then
    return 
  end
  l_14_0:del_unit_timer(l_14_1, l_14_1.timer_sp_idle)
  l_14_1.timer_sp_idle = nil
end

l_0_6.try_to_stop_unit_sp_idle_timer = l_0_10
l_0_10 = function(l_15_0, l_15_1)
  local l_15_2 = l_0_3[l_15_1.type]
  if not l_15_2 then
    return 
  end
  local l_15_3 = l_15_1.ani_trigger
  local l_15_4 = l_15_2[l_15_3]
  if not l_15_4 then
    return 
  end
  if not l_15_1.ani_to_effect then
    local l_15_5 = {}
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_15_1.ani_to_effect = l_15_5
   -- DECOMPILER ERROR: Confused at declaration of local variable

  if l_15_1.ani_to_effect[l_15_3] then
    l_15_1.ani_to_effect[l_15_3] = nil
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_15_0:del_unit_effect(l_15_1, l_15_1.ani_to_effect[l_15_3])
  end
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Overwrote pending register.

    if l_15_1.pet then
      l_15_0.land_data:land_to_world_pos(l_15_1.center_pos.x, l_15_1.center_pos.y, nil)
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_15_1.ani_to_effect[l_15_3] = l_15_0:play_unit_effect(l_15_1, l_15_4, true, "skin_root", nil, nil, true, nil, nil, nil, true)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_6.try_to_play_role_ani_eff = l_0_10

