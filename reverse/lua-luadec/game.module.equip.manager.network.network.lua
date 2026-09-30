-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua3_573410\game.module.equip.manager.network.network_1276696993033617756.bin 

local l_0_0 = require("game.utils.events")
local l_0_1 = require("game.network.network_utils")
local l_0_2 = import("..head")
local l_0_3 = l_0_2.network
local l_0_4 = l_0_2.data
local l_0_5 = l_0_2.const
local l_0_6 = l_0_2.event
local l_0_7 = require("game.ui.manager.red_pointnew.redpoint_helper")
local l_0_8 = Game.module.bag.data
local l_0_9 = DataConfigs.equip
local l_0_10 = DataConfigs.equip_stone
local l_0_11 = Game.module.common_view
local l_0_12 = (require("game.module.common_view.manager.confirm"))
local l_0_13 = nil
local l_0_14 = Game.module.common_view
local l_0_15 = require("game.other.player_prefs")
l_0_3.init = function()
  l_0_13 = Game.module.main_weapon_develop.data
  local l_1_0 = l_0_3
  local l_1_1 = {}
  l_1_1.role_equip_info_s2c = l_0_3.on_role_equip_info_s2c
  l_1_1.role_equip_remove_s2c = l_0_3.on_role_equip_remove_s2c
  l_1_1.role_equip_put_s2c = l_0_3.on_role_equip_put_s2c
  l_1_1.role_equip_strengthen_return_s2c = l_0_3.on_role_equip_strengthen_return_s2c
  l_1_1.role_equip_plan_s2c = l_0_3.on_role_equip_plan_s2c
  l_1_1.role_equip_wear_plan_s2c = l_0_3.on_role_equip_wear_plan_s2c
  l_1_1.role_equip_remove_plan_s2c = l_0_3.on_role_equip_remove_plan_s2c
  l_1_1.role_equip_strengthen_s2c = l_0_3.on_role_equip_strengthen_s2c
  l_1_1.role_equip_active_suit_s2c = l_0_3.on_role_equip_active_suit_s2c
  l_1_1.role_equip_update_plan_s2c = l_0_3.on_role_equip_update_plan_s2c
  l_1_1.role_equip_put_stone_s2c = l_0_3.on_role_equip_put_stone_s2c
  l_1_1.role_equip_upgrade_stone_s2c = l_0_3.on_role_equip_upgrade_stone_s2c
  l_1_1.role_equip_switch_stone_s2c = l_0_3.on_role_equip_switch_stone_s2c
  l_1_1.role_equip_inherit_s2c = l_0_3.on_role_equip_inherit_s2c
  l_1_1.role_equip_switch_s2c = l_0_3.on_role_equip_switch_s2c
  l_1_0.net_event_names = l_1_1
  l_1_0 = l_0_1
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_3
  l_1_1 = l_1_1.net_event_names
  l_1_0(l_1_1, "equip")
end

l_0_3.clear = function()
  l_0_1.unlisten_net_events(l_0_3.net_event_names)
end

l_0_3.role_equip_switch_c2s = function(l_3_0, l_3_1, l_3_2)
  local l_3_3 = l_0_13.is_weapon_unlock(l_3_1)
  l_0_4.set_value("try_equip_switch", true)
  if not l_3_3 then
    l_0_4.set_value("role_equip_switch_c2s", true)
  else
    l_0_4.set_value("role_equip_switch_c2s", false)
  end
  local l_3_4 = l_0_8.uid_to_item[l_3_0]
   -- DECOMPILER ERROR: Confused at declaration of local variable

  if l_3_4 then
    local l_3_6 = l_3_4.cfg_id
    local l_3_7 = l_0_4.set_value
    do
      local l_3_8 = "role_equip_switch_c2s_args"
      l_3_7(l_3_8, {item_id = l_3_0, item_cid = l_3_6, type = l_3_2})
      l_3_7 = l_0_1
      l_3_7 = l_3_7.send
      l_3_8 = "role_equip_switch_c2s"
      l_3_7(l_3_8, {item_id = l_3_0, target_id = l_3_1, type = l_3_2})
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

     -- Warning: missing end command somewhere! Added here
  end
end

l_0_3.role_equip_active_suit_c2s = function(l_4_0, l_4_1)
  local l_4_2 = l_0_1.send
  local l_4_3 = "role_equip_active_suit_c2s"
  local l_4_4 = {}
  l_4_4.type = l_4_0
  l_4_4.lv = l_4_1
  l_4_2(l_4_3, l_4_4)
end

l_0_3.role_equip_strengthen_c2s = function(l_5_0, l_5_1, l_5_2, l_5_3)
  l_0_4.set_value("send_role_equip_strengthen_c2s", true)
  l_0_4.get_value("not_refresh_equip_slot_red_point", true)
  local l_5_4 = {}
  l_5_4.item_id = l_5_0
  l_5_4.items = l_5_1
  l_5_4.is_use = l_5_2
  l_5_4.lv = l_5_3
  l_0_4.is_wait_strengthen_spine = true
  l_0_1.send("role_equip_strengthen_c2s", l_5_4)
end

l_0_3.role_equip_remove_plan_c2s = function(l_6_0, l_6_1)
  local l_6_2 = l_0_1.send
  local l_6_3 = "role_equip_remove_plan_c2s"
  local l_6_4 = {}
  l_6_4.id = l_6_0
  l_6_4.pos = l_6_1
  l_6_2(l_6_3, l_6_4)
end

l_0_3.role_equip_wear_plan_c2s = function(l_7_0, l_7_1)
  local l_7_2 = l_0_1.send
  local l_7_3 = "role_equip_wear_plan_c2s"
  local l_7_4 = {}
  l_7_4.id = l_7_0
  l_7_4.list = l_7_1
  l_7_2(l_7_3, l_7_4)
end

l_0_3.role_equip_plan_c2s = function(l_8_0)
  l_0_1.send("role_equip_plan_c2s", {})
end

l_0_3.role_equip_put_c2s = function(l_9_0)
  local l_9_1 = l_0_1.send
  local l_9_2 = "role_equip_put_c2s"
  local l_9_3 = {}
  l_9_3.item_id = l_9_0
  l_9_1(l_9_2, l_9_3)
end

l_0_3.role_equip_remove_c2s = function(l_10_0)
  local l_10_1 = l_0_1.send
  local l_10_2 = "role_equip_remove_c2s"
  local l_10_3 = {}
  l_10_3.item_id = l_10_0
  l_10_1(l_10_2, l_10_3)
end

l_0_3.role_equip_put_stone_c2s = function(l_11_0, l_11_1)
  local l_11_2 = {}
  l_11_2.pos = l_11_0
  l_11_2.stone_id = l_11_1
  l_0_1.send("role_equip_put_stone_c2s", l_11_2)
end

l_0_3.role_equip_upgrade_stone_c2s = function(l_12_0, l_12_1)
  local l_12_2 = {}
  l_12_2.pos = l_12_0
  l_12_2.items = l_12_1
  l_0_1.send("role_equip_upgrade_stone_c2s", l_12_2)
end

l_0_3.role_equip_switch_stone_c2s = function(l_13_0, l_13_1)
  local l_13_2 = {}
  l_13_2.pos = l_13_0
  l_13_2.stone_cid = l_13_1
  l_0_1.send("role_equip_switch_stone_c2s", l_13_2)
end

l_0_3.role_equip_inherit_c2s = function(l_14_0, l_14_1)
  if l_0_4.is_equipped(l_14_1) then
    return 
  end
  local l_14_2, l_14_3, l_14_4 = l_0_4.is_in_plan(l_14_1)
  if l_14_2 then
    local l_14_5 = l_0_12.confirm
    local l_14_6 = {}
    l_14_6.content = string.format("\232\175\165\232\163\133\229\164\135\229\156\168\227\128\144%s\227\128\145\230\150\185\230\161\136\228\184\173\229\183\178\229\186\148\231\148\168\239\188\140\230\152\175\229\144\166\231\161\174\232\174\164\232\191\155\232\161\140\231\187\167\230\137\191\239\188\159", l_14_4)
    l_14_6.sure_click = function()
      local l_15_0 = {}
      l_15_0.item_id = l_14_0
      l_15_0.inherit_item_id = l_14_1
      l_0_1.send("role_equip_inherit_c2s", l_15_0)
      end
    l_14_5(l_14_6)
    return 
  end
  local l_14_7 = {}
  l_14_7.item_id = l_14_0
  l_14_7.inherit_item_id = l_14_1
  l_0_1.send("role_equip_inherit_c2s", l_14_7)
end

l_0_3.role_equip_info_c2s = function()
  l_0_1.send("role_equip_info_c2s", {})
end

l_0_3.on_role_equip_info_s2c = function(l_16_0, l_16_1)
  l_0_13.return_num = l_16_1.return_num
  l_0_4.update_equip_strengthen_lv_dic(l_16_1)
  l_0_4.refresh_equip_enhance_limit()
  do
    local l_16_2 = l_0_4.get_wearing_equip_data()
    for l_16_6,l_16_7 in ipairs(l_16_2) do
      l_0_4.get_equip_rating(l_16_7.id, false, true)
    end
    l_0_4.update_equip_stone_list(l_16_1)
    local l_16_8, l_16_12 = l_0_4.set_value
    l_16_12 = "is_weapon_exchange_done"
    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

      l_16_8(l_16_12, not l_16_1.exchange_num or l_16_1.exchange_num > 0)
      l_16_8 = l_0_4
      l_16_8 = l_16_8.update_pos_build_count_list
      l_16_12 = l_16_1
      l_16_8(l_16_12)
      l_16_8 = l_0_4
      l_16_8 = l_16_8.update_equip_refine_get_count_list
      l_16_12 = l_16_1
      l_16_8(l_16_12)
      l_16_8 = l_0_4
      l_16_8 = l_16_8.update_equip_suit
      l_16_12 = l_16_1
      l_16_8(l_16_12)
      l_16_8 = l_0_4
      l_16_8 = l_16_8.update_highest_artifact_class
      l_16_12 = l_16_1
      l_16_8(l_16_12)
      l_16_8 = l_0_4
      l_16_8 = l_16_8.update_weapon_exchange_list
      l_16_12 = l_16_1
      l_16_8(l_16_12)
      l_16_8 = l_0_4
      l_16_8 = l_16_8.set_value
      l_16_12 = "reshape_num"
      l_16_8(l_16_12, l_16_1.reshape_num or 0)
      l_16_8 = l_0_4
      l_16_8 = l_16_8.set_value
      l_16_12 = "has_trigger_weapon_job_player_lv"
      l_16_8(l_16_12, l_0_15.get_player_data("has_trigger_weapon_job_player_lv", "number"))
      l_16_8 = l_0_7
      l_16_8 = l_16_8.update_red_point
      l_16_12 = l_0_5
      l_16_12 = l_16_12.equip_slot_red_point
      l_16_8(l_16_12)
      l_16_8 = l_0_7
      l_16_8 = l_16_8.update_red_point
      l_16_12 = l_0_5
      l_16_12 = l_16_12.equip_auto_equip_red_point
      l_16_8(l_16_12)
      l_16_8 = l_0_0
      l_16_8 = l_16_8.brocast
      l_16_12 = "artifact_highest_class_change"
      l_16_8(l_16_12)
      l_16_8 = l_0_0
      l_16_8 = l_16_8.brocast
      l_16_12 = "update_weapon_return_num"
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_16_8(l_16_12)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_3.on_role_equip_remove_s2c = function(l_17_0, l_17_1)
end

l_0_3.on_role_equip_put_s2c = function(l_18_0, l_18_1)
end

l_0_3.on_role_equip_strengthen_return_s2c = function(l_19_0, l_19_1)
  if l_19_0 ~= 0 then
    return 
  end
  l_0_4.set_value("strength_return_msg", l_19_1)
end

l_0_3.on_role_equip_plan_s2c = function(l_20_0, l_20_1)
  l_0_4.init_equip_plan(l_20_1)
  l_0_2.refresh_all_equip_slot_red_point()
  l_0_0.brocast(l_0_6.update_equip_plan)
end

l_0_3.on_role_equip_wear_plan_s2c = function(l_21_0, l_21_1)
  l_0_4.update_equip_plan_wear(l_21_1)
  l_0_0.brocast(l_0_6.update_equip_plan)
  local l_21_2 = l_0_4.get_value("replace_equip_id")
  l_0_4.set_value("replace_equip_id", nil)
  local l_21_3 = Game.module.cloud_data
   -- DECOMPILER ERROR: Confused at declaration of local variable

  if l_21_2 and l_21_3.try_get_player_val_from_server("is_equip_auto_resolve") == "true" then
    if not l_0_8.uid_to_item[l_21_2] then
      return 
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    if l_0_2.is_best_sub_attr_equip(l_0_8.uid_to_item[l_21_2]) then
      return 
    end
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

    if l_0_4.is_in_plan(l_0_8.uid_to_item[l_21_2].id) then
      if l_0_4.is_equipped(l_0_8.uid_to_item[l_21_2].id) then
        Game.module.bag.network.package_resolve_c2s({{id = l_21_2, number = 1}})
      else
        BroadcastTips.broadcast_tips("\232\175\165\232\163\133\229\164\135\228\187\141\232\162\171\229\133\182\228\187\150\232\163\133\229\164\135\230\150\185\230\161\136\228\189\191\231\148\168\239\188\140\229\166\130\233\156\128\229\136\134\232\167\163\232\175\183\230\137\139\229\138\168\229\164\132\231\144\134")
      end
    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

      elseif not l_0_8.uid_to_item[l_21_2].is_lock == 0 then
        l_0_12.confirm({content = "\232\175\165\232\163\133\229\164\135\233\148\129\229\174\154\228\184\173\239\188\140\230\152\175\229\144\166\232\167\163\233\148\129\229\185\182\229\136\134\232\167\163?", sure_click = function()
      l_21_6.package_lock_c2s(l_21_5.id, 0)
      local l_22_0 = l_21_6.package_resolve_c2s
      local l_22_1 = {}
      local l_22_2 = {}
      l_22_2.id = l_21_2
      l_22_2.number = 1
       -- DECOMPILER ERROR: No list found. Setlist fails

      l_22_0(l_22_1)
      end})
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    else
      Game.module.bag.network.package_resolve_c2s({{id = l_21_2, number = 1}})
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Overwrote pending register.

     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused at declaration of local variable

    if l_0_4.get_value("new_replace_equip_id") then
      if l_0_8.uid_to_item[l_0_4.get_value("new_replace_equip_id")] then
        l_0_7.update_red_point(string.format("equip_slot_%s_red_point", l_0_9.get_equip_cfg(l_0_9.get_equip_cfg(l_0_8.uid_to_item[l_21_2].cfg_id)).part))
         -- DECOMPILER ERROR: Confused about usage of registers for local variables.

      end
      l_0_4.set_value("new_replace_equip_id", nil)
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_3.on_role_equip_remove_plan_s2c = function(l_22_0, l_22_1)
  l_0_4.update_equip_plan_remove(l_22_1)
  l_0_0.brocast(l_0_6.update_equip_plan)
end

l_0_3.on_role_equip_strengthen_s2c = function(l_23_0, l_23_1)
  local l_23_2 = l_23_1.item_id
  local l_23_3 = l_23_1.result
  local l_23_4 = l_23_1.info
  l_0_4.return_num = l_23_1.return_num or 0
  local l_23_5 = l_0_8.uid_to_item[l_23_2]
  local l_23_6 = l_0_9.get_equip_cfg(l_23_5.cfg_id)
  local l_23_7 = l_0_4.equip_strengthen_lv_dic
  local l_23_8 = l_23_6.part
  if not l_0_4.equip_strengthen_lv_dic[l_23_6.part] then
    l_23_7[l_23_8] = {}
  end
  l_23_7 = l_0_4
  l_23_7 = l_23_7.equip_strengthen_lv_dic
  l_23_8 = l_23_6.part
  l_23_7 = l_23_7[l_23_8]
  if l_23_4 then
    l_23_8 = l_23_7.lv
    if not l_23_8 then
      l_23_8 = 0
    end
    l_23_7.lv = l_23_8
    l_23_8 = l_23_7.level_list
    if not l_23_8 then
      l_23_8 = {}
    end
    l_23_7.level_list = l_23_8
    l_23_8 = l_23_4.lv
    local l_23_9 = l_23_4.grade
    local l_23_10 = l_23_4.luck
    if l_23_3 == 1 then
      l_23_7.lv = math.max(l_23_7.lv, l_23_8)
    end
    local l_23_11 = l_23_7.level_list
    local l_23_12 = {}
    l_23_12.grade = l_23_9
    l_23_12.luck = l_23_10
    l_23_11[l_23_8] = l_23_12
  end
  l_23_8 = l_0_8
  l_23_8 = l_23_8.uid_to_item
  l_23_8 = l_23_8[l_23_2]
  l_0_4.get_equip_strength_rating(l_23_6.part, false, true)
  l_0_7.update_red_point("equip_strengthen_master_upgrade")
  l_0_0.brocast(l_0_6.role_equip_strengthen, l_23_2, l_23_3)
end

l_0_3.on_role_equip_active_suit_s2c = function(l_24_0, l_24_1)
  if l_24_1.type and l_24_1.lv then
    local l_24_2 = l_0_4.equip_suit_dic
    local l_24_3 = l_24_1.type
    l_24_2[l_24_3] = l_24_1.lv
  end
  l_0_7.update_red_point("equip_strengthen_master_upgrade")
  l_0_0.brocast("role_equip_active_suit")
end

l_0_3.on_role_equip_update_plan_s2c = function(l_25_0, l_25_1)
  l_0_4.update_equip_plan(l_25_1)
end

l_0_3.on_role_equip_put_stone_s2c = function(l_26_0, l_26_1)
  l_0_2.refresh_equip_stone_info_put(l_26_1.equip_pos, l_26_1.stone_cid)
  l_0_4.update_stone(l_26_1.equip_pos, l_26_1.stone_cid)
  l_0_0.brocast("equip_stone_refresh", l_26_1.equip_pos)
end

l_0_3.on_role_equip_upgrade_stone_s2c = function(l_27_0, l_27_1)
  local l_27_2 = l_0_4.equip_stone_cid_lv_dic[l_27_1.pos]
  local l_27_3 = l_27_2.stone_cid
  local l_27_4 = l_27_2.exp
  l_0_4.update_stone(l_27_1.pos, l_27_1.stone_cid, l_27_1.stone_lv, l_27_1.stone_exp)
  l_27_2 = l_0_4.equip_stone_cid_lv_dic[l_27_1.pos]
  do
    local l_27_5 = nil
    if l_27_3 ~= l_27_2.stone_cid then
      local l_27_6 = l_0_10.get_config(l_27_3)
      repeat
        repeat
          if l_27_6.next_id ~= l_27_2.stone_cid then
            local l_27_7 = 0 + l_27_6.exp_cost
            do
              local l_27_8 = 0 + 1
              l_27_6 = l_0_10.get_config(l_27_6.next_id)
            until l_27_8 > 300
            error("white times more than 300!!!")
            do return end
        end
         -- DECOMPILER ERROR: Confused about usage of registers!

        else
          local l_27_9 = l_27_7 + l_27_6.exp_cost
           -- DECOMPILER ERROR: Confused at declaration of local variable

        end
      elseif l_27_2.stone_lv > 0 then
        local l_27_10 = l_27_5
        local l_27_11 = l_0_10.get_config(l_27_3)
        local l_27_12 = l_27_2.stone_lv
         -- DECOMPILER ERROR: Overwrote pending register.

        repeat
          repeat
            if l_27_12 > 0 then
              if not l_27_11.next_id then
                do return end
              end
              do
                local l_27_14, l_27_15 = 0, l_0_10.get_config(l_27_3) + l_27_11.exp_cost
                 -- DECOMPILER ERROR: Attempted to generate an assignment, but got confused about usage of registers

                 -- DECOMPILER ERROR: Attempted to generate an assignment, but got confused about usage of registers

                 -- DECOMPILER ERROR: Attempted to generate an assignment, but got confused about usage of registers

                 -- DECOMPILER ERROR: Attempted to generate an assignment, but got confused about usage of registers

              until l_27_14 > 300
               -- DECOMPILER ERROR: Attempted to generate an assignment, but got confused about usage of registers

              error("white times more than 300!!!")
               -- DECOMPILER ERROR: Attempted to generate an assignment, but got confused about usage of registers

              do return end
               -- DECOMPILER ERROR: Attempted to generate an assignment, but got confused about usage of registers

          end
           -- DECOMPILER ERROR: Attempted to generate an assignment, but got confused about usage of registers

           -- DECOMPILER ERROR: Confused about usage of registers!

          else
            l_27_10, l_27_14, l_27_12, l_27_11, l_27_5 = l_27_15 - l_27_4 + l_27_1.stone_exp, l_27_14 + 1, l_27_12 - 1, l_0_10.get_config(l_27_11.next_id), l_27_9 - l_27_4 + l_27_1.stone_exp
          end
        else
          BroadcastTips.broadcast_tips(string.format("\229\174\157\231\159\179\232\142\183\229\190\151%d\231\187\143\233\170\140", l_27_1.stone_exp - l_27_4))
          l_0_0.brocast("equip_stone_refresh", l_27_1.pos)
        end
         -- DECOMPILER ERROR: Confused about usage of registers for local variables.

         -- Warning: missing end command somewhere! Added here
      end
       -- Warning: missing end command somewhere! Added here
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_3.on_role_equip_switch_stone_s2c = function(l_28_0, l_28_1)
  l_0_4.update_stone(l_28_1.pos, l_28_1.stone_cid)
  l_0_0.brocast("equip_stone_refresh", l_28_1.pos)
end

l_0_3.on_role_gameplay_set_s2c = function(l_29_0, l_29_1)
  l_0_4.update_gameplay_plan_dic(l_29_1)
end

l_0_3.on_role_equip_inherit_s2c = function(l_30_0, l_30_1)
  l_0_4.update_best_attr_equip()
  l_0_0.brocast("role_equip_inherit_success")
end

l_0_3.on_role_equip_switch_s2c = function(l_31_0, l_31_1)
  if l_31_0 ~= 0 then
    return 
  end
  local l_31_2 = l_0_4.get_value("role_equip_switch_c2s_args")
  if l_31_2 and (l_31_2.type == 3 or l_31_2.type == 4) then
    local l_31_3 = {}
    l_31_3.items = {}
    local l_31_4 = table.insert
    local l_31_5 = l_31_3.items
    local l_31_6 = {}
    l_31_6.item_id = l_31_2.item_id
    l_31_6.item_cid = l_31_2.item_cid
    l_31_6.number = 1
    l_31_4(l_31_5, l_31_6)
    l_31_4 = l_0_14
    l_31_4 = l_31_4.show_reward_display
    l_31_5 = l_31_3
    l_31_4(l_31_5)
  else
    BroadcastTips.broadcast_tips("\232\189\172\230\141\162\230\136\144\229\138\159")
  end
end

l_0_3.clear_timer = function()
  if l_0_3.timer then
    Game.timer:clear_timer(l_0_3.timer)
    l_0_3.timer = nil
  end
end

return l_0_3

