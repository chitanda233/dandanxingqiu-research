-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.unit.move.core_-3964286075077599580.bin 

local l_0_0 = Time
local l_0_1 = math
local l_0_2 = l_0_1.cos
local l_0_3 = l_0_1.sin
local l_0_4 = l_0_1.pi
local l_0_5 = l_0_1.deg_to_rad
local l_0_6 = l_0_1.ceil
local l_0_7 = l_0_1.round
local l_0_8 = DataConfigs
local l_0_9 = l_0_8.fight_misc
local l_0_10 = require("game.utils.events")
local l_0_11 = Game.module.fight
local l_0_12 = l_0_11.ways.base
local l_0_13 = l_0_11.role_status
local l_0_14 = l_0_13.idle
local l_0_15 = l_0_13.moving
local l_0_16 = l_0_13.falling
local l_0_17 = l_0_13.blowing
local l_0_18 = l_0_13.target_falling
local l_0_19 = l_0_13.push_out_land
local l_0_20 = l_0_13.hook_rope
local l_0_21 = l_0_11.role_directions.left
local l_0_22 = l_0_11.role_directions.right
l_0_12.update_units = function(l_1_0)
  for l_1_4,l_1_5 in pairs(l_1_0.id_to_unit) do
    l_1_0:rsync_unit_pos(l_1_5)
  end
end

l_0_12.rsync_unit_pos = function(l_2_0, l_2_1)
  if l_2_1.hidden_units then
    return 
  end
  if not l_2_1.need_rsync_world_pos then
    return 
  end
  l_2_0:set_unit_world_pos(l_2_1)
end

l_0_12.set_unit_world_pos = function(l_3_0, l_3_1)
  assert(l_3_1)
  l_3_1.need_rsync_world_pos = false
  local l_3_2 = l_3_1.pos
  local l_3_3 = l_3_0.table_pools[2]
  l_3_0.land_data:land_to_world_pos(l_3_2.x, l_3_2.y, l_3_3)
  if not l_3_0:is_physics_env() or not l_3_1.comp_scene_obj then
    local l_3_4 = l_3_1.model
    if l_3_4 then
      l_3_4.transform.position = l_3_3
    end
  end
  l_3_1.world_pos.x = l_3_3.x
  l_3_1.world_pos.y = l_3_3.y
  l_3_1.world_pos.z = l_3_3.z
  l_0_10.brocast("fight_unit_world_pos_changed", l_3_1.id)
  l_3_0:try_to_update_hook_rope_position_by_unit(l_3_1)
  if l_3_1.id == l_3_0.ctrl_unit_id and l_3_0:is_loop_map() then
    l_3_0:try_to_update_loop_map_ctrl_block(l_3_1)
  end
end

l_0_12.update_units_five_frame = function(l_4_0)
  for l_4_4,l_4_5 in pairs(l_4_0.id_to_unit) do
    l_4_0:rsync_unit_model_angle(l_4_5)
  end
end

l_0_12.rsync_unit_model_angle = function(l_5_0, l_5_1)
  if l_5_1.hidden_units then
    return 
  end
  if not l_5_1.need_rsync_angle then
    return 
  end
  l_5_1.need_rsync_angle = false
  l_0_10.brocast("fight_unit_angle_changed", l_5_1)
  if not l_5_1.model or not l_5_1.model.t_skin_root then
    return 
  end
  if l_5_0:is_physics_env() then
    return 
  end
  if l_5_1.direction == l_0_21 then
    local l_5_2, l_5_3 = l_5_1.angle + 180
  end
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    l_5_0.table_pools[2].x = 0
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_5_0.table_pools[2].y = 180
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_5_0.table_pools[2].z = -l_5_2
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_5_1.model.t_skin_root.localEulerAngles = l_5_0.table_pools[2]
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_12.fixed_update_units = function(l_6_0, l_6_1)
  for l_6_5,l_6_6 in pairs(l_6_0.id_to_unit) do
    xpcall(l_6_0.fixed_update_unit, l_6_0:fight_traceback(), l_6_0, l_6_6, l_6_1)
  end
end

l_0_12.fixed_update_unit = function(l_7_0, l_7_1, l_7_2)
  if l_7_1.role or l_7_1.pet then
    l_7_0:update_unit_moving_pos(l_7_1, l_7_2)
  else
    do
      local l_7_3, l_7_4 = l_7_0.client_type_handler:get_play_speed() or 1
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    for l_7_8 = 1, l_7_3 do
      do
         -- DECOMPILER ERROR: Confused at declaration of local variable

        l_7_0:update_unit_moving_pos(l_7_1, l_7_2)
      end
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_7_0:is_physics_env() then
    do return end
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_7_0:update_unit_falling_pos(l_7_1, l_7_2)
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_7_0:update_unit_target_falling_pos(l_7_1, l_7_2)
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_7_0:update_unit_blowing(l_7_1, l_7_2)
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_7_0:update_unit_push_out_land_pos(l_7_1, l_7_2)
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_7_0:update_unit_hook_rope_pos(l_7_1, l_7_2)
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_12.set_unit_server_pos = function(l_8_0, l_8_1, l_8_2)
  assert(l_8_1)
  l_8_1.server_pos.x = l_8_2.x
  l_8_1.server_pos.y = l_8_2.y
end

l_0_12.raw_set_unit_land_pos = function(l_9_0, l_9_1, l_9_2, l_9_3, l_9_4)
  l_9_1.need_rsync_world_pos = true
  l_9_1.need_sync_pos_to_server = true
  l_9_1.pos.x = l_9_2.x
  l_9_1.pos.y = l_9_2.y
  if l_9_1.comp_scene_obj and l_9_4 ~= true then
    local l_9_5 = l_9_0.table_pools[2]
    l_9_0.land_data:land_to_world_pos(l_9_2.x, l_9_2.y, l_9_5)
    if l_9_1.state == l_0_15 and not l_9_0:is_unit_has_buff_state(l_9_1, l_0_11.buff_states.move_lift) then
      local l_9_6 = not l_9_0:is_unit_has_buff_state(l_9_1, l_0_11.buff_states.fly_free)
    else
      local l_9_7, l_9_8 = false
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_9_1.comp_scene_obj:MovePosition(l_9_5.x, l_9_5.y, true, l_9_7)
  end
  if l_9_3 ~= true then
    l_9_0:set_unit_server_pos(l_9_1, l_9_2)
  end
end

end
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

 -- Warning: undefined locals caused missing assignments!

