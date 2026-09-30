-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua1_573660\game.module.battle_pass.manager.core_6719724894960869895.bin 

local l_0_0 = pairs
local l_0_1 = ipairs
local l_0_2 = table.insert
local l_0_3 = table.sort
local l_0_4 = string.format
local l_0_5 = DataConfigs
local l_0_6 = l_0_5.language_define
local l_0_7 = l_0_5.item
local l_0_8 = l_0_5.recharge
local l_0_9 = l_0_5.battlepass_misc
local l_0_10 = l_0_5.battlepass_reward
local l_0_11 = l_0_5.battlepass_season
local l_0_12 = l_0_5.battlepass_common
local l_0_13 = l_0_5.battlepass_common_reward
local l_0_14 = l_0_5.tasks
local l_0_15 = l_0_5.battlepass_anim
local l_0_16 = BroadcastTips
local l_0_17 = GlobalConst
local l_0_18 = Game.events
local l_0_19 = Game.redpoint_helper
local l_0_20 = Game.server_time
local l_0_21 = Game.ui_manager
local l_0_22 = require("game.other.game_time.init")
local l_0_23 = require("game.module.tips.view.try_to_cost.core")
local l_0_24 = require("game.other.player_prefs")
local l_0_25 = Game.module.common_view
local l_0_26 = Game.module.jump_to
local l_0_27 = Game.module.open_func
local l_0_28 = l_0_27.const
local l_0_29 = l_0_27.event
local l_0_30 = Game.module.task
local l_0_31 = l_0_30.data
local l_0_32 = l_0_30.const
local l_0_33 = l_0_30.event
local l_0_34 = Game.module.recharge
local l_0_35 = Game.module.bag
local l_0_36 = import(".head")
local l_0_37 = l_0_36.data
local l_0_38 = l_0_36.network
local l_0_39 = l_0_36.const
local l_0_40 = l_0_36.event
l_0_36.init = function()
  l_0_37.init()
  l_0_38.init()
  l_0_36.setup_events()
  l_0_36.init_red_points()
  l_0_36.register_jump()
end

l_0_36.clear = function()
  l_0_36.clear_events()
  l_0_36.clear_red_points()
  l_0_38.clear()
  l_0_37.clear()
end

l_0_36.init_req_battle_pass = function()
  if l_0_27.is_open(l_0_28.type.battle_pass) then
    l_0_38.req_battle_pass_info_c2s()
  end
end

l_0_36.init_req_common_battle_pass = function()
  for l_4_3,l_4_4 in l_0_1(l_0_39.init_req_common_type) do
    if not l_0_37.is_req_common_type[l_4_4] then
      local l_4_5 = l_0_12.get_config(l_4_4)
      do
         -- DECOMPILER ERROR: Confused at declaration of local variable

         -- DECOMPILER ERROR: Confused about usage of registers!

         -- DECOMPILER ERROR: Confused about usage of registers!

        if ((l_4_5 and not l_4_5.open_id) or l_4_5.open_id == 0 or l_0_27.is_open(l_4_5.open_id)) then
          l_0_37.is_req_common_type[l_4_4] = true
          l_0_38.req_battle_pass_common_info_c2s(l_4_4)
        end
         -- DECOMPILER ERROR: Confused about usage of registers for local variables.

      end
    end
  end
end

l_0_36.is_open = function(l_5_0)
  local l_5_1 = l_0_28.type.battle_pass
  local l_5_2 = true
  if not l_0_27.is_open(l_5_1) then
    l_5_2 = false
    if l_5_0 then
      l_0_16.broadcast_tips(l_0_27.get_no_open_tips(l_5_1))
    end
  end
  if l_0_37.season_id == 0 or l_0_37.reward_group_id == 0 then
    l_5_2 = false
    if l_5_0 then
      l_0_16.broadcast_tips(l_0_6.get_string("lan_battlepass_not_open"))
    end
  end
  if l_0_37.end_time == 0 or l_0_37.end_time < l_0_20.get_server_time() then
    l_5_2 = false
    if l_5_0 then
      l_0_16.broadcast_tips(l_0_6.get_string("lan_battlepass_not_open"))
    end
  end
  return l_5_2
end

l_0_36.get_reward_configs = function()
  if l_0_37.reward_group_id == 0 then
    return nil
  end
  local l_6_0 = l_0_10.get_config_by_reward_id(l_0_37.reward_group_id)
  if l_6_0 and next(l_6_0) then
    return l_6_0
  end
  return nil
end

l_0_36.get_season_config = function()
  if l_0_37.season_id == 0 then
    return nil
  end
  local l_7_0 = l_0_11.get_config(l_0_37.season_id)
  if l_7_0 then
    return l_7_0
  end
  return nil
end

l_0_36.get_max_lv = function()
  local l_8_0 = l_0_36.get_reward_configs()
  if l_8_0 then
    return l_8_0[#l_8_0].lv
  end
  return 0
end

l_0_36.get_is_buy = function()
  return l_0_37.is_buy == true
end

l_0_36.get_item_is_lock = function(l_10_0, l_10_1)
  if l_0_37.level < l_10_0 then
    return true
  end
  if l_10_1 and not l_0_36.get_is_buy() then
    return true
  end
  return false
end

l_0_36.get_item_is_got = function(l_11_0, l_11_1)
  if l_0_37.level < l_11_0 then
    return false
  end
  if l_11_1 and l_0_36.get_is_buy() and l_11_0 <= l_0_37.advance_level then
    return true
  end
  return false
end

l_0_36.get_item_can_get = function(l_12_0, l_12_1)
  if l_0_37.level < l_12_0 then
    return false
  end
  if l_12_1 and l_0_36.get_is_buy() and l_0_37.advance_level < l_12_0 then
    return true
  end
  return false
end

l_0_36.get_item_is_buy_notice = function(l_13_0, l_13_1)
  if l_13_0 <= l_0_37.level and l_13_1 and not l_0_36.get_is_buy() then
    return true
  end
  return false
end

l_0_36.get_reward_list = function()
  local l_14_0 = l_0_36.get_reward_configs()
  local l_14_1 = l_0_36.get_season_config()
  if not l_14_0 or not l_14_1 then
    return {}
  end
  local l_14_2 = {}
  for l_14_6,l_14_7 in l_0_1(l_14_0) do
    local l_14_8 = {}
    l_14_8.lv = l_14_7.lv
    l_14_8.sp_lv = l_14_7.sp_lv
    l_14_8.free_reward = clone(l_14_7.free_reward)
    l_14_8.pay_reward = clone(l_14_7.pay_reward)
    if l_14_1.reward[l_14_7.lv] then
      l_0_2(l_14_8.pay_reward, clone(l_14_1.reward[l_14_7.lv]))
    end
    l_0_2(l_14_2, l_14_8)
  end
  return l_14_2
end

l_0_36.get_advance_reward_list = function()
  local l_15_0 = l_0_36.get_reward_configs()
  local l_15_1 = l_0_36.get_season_config()
  if not l_15_0 or not l_15_1 then
    return {}
  end
  local l_15_2 = {}
  for l_15_6,l_15_7 in l_0_0(l_15_1.reward) do
    local l_15_8 = l_15_7[1]
    local l_15_9 = l_15_7[2]
    l_15_2[l_15_8] = (l_15_2[l_15_8] or 0) + l_15_9
  end
  for l_15_13,l_15_14 in l_0_1(l_15_0) do
    for l_15_18,l_15_19 in l_0_1(l_15_14.pay_reward) do
      local l_15_20 = l_15_19[1]
      local l_15_21 = l_15_19[2]
      l_15_2[l_15_20] = (l_15_2[l_15_20] or 0) + l_15_21
    end
  end
  local l_15_22, l_15_31, l_15_32 = {}
  l_15_31 = l_0_0
  l_15_32 = l_15_2
  l_15_31 = l_15_31(l_15_32)
  for l_15_26,l_15_27 in l_15_31 do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

      l_0_2(l_15_22, {item_id = l_15_14, item_num = l_15_15})
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_0_3(l_15_22, function(l_1_0, l_1_1)
    local l_16_2 = l_0_7.get_item(l_1_0.item_id)
    local l_16_3 = l_0_7.get_item(l_1_1.item_id)
    if l_16_3.quality >= l_16_2.quality then
      return not l_16_2 or not l_16_3 or l_16_2.quality == l_16_3.quality
    end
    return l_1_0.item_id < l_1_1.item_id
   end)
   -- DECOMPILER ERROR: Confused about usage of registers!

  return l_15_22
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_36.get_buy_reward_list = function(l_16_0)
  local l_16_1 = l_0_36.get_reward_configs()
  local l_16_2 = l_0_36.get_season_config()
  if not l_16_1 or not l_16_2 then
    return {}
  end
  local l_16_3 = {}
  for l_16_7,l_16_8 in l_0_1(l_16_1) do
    if l_0_37.level < l_16_8.lv and l_16_8.lv <= l_16_0 then
      for l_16_12,l_16_13 in l_0_1(l_16_8.free_reward) do
        local l_16_14 = l_16_13[1]
        local l_16_15 = l_16_13[2]
        l_16_3[l_16_14] = (l_16_3[l_16_14] or 0) + l_16_15
      end
      if l_0_36.get_is_buy() then
        if l_16_2.reward[l_16_8.lv] then
          local l_16_16 = l_16_2.reward[l_16_8.lv][1]
          local l_16_17 = l_16_2.reward[l_16_8.lv][2]
          l_16_3[l_16_16] = (l_16_3[l_16_16] or 0) + l_16_17
        end
        for l_16_21,l_16_22 in l_0_1(l_16_8.pay_reward) do
          local l_16_23 = l_16_22[1]
          local l_16_24 = l_16_22[2]
          l_16_3[l_16_23] = (l_16_3[l_16_23] or 0) + l_16_24
        end
      end
    end
  end
  local l_16_25, l_16_34, l_16_35 = {}
  l_16_34 = l_0_0
  l_16_35 = l_16_3
  l_16_34 = l_16_34(l_16_35)
  for l_16_29,l_16_30 in l_16_34 do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

      l_0_2(l_16_25, {item_id = l_16_8, item_num = l_16_18})
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  l_0_3(l_16_25, function(l_1_0, l_1_1)
    local l_17_2 = l_0_7.get_item(l_1_0.item_id)
    local l_17_3 = l_0_7.get_item(l_1_1.item_id)
    if l_17_3.quality >= l_17_2.quality then
      return not l_17_2 or not l_17_3 or l_17_2.quality == l_17_3.quality
    end
    return l_1_0.item_id < l_1_1.item_id
   end)
   -- DECOMPILER ERROR: Confused about usage of registers!

  return l_16_25
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_36.get_left_time_str = function(l_17_0)
  local l_17_1 = l_17_0 - l_0_20.get_server_time()
  local l_17_2, l_17_3, l_17_4, l_17_5 = l_0_22.get_d_h_m_s(l_17_1)
  local l_17_6 = ""
  if l_17_2 > 0 then
    l_17_6 = l_0_4("%s%s%s%s", l_17_2, l_0_6.get_string("format_time_str_day"), l_17_3, l_0_6.get_string("format_time_str_hour"))
  elseif l_17_3 > 0 then
    l_17_6 = l_0_4("%s%s%s%s", l_17_3, l_0_6.get_string("format_time_str_hour"), l_17_4, l_0_6.get_string("format_time_str_minute"))
  else
    l_17_6 = l_0_4("%s%s%s%s", l_17_4, l_0_6.get_string("format_time_str_minute"), l_17_5, l_0_6.get_string("format_time_str_second"))
  end
  return l_17_6
end

l_0_36.get_is_lv_limit = function()
  return l_0_36.get_max_lv() <= l_0_37.level
end

l_0_36.get_is_exp_limit = function()
  return l_0_37.week_exp_limit <= l_0_37.week_exp
end

l_0_36.get_season_show = function()
  if l_0_37.season_id > 0 and l_0_37.season_id ~= l_0_24.get_player_data("battle_pass_season_show", "number") then
    return true
  end
  return false
end

l_0_36.set_season_show = function()
  if l_0_37.season_id > 0 then
    l_0_24.set_player_data("battle_pass_season_show", l_0_37.season_id)
    l_0_19.update_red_point("battle_pass_dress_up_red_point")
  end
end

l_0_36.preload_show_scene = function(l_22_0)
  if not l_22_0 then
    local l_22_1 = l_0_36.get_season_config()
    if l_22_1 then
      l_22_0 = l_22_1.anim_id
    end
  end
  if not l_22_0 or not l_0_15.get_config(l_22_0) then
    log_error("\230\137\190\228\184\141\229\136\176\233\133\141\231\189\174\239\188\140\232\175\183\230\163\128\230\159\165\230\149\176\230\141\174")
    return 
  end
  local l_22_2 = l_0_15.get_config(l_22_0)
  local l_22_3 = l_22_2.scene
  local l_22_4 = l_0_4("Scene/AnimationScene/%s/Prefabs/%s.ab", l_22_3, l_22_3)
  Game.module.preload.preload_res(l_22_4, "prefab", false, true)
end

l_0_36.get_max_exp = function()
  return l_0_9.battlepass_exp.val
end

l_0_36.get_lv_price = function()
  return l_0_9.battlepass_lv_price.val
end

l_0_36.get_lv_item = function()
  return l_0_17.money.diamond
end

l_0_36.get_pay_id = function()
  return l_0_9.battlepass_pay_id.val
end

l_0_36.get_warning_day = function()
  return l_0_9.battlepass_pay_time_warning.val
end

l_0_36.try_to_buy = function(l_28_0)
  if not l_0_36.is_open(true) then
    return 
  end
  if l_28_0 <= l_0_37.level then
    l_0_36.init_req_battle_pass()
    return 
  end
  local l_28_1 = l_0_36.get_lv_price()
  local l_28_2 = (l_28_0 - l_0_37.level) * l_28_1
  local l_28_3 = l_0_23.try_to_cost_item
  local l_28_4 = {}
  l_28_4.cid = l_0_36.get_lv_item()
  l_28_4.cost = l_28_2
  l_28_4.cb = function(l_1_0)
    if l_1_0 == 1 then
      l_0_38.req_battle_pass_buy_level_c2s(l_28_0)
    end
   end
  l_28_3(l_28_4)
end

l_0_36.try_to_advance = function()
  if not l_0_36.is_open(true) then
    return 
  end
  if l_0_36.get_is_buy() then
    l_0_36.init_req_battle_pass()
    return 
  end
  if l_0_20.get_server_time() < l_0_37.recharge_time then
    l_0_16.broadcast_tips(l_0_4("\230\147\141\228\189\156\229\164\170\232\191\135\233\162\145\231\185\129\239\188\140\232\175\183%s\231\167\146\229\144\142\229\134\141\232\175\149", math.ceil(l_0_37.recharge_time - l_0_20.get_server_time())))
    return 
  end
  local l_29_1 = function()
    l_0_34.recharge((l_0_36.get_pay_id()), nil, function()
      l_0_37.recharge_time = l_0_20.get_server_time() + l_0_39.recharge_cd
      end)
    l_0_21.close_view("BattlePassAdvanceView")
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   end
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    if math.ceil((l_0_37.end_time - l_0_20.get_server_time()) / 86400) <= l_0_36.get_warning_day() and l_0_37.level < l_0_36.get_max_lv() then
      l_0_25.confirm({content = l_0_4(l_0_6.get_string("lan_battlepass_buy_1"), math.ceil((l_0_37.end_time - l_0_20.get_server_time()) / 86400)), sure_click = function()
    l_29_0()
   end})
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- DECOMPILER ERROR: Confused about usage of registers!

  else
    l_29_1()
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
end

l_0_36.init_red_points = function()
  local l_30_0 = l_0_19.new_red_point
  local l_30_1 = {}
  local l_30_2 = {}
   -- DECOMPILER ERROR: No list found. Setlist fails

  l_30_0(l_30_1)
   -- DECOMPILER ERROR: Overwrote pending register.

   -- DECOMPILER ERROR: Overwrote pending register.

  l_30_2, l_30_0, l_30_1.point_cb_infos, l_30_2, l_30_1.tp, l_30_1.id, l_30_1.parent_ids = {"main_view_welfare_red"}, l_0_19, l_30_2, {}, 1, "welfare_battle_pass_red_point", l_30_2
  local l_30_3 = {}
  do
    l_30_3.cb = l_0_36.get_battle_pass_point_num
    l_30_2 = {l_30_3}
    l_30_1 = {parent_ids = l_30_2, id = "battle_pass_red_point", tp = 1, point_cb_infos = l_30_2}
    l_30_0(l_30_1)
    l_30_0 = l_0_19
    l_30_0 = l_30_0.new_red_point
    l_30_3 = "welfare_battle_pass_red_point"
    l_30_2 = {l_30_3}
    l_30_3 = {cb = l_0_36.get_battle_pass_task_point_num}
    l_30_2 = {l_30_3}
    l_30_1 = {parent_ids = l_30_2, id = "battle_pass_task_red_point", tp = 1, point_cb_infos = l_30_2}
    l_30_0(l_30_1)
    l_30_0 = l_0_19
    l_30_0 = l_30_0.new_red_point
    l_30_3 = "welfare_battle_pass_red_point"
    l_30_2 = {l_30_3}
    l_30_3 = {cb = function()
      if not l_0_36.is_open() then
        return 0
      end
      return l_0_36.get_season_show() and 1 or 0
      end}
    l_30_2 = {l_30_3}
    l_30_1 = {parent_ids = l_30_2, id = "battle_pass_dress_up_red_point", tp = 1, point_cb_infos = l_30_2}
    l_30_0(l_30_1)
    l_30_0 = l_0_19
    l_30_0 = l_30_0.new_red_point
    l_30_3 = "main_view_welfare_red"
    l_30_2 = {l_30_3}
    l_30_2 = {}
    l_30_1 = {parent_ids = l_30_2, id = "welfare_fund_red_point", tp = 1, point_cb_infos = l_30_2}
    l_30_0(l_30_1)
    l_30_0 = l_0_19
    l_30_0 = l_30_0.new_red_point
    l_30_3 = "welfare_fund_red_point"
    l_30_2 = {l_30_3}
    l_30_2 = l_0_39
    l_30_2 = l_30_2.common_red_point
    l_30_3 = l_0_39
    l_30_3 = l_30_3.common_type
    l_30_3 = l_30_3.weapon
    l_30_2 = l_30_2[l_30_3]
    l_30_3 = {cb = function()
      local l_32_0 = l_0_36.get_common_point_num
      local l_32_1 = l_0_39.common_type.weapon
      return l_32_0(l_32_1)
      end}
    l_30_2 = {l_30_3}
    l_30_1 = {parent_ids = l_30_2, id = l_30_2, tp = 1, point_cb_infos = l_30_2}
    l_30_0(l_30_1)
    l_30_0 = l_0_19
    l_30_0 = l_30_0.new_red_point
    l_30_3 = "welfare_fund_red_point"
    l_30_2 = {l_30_3}
    l_30_2 = l_0_39
    l_30_2 = l_30_2.common_red_point
    l_30_3 = l_0_39
    l_30_3 = l_30_3.common_type
    l_30_3 = l_30_3.equip
    l_30_2 = l_30_2[l_30_3]
    l_30_3 = {cb = function()
      local l_33_0 = l_0_36.get_common_point_num
      local l_33_1 = l_0_39.common_type.equip
      return l_33_0(l_33_1)
      end}
    l_30_2 = {l_30_3}
    l_30_1 = {parent_ids = l_30_2, id = l_30_2, tp = 1, point_cb_infos = l_30_2}
    l_30_0(l_30_1)
    l_30_0 = l_0_19
    l_30_0 = l_30_0.new_red_point
    l_30_3 = "welfare_fund_red_point"
    l_30_2 = {l_30_3}
    l_30_2 = l_0_39
    l_30_2 = l_30_2.common_red_point
    l_30_3 = l_0_39
    l_30_3 = l_30_3.common_type
    l_30_3 = l_30_3.level
    l_30_2 = l_30_2[l_30_3]
    l_30_3 = {cb = function()
      local l_34_0 = l_0_36.get_common_point_num
      local l_34_1 = l_0_39.common_type.level
      return l_34_0(l_34_1)
      end}
    l_30_2 = {l_30_3}
    l_30_1 = {parent_ids = l_30_2, id = l_30_2, tp = 1, point_cb_infos = l_30_2}
    l_30_0(l_30_1)
    l_30_0 = l_0_37
    l_30_1 = {}
    l_30_0.common_once_red_point = l_30_1
    l_30_0 = l_0_1
    l_30_1 = l_0_39
    l_30_1 = l_30_1.welfare_fund_type
    l_30_0 = l_30_0(l_30_1)
    for l_30_3,i_2 in l_30_0 do
      local l_30_5 = l_0_12.get_config(l_30_4)
      local l_30_6 = l_30_5.pay_id
      local l_30_7 = l_30_5.price
      if (not l_30_6 or l_30_6 <= 0) and l_30_7 and next(l_30_7) then
        local l_30_8 = l_0_39.common_red_point[l_30_4]
        local l_30_9 = l_0_4("%s_once", l_30_8)
        local l_30_10 = l_0_19.new_red_point
        local l_30_11 = {}
        local l_30_12 = {}
         -- DECOMPILER ERROR: No list found. Setlist fails

        local l_30_13 = {}
        l_30_13.cb, l_30_11.tp, l_30_11.id, l_30_11.parent_ids = function()
          local l_35_0 = l_0_36.get_common_once_point_num
          local l_35_1 = l_30_4
          return l_35_0(l_35_1)
            end, 1, l_30_9, l_30_12
        l_30_12 = {l_30_13}
        l_30_11.point_cb_infos = l_30_12
        l_30_10(l_30_11)
        l_30_10 = l_0_37
        l_30_10 = l_30_10.common_once_red_point
        l_30_10[l_30_4] = l_30_9
      end
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
end

l_0_36.clear_red_points = function()
  l_0_19.destroy_red_point("welfare_battle_pass_red_point", true)
  l_0_19.destroy_red_point("battle_pass_red_point", true)
  l_0_19.destroy_red_point("battle_pass_task_red_point", true)
  l_0_19.destroy_red_point("battle_pass_dress_up_red_point", true)
  l_0_19.destroy_red_point("welfare_fund_red_point", true)
  l_0_19.destroy_red_point(l_0_39.common_red_point[l_0_39.common_type.weapon], true)
  l_0_19.destroy_red_point(l_0_39.common_red_point[l_0_39.common_type.equip], true)
  l_0_19.destroy_red_point(l_0_39.common_red_point[l_0_39.common_type.level], true)
  for l_31_3,l_31_4 in l_0_0(l_0_37.common_once_red_point) do
    l_0_19.destroy_red_point(l_31_4, true)
  end
end

l_0_36.get_battle_pass_point_num = function()
  if not l_0_36.is_open() then
    return 0
  end
  if (l_0_37.normal_level >= l_0_37.level or l_0_36.get_is_buy()) and l_0_37.advance_level < l_0_37.level then
    return 0 + (l_0_37.level - l_0_37.normal_level) + (l_0_37.level - l_0_37.advance_level)
  end
end

l_0_36.get_battle_pass_task_point_num = function()
  if not l_0_36.is_open() then
    return 0
  end
  if l_0_36.get_battle_pass_task_point_num_by_type(1) > 0 then
    return 1
  end
  if l_0_36.get_battle_pass_task_point_num_by_type(2) > 0 then
    return 1
  end
  return 0
end

l_0_36.get_battle_pass_task_point_num_by_type = function(l_34_0)
  if not l_0_36.is_open() then
    return 0
  end
  if l_0_36.get_is_lv_limit() then
    return 0
  end
  if l_0_36.get_is_exp_limit() and l_34_0 == 1 then
    return 0
  end
  local l_34_1 = l_0_31.get_task_data_by_type(l_0_32.task_type.battle_pass)
  for l_34_5,l_34_6 in l_0_1(l_34_1) do
    local l_34_7 = l_34_6.task_id
    local l_34_8 = l_0_31.get_task_data_by_id(l_34_7)
    if l_34_8 and l_34_8.status == l_0_32.task_status.can_get then
      local l_34_9 = l_0_14.get_task_cfg(l_34_7)
      if l_34_9 and l_34_9.sub_task_tp == l_34_0 then
        return 1
      end
    end
  end
  return 0
end

l_0_36.setup_events = function()
  local l_35_0 = l_0_36
  do
    local l_35_1 = {}
     -- DECOMPILER ERROR: No list found. Setlist fails

     -- DECOMPILER ERROR: Overwrote pending register.

    if l_35_0 then
      return 
    end
     -- DECOMPILER ERROR: Overwrote pending register.

     -- DECOMPILER ERROR: Overwrote pending register.

     -- DECOMPILER ERROR: Overwrote pending register.

     -- DECOMPILER ERROR: Overwrote pending register.

     -- DECOMPILER ERROR: Overwrote pending register.

    l_35_0(l_35_1, l_0_29.update_all, false)
  end
   -- Warning: undefined locals caused missing assignments!
end

l_0_36.clear_events = function()
  if not l_0_36.has_setup then
    return 
  end
  l_0_36.has_setup = false
  l_0_18.remove_listeners(l_0_36.listen_events, l_0_36, false)
end

l_0_36.on_update_battle_pass_common_notify_buy = function(l_37_0)
  local l_37_1 = l_0_37.battle_pass_info
  local l_37_2 = l_37_0.type
  if not l_0_37.battle_pass_info[l_37_0.type] then
    l_37_1[l_37_2] = {}
  end
  l_37_1 = l_0_37
  l_37_1 = l_37_1.battle_pass_info
  l_37_2 = l_37_0.type
  l_37_1 = l_37_1[l_37_2]
  l_37_1.is_buy = true
  l_37_1 = l_0_18
  l_37_1 = l_37_1.brocast
  l_37_2 = l_0_40
  l_37_2 = l_37_2.common_info
  l_37_1(l_37_2, l_37_0.type)
  l_37_1 = l_0_36
  l_37_1 = l_37_1.update_common_red_points
  l_37_2 = l_37_0.type
  l_37_1(l_37_2)
  l_37_1 = l_0_36
  l_37_1 = l_37_1.update_common_once_red_points
  l_37_2 = l_37_0.type
  l_37_1(l_37_2)
  l_37_1 = l_0_16
  l_37_1 = l_37_1.broadcast_tips
  l_37_2 = "\232\191\155\233\152\182\230\136\144\229\138\159"
  l_37_1(l_37_2)
end

l_0_36.on_update_battle_pass_common_notify_exp_changed = function(l_38_0)
  l_0_37.init_common_info(l_38_0)
  l_0_18.brocast(l_0_40.common_info, l_38_0.type)
  l_0_36.update_common_red_points(l_38_0.type)
end

l_0_36.on_open_func_event_update_all = function()
  l_0_36.init_req_battle_pass()
  l_0_36.init_req_common_battle_pass()
end

l_0_36.on_open_func_event_update_item = function(l_40_0, l_40_1)
  if l_40_1 then
    if l_40_0 == l_0_28.type.battle_pass then
      l_0_36.init_req_battle_pass()
    end
    for l_40_5,l_40_6 in l_0_1(l_0_39.init_req_common_type) do
      local l_40_7 = l_0_12.get_config(l_40_6)
       -- DECOMPILER ERROR: Confused at declaration of local variable

      if not l_40_7 or l_40_0 == l_40_7.open_id then
        l_0_36.init_req_common_battle_pass()
    else
      end
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_36.on_task_update_task_info = function()
  l_0_19.update_red_point("battle_pass_task_red_point")
end

l_0_36.on_fake_money_changed = function()
  l_0_36.update_common_once_red_points()
end

l_0_36.register_jump = function()
  local l_43_0 = l_0_26.register_info
  local l_43_1 = "BattlePassMain"
  local l_43_2 = {}
  l_43_2.check_handler = function(l_1_0)
    local l_44_1 = l_0_36.is_open
    local l_44_2 = l_1_0.show_msg
    return l_44_1(l_44_2)
   end
  l_43_2.handler = function(l_2_0)
    local l_45_1 = Game.module.welfare
    local l_45_2 = l_0_21.open_view
    local l_45_3 = "WelfareMainView"
    local l_45_4 = {}
    l_45_4.view_type = l_45_1.const.view_type.battle_pass
    l_45_2(l_45_3, l_45_4)
   end
  l_43_0(l_43_1, l_43_2)
  l_43_0 = l_0_26
  l_43_0 = l_43_0.register_info
  l_43_1 = "BattlePassBuy"
  l_43_2 = {check_handler = function(l_3_0)
    if not l_0_36.is_open(l_3_0.show_msg) then
      return false
    end
    if l_0_36.get_max_lv() <= l_0_37.level then
      if l_3_0.show_msg then
        l_0_16.broadcast_tips(l_0_6.get_string("lan_battlepass_lv_max"))
      end
      return false
    end
    return true
   end, handler = function(l_4_0)
    l_0_21.open_view("BattlePassBuyView")
   end}
  l_43_0(l_43_1, l_43_2)
end

l_0_36.get_common_is_open = function(l_44_0, l_44_1)
  if l_0_37.battle_pass_info then
    local l_44_2 = l_0_37.battle_pass_info[l_44_0]
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  if not l_44_2 then
    return false
  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if (not l_0_12.get_config(l_44_0) or l_0_12.get_config(l_44_0).open_id) and l_0_12.get_config(l_44_0).open_id > 0 and not l_0_27.is_open(l_0_12.get_config(l_44_0).open_id) then
      return false
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if not l_44_2.reward_group_id or l_44_2.reward_group_id == 0 then
      return false
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if not l_44_1 and l_44_2.end_time and l_44_2.end_time > 0 and l_44_2.end_time < l_0_20.get_server_time() then
      return false
    end
    return true
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_36.get_common_is_buy = function(l_45_0)
  local l_45_1 = l_0_37.battle_pass_info[l_45_0]
  if not l_45_1 then
    return false
  end
  return l_45_1.is_buy == true
end

l_0_36.get_common_is_lock = function(l_46_0, l_46_1, l_46_2)
  local l_46_3 = l_0_37.battle_pass_info[l_46_0]
  if not l_46_3 then
    return false
  end
  if l_46_3.level < l_46_1 then
    return true
  end
  if l_46_2 and not l_0_36.get_common_is_buy(l_46_0) then
    return true
  end
  return false
end

l_0_36.get_common_is_got = function(l_47_0, l_47_1, l_47_2)
  local l_47_3 = l_0_37.battle_pass_info[l_47_0]
  if not l_47_3 then
    return false
  end
  if l_47_3.level < l_47_1 then
    return false
  end
  if l_47_2 and l_0_36.get_common_is_buy(l_47_0) and l_47_1 <= l_47_3.advance_level then
    return true
  end
  return false
end

l_0_36.get_common_can_get = function(l_48_0, l_48_1, l_48_2)
  local l_48_3 = l_0_37.battle_pass_info[l_48_0]
  if not l_48_3 then
    return false
  end
  if l_48_3.level < l_48_1 then
    return false
  end
  if l_48_2 and l_0_36.get_common_is_buy(l_48_0) and l_48_3.advance_level < l_48_1 then
    return true
  end
  return false
end

l_0_36.get_common_is_buy_notice = function(l_49_0, l_49_1, l_49_2)
  local l_49_3 = l_0_37.battle_pass_info[l_49_0]
  if not l_49_3 then
    return false
  end
  if l_49_1 <= l_49_3.level and l_49_2 and not l_0_36.get_common_is_buy(l_49_0) then
    return true
  end
  return false
end

l_0_36.get_common_point_num = function(l_50_0)
  if not l_0_36.get_common_is_open(l_50_0) then
    return 0
  end
  local l_50_1 = l_0_37.battle_pass_info[l_50_0]
  if not l_50_1 then
    return 0
  end
  if (l_0_36.is_single_advance(l_50_0) or not l_50_1.level or not l_50_1.normal_level or l_50_1.normal_level >= l_50_1.level or not l_0_36.is_single_normal(l_50_0)) and l_0_36.get_common_is_buy(l_50_0) and l_50_1.level and l_50_1.advance_level and l_50_1.advance_level < l_50_1.level then
    return 0 + (l_50_1.level - l_50_1.normal_level) + (l_50_1.level - l_50_1.advance_level)
  end
end

l_0_36.update_common_red_points = function(l_51_0)
  if l_0_39.common_red_point[l_51_0] then
    l_0_19.update_red_point(l_0_39.common_red_point[l_51_0])
  end
end

l_0_36.common_try_to_advance = function(l_52_0, l_52_1, l_52_2)
  if not l_0_36.get_common_is_open(l_52_0) then
    return 
  end
  if l_0_36.get_common_is_buy(l_52_0) then
    l_0_38.req_battle_pass_common_info_c2s(l_52_0)
    return 
  end
  local l_52_3 = l_0_12.get_config(l_52_0)
  local l_52_4 = l_52_3.pay_id
  local l_52_5 = l_52_3.price
  if l_52_4 and l_52_4 > 0 then
    if l_0_20.get_server_time() < l_0_37.recharge_time then
      l_0_16.broadcast_tips(l_0_4("\230\147\141\228\189\156\229\164\170\232\191\135\233\162\145\231\185\129\239\188\140\232\175\183%s\231\167\146\229\144\142\229\134\141\232\175\149", math.ceil(l_0_37.recharge_time - l_0_20.get_server_time())))
      return 
    end
    if l_52_1 and l_0_34.is_use_crystal(l_52_4) then
      local l_52_6 = l_0_8[l_52_4]
      local l_52_7 = l_0_36.get_common_name(l_52_0)
       -- DECOMPILER ERROR: Confused at declaration of local variable

      local l_52_9 = l_52_2 or ""
      local l_52_10 = l_0_25.confirm
      l_52_10({content = l_0_4("\230\152\175\229\144\166\230\182\136\232\128\151<oitem=%s>%s\232\167\163\233\148\129%s%s\229\165\150\229\138\177\239\188\159", l_0_17.money.crystal, l_52_6.gift_price, l_52_7, l_52_9), sure_click = function()
        l_0_34.recharge(l_52_4, true)
         end})
    else
      l_0_34.recharge(l_52_4, nil, function()
      l_0_37.recharge_time = l_0_20.get_server_time() + l_0_39.recharge_cd
      end)
    end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    elseif l_52_5 and #l_52_5 > 0 then
      l_0_23.try_to_cost_item({cid = l_52_5[1][1], cost = l_52_5[1][2], cb = function(l_3_0)
    if l_52_1 then
      if not l_52_2 then
        local l_55_1 = l_3_0 ~= 1 or ""
      end
       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused at declaration of local variable

      do
         -- DECOMPILER ERROR: Confused at declaration of local variable

         -- DECOMPILER ERROR: Confused about usage of registers!

        l_0_25.confirm({content = l_0_4("\230\152\175\229\144\166\230\182\136\232\128\151<oitem=%s>%s\232\167\163\233\148\129%s%s\229\165\150\229\138\177\239\188\159", l_52_5[1][1], l_52_5[1][2], l_0_36.get_common_name(l_52_0), l_55_1), sure_click = function()
        l_0_38.req_battle_pass_common_buy_c2s(l_52_0)
         end})
      end
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    else
      l_0_38.req_battle_pass_common_buy_c2s(l_52_0)
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
   end})
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
end

l_0_36.get_common_name = function(l_53_0)
  local l_53_1 = l_0_12.get_config(l_53_0)
  if l_53_1 and l_53_1.name then
    local l_53_2 = l_0_6.get_string
    local l_53_3 = l_53_1.name
    return l_53_2(l_53_3)
  end
  return ""
end

l_0_36.is_single_normal = function(l_54_0)
  local l_54_1 = l_0_12.get_config(l_54_0)
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    return not l_54_1 or not l_54_1.single_reward or l_54_1.single_reward == l_0_39.common_single_normal
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_36.is_single_advance = function(l_55_0)
  local l_55_1 = l_0_12.get_config(l_55_0)
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    return not l_55_1 or not l_55_1.single_reward or l_55_1.single_reward == l_0_39.common_single_advance
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_36.get_common_once_point_num = function(l_56_0)
  if l_0_36.get_common_once_red_value(l_56_0) > 0 then
    return 0
  end
  if not l_0_36.get_common_is_open(l_56_0) then
    return 0
  end
  local l_56_1 = l_0_37.battle_pass_info[l_56_0]
  if not l_56_1 then
    return 0
  end
  if l_0_36.get_common_is_buy(l_56_0) then
    return 0
  end
  local l_56_2 = l_0_12.get_config(l_56_0)
  local l_56_3 = l_56_2.price[1][1]
  if l_0_35.get_bag_item_count_by_cid(nil, l_56_3) < l_56_2.price[1][2] then
    return 0
  end
  return 1
end

l_0_36.update_common_once_red_points = function(l_57_0)
  if l_57_0 then
    local l_57_1 = l_0_37.common_once_red_point[l_57_0]
    if l_57_1 then
      l_0_19.update_red_point(l_57_1)
    else
      for l_57_5,l_57_6 in l_0_0(l_0_37.common_once_red_point) do
        l_0_19.update_red_point(l_57_6)
      end
    end
  end
end

l_0_36.set_common_once_red_points = function(l_58_0)
  if l_58_0 then
    local l_58_1 = l_0_37.common_once_red_point[l_58_0]
    if l_58_1 and l_0_36.get_common_once_point_num(l_58_0) > 0 then
      l_0_36.set_common_once_red_value(l_58_0)
      l_0_19.update_red_point(l_58_1)
    end
  end
end

l_0_36.get_common_once_red_value = function(l_59_0)
  if not l_0_37.click_common_type[l_59_0] then
    l_0_37.click_common_type[l_59_0] = l_0_24.get_player_data(l_0_4("battle_pass_common_once_red_%s", l_59_0), "number", 0)
  end
  return l_0_37.click_common_type[l_59_0] or 0
end

l_0_36.set_common_once_red_value = function(l_60_0)
  l_0_37.click_common_type[l_60_0] = 1
  l_0_24.set_player_data(l_0_4("battle_pass_common_once_red_%s", l_60_0), 1)
end

l_0_36.get_common_state = function(l_61_0, l_61_1)
  if not l_61_1 or l_61_1 == 0 then
    if l_0_36.get_common_point_num(l_61_0) > 0 then
      return 1
    end
    if l_0_37.battle_pass_info then
      local l_61_2, l_61_3, l_61_4, l_61_5 = l_0_37.battle_pass_info[l_61_0]
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if not l_61_2 or not l_61_2.reward_group_id or l_61_2.reward_group_id == 0 then
      return 0
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

    if l_0_36.get_common_is_got(l_61_0, l_0_13.get_config_by_reward_id(l_61_2.reward_group_id)[#l_0_13.get_config_by_reward_id(l_61_2.reward_group_id)].lv) then
      return 2
    else
      return 0
    end
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_0_36.get_common_is_got(l_61_0, l_61_1) then
    return 2
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  else
    if l_0_36.get_common_can_get(l_61_0, l_61_1) then
      return 1
    else
      return 0
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
  end
end


