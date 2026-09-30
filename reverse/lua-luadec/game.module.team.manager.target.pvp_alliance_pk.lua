-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.team.manager.target.pvp_alliance_pk_-4659230093056601861.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.ways.pvp_alliance_pk
local l_0_2 = require("game.module.common_view.manager.confirm")
local l_0_3 = Game.module.dungeon_material
local l_0_4 = DataConfigs.language_define
local l_0_5 = DataConfigs.alliance_misc
local l_0_6 = Game.module.activity
local l_0_7 = l_0_6.data
local l_0_8 = l_0_6.const
local l_0_9 = DataConfigs.team_target
local l_0_10 = Game.module.team
local l_0_11 = l_0_10.data
local l_0_12 = l_0_10.const
local l_0_13 = Game.module.rank_pop.const
local l_0_14 = Game.module.alliance_battle
local l_0_15 = l_0_14.data
local l_0_16 = l_0_14.const
l_0_1.init = function(l_1_0)
  l_1_0.target_cfg = l_0_9.get_cfg_by_id(l_0_12.target_main_type.alliance_pvp)
end

l_0_1.get_room_open_invite_args = function(l_2_0, l_2_1)
  local l_2_2 = {}
  l_2_2.show_tab = 3
  return l_2_2
end

l_0_1.has_sub_target = function(l_3_0)
  return false
end

l_0_1.get_sub_target_display_reward = function(l_4_0, l_4_1)
  if not l_0_15.is_cross or not l_4_0.target_cfg.pre_reward then
    return l_4_0.target_cfg.cross_pre_reward
  end
end

l_0_1.get_target_desc = function(l_5_0, l_5_1)
  local l_5_2 = l_0_4.get_string
  local l_5_3 = l_5_0.target_cfg.sub_target[1].target_desc
  return l_5_2(l_5_3)
end

l_0_1.get_battle_win_info = function(l_6_0, l_6_1)
  local l_6_2 = l_0_4.get_string
  local l_6_3 = l_6_0.target_cfg.sub_target[1].target_win_desc
  return l_6_2(l_6_3)
end

l_0_1.get_start_btn_desc = function(l_7_0, l_7_1)
  if not l_0_14.is_open(true) then
    return "\230\175\148\232\181\155\230\156\170\229\188\128\229\144\175"
  end
  return "\229\188\128\229\167\139\229\140\185\233\133\141"
end

l_0_1.get_start_btn_gray_state = function(l_8_0, l_8_1)
  local l_8_2 = l_0_14.is_open(true)
  if not l_8_2 then
    local l_8_3, l_8_4 = l_8_0:get_target_item_desc()
    return true, l_8_4, true
  end
  return false, nil, not l_8_2
end

l_0_1.get_team_target_right_desc = function(l_9_0, l_9_1)
  local l_9_2 = l_0_14.is_open(true)
  if not l_9_2 then
    local l_9_3 = l_0_5.alliance_pk_match_time.val
    return string.format("%02d:%02d~%02d:%02d", l_9_3[1][1], l_9_3[1][2], l_9_3[2][1], l_9_3[2][2]), false
  end
  local l_9_4 = l_0_15.acc_win
  return l_9_4 > 0 and string.format("%s\232\191\158\232\131\156", l_9_4) or "", false, l_0_11.get_team_target_name(l_9_0.target_cfg.id, 1)
end

l_0_1.get_is_show_ready = function(l_10_0)
  return l_0_7.is_activity_open(l_0_8.act_id.alliance_battle)
end

l_0_1.get_rank_tab_id = function(l_11_0)
  if l_0_15.is_cross then
    return l_0_13.rank_pop_type.ALLIANCE_BATTLE_CROSS
  else
    return l_0_13.rank_pop_type.ALLIANCE_BATTLE
  end
end

l_0_1.get_target_item_desc = function(l_12_0, l_12_1, l_12_2)
  local l_12_3 = l_0_5.alliance_pk_match_time.val
  return l_0_12.team_target_desc_type.tips, string.format("\230\180\187\229\138\168\230\156\159\233\151\180%02d:%02d~%02d:%02d", l_12_3[1][1], l_12_3[1][2], l_12_3[2][1], l_12_3[2][2])
end

l_0_1.get_main_bg = function(l_13_0)
  local l_13_1 = Game.server_time.get_server_time()
  local l_13_2 = TimeUtils.getDateTime(l_13_1)
  do
    local l_13_3 = l_13_2.Hour
    for l_13_7,l_13_8 in pairs(l_0_16.bg_type_to_time_slot) do
      for l_13_12,l_13_13 in ipairs(l_13_8) do
        if l_13_13 == l_13_3 then
          if l_13_7 == l_0_16.bg_type.day then
            return "AlliancePkBg"
            for l_13_12,l_13_13 in l_13_9 do
            end
            if l_13_7 == l_0_16.bg_type.evening or l_13_7 == l_0_16.bg_type.early_morning then
              return "AlliancePkBg_sr"
              for l_13_12,l_13_13 in l_13_9 do
              end
              if l_13_7 == l_0_16.bg_type.night then
                return "AlliancePkBg_n"
              end
            end
          end
        end
        return "AlliancePkBg"
      end
       -- Warning: missing end command somewhere! Added here
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_1.check_start_match = function(l_14_0, l_14_1, l_14_2, l_14_3)
  local l_14_4 = l_0_14.is_open(true)
  if not l_14_4 then
    return false, "\230\175\148\232\181\155\230\156\170\229\188\128\229\144\175"
  end
  if l_0_14.check_can_worship() then
    local l_14_5 = l_0_2.confirm
    local l_14_6 = {}
    l_14_6.content = "\229\189\147\229\137\141\229\176\154\230\156\170\232\134\156\230\139\156\229\189\147\229\164\169\229\133\172\228\188\154\229\164\167\231\165\158\239\188\140\230\152\175\229\144\166\232\191\155\232\161\140\232\134\156\230\139\156\230\157\165\232\142\183\229\190\151\229\133\172\228\188\154\228\186\137\233\156\184\232\181\155\231\154\132\230\136\152\230\150\151\229\177\158\230\128\167\229\162\158\231\155\138\239\188\159"
    l_14_6.sure_click = function()
      l_0_14.network.req_alliance_pk_worship_c2s()
      l_14_3()
      end
    l_14_6.cancel_click = function()
      l_14_3()
      end
    l_14_6.sure_label = "\232\134\156\230\139\156"
    l_14_6.cancel_label = "\231\187\167\231\187\173\229\140\185\233\133\141"
    l_14_5(l_14_6)
    l_14_5 = false
    return l_14_5
  end
  return true
end

l_0_1.need_fill_member_before_match = function(l_15_0, l_15_1)
  return true, true
end

return l_0_1

