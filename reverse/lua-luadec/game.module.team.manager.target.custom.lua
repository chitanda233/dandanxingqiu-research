-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.custom_1475855929656852861.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.custom
local l_0_2 = l_0_0.ways.base
local l_0_3 = DataConfigs.team_target
local l_0_4 = Game.module.team
local l_0_5 = l_0_4.data
local l_0_6 = l_0_4.const
local l_0_7 = l_0_4.network
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_3.get_cfg_by_id(l_0_6.target_main_type.custom)
end

l_0_1.get_start_btn_desc = function(l_2_0)
  return "\229\188\128\229\167\139\229\175\185\230\136\152"
end

l_0_1.get_team_panel_type = function(l_3_0)
  return l_0_6.panel_type.team_custom
end

l_0_1.get_target_item_desc = function(l_4_0, l_4_1, l_4_2)
  return l_0_6.team_target_desc_type.tips, "\232\135\170\231\148\177\228\189\147\233\170\140\229\156\176\229\155\190\230\168\161\229\188\143"
end

l_0_1.get_start_btn_gray_state = function(l_5_0)
  local l_5_1 = l_0_5.get_team_info()
  if not l_5_1 then
    return false, "\230\151\160\233\152\159\228\188\141\228\191\161\230\129\175"
  end
  local l_5_2 = l_5_1.members
  local l_5_3 = false
  do
    local l_5_4 = false
    for l_5_8,l_5_9 in ipairs(l_5_2) do
      if not l_5_3 and l_0_5.get_custom_camp(l_5_9.role_id) == l_0_6.custom_camp.blue then
        l_5_3 = true
        for l_5_8,l_5_9 in l_5_5 do
        end
        if not l_5_4 and l_0_5.get_custom_camp(l_5_9.role_id) == l_0_6.custom_camp.red then
          l_5_4 = true
        end
      end
      if not l_5_3 then
        return true, "\232\147\157\230\150\185\229\176\154\230\151\160\230\136\144\229\145\152"
      end
      if not l_5_4 then
        return true, "\231\186\162\230\150\185\229\176\154\230\151\160\230\136\144\229\145\152"
      end
      if not l_0_5.is_members_all_ready() then
        return true, "\230\136\191\233\151\180\229\134\133\230\156\137\230\136\144\229\145\152\229\176\154\230\156\170\229\135\134\229\164\135"
      end
      return false
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_1.could_turn_to_this_target = function(l_6_0, l_6_1, l_6_2)
  if not l_0_5.is_in_team() and l_6_1 then
    l_0_7.team_create_c2s(l_0_6.target_main_type.custom, 1)
    l_0_7.team_set_condition_c2s({})
    l_0_7.team_set_setting_c2s({})
  end
  if l_6_2 then
    l_6_2(true)
  end
end

l_0_1.has_sub_target = function(l_7_0, l_7_1, l_7_2)
  return false
end

return l_0_1

