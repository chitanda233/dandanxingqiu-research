-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.unit.round_status_-8744964262973727156.bin 

local l_0_0 = require("game.utils.events")
local l_0_1 = string.format
local l_0_2 = Game.module.fight
local l_0_3 = l_0_2.ways.base
l_0_3.set_unit_round_status = function(l_1_0, l_1_1, l_1_2)
  local l_1_3 = l_1_1.round_status
  if l_1_3 == l_1_2 then
    return 
  end
  if l_1_3 then
    local l_1_4 = assert(l_0_2.unit_round_status_str[l_1_3], l_1_3)
    local l_1_5 = l_0_1("on_unit_exit_status_%s", l_1_4)
    local l_1_6 = l_1_0[l_1_5]
    if l_1_6 then
      l_1_6(l_1_0, l_1_1, l_1_2)
    end
  end
  l_1_1.round_status = l_1_2
  local l_1_7 = assert(l_0_2.unit_round_status_str[l_1_2], l_1_2)
  local l_1_8 = l_0_1("on_unit_enter_status_%s", l_1_7)
  local l_1_9 = l_1_0[l_1_8]
  if l_1_9 then
    l_1_9(l_1_0, l_1_1, l_1_3)
  end
  l_0_0.brocast("fight_unit_round_state_changed", l_1_1, l_1_3)
end

l_0_3.on_unit_enter_status_action = function(l_2_0, l_2_1, l_2_2)
  if l_2_0:is_ctrl_unit(l_2_1) then
    l_2_0:enter_ctrl_unit_round_action(l_2_1)
  else
    if l_2_0:is_self_commander() and l_2_0:is_partner(l_2_1) and l_2_0:unit_can_do_round_action(l_2_1) then
      l_2_0:start_unit_wait_attack_timer(l_2_1)
    end
  end
  l_2_0:try_to_start_unit_camera_look_at_timer(l_2_1)
end

l_0_3.on_unit_exit_status_action = function(l_3_0, l_3_1, l_3_2)
  l_3_0:try_to_stop_unit_wait_attack_timer(l_3_1)
  l_3_0:try_to_stop_unit_camera_look_at_timer(l_3_1)
  if l_3_1.state == l_0_2.role_status.moving then
    l_3_0:try_to_req_stop_move_unit(l_3_1)
  end
  if l_3_0:is_ctrl_unit(l_3_1) then
    l_3_0.wait_update_recommand_forces = false
    l_3_0.recommand_forces = nil
    l_0_0.brocast("fight_update_recommend_power", nil)
    l_3_0:try_to_hide_parabola()
  end
end

l_0_3.on_unit_enter_status_watch = function(l_4_0, l_4_1, l_4_2)
  if l_4_1.id ~= l_4_0.ctrl_unit_id then
    return 
  end
  l_0_0.brocast("fight_stop_count_down")
end

l_0_3.on_unit_enter_status_done = function(l_5_0, l_5_1, l_5_2)
  l_5_0:trigger_buff_event("unit_enter_status_done", l_5_1)
end


