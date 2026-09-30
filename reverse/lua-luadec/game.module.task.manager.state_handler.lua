-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua5_573650\game.module.task.manager.state_handler_-3211410094775480611.bin 

local l_0_0 = class("state_handler", nil)
local l_0_1 = Game.timer
l_0_0.ctor = function(l_1_0, l_1_1)
  l_1_0.handler_target = l_1_1
  l_1_0._state_enter_handler = nil
  l_1_0._state_exit_handler = nil
  l_1_0._state_update_handler = nil
  l_1_0._curState = nil
  l_1_0._cur_state_update_func = nil
  l_1_0._change_state_delay = nil
  l_1_0._is_in_change_state = nil
end

l_0_0.clear_all_state = function(l_2_0)
  l_2_0._state_enter_handler = nil
  l_2_0._state_exit_handler = nil
  l_2_0._state_update_handler = nil
  l_2_0._curState = nil
  l_2_0._cur_state_update_func = nil
  l_2_0._is_in_change_state = nil
  l_2_0:clear_change_state_delay()
end

l_0_0.destroy = function(l_3_0)
  l_3_0:clear_all_state()
  l_3_0.handler_target = nil
end

l_0_0.add_state = function(l_4_0, l_4_1, l_4_2, l_4_3, l_4_4)
  if l_4_1 == nil then
    return 
  end
  if not l_4_0._state_enter_handler then
    l_4_0._state_enter_handler = {}
  end
  l_4_0._state_enter_handler[l_4_1] = l_4_2
  if not l_4_0._state_exit_handler then
    l_4_0._state_exit_handler = {}
  end
  l_4_0._state_exit_handler[l_4_1] = l_4_3
  if not l_4_0._state_update_handler then
    l_4_0._state_update_handler = {}
  end
  l_4_0._state_update_handler[l_4_1] = l_4_4
end

l_0_0.remove_state = function(l_5_0, l_5_1)
  if l_5_1 == nil then
    return 
  end
  if l_5_0._state_enter_handler then
    l_5_0._state_enter_handler[l_5_1] = nil
  end
  if l_5_0._state_exit_handler then
    l_5_0._state_exit_handler[l_5_1] = nil
  end
  if l_5_0._state_update_handler then
    l_5_0._state_update_handler[l_5_1] = nil
  end
  if l_5_1 == l_5_0._curState then
    l_5_0._cur_state_update_func = nil
  end
end

l_0_0.clear_change_state_delay = function(l_6_0)
  if l_6_0._change_state_delay then
    l_0_1:clear_timer(l_6_0._change_state_delay)
    l_6_0._change_state_delay = nil
  end
end

l_0_0.change_state = function(l_7_0, l_7_1, l_7_2)
  if l_7_1 == nil then
    return 
  end
  l_7_0:clear_change_state_delay()
  if l_7_2 and l_7_2 > 0 then
    l_7_0._change_state_delay = l_0_1:run_after_no_args(l_7_2, function()
    l_7_0:change_state(l_7_1, nil)
   end)
    return true
  end
  if l_7_0._is_in_change_state then
    print("\232\175\183\231\168\139\229\186\143\230\163\128\230\159\165\239\188\129StateHandler \228\184\141\232\131\189\229\156\168\229\136\135\230\141\162\231\138\182\230\128\129\232\191\135\231\168\139\228\184\173\229\134\141\230\172\161\229\136\135\230\141\162\231\138\182\230\128\129\239\188\129", l_7_0._curState)
    return false
  end
  l_7_0._is_in_change_state = true
  if l_7_0._state_exit_handler then
    local l_7_3, l_7_4, l_7_5, l_7_6, l_7_8 = l_7_0._state_exit_handler[l_7_0._curState]
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_7_3 then
    l_7_3(l_7_0.handler_target)
  end
  l_7_0._curState = l_7_1
  if l_7_0._state_update_handler then
    l_7_0._cur_state_update_func = l_7_0._state_update_handler[l_7_1]
  end
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

  end
  if l_7_0._state_enter_handler then
    l_7_0._is_in_change_state = false
     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_7_0._state_enter_handler then
      l_7_0._state_enter_handler[l_7_1](l_7_0.handler_target)
    end
    return true
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

     -- Warning: missing end command somewhere! Added here
  end
end

l_0_0.get_cur_state = function(l_8_0)
  return l_8_0._curState
end

l_0_0.on_update = function(l_9_0, ...)
  if l_9_0._cur_state_update_func then
    l_9_0._cur_state_update_func(...)
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
end

return l_0_0

