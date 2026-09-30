-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.morph_-4827592058654006077.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.morph
local l_0_2 = l_0_0.ways.base
local l_0_3 = Game.module.team
local l_0_4 = l_0_3.const
local l_0_5 = DataConfigs.team_target
local l_0_6 = Game.module.morph
l_0_1.show_season_xianding = function(l_1_0)
  return true
end

l_0_1.get_target_item_desc = function(l_2_0, l_2_1, l_2_2)
  local l_2_3 = l_0_6.check_morph_valid()
  if not l_2_3 then
    local l_2_4 = l_0_6.get_open_time_str()
    return l_0_4.team_target_desc_type.tips, l_2_4
  end
  do
    local l_2_5 = l_2_0.target_cfg.sub_target[1]
    if l_2_5.max_reward_times <= l_0_6.get_reward_times() then
      local l_2_6, l_2_8, l_2_10 = l_2_5.day_low_reward_times
      l_2_10 = l_0_6
      l_2_10 = l_2_10.get_common_reward_times
      l_2_10 = l_2_10()
      l_2_8 = l_2_10
       -- DECOMPILER ERROR: Confused at declaration of local variable

      l_2_10 = l_0_4
      l_2_10 = l_2_10.team_target_desc_type
      l_2_10 = l_2_10.desc
      return l_2_10, "\229\143\130\228\184\142\229\165\150\229\138\177\230\172\161\230\149\176:", string.format("%s/%s", l_2_8, l_2_6)
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    return l_0_4.team_target_desc_type.desc, "\232\142\183\232\131\156\229\165\150\229\138\177\230\172\161\230\149\176:", string.format("%s/%s", l_2_8, l_2_6)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.get_team_target_reward_desc = function(l_3_0)
  local l_3_1 = l_3_0.target_cfg.sub_target[1]
  if l_3_1.max_reward_times <= l_0_6.get_reward_times() then
    local l_3_2, l_3_8, l_3_10, l_3_11 = l_3_1.day_low_reward_times
    l_3_10 = l_0_6
    l_3_10 = l_3_10.get_common_reward_times
    l_3_10 = l_3_10()
    l_3_8 = l_3_10
    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

      l_3_10 = string
      l_3_10 = l_3_10.format
       -- DECOMPILER ERROR: Confused at declaration of local variable

      l_3_11 = "\229\143\130\228\184\142\229\165\150\229\138\177\230\172\161\230\149\176:%s/%s"
       -- DECOMPILER ERROR: Confused at declaration of local variable

      local l_3_6 = l_3_8
      local l_3_7 = l_3_2
      return l_3_10(l_3_11, l_3_6, l_3_7)
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

  return string.format("\232\142\183\232\131\156\229\165\150\229\138\177\230\172\161\230\149\176:%s/%s", l_3_8, l_3_2)
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.get_team_target_right_desc = function(l_4_0)
  local l_4_1 = l_0_6.check_morph_valid()
  if not l_4_1 then
    return l_0_6.get_open_time_str()
  end
  local l_4_2 = l_0_6.get_win_times()
  if not l_4_2 or l_4_2 == 0 then
    return ""
  end
  local l_4_3 = string.format
  local l_4_4 = "%s\232\191\158\232\131\156"
  local l_4_5 = l_4_2
  return l_4_3(l_4_4, l_4_5)
end

l_0_1.get_start_btn_gray_state = function(l_5_0)
  local l_5_1 = l_0_6.check_morph_valid()
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

return l_0_1

