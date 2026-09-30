-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua6_573512\game.module.season.manager.data.data_pve_9111794210503480157.bin 

local l_0_0 = DataConfigs
local l_0_1 = import("..head")
local l_0_2 = l_0_1.data_pve
local l_0_3 = l_0_1.const
l_0_2.init = function()
  l_0_2.reset()
end

l_0_2.clear = function()
  l_0_2.reset()
end

l_0_2.reset = function()
  l_0_2.season_pve_reward_info = {}
  l_0_2.season_pve_reward_overflow = 0
  l_0_2.week_exp = 0
end

l_0_2.init_season_pve_week_reward = function(l_4_0)
  l_0_2.season_pve_week_reward_id = l_4_0
end

l_0_2.init_season_pve_reward_info = function(l_5_0)
  l_0_2.season_pve_reward_info = {}
  if l_5_0 then
    for l_5_4,l_5_5 in pairs(l_5_0) do
      l_0_2.season_pve_reward_info[l_5_5] = true
    end
  end
end

l_0_2.init_season_pve_reward_overflow = function(l_6_0)
  l_0_2.season_pve_reward_overflow = l_6_0
end

l_0_2.get_season_pve_reward_overflow = function()
  return l_0_2.season_pve_reward_overflow or 0
end

l_0_2.on_get_season_pve_reward = function(l_8_0)
  if not l_8_0 then
    return 
  end
  for l_8_4,l_8_5 in pairs(l_8_0) do
    l_0_2.season_pve_reward_info[l_8_5] = true
  end
end

l_0_2.init_season_pve_week_reward = function(l_9_0)
  l_0_2.week_exp = l_9_0
end

l_0_2.init_season_task = function(l_10_0)
  l_0_2.season_task_dic = {}
  if not l_10_0 then
    return 
  end
  for l_10_4,l_10_5 in pairs(l_10_0) do
    local l_10_6 = l_0_2.season_task_dic
    local l_10_7 = l_10_5.task_id
    l_10_6[l_10_7] = l_10_5.num
  end
end


