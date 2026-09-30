-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.alliance_trial_-4947767525399406346.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.alliance_trial
local l_0_2 = l_0_0.ways.base
local l_0_3 = Game.module.team
local l_0_4 = l_0_3.data
local l_0_5 = l_0_3.const
local l_0_6 = l_0_3.network
local l_0_7 = l_0_3.event
local l_0_8 = Game.module.data
local l_0_9 = Game.module.alliance
local l_0_10 = l_0_9.network
local l_0_11 = Game.module.open_func
local l_0_12 = l_0_11.const
local l_0_13 = Game.module.activity
local l_0_14 = l_0_13.data
local l_0_15 = l_0_13.const
l_0_1.init = function(l_1_0, l_1_1)
  l_0_2.init(l_1_0, l_1_1)
  l_0_10.alliance_trial_info_c2s()
end

l_0_1.get_team_target_right_desc = function(l_2_0)
  local l_2_1 = l_0_15.act_id.alliance_trial
  if l_0_14.is_activity_open(l_2_1) then
    local l_2_2 = l_0_11.is_open(l_0_12.type.alliance_trial)
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

  end
  return string.format("\229\165\150\229\138\177\230\172\161\230\149\176\239\188\154<color=%s>%s</color>/%s", string.get_color_with_cost_info(l_0_9.get_trial_challenge_cnt(), , not l_2_2, true), l_0_9.get_trial_challenge_cnt(), )
end
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

return "", false
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.get_team_target_left_desc = function(l_3_0)
  return "", false
end

l_0_1.get_target_item_desc = function(l_4_0)
  local l_4_1 = l_0_15.act_id.alliance_trial
  if l_0_14.is_activity_open(l_4_1) then
    local l_4_2 = l_0_11.is_open(l_0_12.type.alliance_trial)
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

  end
  return l_0_5.team_target_desc_type.desc, "\229\165\150\229\138\177\230\172\161\230\149\176\239\188\154", string.format("<color=%s>%s</color>/%s", string.get_color_with_cost_info(l_0_9.get_trial_challenge_cnt(), , not l_4_2, true), l_0_9.get_trial_challenge_cnt(), ), false
end
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.


 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.get_team_target_reward_desc = function(l_5_0)
  local l_5_1 = l_0_15.act_id.alliance_trial
  if l_0_14.is_activity_open(l_5_1) then
    local l_5_2 = l_0_11.is_open(l_0_12.type.alliance_trial)
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

  end
  return string.format("\229\165\150\229\138\177\230\172\161\230\149\176\239\188\154<color=%s>%s</color>/%s", string.get_color_with_cost_info(l_0_9.get_trial_challenge_cnt(), , not l_5_2, true), l_0_9.get_trial_challenge_cnt(), )
end
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.


 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_1.get_room_open_invite_args = function(l_6_0, l_6_1)
  local l_6_2 = {}
  l_6_2.show_tab = 3
  return l_6_2
end

l_0_1.get_start_btn_desc = function(l_7_0)
  return "\229\188\128\229\167\139\230\140\145\230\136\152"
end

l_0_1.get_start_btn_gray_state = function(l_8_0)
  do
    local l_8_1 = l_0_15.act_id.alliance_trial
    if l_0_14.is_activity_open(l_8_1) then
      return not l_0_11.is_open(l_0_12.type.alliance_trial), "\230\180\187\229\138\168\230\156\170\229\188\128\229\144\175"
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_1.has_sub_target = function(l_9_0)
  return false
end

l_0_1.check_start_match = function(l_10_0, l_10_1, l_10_2, l_10_3)
  local l_10_4 = l_0_4.get_team_info()
  if l_10_4 and l_10_4.members then
    local l_10_5 = l_0_9.data.get_my_alliance_id()
    if not l_10_5 or l_10_5 == 0 then
      return false, "\230\130\168\230\156\170\229\138\160\229\133\165\229\133\172\228\188\154\239\188\140\230\151\160\230\179\149\229\143\130\229\138\160\229\133\172\228\188\154\232\175\149\231\130\188"
    end
    local l_10_6 = {}
    for l_10_10,l_10_11 in ipairs(l_10_4.members) do
      if l_10_11.is_robot == 0 then
        local l_10_12 = l_0_8.raw_get_player_info(l_10_11.role_id)
        if not l_10_12.alliance_id then
          local l_10_13 = not l_10_12 or 0
        end
         -- DECOMPILER ERROR: Confused about usage of registers!

        if not l_10_12.name then
          table.insert(l_10_6, l_10_13 == l_10_5 or "\230\156\170\231\159\165\231\142\169\229\174\182")
        end
      end
    end
    do
      if #l_10_6 > 0 then
        local l_10_14 = string.format("\233\152\159\228\188\141\228\184\173\230\156\137\233\157\158\230\156\172\229\133\172\228\188\154\230\136\144\229\145\152\239\188\140\230\151\160\230\179\149\230\140\145\230\136\152")
      end
      return false, l_10_14
    end
  end
  return true
end

l_0_1.need_fill_member_before_match = function(l_11_0, l_11_1)
  return true, true
end

return l_0_1

