-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.buff.core_7272499947804274124.bin 

local l_0_0 = table.insert
local l_0_1 = table.remove
local l_0_2 = DataConfigs.buff
local l_0_3 = DataConfigs.language_define
local l_0_4 = require("game.utils.events")
local l_0_5 = Game.module.fight
local l_0_6 = l_0_5.ways.base
l_0_6.buffs = {}
l_0_6.buff_state_handlers = {}
l_0_6.init_buff = function(l_1_0)
  l_1_0.id_to_buff = {}
  l_1_0.buff_id_to_ui_eff = {}
  l_1_0.buff_events = {}
  l_1_0:init_area()
  l_1_0:init_buff_stack_count()
end

l_0_6.clear_buff = function(l_2_0)
  l_2_0:clear_buff_stack_count()
  l_2_0:clear_area()
  for l_2_4,l_2_5 in pairs(l_2_0.id_to_buff) do
    l_2_0:del_buff(l_2_5)
  end
  l_2_0.id_to_buff = nil
  l_2_0.buff_id_to_ui_eff = nil
  l_2_0.buff_events = nil
end

l_0_6.try_to_add_or_update_unit_buffs = function(l_3_0, l_3_1, l_3_2, l_3_3, l_3_4)
  if not l_3_2 then
    return 
  end
  assert(l_3_1)
  local l_3_5 = nil
  for l_3_9,l_3_10 in ipairs(l_3_2) do
    l_3_5 = l_3_0.id_to_buff[l_3_10.id]
    if l_3_5 then
      l_3_0:update_buff(l_3_1, l_3_5, l_3_10)
    else
      l_3_5 = l_3_0:add_buff(l_3_1, l_3_10, l_3_4)
    end
    if l_3_3 and l_3_3.camp ~= l_3_1.camp and l_3_5.cf_info.tp_eff == l_0_5.buff_states.freeze then
      local l_3_11, l_3_12 = l_3_0:try_trigger_reply, l_3_0
      local l_3_13 = l_0_5.reply_trigger_type.freeze
      local l_3_14 = {}
      l_3_14.target = l_3_3
      l_3_14.to = l_3_1
      l_3_11(l_3_12, l_3_13, l_3_14)
    end
  end
  l_0_4.brocast("fight_unit_buff_update", l_3_1)
end

l_0_6.try_to_del_unit_buffs_by_now_list = function(l_4_0, l_4_1, l_4_2)
  if not l_4_2 or not next(l_4_2) then
    l_4_0:del_unit_buffs(l_4_1, true)
    return 
  end
  if not l_4_1.id_to_buff then
    return 
  end
  local l_4_3 = {}
  for l_4_7,l_4_8 in pairs(l_4_2) do
    l_4_3[l_4_8.id] = true
  end
  for l_4_12,l_4_13 in pairs(l_4_1.id_to_buff) do
    if not l_4_3[l_4_12] then
      l_4_0:del_buff(l_4_13, true)
    end
  end
  l_4_3 = nil
end

l_0_6.add_buff = function(l_5_0, l_5_1, l_5_2, l_5_3)
  if l_5_1.hidden_units then
    return 
  end
  local l_5_4 = clone(l_5_2)
  l_5_4.owner = l_5_1
  l_5_0.id_to_buff[l_5_4.id] = l_5_4
  l_5_1.id_to_buff[l_5_4.id] = l_5_4
  l_0_0(l_5_1.time_order_to_buff, l_5_4)
  local l_5_5 = l_0_2[l_5_2.cfg_id]
  if not l_5_5 then
    l_5_0:fight_log_error("add_buff,buff_msg.cfg_id:{0}", l_5_2.cfg_id)
  end
  l_5_4.cf_info = l_5_5
  l_5_4.handler = l_0_6.buffs.common
  l_5_0:try_to_active_buff(l_5_4, l_5_3)
  if l_5_1.id == l_5_0.ctrl_unit_id then
    l_0_4.brocast("fight_ctrl_one_buff_update", l_5_1, l_5_4.id)
  end
  return l_5_4
end

l_0_6.try_to_active_buff = function(l_6_0, l_6_1, l_6_2, l_6_3)
  local l_6_4 = l_6_1.owner
  if l_6_4.round_count < l_6_1.effect_round then
    return false
  end
  if l_6_1.end_round < l_6_4.round_count then
    return false
  end
  if l_6_1.is_active then
    if l_6_3 and l_6_3 == l_6_1.count then
      return false
    end
    l_6_0:check_chat_log_active_buff(l_6_1)
    return false
  end
  l_6_0:check_chat_log_active_buff(l_6_1)
  l_6_1.is_active = true
  l_6_1.handler.on_active(l_6_0, l_6_1, l_6_2)
  return true
end

l_0_6.try_to_disactive_buff = function(l_7_0, l_7_1)
  local l_7_2 = l_7_1.owner
  if not l_7_1.is_active then
    return false
  end
  if l_7_1.effect_round <= l_7_2.round_count and l_7_2.round_count <= l_7_1.end_round then
    return false
  end
  l_7_1.handler.on_disactive(l_7_0, l_7_1)
  l_7_1.is_active = nil
  return true
end

l_0_6.try_to_active_unit_buffs = function(l_8_0, l_8_1)
  assert(l_8_1)
  local l_8_2 = l_8_1.id_to_buff
  if not l_8_2 then
    return 
  end
  local l_8_3 = false
  for l_8_7,l_8_8 in pairs(l_8_2) do
    if l_8_0:try_to_active_buff(l_8_8, nil, l_8_8.count) then
      l_8_3 = true
    end
  end
  if l_8_3 then
    l_0_4.brocast("fight_unit_buff_update", l_8_1)
  end
end

l_0_6.update_buff = function(l_9_0, l_9_1, l_9_2, l_9_3)
  if l_9_1.hidden_units then
    return 
  end
  if l_9_2.owner then
    local l_9_4 = l_9_2.owner.id
  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

  assert(l_9_1 and l_9_4 == l_9_1.id)
  assert(l_9_2.cfg_id == l_9_3.cfg_id)
   -- DECOMPILER ERROR: Confused at declaration of local variable

  l_9_2.handler.on_update(l_9_0, l_9_2, l_9_3)
  clone_to(l_9_3, l_9_2)
  if l_9_2.effect_count ~= l_9_2.effect_round then
    l_9_0:try_to_disactive_buff(l_9_2)
    l_9_0:try_to_active_buff(l_9_2, nil, l_9_2.count)
  end
  for l_9_15,l_9_16 in ipairs(l_9_1.time_order_to_buff) do
    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

      if l_9_2.count.id == l_9_2.id then
        l_0_1(l_9_1.time_order_to_buff, nil)
      end
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_0_0(l_9_1.time_order_to_buff, l_9_2)
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_9_1.id == l_9_0.ctrl_unit_id then
    l_0_4.brocast("fight_ctrl_one_buff_update", l_9_1, l_9_2.id)
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
end

l_0_6.del_unit_buffs = function(l_10_0, l_10_1, l_10_2)
  if l_10_1.hidden_units then
    return 
  end
  local l_10_3 = l_10_1.id_to_buff
  if not l_10_3 then
    return 
  end
  for l_10_7,l_10_8 in pairs(l_10_3) do
    l_10_0:del_buff(l_10_8, l_10_2)
  end
end

l_0_6.del_buff_by_id = function(l_11_0, l_11_1)
  local l_11_2 = l_11_0.id_to_buff[l_11_1]
  if not l_11_0.play_type then
    l_11_0:fight_log_error("del_buff_by_id,buff_id:" .. l_11_1 .. ",play_type:" .. (l_11_2 or ""))
  end
  return nil
  l_11_0:del_buff(l_11_2)
  return l_11_2
end

l_0_6.del_buff = function(l_12_0, l_12_1, l_12_2)
  assert(l_12_1)
  if l_12_1.is_active then
    l_12_1.handler.on_disactive(l_12_0, l_12_1, l_12_2)
    l_12_1.is_active = nil
  end
  local l_12_3 = l_12_1.owner
  l_12_0.id_to_buff[l_12_1.id] = nil
  l_12_3.id_to_buff[l_12_1.id] = nil
  for l_12_7,l_12_8 in ipairs(l_12_3.time_order_to_buff) do
    if l_12_8.id == l_12_1.id then
      l_0_1(l_12_3.time_order_to_buff, l_12_7)
    end
  end
  if l_12_3.id == l_12_0.ctrl_unit_id then
    l_0_4.brocast("fight_ctrl_one_buff_update", l_12_3, l_12_1.id)
  end
  l_0_4.brocast("fight_unit_buff_update", l_12_3)
end

l_0_6.unit_has_buff_by_group_and_caster = function(l_13_0, l_13_1, l_13_2, l_13_3)
  for l_13_7,l_13_8 in pairs(l_13_1.id_to_buff) do
    if l_13_8.cf_info.group_id == l_13_2 and (not l_13_3 or l_13_8.caster == l_13_3) then
      return true
    end
  end
  return false
end

l_0_6.unit_has_buff_by_buff_state_and_caster = function(l_14_0, l_14_1, l_14_2, l_14_3)
  if not l_14_0:is_unit_has_buff_state(l_14_1, l_14_2) then
    return false
  end
  local l_14_4 = nil
  for l_14_8,l_14_9 in pairs(l_14_1.id_to_buff) do
    l_14_4 = l_14_9.cf_info.args
    if l_14_4 and l_14_4.buff_state == l_14_2 and l_14_9.caster == l_14_3 then
      return true
    end
  end
  return false
end

l_0_6.is_unit_has_buff_type = function(l_15_0, l_15_1, l_15_2)
  for l_15_6,l_15_7 in pairs(l_15_1.id_to_buff) do
    if l_15_7.cf_info.type == l_15_2 then
      return true
    end
  end
  return false
end

l_0_6.get_unit_buff_by_buff_state = function(l_16_0, l_16_1, l_16_2)
  if not l_16_1 or not l_16_1.id_to_buff then
    return nil
  end
  for l_16_6,l_16_7 in pairs(l_16_1.id_to_buff) do
    local l_16_8 = l_16_7.cf_info.args
    if l_16_8 and l_16_8.buff_state == l_16_2 and l_16_7.is_active then
      return l_16_7
    end
  end
  return nil
end

l_0_6.get_unit_buff_eff_val = function(l_17_0, l_17_1, l_17_2, l_17_3)
  if not l_17_1.id_to_buff then
    return 
  end
  local l_17_4, l_17_5, l_17_6 = nil, nil, nil
  for l_17_10,l_17_11 in pairs(l_17_1.id_to_buff) do
    if l_17_11.is_active and l_17_11.cf_info.args and l_17_11.cf_info.args then
      l_17_6 = l_17_11.cf_info.args[l_17_2]
      if l_17_6 and l_17_3 then
        l_17_6 = l_17_6[l_17_3]
      end
      if l_17_6 and (not l_17_5 or l_17_5 < l_17_10) then
        l_17_5 = l_17_10
        l_17_4 = l_17_6
      end
    end
  end
  return l_17_4
end


