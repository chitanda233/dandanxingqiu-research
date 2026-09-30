-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.buff.state_-4390725589744456449.bin 

local l_0_0 = require("game.utils.events")
local l_0_1 = Game.module.fight
local l_0_2 = l_0_1.ways.base
l_0_2.set_unit_buff_state = function(l_1_0, l_1_1, l_1_2, l_1_3)
  do
    local l_1_4, l_1_5, l_1_6, l_1_7 = l_1_1.buff_states[l_1_2] or 0
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_1_1.buff_states[l_1_2] = l_1_4 + 1
   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_1_4 == 0 then
    l_1_0:on_unit_add_buff_state(l_1_1, l_1_2, l_1_3)
  end
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_0_2.buff_state_handlers[l_1_2] then
      l_1_0:try_to_register_buff_events(l_1_3, l_0_2.buff_state_handlers[l_1_2])
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
end

l_0_2.unset_unit_buff_state = function(l_2_0, l_2_1, l_2_2, l_2_3)
  do
    local l_2_4, l_2_5, l_2_6, l_2_7 = l_2_1.buff_states[l_2_2] or 0
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_2_1.buff_states[l_2_2] = math.max(0, l_2_4 - 1)
  l_2_0:try_to_unregister_buff_events(l_2_3)
   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_2_4 == 1 then
    l_2_0:on_unit_del_buff_state(l_2_1, l_2_2, l_2_3)
  end
end

l_0_2.on_unit_add_buff_state = function(l_3_0, l_3_1, l_3_2, l_3_3)
  l_0_0.brocast("fight_buff_state_add", l_3_1, l_3_2)
  local l_3_4 = l_0_2.buff_state_handlers[l_3_2]
  if not l_3_4 then
    return 
  end
  l_3_4.on_active(l_3_0, l_3_1, l_3_3)
end

l_0_2.on_unit_del_buff_state = function(l_4_0, l_4_1, l_4_2, l_4_3)
  l_0_0.brocast("fight_buff_state_remove", l_4_1, l_4_2)
  local l_4_4 = l_0_2.buff_state_handlers[l_4_2]
  if not l_4_4 then
    return 
  end
  l_4_4.on_disactive(l_4_0, l_4_1, l_4_3)
end

l_0_2.is_unit_has_buff_state = function(l_5_0, l_5_1, l_5_2)
  if not l_5_1 or not l_5_1.buff_states then
    return false
  end
  local l_5_3 = l_5_1.buff_states[l_5_2]
  if not l_5_3 then
    return false
  end
  return l_5_3 > 0
end

l_0_2.is_unit_buff_ban_skill = function(l_6_0, l_6_1, l_6_2, l_6_3)
  if l_6_0:is_unit_has_buff_state(l_6_1, l_0_1.buff_states.avoid_skill) then
    return true
  end
  if l_6_0:is_unit_has_buff_state(l_6_1, l_0_1.buff_states.silent) then
    if l_6_3.source == l_0_1.skill_source.weapon then
      return false
    end
    return true
  end
  return false
end

l_0_2.get_unit_state_buff = function(l_7_0, l_7_1, l_7_2, l_7_3)
  if not l_7_1 or not l_7_1.id_to_buff then
    return 
  end
  for l_7_7,l_7_8 in pairs(l_7_1.id_to_buff) do
    if l_7_8.is_active and l_7_8.cf_info.args and l_7_8.cf_info.args.buff_state == l_7_2 and (not l_7_3 or l_7_8.cf_info.args[l_7_3]) then
      return l_7_8, l_7_8.cf_info.args
    end
  end
end


