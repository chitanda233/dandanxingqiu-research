-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua6_573512\game.module.season.manager.data.data_3v3_829726415761633321.bin 

local l_0_0 = ipairs
local l_0_1 = DataConfigs
local l_0_2 = l_0_1.cfg_3V3_season
local l_0_3 = import("..head")
local l_0_4 = l_0_3.data_3v3
local l_0_5 = l_0_3.const
local l_0_6 = l_0_5.award_state
l_0_4.init = function()
  l_0_4.reset()
end

l_0_4.clear = function()
  l_0_4.reset()
end

l_0_4.reset = function()
  l_0_4.season_v3_info = {}
  l_0_4.player_v3_info = {}
  l_0_4.has_get_rank_dic = {}
end

l_0_4.save_v3_season_info = function(l_4_0)
  if l_4_0 then
    local l_4_1 = l_4_0.season_id
    if l_4_1 then
      l_4_0.season_config = l_0_2.get_config(l_4_1)
    end
  end
  l_0_4.season_v3_info = l_4_0
end

l_0_4.save_v3_player_info = function(l_5_0)
  if l_5_0 then
    table.clear(l_0_4.has_get_rank_dic)
    if l_5_0.season_rank_list then
      for l_5_4,l_5_5 in l_0_0(l_5_0.season_rank_list) do
        l_0_4.has_get_rank_dic[l_5_5] = true
      end
    end
    l_0_4.player_v3_info = l_5_0
  end
end

l_0_4.save_v3_get_activity_reward = function(l_6_0)
  if l_6_0 == l_0_5.activity_reward_type.win then
    l_0_4.player_v3_info.is_win_reward = 1
  else
    if l_6_0 == l_0_5.activity_reward_type.join then
      l_0_4.player_v3_info.is_join_reward = 1
    end
  end
end

l_0_4.save_v3_get_season_rank_reward = function(l_7_0)
  local l_7_1 = l_0_4.player_v3_info
  if not l_7_1.season_rank_list then
    l_7_1.season_rank_list = {}
  end
  table.insert(l_7_1.season_rank_list, l_7_0)
  l_0_4.has_get_rank_dic[l_7_0] = true
end

l_0_4.get_3v3_season_info = function(l_8_0)
  return l_0_4.season_v3_info
end

l_0_4.get_3v3_player_info = function()
  return l_0_4.player_v3_info
end

l_0_4.rank_v3_has_award = function(l_10_0, l_10_1)
  local l_10_2 = api_season_v3.get_config(l_10_1)
  if not l_10_2.season_reward then
    return false
  end
  if not l_10_2.season_reward[l_10_0] then
    return false
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  local l_10_3 = l_10_2.season_reward[l_10_0].reach_reward
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    return not l_10_3 or #l_10_3 > 0
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_4.get_my_season_v3_award_state = function(l_11_0)
  if l_0_4.has_get_rank_dic[l_11_0] then
    return l_0_6.getted
  else
    if l_11_0 <= l_0_4.player_v3_info.season_max_rank then
      return l_0_6.reached
    else
      return l_0_6.doing
    end
  end
end


