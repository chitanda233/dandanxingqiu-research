-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.support_rank_5041115333585832744.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.support_rank
local l_0_2 = l_0_0.ways.base
local l_0_3 = Game.module.team
local l_0_4 = l_0_3.const
local l_0_5 = DataConfigs.team_target
local l_0_6 = Game.module.commander
local l_0_7 = DataConfigs.support_rank_misc
l_0_1.is_team_type_open = function(l_1_0)
  if not l_0_6.check_commander_valid() then
    return false
  end
  local l_1_1 = l_0_2.is_team_type_open
  local l_1_2 = l_1_0
  return l_1_1(l_1_2)
end

l_0_1.get_target_item_desc = function(l_2_0, l_2_1, l_2_2)
  local l_2_3 = l_0_6.check_commander_valid()
  if not l_2_3 then
    local l_2_4 = l_0_6.get_open_time_str()
    return l_0_4.team_target_desc_type.tips, l_2_4
  end
  local l_2_5 = l_0_6.get_reward_times_limit()
  local l_2_6 = l_0_6.get_reward_times()
  if l_2_6 < l_2_5 then
    return l_0_4.team_target_desc_type.desc, "\233\171\152\233\162\157\229\165\150\229\138\177\230\172\161\230\149\176:", string.format("%s/%s", l_2_5 - l_2_6, l_2_5)
  end
  l_2_5 = l_0_6.get_base_reward_times_limit()
  l_2_6 = l_0_6.get_base_reward_times()
  return l_0_4.team_target_desc_type.desc, "\229\159\186\231\161\128\229\165\150\229\138\177\230\172\161\230\149\176:", string.format("%s/%s", l_2_5 - l_2_6, l_2_5)
end

l_0_1.get_team_target_reward_desc = function(l_3_0)
  local l_3_1 = l_0_6.get_reward_times_limit()
  local l_3_2 = l_0_6.get_reward_times()
  if l_3_2 < l_3_1 then
    local l_3_3 = string.format
    local l_3_4 = "\233\171\152\233\162\157\229\165\150\229\138\177\230\172\161\230\149\176:%s/%s"
    local l_3_5 = l_3_1 - l_3_2
    local l_3_6 = l_3_1
    return l_3_3(l_3_4, l_3_5, l_3_6)
  end
  l_3_1 = l_0_6.get_base_reward_times_limit()
  l_3_2 = l_0_6.get_base_reward_times()
  local l_3_7 = string.format
  local l_3_8 = "\229\159\186\231\161\128\229\165\150\229\138\177\230\172\161\230\149\176:%s/%s"
  local l_3_9 = l_3_1 - l_3_2
  local l_3_10 = l_3_1
  return l_3_7(l_3_8, l_3_9, l_3_10)
end

l_0_1.get_team_target_right_desc = function(l_4_0)
  if not l_0_6.check_commander_valid() then
    return l_0_6.get_open_time_str()
  end
  return ""
end

l_0_1.get_start_btn_gray_state = function(l_5_0)
  local l_5_1 = l_0_6.check_commander_valid()
  if not l_5_1 then
    local l_5_2 = l_0_6.get_open_time_str()
    return true, l_5_2
  end
  return false
end

l_0_1.get_start_btn_desc = function(l_6_0, l_6_1)
  return "\229\188\128\229\167\139\229\140\185\233\133\141"
end

l_0_1.has_sub_target = function(l_7_0)
  return false
end

l_0_1.get_main_bg = function(l_8_0)
  return "CommanderBg"
end

l_0_1.get_detail_info = function(l_9_0)
  local l_9_1 = l_0_6.get_reward_times_limit()
  local l_9_2 = l_0_6.get_reward_times()
  local l_9_3 = "\230\151\160\232\174\186\232\131\156\232\180\159\233\131\189\228\188\154\230\137\163\233\153\164\229\165\150\229\138\177\230\172\161\230\149\176"
  if l_9_2 < l_9_1 then
    local l_9_4 = {}
    local l_9_5 = table.insert
    local l_9_6 = l_9_4
    local l_9_7 = {}
    l_9_7.title = "\233\171\152\233\162\157\229\165\150\229\138\177\239\188\136\232\131\156\229\136\169\239\188\137"
    l_9_7.desc = l_9_3
    l_9_7.reward = l_0_7.support_rank_win_reward.val
    l_9_5(l_9_6, l_9_7)
    l_9_5 = table
    l_9_5 = l_9_5.insert
    l_9_6 = l_9_4
    l_9_7 = {title = "\233\171\152\233\162\157\229\165\150\229\138\177\239\188\136\229\164\177\232\180\165\239\188\137", desc = l_9_3, reward = l_0_7.support_rank_lose_reward.val}
    l_9_5(l_9_6, l_9_7)
    return l_9_4
  end
  local l_9_8 = {}
  local l_9_9 = table.insert
  local l_9_10 = l_9_8
  local l_9_11 = {}
  l_9_11.title = "\229\159\186\231\161\128\229\165\150\229\138\177\239\188\136\232\131\156\229\136\169\239\188\137"
  l_9_11.desc = l_9_3
  l_9_11.reward = l_0_7.support_rank_base_reward.val
  l_9_9(l_9_10, l_9_11)
  l_9_9 = table
  l_9_9 = l_9_9.insert
  l_9_10 = l_9_8
  l_9_11 = {title = "\229\159\186\231\161\128\229\165\150\229\138\177\239\188\136\229\164\177\232\180\165\239\188\137", desc = l_9_3, reward = l_0_7.support_rank_base_lose_reward.val}
  l_9_9(l_9_10, l_9_11)
  return l_9_8
end

return l_0_1

