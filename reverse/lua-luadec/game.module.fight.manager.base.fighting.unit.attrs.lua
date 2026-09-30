-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.unit.attrs_-6891889581371411036.bin 

local l_0_0 = math.min
local l_0_1 = math.max
local l_0_2 = string.format
local l_0_3 = DataConfigs
local l_0_4 = l_0_3.fight_misc
local l_0_5 = require("game.utils.events")
local l_0_6 = Game.module.fight
local l_0_7 = l_0_6.ways.base
l_0_7.on_msg_battle_update_attr_s2c = function(l_1_0, l_1_1, l_1_2)
  local l_1_3 = (l_1_0:get_unit_by_id(l_1_2.object_id))
  local l_1_4, l_1_5 = nil, nil
  do
    local l_1_6 = l_1_2.attr
    for l_1_10,l_1_11 in pairs(l_1_6) do
      l_1_5 = l_0_2("update_unit_%s", l_1_10)
      l_1_4 = l_1_0[l_1_5]
      if l_1_4 then
        l_1_4(l_1_0, l_1_3, l_1_11)
        for l_1_10,l_1_11 in l_1_7 do
        end
        l_1_3.attrs[l_1_10] = l_1_11
      end
      l_0_5.brocast("battle_update_attr", l_1_2.object_id)
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_7.add_unit_hp = function(l_2_0, l_2_1, l_2_2)
  local l_2_3 = l_0_0(l_2_1.attrs.max_hp, l_2_1.attrs.hp + l_2_2)
  l_2_0:update_unit_hp(l_2_1, l_2_3)
end

l_0_7.dec_unit_hp = function(l_3_0, l_3_1, l_3_2)
  local l_3_3 = l_0_1(0, l_3_1.attrs.hp - l_3_2)
  l_3_0:update_unit_hp(l_3_1, l_3_3)
end

l_0_7.update_unit_hp = function(l_4_0, l_4_1, l_4_2)
  assert(l_4_1)
  local l_4_3 = l_4_1.attrs.hp
  l_4_1.attrs.last_hp = l_4_3
  l_4_1.attrs.hp = l_4_2
  l_4_0:try_to_perform_unit_hp_update(l_4_1, l_4_3, l_4_2, dmg, false)
  if not l_4_0:is_ctrl_unit(l_4_1) then
    return 
  end
  l_4_0:try_to_trigger_guide_on_ctrl_unit_attr_change(l_4_0.cf_battle_id, "hp")
end

l_0_7.try_to_perform_unit_hp_update = function(l_5_0, l_5_1, l_5_2, l_5_3, l_5_4, l_5_5, l_5_6)
  if l_5_1.unit_hp_perform_queue and next(l_5_1.unit_hp_perform_queue) then
    local l_5_7, l_5_8 = nil, nil
    repeat
      repeat
        if next(l_5_1.unit_hp_perform_queue) then
          l_5_7 = table.remove(l_5_1.unit_hp_perform_queue, 1)
          l_5_8 = l_5_0.timer:get_timer_info_by_timer_id(l_5_7)
        until l_5_8
        l_5_0.timer:excute_timer(l_5_8)
        l_5_0:del_this_round_timer(l_5_7)
      else
        table.clear(l_5_1.unit_hp_perform_queue)
      end
      l_5_0:perform_unit_hp_update(l_5_1, l_5_2, l_5_3, l_5_4, l_5_5, l_5_6)
       -- Warning: missing end command somewhere! Added here
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_7.perform_unit_hp_update = function(l_6_0, l_6_1, l_6_2, l_6_3, l_6_4, l_6_5, l_6_6)
  assert(l_6_1)
  if l_6_6 then
    if not l_6_1.role or l_6_1.state == l_0_6.role_status.blowing then
      if l_6_4 and l_6_4 < l_6_2 then
        l_0_5.brocast("fight_update_hp", l_6_1, l_6_2 - l_6_4, l_6_1.attrs.max_hp, l_6_2)
      end
      return 
    end
    if l_6_0:is_unit_has_buff_state(l_6_1, l_0_6.buff_states.move_lift) and not l_6_0.land_data:is_land_pos_empty(l_6_1.pos.x, l_6_1.pos.y) then
      return 
    end
  end
  if l_6_2 ~= l_6_3 then
    l_0_5.brocast("fight_update_hp", l_6_1, l_6_1.attrs.hp, l_6_1.attrs.max_hp, l_6_2)
  end
  if l_6_3 <= 0 then
    local l_6_7 = l_6_0.owner_id_to_pet_unit[l_6_1.id]
    if l_6_7 and not l_6_5 then
      l_6_0:on_hp_volume_to_zero(l_6_7, l_6_5, true)
    end
    l_6_0:on_hp_volume_to_zero(l_6_1, l_6_5)
  end
  if l_6_3 > 0 and l_6_2 <= 0 then
    l_6_0:on_hp_volume_recovered_from_zero(l_6_1)
  end
end

l_0_7.update_unit_max_hp = function(l_7_0, l_7_1, l_7_2)
  assert(l_7_2)
  local l_7_3 = l_7_1.attrs.hp
  l_7_1.attrs.max_hp = l_7_2
  l_7_1.attrs.hp = l_0_0(l_7_1.attrs.hp, l_7_2)
  l_0_5.brocast("fight_update_hp", l_7_1, l_7_1.attrs.hp, l_7_2, l_7_3)
  if not l_7_0:is_ctrl_unit(l_7_1) then
    return 
  end
  l_7_0:try_to_trigger_guide_on_ctrl_unit_attr_change(l_7_0.cf_battle_id, "max_hp")
end

l_0_7.update_unit_anger = function(l_8_0, l_8_1, l_8_2)
  assert(l_8_1)
  local l_8_3 = l_8_1.attrs.anger
  l_8_1.attrs.anger = l_8_2
  l_8_0:perform_unit_anger_update(l_8_1, l_8_3, l_8_2)
end

l_0_7.perform_unit_anger_update = function(l_9_0, l_9_1, l_9_2, l_9_3)
  l_0_5.brocast("fight_update_anger", l_9_1, l_9_1.attrs.anger)
  if not l_9_0:is_ctrl_unit(l_9_1) then
    return 
  end
  l_9_0:try_to_trigger_guide_on_ctrl_unit_attr_change(l_9_0.cf_battle_id, "anger")
end

l_0_7.update_unit_strength = function(l_10_0, l_10_1, l_10_2)
  assert(l_10_1)
  l_10_1.attrs.strength = l_0_1(l_0_0(l_10_2, l_10_1.attrs.max_strength), 0)
  if not l_10_0:is_ctrl_unit(l_10_1) then
    return 
  end
  l_0_5.brocast("fight_update_strength", l_10_1)
  l_10_0:try_to_trigger_guide_on_ctrl_unit_attr_change(l_10_0.cf_battle_id, "strength")
end

l_0_7.update_unit_max_strength = function(l_11_0, l_11_1, l_11_2)
  assert(l_11_2)
  l_11_1.attrs.max_strength = l_11_2
  l_11_1.attrs.strength = l_0_0(l_11_1.attrs.strength, l_11_2)
  if not l_11_0:is_ctrl_unit(l_11_1) then
    return 
  end
  l_0_5.brocast("fight_update_strength", l_11_1)
  l_11_0:try_to_trigger_guide_on_ctrl_unit_attr_change(l_11_0.cf_battle_id, "max_strength")
end

l_0_7.update_unit_energy = function(l_12_0, l_12_1, l_12_2)
  assert(l_12_1)
  local l_12_3 = l_12_1.attrs.energy
  l_12_1.attrs.energy = l_0_1(l_0_0(l_12_2, l_12_1.attrs.max_energy), 0)
  l_12_0:perform_unit_energy_update(l_12_1, l_12_3, l_12_2)
  if not l_12_0:is_ctrl_unit(l_12_1) then
    return 
  end
  l_12_0:try_to_trigger_guide_on_ctrl_unit_attr_change(l_12_0.cf_battle_id, "energy")
end

l_0_7.perform_unit_energy_update = function(l_13_0, l_13_1, l_13_2, l_13_3, l_13_4, l_13_5)
  if l_13_1.pet then
    if l_13_1.attrs.max_energy <= l_13_3 and not l_13_1.eff_energy then
      l_13_0:play_pet_max_energy_eff(l_13_1)
      do return end
      if l_13_1.eff_energy then
        l_13_0:del_unit_effect(l_13_1, l_13_1.eff_energy)
        l_13_1.eff_energy = nil
      end
    end
    l_0_5.brocast("fight_update_energy", l_13_1)
  else
    l_13_0:check_show_normal_unit_energy_effect(l_13_1, l_13_3)
    if l_13_1.id == l_13_0.ctrl_unit_id or l_13_1.id == l_13_0.self_unit_id then
      l_0_5.brocast("fight_update_energy", l_13_1)
    end
  end
end

l_0_7.check_show_normal_unit_energy_effect = function(l_14_0, l_14_1)
  if not l_14_1.role then
    return 
  end
  local l_14_2 = l_14_0:is_unit_equip_skill_energy_enough(l_14_1)
  if l_14_2 and not l_14_1.eff_energy then
    l_14_1.eff_energy = l_14_0:play_unit_effect(l_14_1, l_0_4.eff_energy_enough.value, true, "skin_root", nil, nil, false, nil, nil, true, false, nil, nil)
    do return end
    if l_14_1.eff_energy then
      l_14_0:del_unit_effect(l_14_1, l_14_1.eff_energy)
      l_14_1.eff_energy = nil
    end
  end
end

l_0_7.play_pet_max_energy_eff = function(l_15_0, l_15_1)
  local l_15_2 = l_15_0.table_pools[1]
  local l_15_3 = l_15_0.table_pools[2]
  l_15_0.land_data:land_to_world_pos(l_15_1.pos.x, l_15_1.pos.y, l_15_2)
  l_15_0.land_data:land_to_world_pos(l_15_1.center_pos.x, l_15_1.center_pos.y, l_15_3)
  local l_15_4 = l_15_0.table_pools[3]
  l_15_4.x = l_15_3.x - l_15_2.x
  l_15_4.y = l_15_3.y - l_15_2.y
  l_15_4.z = l_15_3.z - l_15_2.z
  l_15_1.eff_energy = l_15_0:play_unit_effect(l_15_1, l_0_4.eff_bear_skill.value, true, nil, nil, l_15_4, false, nil, nil, true, false, nil, nil)
end

l_0_7.update_unit_max_energy = function(l_16_0, l_16_1, l_16_2)
  l_16_1.attrs.max_energy = l_16_2
  local l_16_3 = math.max(math.min(l_16_1.attrs.energy, l_16_2), 0)
  l_16_1.attrs.energy = l_16_3
  if l_16_1.pet then
    l_0_5.brocast("fight_update_max_energy", l_16_1)
  else
    l_16_0:check_show_normal_unit_energy_effect(l_16_1)
    if l_16_1.id == l_16_0.ctrl_unit_id then
      l_0_5.brocast("fight_update_ctrl_max_energy", l_16_1)
    end
  end
end

l_0_7.update_unit_spe = function(l_17_0, l_17_1, l_17_2)
  l_17_1.attrs.spe = l_17_2
  l_0_5.brocast("fight_update_speed", l_17_1)
end


