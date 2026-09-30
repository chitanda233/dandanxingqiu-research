-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua5_573650\game.module.task.manager.data.data_daily_task_-8554669163478059890.bin 

local l_0_0 = table.insert
local l_0_1 = ipairs
local l_0_2 = pairs
local l_0_3 = assert
local l_0_4 = import("..head")
local l_0_5 = l_0_3(l_0_4.data)
local l_0_6 = l_0_3(l_0_4.event)
local l_0_7 = DataConfigs.task_liveness
local l_0_8 = require("game.utils.events")
l_0_5.reset_daily_task = function()
  l_0_5.daily_liveness_data = {}
  local l_1_0 = l_0_5
  local l_1_1 = {}
  l_1_1.day = 0
  l_1_1.task = {}
  l_1_0.daily_task_data = l_1_1
end

l_0_5.update_liveness_reward = function(l_2_0)
  if not l_0_5.daily_liveness_data.act_ids then
    l_0_5.daily_liveness_data.act_ids = {}
  end
  l_0_0(l_0_5.daily_liveness_data.act_ids, l_2_0.act_id)
  l_0_8.brocast(l_0_6.update_daily_liveness_info)
end

l_0_5.update_week_point_reward = function(l_3_0)
  if not l_0_5.daily_liveness_data.week_ids then
    l_0_5.daily_liveness_data.week_ids = {}
  end
  l_0_0(l_0_5.daily_liveness_data.week_ids, l_3_0.week_id)
  if not l_0_5.daily_liveness_data.week_dic then
    l_0_5.daily_liveness_data.week_dic = {}
  end
  l_0_5.daily_liveness_data.week_dic[l_3_0.week_id] = true
  l_0_8.brocast(l_0_6.update_daily_liveness_info)
end

l_0_5.update_daily_liveness_data = function(l_4_0)
  l_0_5.daily_liveness_data.day_act = l_4_0.day_act or 0
  l_0_5.daily_liveness_data.act_ids = l_4_0.act_ids
  l_0_5.daily_liveness_data.role_lv = l_4_0.role_lv
  l_0_5.daily_liveness_data.week_score = l_4_0.week_score
  if not l_4_0.week_ids then
    l_0_5.daily_liveness_data.week_ids = {}
  end
  l_0_5.daily_liveness_data.week_dic = {}
  for l_4_4,l_4_5 in l_0_2(l_0_5.daily_liveness_data.week_ids) do
    if l_4_5 then
      l_0_5.daily_liveness_data.week_dic[l_4_5] = true
    end
  end
  l_0_5.daily_liveness_data.day_score = l_4_0.day_score
  l_0_5.daily_liveness_data.week_score_limit = l_4_0.week_score_limit
  l_0_8.brocast(l_0_6.update_task_info)
  l_0_8.brocast(l_0_6.update_daily_liveness_info)
end

l_0_5.get_daily_liveness_task_data = function()
  local l_5_0 = l_0_7.get_all_cfg()
  local l_5_1 = {}
  if l_0_5.daily_liveness_data and l_0_5.daily_liveness_data.day_act then
    for l_5_5,l_5_6 in l_0_1(l_5_0) do
      local l_5_7 = {}
      l_5_7.id = l_5_6.id
      l_5_7.cfg = l_5_6
      l_5_7.can_get = l_5_6.liveness <= l_0_5.daily_liveness_data.day_act
      l_5_7.is_get = false
      if l_0_5.daily_liveness_data.act_ids then
        for l_5_13,l_5_14 in l_0_1(l_0_5.daily_liveness_data.act_ids) do
          if l_5_14 == l_5_6.id then
            l_5_7.is_get = true
          end
        end
      end
      l_0_0(l_5_1, l_5_7)
    end
  end
  return l_5_1
end

l_0_5.get_daily_liveness_data = function()
  return l_0_5.daily_liveness_data
end


