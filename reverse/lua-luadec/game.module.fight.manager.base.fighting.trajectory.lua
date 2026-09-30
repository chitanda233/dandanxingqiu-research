-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.trajectory_-9147858616376267781.bin 

local l_0_0 = math.abs
local l_0_1 = math.floor
local l_0_2 = table.insert
local l_0_3 = GameFunctions
local l_0_4 = math.turn_to_three_decimal_places
local l_0_5 = Game
local l_0_6 = l_0_5.module.fight
local l_0_7 = l_0_6.ways.base
local l_0_8 = function(l_1_0, l_1_1)
  if l_1_1.last_pos then
    l_1_1.last_pos.x = l_1_1.pos.x
    l_1_1.last_pos.y = l_1_1.pos.y
  end
  if l_1_1.last_world_pos then
    l_1_1.last_world_pos.x = l_1_1.world_pos.x
    l_1_1.last_world_pos.y = l_1_1.world_pos.y
  end
end

local l_0_9 = function(l_2_0, l_2_1, l_2_2)
  if not l_2_1.fly_time then
    l_2_1.fly_time = 0
  end
  l_2_1.fly_time = l_2_1.fly_time + l_2_2
  if not l_2_1.fly_time_no_free_fall then
    l_2_1.fly_time_no_free_fall = (not l_2_0:is_physics_env() or l_2_1.free_fall or 0) + l_2_2
     -- Warning: missing end command somewhere! Added here
  end
end

local l_0_11 = function(l_3_0, l_3_1, l_3_2)
  l_0_9(l_3_0, l_3_1, l_3_2)
  l_0_8(l_3_0, l_3_1)
end

local l_0_15 = function(l_8_0)
  if l_8_0.x == -9999 and l_8_0.y == -9999 then
    return false
  end
  return true
end

local l_0_16 = function(l_9_0, l_9_1, l_9_2)
  l_9_1.pos.y = l_9_1.pos.y + l_0_1(l_9_1.v_y * l_9_2)
  local l_9_3, l_9_4, l_9_5 = l_9_0.land_data:find_land_cross_point2(l_9_0.land_data, l_9_1.pos.x, l_9_1.last_pos.y, l_9_1.pos.x, l_9_1.pos.y, 3)
  if l_9_3 then
    l_9_1.free_fall = false
    local l_9_6 = l_9_0.land_data:get_touch(l_9_4, l_9_5)
    if l_0_11(l_9_6) then
      l_9_4 = l_9_6.x
      l_9_5 = l_9_6.y
    end
    l_9_1.pos.x = l_9_4
    l_9_1.pos.y = l_9_5
  end
  l_9_0.land_data:land_to_world_pos(l_9_1.pos.x, l_9_1.pos.y, l_9_1.world_pos)
  l_9_1.v_y = l_0_4(l_9_1.v_y + l_9_1.a_y * l_9_2)
  l_9_1.need_rsync_world_pos = true
end

local l_0_17 = function(l_11_0, l_11_1, l_11_2)
  if l_11_0:is_physics_env() then
    if l_11_1.pos.x >= l_11_2.x or not l_0_6.role_directions.right then
      local l_11_3 = l_0_6.role_directions.left
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_11_0.land_data:is_beyond_max_angle(l_11_2.x, l_11_2.y, l_11_3) then
      return true
    end
  end
  return false
end

local l_0_18 = function(l_12_0, l_12_1, l_12_2)
  if l_0_13(l_12_0, l_12_1, l_12_2) then
    return false
  end
  l_12_1.pos.x = l_12_2.x
  l_12_1.pos.y = l_12_2.y
  return true
end

local l_0_20 = {x = 0, y = 1}
do
  local l_0_22 = {x = 0, y = -1}
end
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

 -- Warning: undefined locals caused missing assignments!

