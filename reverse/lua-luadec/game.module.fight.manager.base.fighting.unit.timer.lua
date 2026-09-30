-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.unit.timer_156545776232081799.bin 

local l_0_0 = Game.module.fight
local l_0_1 = l_0_0.ways.base
l_0_1.add_run_after_to_unit = function(l_1_0, l_1_1, l_1_2, l_1_3)
  assert(l_1_1)
  if l_1_2 <= 0 then
    l_1_3()
    return nil
  end
  if not l_1_1.timers then
    local l_1_4, l_1_5, l_1_6 = {}
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_1_1.timers = l_1_4
   -- DECOMPILER ERROR: Overwrote pending register.

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_1_4[nil] = true
     -- DECOMPILER ERROR: Confused about usage of registers!

    return nil
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.add_run_every_to_unit = function(l_2_0, l_2_1, l_2_2, l_2_3)
  assert(l_2_1)
  if not l_2_1.timers then
    local l_2_4, l_2_5 = {}
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_2_1.timers = l_2_4
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_2_4[l_2_0.timer:run_every_no_args(l_2_2, l_2_3)] = true
    return l_2_0.timer:run_every_no_args(l_2_2, l_2_3)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.add_run_every_to_unit_unscale_timer = function(l_3_0, l_3_1, l_3_2, l_3_3)
  assert(l_3_1)
  if not l_3_1.unscale_timers then
    local l_3_4, l_3_5 = {}
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_3_1.unscale_timers = l_3_4
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_3_4[l_3_0.unscale_timer:run_every_no_args(l_3_2, l_3_3)] = true
    return l_3_0.unscale_timer:run_every_no_args(l_3_2, l_3_3)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.del_unit_timers = function(l_4_0, l_4_1)
  assert(l_4_1)
  local l_4_2 = l_4_1.timers
  if l_4_2 then
    for l_4_6,l_4_7 in pairs(l_4_2) do
      l_4_0.timer:del_timer(l_4_6)
      l_4_2[l_4_6] = nil
    end
    l_4_1.timers = nil
  end
  l_4_2 = l_4_1.unscale_timers
  if l_4_2 then
    for l_4_11,l_4_12 in pairs(l_4_2) do
      l_4_0.unscale_timer:del_timer(l_4_11)
      l_4_2[l_4_11] = nil
    end
    l_4_1.unscale_timers = nil
  end
end

l_0_1.del_unit_timer = function(l_5_0, l_5_1, l_5_2)
  assert(l_5_1)
  local l_5_3 = l_5_1.timers
  if not l_5_3 then
    return 
  end
  if not l_5_2 then
    return 
  end
  if not l_5_3[l_5_2] then
    return 
  end
  l_5_3[l_5_2] = nil
  l_5_0.timer:del_timer(l_5_2)
end

l_0_1.del_unit_unscale_timer = function(l_6_0, l_6_1, l_6_2)
  assert(l_6_1)
  local l_6_3 = l_6_1.unscale_timers
  if not l_6_3 then
    return 
  end
  if not l_6_2 then
    return 
  end
  if not l_6_3[l_6_2] then
    return 
  end
  l_6_3[l_6_2] = nil
  l_6_0.unscale_timer:del_timer(l_6_2)
end


