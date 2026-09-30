-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.unit.placement_radar_4110049648502398089.bin 

local l_0_0 = math.pow
local l_0_1 = math.deg
local l_0_2 = math.rad
local l_0_3 = math.atan2
local l_0_4 = math.abs
local l_0_5 = TransformUtils
local l_0_6 = Game.module.fight
local l_0_7 = l_0_6.ways.base
local l_0_8 = l_0_6.role_directions
l_0_7.destroy_unit_placement_radar = function(l_1_0, l_1_1)
  local l_1_2, l_1_3 = l_1_0:get_my_radar_placements, l_1_0
  local l_1_4 = {}
  l_1_4.only_one = true
  l_1_2 = l_1_2(l_1_3, l_1_4)
  if l_1_2 then
    l_1_3, l_1_4 = l_1_0:camera_focus_position, l_1_0
    l_1_3(l_1_4, l_1_2.world_pos, 0.3, l_0_6.camera_priority.force)
    l_1_3, l_1_4 = l_1_0:lock_camera, l_1_0
    l_1_3(l_1_4, 16)
  else
    l_1_3, l_1_4 = l_1_0:unlock_camera, l_1_0
    l_1_3(l_1_4, 16)
  end
  l_1_1.radar_timer = nil
  l_1_3 = nil
  l_1_4 = l_1_1.radar_scan_targets
  if l_1_4 then
    l_1_4 = pairs
    l_1_4 = l_1_4(l_1_1.radar_scan_targets)
    for l_1_8,i_2 in l_1_4 do
      l_1_3 = l_1_0:get_unit_by_id(l_1_7, true)
      if l_1_3 then
        l_1_0:del_unit_effect_by_effect_id(l_1_3, l_1_8)
      end
    end
    l_1_1.radar_scan_targets = nil
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
end

l_0_7.init_placement_radar = function(l_2_0, l_2_1)
  l_2_1.radar_time = 0
  l_2_1.radar_timer = l_2_0:add_run_every_to_unit(l_2_1, 16.667, function()
    l_2_0:update_placement_radar(l_2_1)
   end)
  l_2_0:try_to_turn_unit_face(l_2_1, l_0_8.left, true)
  l_2_0:camera_focus_position(l_2_1.world_pos, 0.3, l_0_6.camera_priority.force)
  l_2_0:lock_camera(16)
end

l_0_7.update_placement_radar = function(l_3_0, l_3_1)
  l_3_1.radar_time = l_3_1.radar_time + 16.667
  local l_3_2 = l_3_1.cf_info.spec_args.detection_period
   -- DECOMPILER ERROR: Confused about usage of registers!

  if 360 - l_3_1.radar_time % l_3_2 / l_3_2 * 360 > 180 then
    local l_3_3, l_3_5, l_3_8, l_3_11, l_3_14, l_3_15, l_3_18, l_3_20, l_3_22 = 360 - l_3_1.radar_time % l_3_2 / l_3_2 * 360 - 360
  end
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_3_1.model or not l_3_1.model.skin or l_3_1.model.skin.gameObject then
    if not l_3_1.model.skin.t_radar then
      l_3_1.model.skin.t_radar = l_3_1.model.skin.gameObject.transform:Find("zhizhen")
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_3_1.model.skin.gameObject.transform:Find("zhizhen") then
      l_0_5.SetR(l_3_1.model.skin.gameObject.transform:Find("zhizhen"), 0, 0, l_3_3)
    end
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_3_1.owner_id ~= l_3_0.ctrl_unit_id then
    return 
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_3_1.radar_fire_targets then
    l_3_1.radar_fire_targets = {}
     -- DECOMPILER ERROR: Confused about usage of registers!

  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_3_1.radar_scan_targets then
    l_3_1.radar_scan_targets = {}
     -- DECOMPILER ERROR: Confused about usage of registers!

  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

  for l_3_33,l_3_34 in pairs(l_3_0.id_to_unit) do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if not l_3_0:is_enemy() then
      for i_1,i_2 in pairs(l_3_0.id_to_unit) do
      end
       -- DECOMPILER ERROR: Confused about usage of registers!

      if not l_3_0:is_unit_recommend_force_able(i_2, true) then
        for i_1,i_2 in pairs(l_3_0.id_to_unit) do
        end
         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Overwrote pending register.

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Overwrote pending register.

         -- DECOMPILER ERROR: Overwrote pending register.

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Overwrote pending register.

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Confused about usage of registers!

        l_3_0:try_show_radar_scan_target(l_3_1, i_2, nil, nil, l_3_3, nil, nil)
         -- DECOMPILER ERROR: Confused about usage of registers for local variables.

      end
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

       -- Warning: missing end command somewhere! Added here
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_7.try_show_radar_scan_target = function(l_4_0, l_4_1, l_4_2, l_4_3, l_4_4, l_4_5, l_4_6, l_4_7)
  if l_4_1.radar_scan_targets[l_4_2.id] ~= nil == l_4_3 then
    return 
  end
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    if l_4_3 then
      temp_vec3:Set(l_4_2.world_pos.x, l_4_2.world_pos.y + 0.2, 0)
       -- DECOMPILER ERROR: Confused at declaration of local variable

    end
    l_4_1.radar_scan_targets[l_4_2.id] = l_4_0:play_effect(10000045, l_4_0.t_effect_root, temp_vec3, nil, true, false) and l_4_0:play_effect(10000045, l_4_0.t_effect_root, temp_vec3, nil, true, false).id or false
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_7.get_my_radar_placements = function(l_5_0, l_5_1, l_5_2, l_5_3)
  local l_5_4 = l_0_6.placement_spec_type.radar
  local l_5_5 = nil
  for l_5_9,l_5_10 in pairs(l_5_0.id_to_unit) do
    if l_5_10.placement and l_5_10.owner_id == l_5_0.ctrl_unit_id and l_5_10.cf_info.spec_tag == l_5_4 then
      if l_5_2 then
        if l_5_3 then
          l_5_2(l_5_3, l_5_10, l_5_1)
        else
          l_5_2(l_5_10, l_5_1)
        end
      else
        if l_5_1 and l_5_1.only_one then
          l_5_5 = l_5_10
        end
      end
    end
  end
  return l_5_5
end

l_0_7.try_to_select_radar_fire_target = function(l_6_0, l_6_1)
  local l_6_2 = {}
  l_6_0.land_data:world_to_land_pos(l_6_1.x, l_6_1.y, l_6_2)
  l_6_0:get_my_radar_placements(l_6_2, l_6_0.try_to_select_radar_scan_target, l_6_0)
  if l_6_2.target_unit and l_6_2.radar then
    l_6_0:on_radar_fire_target(l_6_2.radar, l_6_2.target_unit)
  end
  return l_6_2.target_unit
end

l_0_7.try_radar_attack_first_target = function(l_7_0)
  local l_7_1 = {}
  l_7_1.compare_radar_dis = true
  l_7_0:get_my_radar_placements(l_7_1, l_7_0.try_to_select_radar_scan_target, l_7_0)
  if l_7_1.target_unit and l_7_1.radar then
    l_7_0:on_radar_fire_target(l_7_1.radar, l_7_1.target_unit)
  end
  return l_7_1.target_unit
end

l_0_7.try_to_select_radar_scan_target = function(l_8_0, l_8_1, l_8_2)
  if not l_8_1.radar_scan_targets then
    return 
  end
  local l_8_3, l_8_4 = nil, nil
  if l_8_2.compare_radar_dis then
    l_8_3, l_8_4 = l_8_1.pos.x, l_8_1.pos.y
  else
    l_8_3, l_8_4 = l_8_2.x, l_8_2.y
  end
  local l_8_5, l_8_6 = nil, nil
  for l_8_10,l_8_11 in pairs(l_8_1.radar_scan_targets) do
    l_8_6 = l_8_0:get_unit_by_id(l_8_10, true)
    if l_8_6 then
      l_8_5 = l_0_0(l_8_6.pos.x - l_8_3, 2) + l_0_0(l_8_6.pos.y - l_8_4, 2)
      if not l_8_2.min_dis or l_8_5 < l_8_2.min_dis then
        l_8_2.target_unit = l_8_6
        l_8_2.radar = l_8_1
        l_8_2.min_dis = l_8_5
      end
    end
  end
end

l_0_7.on_radar_fire_target = function(l_9_0, l_9_1, l_9_2)
  if l_9_1.radar_fire_targets[l_9_2.id] == true then
    return 
  end
  do
    local l_9_3, l_9_4, l_9_5, l_9_6, l_9_7, l_9_8 = l_9_1.radar_scan_targets and l_9_1.radar_scan_targets[l_9_2.id] or nil
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_9_3 then
    l_9_0:del_unit_effect_by_effect_id(l_9_2, l_9_3)
    l_9_1.radar_scan_targets[l_9_2.id] = nil
  end
  l_9_1.radar_fire_targets[l_9_2.id] = true
  l_9_1.radar_fire_target_count = (l_9_1.radar_fire_target_count or 1) + 1
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    l_9_0:send_network_msg("battle_update_attack_info_c2s", {angle = l_9_0:get_unit_fire_angle(l_9_0:get_ctrl_unit()), direction = l_9_0:get_ctrl_unit().direction, force = 0, fire_count = l_9_1.radar_fire_target_count, force_aim_type = 3, target_id = l_9_2.id})
    temp_vec3:Set(0, 0.2, 0)
    l_9_0:play_unit_effect(l_9_2, 10000044, true, nil, nil, temp_vec3, true)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- Warning: undefined locals caused missing assignments!
end


