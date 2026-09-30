-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.unit.destroy_411884009361193884.bin 

local l_0_0 = require("game.utils.events")
local l_0_1 = Game.module.fight
local l_0_2 = l_0_1.ways.base
l_0_2.on_msg_battle_object_leave_s2c = function(l_1_0, l_1_1, l_1_2)
  local l_1_3 = nil
  for l_1_7,l_1_8 in ipairs(l_1_2.leave_ids) do
    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused about usage of registers!

      l_1_3 = l_1_0:get_unit_by_id(, true)
      if not l_1_3 then
        for i_1,i_2 in ipairs(l_1_2.leave_ids) do
        end
        xpcall(l_1_0.destroy_unit, l_1_0:fight_traceback(), l_1_0, l_1_3)
      end
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

     -- Warning: missing end command somewhere! Added here
  end
end

l_0_2.destroy_units = function(l_2_0)
  for l_2_4,l_2_5 in pairs(l_2_0.id_to_unit) do
    if l_2_0.ctrl_unit_id ~= l_2_5.id then
      xpcall(l_2_0.destroy_unit, l_2_0:fight_traceback(), l_2_0, l_2_5)
    end
  end
  local l_2_6 = l_2_0.id_to_unit[l_2_0.ctrl_unit_id]
  if l_2_6 then
    xpcall(l_2_0.destroy_unit, l_2_0:fight_traceback(), l_2_0, l_2_6)
  end
  l_2_0.monster_cf_id_to_dead_count = nil
end

l_0_2.destroy_unit = function(l_3_0, l_3_1)
  assert(l_3_1)
  if l_3_0.round then
    local l_3_2, l_3_3, l_3_9, l_3_10, l_3_11, l_3_12, l_3_13, l_3_14, l_3_16, l_3_17, l_3_18, l_3_19, l_3_20, l_3_21, l_3_22, l_3_23, l_3_24, l_3_25, l_3_26, l_3_27, l_3_28, l_3_29, l_3_30, l_3_31 = l_3_0.round.cur_attacker_infos
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_3_2 then
    for l_3_7,l_3_8 in ipairs(l_3_2) do
      do
         -- DECOMPILER ERROR: Confused at declaration of local variable

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Confused about usage of registers!

        if l_3_12.obj_id == l_3_1.id then
          table.remove(l_3_2, l_3_11)
      end
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    else
      end
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_3_0.transfer_from_id == l_3_1.id then
      l_3_0.transfer_from_id = nil
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_3_0.transfer_to_id == l_3_1.id then
      l_3_0.transfer_to_id = nil
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:update_bullet_cross_unit_count_on_unit_destroy(l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:remove_smoke_unit(l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:try_to_remove_war_fog_mask_from_unit(l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:try_to_unload_preload_unit_res(l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_3_1.appear_perform_id then
      l_3_0:del_perform(l_3_1.appear_perform_id)
       -- DECOMPILER ERROR: Confused about usage of registers!

      l_3_1.appear_perform_id = nil
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_3_1.pet then
      l_3_0.owner_id_to_pet_unit[assert(l_3_1.owner_id)] = nil
       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

      if l_3_1.owner_id == l_3_0.ctrl_unit_id then
        l_3_0:on_my_pet_leave(l_3_1)
         -- DECOMPILER ERROR: Confused about usage of registers for local variables.

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

      elseif l_3_1.placement then
        l_3_0:destroy_unit_placement(l_3_1)
      end
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_3_1.temp_order then
      l_3_0:recycle_unit_order(l_3_1.temp_order)
       -- DECOMPILER ERROR: Confused about usage of registers!

      l_3_1.temp_order = nil
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_1.timer_sp_idle = nil
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_1.timer_hurt_ani = nil
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_1.timer_eff_walk = nil
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_1.timer_holding_fire_ani = nil
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_1.eff_walk = nil
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:try_to_dispose_unit_attach_objs(l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_1.rising_attch_obj = nil
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_1.fly_attch_obj = nil
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:del_unit_buffs(l_3_1, true)
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:clear_unit_extra_hit_area(l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_1.ani_to_effect = nil
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_1.eff_energy = nil
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_1.eff_guide_bullet = nil
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_3_1.monster and l_3_1.alpha and l_3_1.alpha < 1 then
      l_3_0:set_unit_model_alpha(l_3_1, 1)
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:del_unit_timers(l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:del_delay_unit(l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:try_to_del_enter_unit_from_area(l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:raw_set_unit_stop_move(l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:try_to_remove_unit_weapon_attack_eff(l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:del_this_unit_effects(l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:set_unit_skin_layer(l_3_1, "Default")
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0:destroy_unit_model(l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_0_0.brocast("fight_remove_unit_info_ui", l_3_1)
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_0.id_to_unit[l_3_1.id] = nil
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

     -- Warning: missing end command somewhere! Added here
  end
end

l_0_2.destroy_unit_placement = function(l_4_0, l_4_1)
  if l_4_1.cf_info and l_4_1.cf_info.spec_tag == l_0_1.placement_spec_type.radar then
    l_4_0:destroy_unit_placement_radar(l_4_1)
  end
end

l_0_2.update_bullet_cross_unit_count_on_unit_destroy = function(l_5_0, l_5_1)
  if l_5_1.type ~= "placement" then
    return 
  end
  if not l_5_1.cf_info then
    return 
  end
  if l_5_1.cf_info.bullet_cross ~= 1 then
    return 
  end
  l_5_0.bullet_corss_unit_count = l_5_0.bullet_corss_unit_count - 1
end


