-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.unit.die_-5868418002861275661.bin 

local l_0_0 = DataConfigs
local l_0_1 = l_0_0.fight_misc
local l_0_2 = require("game.utils.events")
local l_0_3 = Game.module.fight
local l_0_4 = l_0_3.ways.base
l_0_4.on_hp_volume_to_zero = function(l_1_0, l_1_1, l_1_2, l_1_3)
  if not l_1_2 or l_1_3 then
    l_1_0:unit_die(l_1_1)
  else
    l_1_0:unit_suspended_ani(l_1_1)
  end
end

l_0_4.on_hp_volume_recovered_from_zero = function(l_2_0, l_2_1)
  if l_2_1.is_suspended_ani then
    l_2_0:unit_recover_from_suspended_ani(l_2_1)
  elseif l_2_1.is_dead then
    l_2_0:unit_recover_from_dead(l_2_1)
  end
end

l_0_4.unit_die = function(l_3_0, l_3_1)
  if l_3_1.is_dead then
    return 
  end
  l_3_0:on_fight_unit_die(l_3_1)
end

l_0_4.on_fight_unit_die = function(l_4_0, l_4_1)
  l_4_1.is_dead = true
  l_4_1.is_suspended_ani = nil
  if l_4_1.comp_scene_obj then
    l_4_1.comp_scene_obj:SetIsSimulated(false)
    l_4_1.comp_scene_obj:SetCollisionEnable(false)
  end
  l_4_0:raw_set_unit_stop_move(l_4_1)
  l_4_0:try_to_del_unit_pursuit_eff(l_4_1)
  l_4_0:del_unit_buffs(l_4_1, true)
  l_4_0:clear_unit_extra_hit_area(l_4_1)
  l_4_0:try_to_remove_unit_suspended_ani(l_4_1)
  l_4_1.timer_sp_idle = nil
  l_4_1.timer_hurt_ani = nil
  l_4_1.timer_eff_walk = nil
  l_4_1.timer_holding_fire_ani = nil
  l_4_1.command = nil
  l_4_0:del_unit_timers(l_4_1)
  if l_4_1.id == l_4_0.ctrl_unit_id then
    l_4_0:try_to_play_audio(l_0_1.audio_die.value, l_4_1)
    l_4_0:refresh_all_soul_point()
    l_4_0:ctrl_die_close_ui()
  elseif l_4_1.role or l_4_1.pet then
    l_4_0:try_to_play_audio(l_0_1.audio_ko.value, l_4_1)
  end
  if l_4_1.pet and l_4_1.owner_id == l_4_0.ctrl_unit_id then
    l_4_0:on_my_pet_die(l_4_1)
  end
  l_4_0:req_update_recommand_forces()
  local l_4_2 = l_4_0:get_ctrl_unit()
  if l_4_2 then
    l_4_0:try_unit_drop_gold(l_4_1)
  end
  l_4_0:try_to_update_monster_dead_count(l_4_1, 1)
  l_4_0:del_mark_on_unit_die(l_4_1)
  l_0_2.brocast("fight_unit_die", l_4_1)
  local l_4_3 = l_4_0:add_perform()
  l_4_0:play_unit_death_perform(l_4_1, function()
    l_4_0:del_perform(l_4_2)
    if l_4_0.id_to_unit[l_4_1.id] then
      l_4_0:set_unit_skin_layer(l_4_1, "Default")
      l_4_0:set_unit_effects_active(l_4_1, false)
      l_4_0:set_unit_active(l_4_1, false)
    end
    l_4_0:try_to_show_soul_by_unit_id(l_4_1.id)
   end)
end

l_0_4.unit_recover_from_dead = function(l_5_0, l_5_1)
  if not l_5_1.is_dead then
    return 
  end
  l_5_1.is_dead = false
  l_5_1.fall_to_death = nil
  l_5_0:del_unit_timers(l_5_1)
  l_5_0:try_to_revert_unit_death_perform(l_5_1)
  l_5_0:set_unit_effects_active(l_5_1, true)
  l_5_0:set_unit_active(l_5_1, true)
  l_5_0:set_unit_ani_trigger(l_5_1, "idle")
  if l_5_1.id ~= l_5_0.ctrl_unit_id then
    l_5_0:req_update_recommand_forces()
  else
    l_5_0:unlock_camera(1)
    l_5_0:refresh_all_soul_point()
  end
  l_5_0:try_to_update_monster_dead_count(l_5_1, -1)
  l_0_2.brocast("fight_unit_revert_die", l_5_1)
end

l_0_4.try_to_update_monster_dead_count = function(l_6_0, l_6_1, l_6_2)
  if not l_6_1.monster then
    return 
  end
  local l_6_3 = l_6_1.monster.id
  do
    local l_6_4 = l_6_0.monster_cf_id_to_dead_count[l_6_3] or 0
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_6_0.monster_cf_id_to_dead_count[l_6_3] = math.max(l_6_4 + l_6_2 * 1, 0)
end

l_0_4.get_monster_dead_count = function(l_7_0, l_7_1)
  return l_7_0.monster_cf_id_to_dead_count[l_7_1]
end

local l_0_5 = function(l_8_0, l_8_1, l_8_2)
  l_8_0 = l_8_0 - 1
  if l_8_0 <= 0 and not l_8_2 then
    l_8_1()
  end
  return l_8_0
end

l_0_4.play_unit_death_perform = function(l_9_0, l_9_1, l_9_2)
  if l_9_1.fall_to_death then
    l_9_2()
    return 
  end
  local l_9_3 = l_9_1.death_perform
  if not l_9_3 then
    l_9_2()
    return 
  end
  if l_9_3.tomb then
    l_9_0:show_one_tomb(l_9_1, l_9_1.pos)
  end
  if not l_9_3.delay_remove or l_9_3.delay_remove > 0 then
    l_9_0:add_run_after_to_unit(l_9_1, l_9_3.delay_remove, function()
    l_9_2()
   end)
  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_9_3.ani_name and l_9_0:unit_is_has_animation(l_9_1, l_9_3.ani_name) and l_9_1.ani_trigger ~= l_9_3.ani_name then
    if l_9_1.role then
      l_9_0:set_unit_ani_trigger(l_9_1, l_9_3.ani_name)
     -- DECOMPILER ERROR: Confused about usage of registers!

    else
      l_9_0:set_unit_ani_trigger(l_9_1, l_9_3.ani_name, function()
      l_9_5 = l_0_5(l_9_5, l_9_2, l_9_4)
      end)
    end
  end
  if l_9_3.sd_die then
    l_9_0:try_to_play_audio(l_9_3.sd_die, l_9_1)
  end
  if l_9_3.eff_die then
    if l_9_3.effect_die_path then
      do return end
    end
    l_9_0:play_effect(l_9_3.eff_die, nil, l_9_1.world_pos, nil, nil, true, function()
      l_9_5 = l_0_5(l_9_5, l_9_2, l_9_4)
      end, nil, nil, true)
  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_9_3.dissolve_time or l_9_3.dissolve_time <= 0 then
    l_9_1.eff_die = l_9_0:play_unit_effect(l_9_1, l_9_3.eff_die, true, l_9_3.effect_die_path, nil, nil, true, function()
    l_9_5 = l_0_5(l_9_5, l_9_2, l_9_4)
   end, nil, nil, true)
     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_9_3.dissolve_time and not not l_9_3.delay_remove or l_9_3.delay_remove > 0 then
      l_9_2()
    end
    return 
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- Warning: undefined locals caused missing assignments!
end

l_0_4.try_to_revert_unit_death_perform = function(l_10_0, l_10_1)
  local l_10_2 = l_10_1.tomb_id
  if l_10_2 then
    local l_10_3 = l_10_0.tomb_id_to_tomb[l_10_2]
    l_10_0:disactive_tomb(l_10_3)
  end
  if l_10_1.eff_die then
    l_10_0:del_unit_effect(l_10_1, l_10_1.eff_die)
    l_10_1.eff_die = nil
  end
  if l_10_1.dissolve_delay_timer then
    l_10_0:del_unit_timer(l_10_1, l_10_1.dissolve_delay_timer)
    l_10_1.dissolve_delay_timer = nil
  end
  if l_10_1.dissolve_timer then
    l_10_0:del_unit_timer(l_10_1, l_10_1.dissolve_timer)
    l_10_1.dissolve_timer = nil
  end
  local l_10_4 = l_10_1.death_perform.dissolve_time
  if l_10_4 and l_10_4 > 0 and l_10_1.model then
    GameFunctions.set_target_model_mat_alpha(l_10_1.model.gameObject, 1)
  end
end

l_0_4.unit_suspended_ani = function(l_11_0, l_11_1)
  if l_11_1.is_suspended_ani then
    return 
  end
  l_11_1.is_suspended_ani = true
  local l_11_2 = l_11_1.death_perform
  if l_11_2 and l_11_2.ani_name then
    l_11_0:set_unit_ani_trigger(l_11_1, l_11_2.ani_name)
  end
  if not l_11_1.role then
    return 
  end
  if l_11_1.eff_suspended then
    return 
  end
  l_11_1.eff_suspended = l_11_0:play_unit_effect(l_11_1, l_0_1.hang_fx.value, true, "skin_root", nil, nil, true, nil, nil, nil, true)
end

l_0_4.unit_recover_from_suspended_ani = function(l_12_0, l_12_1)
  if not l_12_1.is_suspended_ani then
    return 
  end
  l_12_1.is_suspended_ani = nil
  if l_12_0:unit_is_has_animation(l_12_1, "reborn") then
    l_12_0:set_unit_ani_trigger(l_12_1, "reborn")
  else
    l_12_0:set_unit_ani_trigger(l_12_1, "idle")
  end
  l_12_0:try_to_remove_unit_suspended_ani(l_12_1)
end

l_0_4.try_to_remove_unit_suspended_ani = function(l_13_0, l_13_1)
  if not l_13_1.eff_suspended then
    return 
  end
  l_13_0:del_unit_effect(l_13_1, l_13_1.eff_suspended)
  l_13_1.eff_suspended = nil
end

l_0_4.set_unit_die_if_in_suspended_ani_when_turn_round = function(l_14_0)
  for l_14_4,l_14_5 in pairs(l_14_0.id_to_unit) do
    if l_14_5.is_suspended_ani and l_14_5.type ~= "monster" then
      l_14_0:unit_die(l_14_5)
    end
  end
end


