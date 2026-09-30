-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua6_573512\game.module.season.manager.network.network_pve_-3087170141190071276.bin 

local l_0_0 = import("..head")
local l_0_1 = l_0_0.network_pve
local l_0_2 = l_0_0.data_pve
local l_0_3 = Game.events
local l_0_4 = require("game.network.network_utils")
local l_0_5 = Game.redpoint_helper
l_0_1.init = function()
  local l_1_0 = l_0_1
  local l_1_1 = {}
  l_1_1.task_season_s2c = l_0_1.on_task_season_s2c
  l_1_1.task_receive_season_rank_s2c = l_0_1.on_task_receive_season_rank_s2c
  l_1_1.task_receive_repeat_reward_s2c = l_0_1.on_task_receive_repeat_reward_s2c
  l_1_0.season_pve_events = l_1_1
  l_1_0 = l_0_4
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_1
  l_1_1 = l_1_1.season_pve_events
  l_1_0(l_1_1, "season_pve")
end

l_0_1.clear = function()
  l_0_4.unlisten_net_events(l_0_1.season_pve_events)
end

l_0_1.on_task_season_s2c = function(l_3_0, l_3_1)
  l_0_2.init_season_pve_week_reward(l_3_1.week_reward)
  l_0_2.init_season_task(l_3_1.season_task)
  local l_3_2 = l_3_1.season_rank_list
  l_0_2.init_season_pve_reward_info(l_3_2)
  local l_3_3 = l_3_1.repeat_low
  l_0_2.init_season_pve_reward_overflow(l_3_3)
  l_0_3.brocast("season_pve_reward_update", l_3_2, l_3_3)
end

l_0_1.on_task_receive_season_rank_s2c = function(l_4_0, l_4_1)
  local l_4_2 = l_4_1.cup
  if l_4_2 then
    l_0_2.on_get_season_pve_reward(l_4_2)
  end
  l_0_3.brocast("season_pve_reward_get", l_4_2)
end

l_0_1.on_task_receive_repeat_reward_s2c = function(l_5_0, l_5_1)
  local l_5_2 = l_5_1.num
  if not l_5_2 then
    return 
  end
  l_0_2.init_season_pve_reward_overflow(l_5_2)
  l_0_3.brocast("season_pve_reward_get_repeat", l_5_2)
  l_0_5.update_red_point(l_0_0.get_season_pve_progress_reward_red_point_id())
end

l_0_1.req_task_season_c2s = function()
  l_0_4.send("task_season_c2s", {})
end

l_0_1.req_task_receive_repeat_reward_c2s = function()
  l_0_4.send("task_receive_repeat_reward_c2s", {})
end

l_0_1.req_task_receive_season_rank_c2s = function(l_8_0)
  local l_8_1 = l_0_4.send
  local l_8_2 = "task_receive_season_rank_c2s"
  local l_8_3 = {}
  l_8_3.cup = l_8_0
  l_8_1(l_8_2, l_8_3)
end


