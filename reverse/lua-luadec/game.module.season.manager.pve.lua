-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua6_573512\game.module.season.manager.pve_-3188936527630195404.bin 

local l_0_0 = table.insert
local l_0_1 = DataConfigs
local l_0_2 = l_0_1.season_pve
local l_0_3 = l_0_1.item
local l_0_4 = Game.module.task
local l_0_5 = l_0_4.const
local l_0_6 = Game.redpoint_helper
local l_0_7 = DataConfigs.tasks
local l_0_8 = import(".head")
local l_0_9 = l_0_8.data_pve
local l_0_10 = l_0_8.const.award_state
l_0_8.get_all_season_pve_rewards = function()
  local l_1_0 = l_0_8.get_cur_season_id()
  if not l_1_0 or l_1_0 <= 0 then
    return 
  end
  return l_0_2.get_cup_list(l_1_0)
end

l_0_8.get_season_pve_cup = function()
  local l_2_0 = GlobalConst.item_cid.season_pve_cup
  return Game.module.bag.get_bag_item_count_by_cid(l_0_3.get_item(l_2_0).bag_type, l_2_0)
end

l_0_8.get_season_pve_progress_reward_state = function(l_3_0, l_3_1)
  local l_3_2 = l_0_8.get_cur_season_id()
  if not l_3_2 or l_3_2 == 0 then
    return l_0_10.doing
  end
  local l_3_3 = l_0_2.get_cup_config(l_3_2, l_3_0)
  if not l_3_3 then
    return l_0_10.doing
  end
  if l_0_9.season_pve_reward_info[l_3_3.id] then
    return l_0_10.getted
  end
  if not l_3_1 then
    l_3_1 = l_0_8.get_season_pve_cup()
  end
  if l_3_1 < l_3_3.id then
    return l_0_10.doing
  end
  return l_0_10.reached
end

l_0_8.get_season_pve_overflow_reward_progress = function()
  local l_4_0 = l_0_8.get_cur_season_id()
  if not l_4_0 or l_4_0 == 0 then
    return 0
  end
  local l_4_1 = l_0_2.get_config(l_4_0)
  local l_4_2 = l_4_1.repeat_low
  if not l_4_2 or l_4_2 < 1 or not l_4_1.repeat_reward_low or #l_4_1.repeat_reward_low == 0 then
    return 0
  end
  return math.max(0, l_0_8.get_season_pve_cup() - l_0_2.get_max_cup_config(l_4_0).id) / l_4_2
end

l_0_8.get_season_pve_overflow_interval = function()
  local l_5_0 = l_0_8.get_cur_season_id()
  if not l_5_0 or l_5_0 == 0 then
    return 0
  end
  return l_0_2.get_config(l_5_0).repeat_low
end

l_0_8.get_season_pve_overflow_rewards = function()
  local l_6_0 = l_0_8.get_cur_season_id()
  if not l_6_0 or l_6_0 == 0 then
    return 0
  end
  return l_0_2.get_config(l_6_0).repeat_reward_low
end

l_0_8.get_season_pve_next_overflow_reward_cup = function()
  local l_7_0 = l_0_8.get_cur_season_id()
  if not l_7_0 or l_7_0 == 0 then
    return 9999
  end
  return (l_0_9.get_season_pve_reward_overflow() + 1) * l_0_8.get_season_pve_overflow_interval() + l_0_2.get_max_cup_config(l_7_0).id
end

l_0_8.get_season_pve_cup_config = function(l_8_0, l_8_1)
  local l_8_2 = l_0_8.get_cur_season_id()
  if not l_8_2 or l_8_2 == 0 then
    return 
  end
  if not l_8_0 then
    l_8_0 = 0
  end
  do
    local l_8_3 = l_0_2.get_cup_config(l_8_2, l_8_0)
    if not l_8_1 then
      return l_8_3
    end
    do
      local l_8_4 = l_8_2 or 1
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    return l_8_3, l_0_2.get_cup_by_index(l_8_2, l_8_4 + 1) or l_8_3
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_8.get_season_pve_getted_overflow_reward_cup = function()
  return l_0_9.get_season_pve_reward_overflow() * l_0_8.get_season_pve_overflow_interval()
end

l_0_8.get_season_pve_can_overflow_reward_count = function()
  return math.floor(l_0_8.get_season_pve_overflow_reward_progress()) - l_0_9.get_season_pve_reward_overflow()
end

l_0_8.get_season_pve_progress_red_point_state = function()
  local l_11_0 = l_0_8.get_cur_season_id()
  if not l_11_0 then
    return 0
  end
  local l_11_1 = l_0_2.get_cup_list(l_11_0)
  if not l_11_1 then
    return 0
  end
  local l_11_2 = l_0_8.get_season_pve_cup()
  local l_11_3 = l_0_10.reached
  if l_0_8.get_season_pve_can_overflow_reward_count() >= 1 then
    return 1
  end
  for l_11_7,l_11_8 in ipairs(l_11_1) do
    if l_11_2 < l_11_8.id then
      do return end
    end
    if l_11_8.reach_reward ~= nil and #l_11_8.reach_reward > 0 and l_0_8.get_season_pve_progress_reward_state(l_11_8.id, l_11_2) == l_11_3 then
      return 1, l_11_8
    end
  end
  return 0
end

l_0_8.get_cur_pve_exp_weekly_max = function()
  local l_12_0 = l_0_8.get_cur_season_id()
  if not l_12_0 then
    return 0
  end
  local l_12_1 = l_0_2.get_config(l_12_0)
  if not l_12_1 then
    return 0
  end
  return l_12_1.exp_weekly_max
end

l_0_8.get_pve_task_list_by_index = function(l_13_0)
  local l_13_1 = {}
  local l_13_2 = l_0_7.get_task_by_type_and_subtype(l_0_5.task_type.career_pve, l_13_0)
  for l_13_6,l_13_7 in pairs(l_13_2) do
    local l_13_8 = l_0_4.data.get_task_data_by_id(l_13_7.id)
    if not l_0_8.data_pve.season_task_dic[l_13_7.id] then
      local l_13_9 = not l_13_8 or 0
    end
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused about usage of registers!

      l_0_0(l_13_1, {cfg = l_13_7, task_data = l_13_8, is_max = l_13_7.repeat_count <= l_13_9})
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  table.sort(l_13_1, function(l_1_0, l_1_1)
    if l_1_0.is_max and not l_1_1.is_max then
      return false
    elseif not l_1_0.is_max and l_1_1.is_max then
      return true
    else
      return l_1_0.cfg.id < l_1_1.cfg.id
    end
   end)
   -- DECOMPILER ERROR: Confused about usage of registers!

  return l_13_1
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_8.on_season_pve_cup_changed = function()
end

l_0_8.init_season_pve_red_points = function()
end

l_0_8.clear_season_pve_red_points = function()
end


