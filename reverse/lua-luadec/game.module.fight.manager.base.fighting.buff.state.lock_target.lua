-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.buff.state.lock_target_-5712498272944212665.bin 

local l_0_0 = Game.module.fight
local l_0_1 = l_0_0.ways.base
local l_0_2 = Game.events
local l_0_3 = {}
l_0_1.buff_state_handlers[l_0_0.buff_states.lock_target] = l_0_3
l_0_3.on_active = function(l_1_0, l_1_1, l_1_2)
  local l_1_3 = l_1_2.from_obj_id
  if not l_1_3 then
    return 
  end
  if not l_1_1.fire_lock_targets then
    l_1_1.fire_lock_targets = {}
  end
  local l_1_4 = table.find(l_1_1.fire_lock_targets, l_1_3)
  if l_1_4 then
    table.remove(l_1_1.fire_lock_targets, l_1_4)
  end
  table.insert(l_1_1.fire_lock_targets, l_1_3)
  l_0_2.brocast("fight_unit_fire_lock_target_changed", l_1_1, l_1_2.from_obj_id, true)
  if l_1_1.id == l_1_0.ctrl_unit_id then
    l_1_0:req_update_recommand_forces(true)
  end
end

l_0_3.on_disactive = function(l_2_0, l_2_1, l_2_2)
  local l_2_3 = l_2_2.from_obj_id
  if not l_2_3 then
    return 
  end
  if not l_2_1.fire_lock_targets then
    return 
  end
  local l_2_4 = table.find(l_2_1.fire_lock_targets, l_2_3)
  if not l_2_4 then
    return 
  end
  table.remove(l_2_1.fire_lock_targets, l_2_4)
  l_0_2.brocast("fight_unit_fire_lock_target_changed", l_2_1, l_2_3, false)
  if l_2_1.id == l_2_0.ctrl_unit_id then
    l_2_0:req_update_recommand_forces(true)
  end
end


