-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.round.timer_-4305445045789317530.bin 

local l_0_0 = Game.module.fight
local l_0_1 = l_0_0.ways.base
l_0_1.run_after_in_this_round = function(l_1_0, l_1_1, l_1_2, l_1_3)
  if l_1_1 <= 0 then
    l_1_2()
    return nil
  end
  local l_1_4 = l_1_0.timer:run_after_no_args(l_1_1, l_1_2)
  l_1_0.round.timers[l_1_4] = true
  if l_1_3 then
    l_1_0.round.timers_special[l_1_4] = true
  end
  return l_1_4
end

l_0_1.run_every_in_this_round = function(l_2_0, l_2_1, l_2_2, l_2_3)
  local l_2_4 = l_2_0.timer:run_every_no_args(l_2_1, l_2_2)
  local l_2_5 = l_2_0.round.timers
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    l_2_5[l_2_4] = l_2_3 or true
    return l_2_4
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.run_every_in_this_round_unscale_timer = function(l_3_0, l_3_1, l_3_2)
  local l_3_3 = l_3_0.unscale_timer:run_every_no_args(l_3_1, l_3_2)
  l_3_0.round.unscale_timers[l_3_3] = true
  return l_3_3
end

l_0_1.del_this_round_timer = function(l_4_0, l_4_1)
  if not l_4_0.round.timers[l_4_1] then
    return 
  end
  l_4_0.timer:del_timer(l_4_1)
  l_4_0.round.timers[l_4_1] = nil
  l_4_0.round.timers_special[l_4_1] = nil
end

l_0_1.del_this_round_unscale_timer = function(l_5_0, l_5_1)
  if not l_5_0.round.unscale_timers[l_5_1] then
    return 
  end
  l_5_0.unscale_timer:del_timer(l_5_1)
  l_5_0.round.unscale_timers[l_5_1] = nil
end

l_0_1.clear_all_round_timers = function(l_6_0)
  local l_6_1 = l_6_0.round.timers
  l_6_0.round.timers = {}
  for l_6_5,l_6_6 in pairs(l_6_1) do
    if l_6_0.round.timers_special[l_6_5] then
      l_6_0.round.timers_special[l_6_5] = nil
      local l_6_7 = l_6_0.timer:get_timer_info_by_timer_id(l_6_5)
      if l_6_7 then
        l_6_0.timer:excute_timer(l_6_7)
      end
    end
    if type(l_6_6) == "function" then
      l_6_6()
    end
    l_6_0.timer:del_timer(l_6_5)
  end
end


