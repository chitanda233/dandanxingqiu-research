-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.gve_story_5742028712629610153.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.gve_story
local l_0_2 = DataConfigs.language_define
local l_0_3 = Game.module.team
local l_0_4 = l_0_3.data
local l_0_5 = l_0_3.const
local l_0_6 = l_0_3.network
local l_0_7 = Game.module.open_func
local l_0_8 = DataConfigs.team_target
local l_0_9 = l_0_0.ways.base
local l_0_10 = Game.module.data
local l_0_11 = Game.module.story_level_multi
l_0_1.get_team_target_right_desc = function(l_1_0)
  return "", false, ""
end

l_0_1.get_team_target_reward_desc = function(l_2_0)
  local l_2_1, l_2_2 = l_0_11.get_entrance_desc()
  return l_2_1 .. l_2_2
end

l_0_1.get_start_btn_desc = function(l_3_0)
  return "\229\188\128\229\167\139\230\140\145\230\136\152"
end

l_0_1.get_target_item_desc = function(l_4_0, l_4_1, l_4_2)
  local l_4_3, l_4_4 = l_0_11.get_dungeon_point(l_4_1)
  return l_0_5.team_target_desc_type.desc, "\230\140\145\230\136\152\231\130\185\230\149\176:", string.format("%s/%s", l_4_3, l_4_4)
end

l_0_1.is_team_target_open = function(l_5_0, l_5_1, l_5_2, l_5_3)
  local l_5_4 = l_5_0.target_cfg
  if l_5_4.is_open == 0 then
    return false
  end
  if not l_5_3 then
    l_5_3 = l_0_10.get_player_id()
  end
  local l_5_5 = l_0_10.raw_get_player_info(l_5_3)
  if not l_5_5 then
    return false
  end
  if l_5_4.open_func and not l_0_10.is_role_cross_func_open(l_5_5.role_id, l_5_4.open_func) then
    return false, 1, l_0_7.get_no_open_tips(l_5_4.open_func)
  end
  local l_5_6 = l_5_0.target_cfg.sub_target[l_5_1]
  if l_5_6 and l_5_6.open_func and not l_0_10.is_role_cross_func_open(l_5_5.role_id, l_5_6.open_func) then
    return false, 1, l_0_7.get_no_open_tips(l_5_6.open_func)
  end
  if not l_0_11.check_dungeon_unlock(l_5_1, l_5_3) then
    return false
  end
  return true
end

l_0_1.get_rec_pow_fixed = function(l_6_0)
  local l_6_1 = l_0_11.get_rec_pow_fixed
  return l_6_1()
end

l_0_1.get_main_bg = function(l_7_0)
  return "PvePhysicChallengeBg"
end

l_0_1.need_fill_member_before_match = function(l_8_0, l_8_1)
  return true, true
end

return l_0_1

