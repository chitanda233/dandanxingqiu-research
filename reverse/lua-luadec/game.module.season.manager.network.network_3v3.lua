-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua6_573512\game.module.season.manager.network.network_3v3_550342646532033637.bin 

local l_0_0 = import("..head")
local l_0_1 = assert(l_0_0.network_3v3)
local l_0_2 = assert(l_0_0.data_3v3)
local l_0_3 = assert(l_0_0.const)
local l_0_4 = require("game.utils.events")
local l_0_5 = require("game.network.network_utils")
local l_0_6 = require("game.utils.events")
local l_0_7 = Game.redpoint_helper
local l_0_8 = {}
l_0_8.ranked_match_season_info_s2c = l_0_1.on_ranked_match_season_info_s2c
l_0_8.ranked_match_role_info_s2c = l_0_1.on_ranked_match_role_info_s2c
l_0_8.ranked_match_receive_reward_s2c = l_0_1.on_ranked_match_receive_reward_s2c
l_0_8.ranked_match_receive_season_rank_s2c = l_0_1.on_ranked_match_receive_season_rank_s2c
l_0_8.ranked_match_fight_result_s2c = l_0_1.on_ranked_match_fight_result_s2c
l_0_8.ranked_match_fight_static_s2c = l_0_1.on_ranked_match_fight_static_s2c
l_0_8.season_rank_s2c = l_0_1.on_season_rank_s2c
l_0_1.net_v3_event_names = l_0_8
l_0_8 = function()
  l_0_5.listen_net_events(l_0_1.net_v3_event_names, "season_3v3")
end

l_0_1.init = l_0_8
l_0_8 = function()
  l_0_5.unlisten_net_events(l_0_1.net_v3_event_names)
end

l_0_1.clear = l_0_8
l_0_8 = function(l_3_0, l_3_1)
  if l_3_0 == 0 then
    if l_3_1.season_id == 0 then
      l_3_1.season_id = 1
    end
    l_0_2.save_v3_season_info(l_3_1)
    l_0_6.brocast("season_info_changed")
  end
end

l_0_1.on_ranked_match_season_info_s2c = l_0_8
l_0_8 = function(l_4_0, l_4_1)
  if l_4_0 == 0 then
    if l_4_1.season_id == 0 then
      l_4_1.season_id = 1
    end
    l_0_2.save_v3_player_info(l_4_1)
    l_0_6.brocast("season_player_info_changed")
    l_0_0.refresh_all_v3_award_red_point()
    l_0_7.update_red_point("season_v3_activity_award_join")
    l_0_7.update_red_point("season_v3_activity_award_win")
  end
end

l_0_1.on_ranked_match_role_info_s2c = l_0_8
l_0_8 = function(l_5_0, l_5_1)
  if l_5_0 == 0 then
    l_0_2.save_v3_get_activity_reward(l_5_1.type)
    l_0_6.brocast("season_get_activity_award", l_5_1.type)
    if l_5_1.type == l_0_3.activity_reward_type.win then
      l_0_7.update_red_point("season_v3_activity_award_win")
    else
      l_0_7.update_red_point("season_v3_activity_award_join")
    end
  end
end

l_0_1.on_ranked_match_receive_reward_s2c = l_0_8
l_0_8 = function(l_6_0, l_6_1)
  if l_6_0 == 0 then
    l_0_2.save_v3_get_season_rank_reward(l_6_1.rank_id)
    l_0_6.brocast("season_get_season_rank_award", l_6_1.rank_id)
    l_0_7.update_red_point(l_0_0.get_rank_season_v3_award_red_point_id(l_6_1.rank_id))
  end
end

l_0_1.on_ranked_match_receive_season_rank_s2c = l_0_8
l_0_8 = function(l_7_0, l_7_1)
  if l_7_0 ~= 0 then
    return 
  end
  local l_7_2 = l_0_0.check_fight_result_changed_info_v3(l_7_1)
  local l_7_3 = l_0_2.update_player_info_by_fight_3v3(l_7_1, l_0_3.season_type.v3)
  l_0_6.brocast("season_player_info_changed", l_0_2.player_info, l_0_3.season_type.v3)
  local l_7_4 = l_0_1
  local l_7_5 = {}
  l_7_5.change_info = l_7_2
  l_7_4.fight_result_param = l_7_5
  if l_7_3 then
    l_7_4 = l_0_0
    l_7_4 = l_7_4.refresh_all_award_red_point
    l_7_4()
  end
  return l_7_2
end

l_0_1.on_ranked_match_fight_result_s2c = l_0_8
l_0_8 = function(l_8_0, l_8_1)
  if l_8_0 ~= 0 then
    return 
  end
  l_0_1.send_ranked_match_role_info_c2s()
end

l_0_1.on_ranked_match_fight_static_s2c = l_0_8
l_0_8 = function()
  l_0_5.send("ranked_match_season_info_c2s", {})
end

l_0_1.send_ranked_match_season_info_c2s = l_0_8
l_0_8 = function()
  l_0_5.send("ranked_match_role_info_c2s", {})
end

l_0_1.send_ranked_match_role_info_c2s = l_0_8
l_0_8 = function(l_11_0)
  local l_11_1 = l_0_5.send
  local l_11_2 = "ranked_match_receive_reward_c2s"
  local l_11_3 = {}
  l_11_3.type = l_11_0
  l_11_1(l_11_2, l_11_3)
end

l_0_1.send_ranked_match_receive_reward_c2s = l_0_8
l_0_8 = function(l_12_0)
  local l_12_1 = l_0_5.send
  local l_12_2 = "ranked_match_receive_season_rank_c2s"
  local l_12_3 = {}
  l_12_3.rank_id = l_12_0
  l_12_1(l_12_2, l_12_3)
end

l_0_1.send_ranked_match_receive_season_rank_c2s = l_0_8

