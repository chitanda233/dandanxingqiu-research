-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.round.perform_-6519626298272865860.bin 

local l_0_0 = string.format
local l_0_1 = Game.module.fight
local l_0_2 = l_0_1.ways.base
local l_0_3 = require("game.module.fight.manager.base.fighting.hit_rate_logger")
l_0_2.get_next_perform_id = function(l_1_0)
  local l_1_1 = l_1_0.round
  l_1_1.perform_id = l_1_1.perform_id + 1
  return l_1_1.perform_id
end

l_0_2.add_perform = function(l_2_0)
  local l_2_1 = l_2_0:get_next_perform_id()
  l_2_0.round.cur_perform_ids[l_2_1] = true
  return l_2_1
end

l_0_2.del_perform = function(l_3_0, l_3_1)
  if not l_3_0.round then
    return 
  end
  l_3_0.round.cur_perform_ids[l_3_1] = nil
end

l_0_2.set_round_perform_status = function(l_4_0, l_4_1)
  if not l_4_0.round then
    return 
  end
  local l_4_2 = l_4_0.round.perform_status
  if l_4_2 == l_4_1 then
    return 
  end
  if l_4_2 then
    local l_4_3 = l_0_1.round_perform_status_str[l_4_2]
    local l_4_4 = l_0_0("on_round_exit_perform_status_%s", l_4_3)
    local l_4_5 = l_4_0[l_4_4]
    if l_4_5 then
      l_4_5(l_4_0, l_4_1)
    end
  end
  l_4_0.round.perform_status = l_4_1
  local l_4_6 = l_0_1.round_perform_status_str[l_4_1]
  local l_4_7 = l_0_0("on_round_enter_perfrom_status_%s", l_4_6)
  local l_4_8 = l_4_0[l_4_7]
  if l_4_8 then
    l_4_8(l_4_0, l_4_2)
  end
end

l_0_2.on_round_enter_perfrom_status_wait_done = function(l_5_0, l_5_1)
  l_5_0:try_to_start_timing_to_check_perform_finish()
  l_5_0:try_to_pick_up_all_waited_drops()
end

l_0_2.on_round_exit_perform_status_wait_done = function(l_6_0, l_6_1)
  l_6_0:try_to_stop_timing_to_check_perform_finish()
end

l_0_2.on_round_enter_perfrom_status_done = function(l_7_0, l_7_1)
  l_7_0.wait_obstacle_move_timestamp = nil
  l_0_3.finish_round(l_7_0)
  local l_7_2, l_7_3 = l_7_0:send_network_msg, l_7_0
  local l_7_4 = "battle_round_finish_c2s"
  local l_7_5 = {}
  l_7_5.round = l_7_0.round.round_count
  l_7_2(l_7_3, l_7_4, l_7_5)
end

l_0_2.try_to_start_timing_to_check_perform_finish = function(l_8_0)
  if l_8_0.timer_perfrom_finish then
    return 
  end
  l_8_0.timer_perfrom_finish = l_8_0.timer:run_every_no_args(200, function()
    l_8_0:on_timing_to_check_perform_finish()
   end)
end

local l_0_4 = {}
l_0_4[l_0_1.role_status.moving] = true
l_0_4[l_0_1.role_status.falling] = true
l_0_4[l_0_1.role_status.target_falling] = true
l_0_4[l_0_1.role_status.push_out_land] = true
l_0_4[l_0_1.role_status.blowing] = true
do
  local l_0_6 = function(l_9_0)
  if l_9_0.node_list and next(l_9_0.node_list) then
    return false
  end
  if l_9_0.round then
    if l_9_0.round.bullet_nodes and next(l_9_0.round.bullet_nodes) then
      return false
    end
    if l_9_0.round.cur_perform_ids and next(l_9_0.round.cur_perform_ids) then
      return false
    end
  end
  for l_9_4,l_9_5 in pairs(l_9_0.id_to_unit) do
    if l_9_5.is_dead then
      for l_9_4,l_9_5 in l_9_1 do
      end
      if l_0_4[l_9_5.state] then
        return false
      end
    end
    return true
     -- Warning: missing end command somewhere! Added here
  end
end

end
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

 -- Warning: undefined locals caused missing assignments!

