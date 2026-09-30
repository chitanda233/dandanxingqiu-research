-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.buff.state.hit_fly_preview_-4533880242312617653.bin 

local l_0_0 = Game.module.fight
local l_0_1 = l_0_0.ways.base
local l_0_2 = assert(DataConfigs.fight_misc)
local l_0_3 = {}
l_0_1.buff_state_handlers[l_0_0.buff_states.hit_fly_preview] = l_0_3
local l_0_4 = {}
local l_0_5 = function(l_1_0, l_1_1)
  if l_1_0.x == l_1_1.x and l_1_0.y == l_1_1.y then
    return 90
  end
  do
    local l_1_5 = math.atan2
    l_1_5 = l_1_5(l_1_1.y - l_1_0.y, l_1_1.x - l_1_0.x)
     -- DECOMPILER ERROR: Confused at declaration of local variable

    local l_1_3 = math.deg
    local l_1_4 = l_1_5
    return l_1_3(l_1_4)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

local l_0_7 = function(l_2_0, l_2_1, l_2_2)
  local l_2_3 = l_2_0.x - l_2_1.x ^ 2 + l_2_0.y - l_2_1.y ^ 2
  local l_2_4 = 300
  if l_2_2 and l_2_2.dec_raduis and l_2_2.dec_raduis > 0 then
    l_2_4 = l_2_2.dec_raduis
  end
  local l_2_5 = 1000
  if l_2_2 and l_2_2.init_vel and l_2_2.init_vel > 0 then
    l_2_5 = l_2_2.init_vel * (1 - math.sqrt(l_2_3) / l_2_4)
  end
  return l_2_5 / (l_0_2.battle_fire_force_factor.value or 1)
end

local l_0_8 = function(l_3_0, l_3_1, l_3_2)
  if not l_3_2.nearest_trigger_area_id then
    return true
  end
  local l_3_3 = l_3_0.id_to_area[l_3_2.nearest_trigger_area_id]
  if not l_3_3 or not l_3_3.owner or not l_3_3.owner.pos then
    return true
  end
  local l_3_4 = l_3_3.owner.pos.x - l_3_2.pos.x ^ 2 + l_3_3.owner.pos.y - l_3_2.pos.y ^ 2
  local l_3_5 = l_3_1.owner.pos.x - l_3_2.pos.x ^ 2 + l_3_1.owner.pos.y - l_3_2.pos.y ^ 2
  return l_3_5 < l_3_4
end

local l_0_10 = function(l_4_0, l_4_1, l_4_2)
  local l_4_3 = l_4_0.pos
  local l_4_4 = l_4_1.pos
  if not l_4_3 or not l_4_4 or not l_4_2 then
    return false
  end
  local l_4_5 = l_4_3.x - l_4_4.x ^ 2 + l_4_3.y - l_4_4.y ^ 2
  return l_4_5 < l_4_2 * l_4_2
end

local l_0_12 = function(l_5_0)
  if not l_5_0 or not l_5_0.owner or not l_5_0.owner.id_to_buff then
    return l_0_4
  end
  for l_5_4,l_5_5 in pairs(l_5_0.owner.id_to_buff) do
    if l_5_5.areas and l_5_5.areas[l_5_0] then
      return l_5_5.cf_info.args.hit_fly_args
    end
  end
  return l_0_4
end

end
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

 -- Warning: undefined locals caused missing assignments!

