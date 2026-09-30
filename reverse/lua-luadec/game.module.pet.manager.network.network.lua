-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua2_573512\game.module.pet.manager.network.network_7403608515343570065.bin 

local l_0_0 = assert
local l_0_1 = ipairs
local l_0_2 = string.format
local l_0_3 = require("game.network.network_utils")
local l_0_4 = BroadcastTips
local l_0_5 = require("game.utils.events")
local l_0_6 = Game.ui_manager
local l_0_7 = Game.ui_const
local l_0_8 = DataConfigs
local l_0_9 = DataConfigs.pet_evo
local l_0_10 = l_0_8.pet
local l_0_11 = l_0_0(l_0_8.language_define)
local l_0_12 = Game.redpoint_helper
local l_0_13 = Game.module.common_view
local l_0_14 = l_0_0(l_0_13.const)
local l_0_15 = import("..head")
local l_0_16 = l_0_0(l_0_15.network)
local l_0_17 = l_0_0(l_0_15.data)
local l_0_18 = l_0_0(l_0_15.const)
l_0_16.init = function()
  local l_1_0 = l_0_16
  local l_1_1 = {}
  l_1_1.pet_add_s2c = l_0_16.on_add_s2c
  l_1_1.pet_update_s2c = l_0_16.on_update_s2c
  l_1_1.pet_update_attrs_s2c = l_0_16.on_pet_update_attrs_s2c
  l_1_1.pet_del_s2c = l_0_16.on_del_s2c
  l_1_1.pet_info_s2c = l_0_16.on_pet_info_s2c
  l_1_1.pet_change_state_s2c = l_0_16.on_change_state_s2c
  l_1_1.pet_rename_s2c = l_0_16.on_rename_s2c
  l_1_1.pet_up_level_s2c = l_0_16.on_up_level_s2c
  l_1_1.pet_break_through_s2c = l_0_16.on_break_through_s2c
  l_1_1.pet_resolve_s2c = l_0_16.on_resolve_s2c
  l_1_1.pet_change_new_state_s2c = l_0_16.on_pet_change_new_state_s2c
  l_1_1.pet_roll_s2c = l_0_16.on_pet_roll_s2c
  l_1_1.pet_skill_learn_s2c = l_0_16.on_pet_skill_learn_s2c
  l_1_1.pet_confirm_skill_learn_s2c = l_0_16.on_pet_confirm_skill_learn_s2c
  l_1_1.pet_inherit_s2c = l_0_16.on_pet_inherit_s2c
  l_1_1.pet_reset_s2c = l_0_16.on_pet_reset_s2c
  l_1_1.pet_add_point_s2c = l_0_16.on_pet_add_point_s2c
  l_1_1.pet_unlock_point_plan_s2c = l_0_16.on_pet_unlock_point_plan_s2c
  l_1_1.pet_set_point_plan_s2c = l_0_16.on_pet_set_point_plan_s2c
  l_1_1.pet_change_point_plan_s2c = l_0_16.on_pet_change_point_plan_s2c
  l_1_1.pet_reset_point_plan_s2c = l_0_16.on_pet_reset_point_plan_s2c
  l_1_1.pet_change_point_plan_name_s2c = l_0_16.on_pet_change_point_plan_name_s2c
  l_1_1.pet_use_inner_pill_s2c = l_0_16.on_pet_use_inner_pill_s2c
  l_1_1.pet_use_candy_pill_s2c = l_0_16.on_pet_use_candy_pill_s2c
  l_1_1.pet_update_flash_list_s2c = l_0_16.on_pet_update_flash_list_s2c
  l_1_1.pet_get_info_s2c = l_0_16.on_pet_get_info_s2c
  l_1_1.pet_skill_slot_unlock_s2c = l_0_16.on_pet_skill_slot_unlock_s2c
  l_1_1.pet_add_notice_s2c = l_0_16.on_pet_add_notice_s2c
  l_1_1.pet_flash_new_s2c = l_0_16.on_pet_flash_new_s2c
  l_1_1.pet_skill_synthesis_s2c = l_0_16.on_pet_skill_synthesis_s2c
  l_1_1.pet_balance_info_s2c = l_0_16.on_pet_balance_info_s2c
  l_1_1.pet_up_insight_teacher_lv_s2c = l_0_16.on_pet_up_insight_teacher_lv_s2c
  l_1_1.pet_reset_talent_pill_s2c = l_0_16.on_pet_reset_talent_pill_s2c
  l_1_0.net_events = l_1_1
  l_1_0 = l_0_3
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_16
  l_1_1 = l_1_1.net_events
  l_1_0(l_1_1, "pet")
  l_1_0 = l_0_16
  l_1_0.net_equip_events, l_1_1 = l_1_1, {pet_equip_roll_s2c = l_0_16.on_pet_equip_roll_s2c, pet_equip_confirm_roll_s2c = l_0_16.on_pet_equip_confirm_roll_s2c, pet_equip_extra_roll_s2c = l_0_16.on_pet_equip_extra_roll_s2c, pet_equip_confirm_extra_roll_s2c = l_0_16.on_pet_equip_confirm_extra_roll_s2c, pet_equip_amulet_roll_s2c = l_0_16.on_pet_equip_amulet_roll_s2c, pet_equip_confirm_amulet_roll_s2c = l_0_16.on_pet_equip_confirm_amulet_roll_s2c, pet_equip_amulet_skill_roll_s2c = l_0_16.on_pet_equip_amulet_skill_roll_s2c, pet_equip_confirm_amulet_skill_roll_s2c = l_0_16.on_pet_equip_confirm_amulet_skill_roll_s2c, pet_equip_amulet_bind_s2c = l_0_16.on_pet_equip_amulet_bind_s2c, pet_equip_synthesis_s2c = l_0_16.on_pet_equip_synthesis_s2c, pet_equip_put_on_s2c = l_0_16.on_pet_equip_put_on_s2c, pet_equip_take_off_s2c = l_0_16.on_pet_equip_take_off_s2c, pet_equip_rand_suit_s2c = l_0_16.on_pet_equip_rand_suit_s2c, pet_equip_confirm_rand_suit_s2c = l_0_16.on_pet_equip_confirm_rand_suit_s2c, pet_flash_plan_list_s2c = l_0_16.on_pet_flash_plan_list_s2c, pet_flash_cnt_s2c = l_0_16.on_pet_flash_cnt_s2c}
  l_1_0 = l_0_3
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_16
  l_1_1 = l_1_1.net_equip_events
  l_1_0(l_1_1, "pet_equip")
end

l_0_16.clear = function()
  l_0_3.unlisten_net_events(l_0_16.net_events)
  l_0_16.net_events = nil
  l_0_3.unlisten_net_events(l_0_16.net_equip_events)
  l_0_16.net_equip_events = nil
end

l_0_16.info_c2s = function()
  l_0_3.send("pet_info_c2s", {})
end

l_0_16.pet_get_info_c2s = function(l_4_0)
  local l_4_1 = l_0_3.send
  local l_4_2 = "pet_get_info_c2s"
  local l_4_3 = {}
  l_4_3.pet_id = l_4_0
  l_4_1(l_4_2, l_4_3)
end

l_0_16.change_state_c2s = function(l_5_0, l_5_1)
  local l_5_2 = {}
  l_5_2.pet_id = l_0_0(l_5_0)
  l_5_2.index = l_0_0(l_5_1)
  l_0_3.send("pet_change_state_c2s", l_5_2)
end

l_0_16.pet_change_new_state_c2s = function(l_6_0)
  local l_6_1 = {}
  l_6_1.pet_id_list = l_0_0(l_6_0)
  l_0_3.send("pet_change_new_state_c2s", l_6_1)
end

l_0_16.rename_c2s = function(l_7_0, l_7_1)
  local l_7_2 = {}
  l_7_2.pet_id = l_0_0(l_7_0)
  l_7_2.nickname = l_0_0(l_7_1)
  l_0_3.send("pet_rename_c2s", l_7_2)
end

l_0_16.up_level_c2s = function(l_8_0)
  local l_8_1 = {}
  l_8_1.pet_id = l_0_0(l_8_0)
  l_0_3.send("pet_up_level_c2s", l_8_1)
end

l_0_16.break_through_c2s = function(l_9_0)
  local l_9_1 = {}
  l_9_1.pet_id = l_0_0(l_9_0)
  l_0_3.send("pet_break_through_c2s", l_9_1)
end

l_0_16.resolve_c2s = function(l_10_0)
  local l_10_1 = {}
  l_10_1.list = l_0_0(l_10_0)
  l_0_3.send("pet_resolve_c2s", l_10_1)
end

l_0_16.pet_roll_c2s = function(l_11_0)
  local l_11_1 = {}
  l_11_1.pet_id = l_11_0
  l_0_3.send("pet_roll_c2s", l_11_1)
end

l_0_16.pet_confirm_roll_c2s = function(l_12_0, l_12_1)
  local l_12_2 = {}
  l_12_2.pet_id = l_12_0
  l_12_2.is_cancel = l_12_1
  l_0_3.send("pet_confirm_roll_c2s", l_12_2)
end

l_0_16.pet_skill_learn_c2s = function(l_13_0, l_13_1)
  local l_13_2 = 0
  local l_13_3 = l_0_17.pet_info[l_13_0]
  if l_13_3 then
    local l_13_4 = l_0_10.get_pet_passivity_skill_num(l_13_3.c_id)
    local l_13_5 = false
    for l_13_9,l_13_10 in l_0_1(l_13_3.passivity_skill_list) do
      if l_13_10.v == 0 and l_0_17.is_pet_skill_pos_unlock(l_13_3, l_13_9) then
        l_13_5 = true
    else
      end
    end
    local l_13_11 = l_0_17.get_real_passivity_skill_list(l_13_3.passivity_skill_list)
    local l_13_12 = #l_13_11
    do
      local l_13_13 = false
      if l_13_4 < #l_13_3.passivity_skill_list then
        for l_13_17 = l_13_4 + 1, #l_13_3.passivity_skill_list do
          if l_13_3.passivity_skill_list[l_13_17].v == 0 then
            l_13_13 = true
        else
          end
        end
      end
    end
    if l_13_5 then
      l_13_2 = 1
    end
  end
  local l_13_18 = {}
  l_13_18.pet_id = l_13_0
  l_13_18.skill_id = l_13_1
  l_13_18.flag = l_13_2
  l_0_3.send("pet_skill_learn_c2s", l_13_18)
end

l_0_16.pet_confirm_skill_learn_c2s = function(l_14_0, l_14_1)
  local l_14_2 = {}
  l_14_2.pet_id = l_14_0
  l_14_2.op = l_14_1
  l_0_3.send("pet_confirm_skill_learn_c2s", l_14_2)
end

l_0_16.pet_use_talent_pill_c2s = function(l_15_0, l_15_1)
  local l_15_2 = {}
  l_15_2.pet_id = l_15_0
  l_15_2.item_cid = l_15_1
  l_0_3.send("pet_use_talent_pill_c2s", l_15_2)
end

l_0_16.pet_reset_talent_pill_c2s = function(l_16_0)
  local l_16_1 = {}
  l_16_1.pet_id = l_16_0
  l_0_3.send("pet_reset_talent_pill_c2s", l_16_1)
end

l_0_16.pet_inherit_c2s = function(l_17_0, l_17_1)
  local l_17_2 = {}
  l_17_2.parent_pet_id = l_17_0
  l_17_2.child_pet_id = l_17_1
  l_0_3.send("pet_inherit_c2s", l_17_2)
end

l_0_16.pet_reset_c2s = function(l_18_0)
  local l_18_1 = {}
  l_18_1.pet_id = l_18_0
  l_0_3.send("pet_reset_c2s", l_18_1)
end

l_0_16.pet_add_point_c2s = function(l_19_0, l_19_1)
  local l_19_2 = {}
  l_19_2.pet_id = l_19_0
  l_19_2.list = l_19_1
  l_0_3.send("pet_add_point_c2s", l_19_2)
end

l_0_16.pet_unlock_point_plan_c2s = function(l_20_0, l_20_1)
  local l_20_2 = {}
  l_20_2.pet_id = l_20_0
  l_20_2.plan_id = l_20_1
  l_0_3.send("pet_unlock_point_plan_c2s", l_20_2)
end

l_0_16.pet_set_point_plan_c2s = function(l_21_0, l_21_1)
  local l_21_2 = {}
  l_21_2.pet_id = l_21_0
  l_21_2.list = l_21_1
  l_0_3.send("pet_set_point_plan_c2s", l_21_2)
end

l_0_16.pet_change_point_plan_c2s = function(l_22_0, l_22_1)
  local l_22_2 = {}
  l_22_2.pet_id = l_22_0
  l_22_2.plan_id = l_22_1
  l_0_3.send("pet_change_point_plan_c2s", l_22_2)
end

l_0_16.pet_reset_point_plan_c2s = function(l_23_0)
  local l_23_1 = {}
  l_23_1.pet_id = l_23_0
  l_0_3.send("pet_reset_point_plan_c2s", l_23_1)
end

l_0_16.pet_change_point_plan_name_c2s = function(l_24_0, l_24_1, l_24_2)
  local l_24_3 = {}
  l_24_3.pet_id = l_24_0
  l_24_3.plan_id = l_24_1
  l_24_3.name = l_24_2
  l_0_3.send("pet_change_point_plan_name_c2s", l_24_3)
end

l_0_16.pet_use_inner_pill_c2s = function(l_25_0, l_25_1)
  local l_25_2 = {}
  l_25_2.pet_id = l_25_0
  l_25_2.item_cid = l_25_1
  l_0_3.send("pet_use_inner_pill_c2s", l_25_2)
end

l_0_16.pet_use_candy_pill_c2s = function(l_26_0, l_26_1)
  local l_26_2 = {}
  l_26_2.pet_id = l_26_0
  l_26_2.item_cid = l_26_1
  l_0_3.send("pet_use_candy_pill_c2s", l_26_2)
end

l_0_16.pet_update_flash_list_c2s = function()
  local l_27_0 = l_0_17.get_can_flash_list()
  local l_27_1 = l_0_3.send
  local l_27_2 = "pet_update_flash_list_c2s"
  local l_27_3 = {}
  l_27_3.flash_list = l_27_0
  l_27_1(l_27_2, l_27_3)
end

l_0_16.pet_equip_rand_suit_c2s = function(l_28_0)
  local l_28_1 = l_0_3.send
  local l_28_2 = "pet_equip_rand_suit_c2s"
  local l_28_3 = {}
  l_28_3.equip_id = l_28_0
  l_28_1(l_28_2, l_28_3)
end

l_0_16.pet_equip_confirm_rand_suit_c2s = function(l_29_0)
  local l_29_1 = l_0_3.send
  local l_29_2 = "pet_equip_confirm_rand_suit_c2s"
  local l_29_3 = {}
  l_29_3.equip_id = l_29_0
  l_29_1(l_29_2, l_29_3)
end

l_0_16.pet_skill_slot_unlock_c2s = function(l_30_0, l_30_1)
  local l_30_2 = l_0_3.send
  local l_30_3 = "pet_skill_slot_unlock_c2s"
  local l_30_4 = {}
  l_30_4.pet_id = l_30_0
  l_30_4.unlock_index = l_30_1
  l_30_2(l_30_3, l_30_4)
end

l_0_16.pet_flash_plan_list_c2s = function()
  l_0_3.send("pet_flash_plan_list_c2s", {})
end

l_0_16.pet_flash_new_c2s = function(l_32_0)
  local l_32_1 = l_0_3.send
  local l_32_2 = "pet_flash_new_c2s"
  local l_32_3 = {}
  l_32_3.pet_id = l_32_0
  l_32_1(l_32_2, l_32_3)
end

l_0_16.pet_skill_synthesis_c2s = function(l_33_0)
  local l_33_1 = l_0_3.send
  local l_33_2 = "pet_skill_synthesis_c2s"
  local l_33_3 = {}
  l_33_3.item_id_list = l_33_0
  l_33_1(l_33_2, l_33_3)
end

l_0_16.pet_balance_info_c2s = function(l_34_0)
  local l_34_1 = l_0_3.send
  local l_34_2 = "pet_balance_info_c2s"
  local l_34_3 = {}
  l_34_3.pet_id = l_34_0
  l_34_1(l_34_2, l_34_3)
end

l_0_16.pet_flash_cnt_c2s = function()
  l_0_3.send("pet_flash_cnt_c2s", {})
end

l_0_16.pet_up_insight_teacher_lv_c2s = function()
  l_0_3.send("pet_up_insight_teacher_lv_c2s", {})
end

l_0_16.on_add_s2c = function(l_37_0, l_37_1)
  if l_37_0 ~= 0 then
    return 
  end
  if l_37_1.pet_info then
    local l_37_2 = l_0_17.update_pet_info(l_37_1.pet_info)
    local l_37_3 = Game.module.godpet
    l_37_3.on_create_success(l_37_1.pet_info)
    l_0_5.brocast(l_0_18.event.update_pet_info, l_37_2, l_0_18.pet_data_type.normal)
    l_0_17.update_up_insight_teacher_lv_progress()
    l_0_12.update_red_point(l_0_18.red_point.pet_chuzhan_btn_red_point)
    l_0_12.update_red_point(l_0_18.red_point.pet_resolve_btn_red_point)
  end
end

l_0_16.on_update_s2c = function(l_38_0, l_38_1)
  if l_38_0 ~= 0 then
    return 
  end
  if l_38_1.pet_info then
    local l_38_2 = l_0_17.update_pet_info(l_38_1.pet_info)
    l_0_5.brocast(l_0_18.event.update_pet_info, l_38_2, l_0_18.pet_data_type.normal)
    l_0_17.update_up_insight_teacher_lv_progress()
  end
end

l_0_16.on_del_s2c = function(l_39_0, l_39_1)
  if l_39_0 ~= 0 then
    return 
  end
  if l_39_1.list then
    for l_39_5,l_39_6 in l_0_1(l_39_1.list) do
      l_0_17.pet_info[l_39_6] = nil
    end
  end
  l_0_5.brocast(l_0_18.event.delete_pet_info, l_39_1.list)
end

l_0_16.on_pet_update_attrs_s2c = function(l_40_0, l_40_1)
  if l_40_0 ~= 0 then
    return 
  end
  if l_40_1.attr_ids then
    for l_40_5 = 1, #l_40_1.attr_ids do
      if l_40_1.attr_ids[l_40_5] == 1 then
        l_0_17.update_pet_evo_skill(l_40_1.pet_id, l_40_1.evo_active_skill_ids)
      else
        if l_40_1.attr_ids[l_40_5] == 2 then
          l_0_17.update_pet_evo_passive_skill(l_40_1.pet_id, l_40_1.evo_active_passive_skill_ids)
        end
      end
    end
    local l_40_6 = l_0_17.get_pet_info_by_id()
    if l_40_6 then
      l_0_5.brocast(l_0_18.event.update_pet_info, l_40_6, l_0_18.pet_data_type.normal)
    end
  end
end

l_0_16.on_pet_info_s2c = function(l_41_0, l_41_1)
  if l_41_0 ~= 0 then
    return 
  end
  if l_41_1.list then
    for l_41_5,l_41_6 in l_0_1(l_41_1.list) do
      l_0_17.update_pet_info(l_41_6, true, true)
    end
  end
  if l_41_1.battle_pet then
    for l_41_10,l_41_11 in l_0_1(l_41_1.battle_pet) do
      l_0_17.update_pet_info(l_41_11, true)
    end
  end
  if l_41_1.list or l_41_1.battle_pet then
    l_0_12.update_red_point("pet_toggle_red_point")
  end
  if l_41_1.insight_teacher_lv then
    l_0_17.update_insight_teacher_lv(l_41_1.insight_teacher_lv)
  end
  l_0_17.common_lv = l_41_1.common_lv
  local l_41_12, l_41_20 = Game.module.godpet
  l_41_20 = l_41_12.data
  l_41_20 = l_41_20.init_pet_info
  l_41_20(l_41_1.flag, l_41_1.treasure_ts)
  l_41_20 = false
   -- DECOMPILER ERROR: Confused at declaration of local variable

  local l_41_14, l_41_22 = false
  l_41_22 = l_0_17
  l_41_22 = l_41_22.get_scroll_data_list
  l_41_22 = l_41_22()
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    for l_41_19 = 1, #l_41_22 do
      if not l_41_14 and l_41_22[l_41_19].god_pet then
        if l_41_22[l_41_19].is_simple_info then
          l_0_16.pet_get_info_c2s(l_41_22[l_41_19].pet_id)
        end
        l_41_20 = true
        l_41_14 = true
      end
      if not l_41_20 and l_41_22[l_41_19].is_simple_info then
        l_0_16.pet_get_info_c2s(l_41_22[l_41_19].pet_id)
      end
      l_41_20 = true
    end
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  l_0_17.reset_selected_first_pet()
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_16.on_change_state_s2c = function(l_42_0, l_42_1)
  if l_42_0 ~= 0 then
    return 
  end
  if l_42_1.pet_id and l_42_1.state then
    local l_42_2 = l_0_17.pet_info[l_42_1.pet_id]
    if l_42_2 then
      l_42_2.state = l_42_1.state
      local l_42_3 = l_0_17.update_pet_info(l_42_2)
      l_0_5.brocast(l_0_18.event.update_pet_info, l_42_3, l_0_18.pet_data_type.normal)
      l_0_12.update_red_point("pet_resharp_btn_red_point")
      l_0_12.update_red_point("pet_level_up_red_point")
      l_0_12.update_red_point(l_0_18.red_point.pet_chuzhan_btn_red_point)
      l_0_12.update_red_point("pet_jinhua_btn_green_point")
    end
  end
end

l_0_16.on_rename_s2c = function(l_43_0, l_43_1)
  if l_43_0 ~= 0 then
    return 
  end
  if l_43_1.pet_id and l_43_1.nickname then
    local l_43_2 = l_0_17.pet_info[l_43_1.pet_id]
    if l_43_2 then
      l_43_2.nickname = l_43_1.nickname
      l_0_5.brocast(l_0_18.event.update_pet_info, l_43_2, l_0_18.pet_data_type.normal)
    end
  end
  l_0_4.broadcast_tips(l_0_11.get_string("TID_PET_RENAME_SUCCESS"))
end

l_0_16.on_up_level_s2c = function(l_44_0, l_44_1)
  if l_44_0 ~= 0 then
    return 
  end
  if l_44_1.pet_info then
    local l_44_2 = l_0_17.get_pet_info_by_id(l_44_1.pet_info.pet_id)
    local l_44_3 = l_0_17.get_empty_skill_slot(l_44_2)
    local l_44_4 = l_0_17.update_pet_info(l_44_1.pet_info)
    local l_44_5 = l_0_17.get_empty_skill_slot(l_44_4)
    if #l_44_3 < #l_44_5 then
      l_0_6.open_view(l_0_7.PetLevelUpUnlockSkillView.name, l_44_4)
    end
    l_0_5.brocast(l_0_18.event.update_pet_info, l_44_4, l_0_18.pet_data_type.level)
    l_0_17.update_up_insight_teacher_lv_progress()
  end
end

l_0_16.on_break_through_s2c = function(l_45_0, l_45_1)
  if l_45_0 ~= 0 then
    return 
  end
  if l_45_1.pet_info then
    local l_45_2 = false
    local l_45_3 = l_0_17.pet_info[l_45_1.pet_info.pet_id]
    if l_45_3 then
      local l_45_4 = l_45_3.evo_times
      local l_45_5 = l_45_3.c_id
      local l_45_6 = l_45_1.pet_info.evo_times
      local l_45_7 = l_0_9.get_config(l_45_5, l_45_4)
      local l_45_8 = l_0_9.get_config(l_45_5, l_45_6)
      if l_45_7 and l_45_8 and l_45_7.level_limit < l_45_8.level_limit then
        l_45_2 = true
      end
    end
    local l_45_9 = l_0_17.update_pet_info(l_45_1.pet_info)
    if l_45_2 then
      l_0_5.brocast(l_0_18.event.update_pet_info, l_45_9, l_0_18.pet_data_type.level_limit_upgrade)
    else
      l_0_5.brocast(l_0_18.event.update_pet_info, l_45_9, l_0_18.pet_data_type.break_through)
    end
    local l_45_10 = l_0_6.open_view
    local l_45_11 = "PetBreakthroughSuccessView"
    local l_45_12 = {}
    l_45_12.pet_info = l_45_9
    l_45_10(l_45_11, l_45_12)
  end
end

l_0_16.on_resolve_s2c = function(l_46_0, l_46_1)
  if l_46_0 ~= 0 then
    return 
  end
  l_0_12.update_red_point("pet_chuzhan_btn_red_point")
  l_0_12.update_red_point(l_0_18.red_point.pet_resolve_btn_red_point)
end

l_0_16.on_pet_change_new_state_s2c = function(l_47_0, l_47_1)
  if l_47_0 ~= 0 then
    return 
  end
  if l_47_1.list then
    for l_47_5,l_47_6 in pairs(l_47_1.list) do
      local l_47_7 = l_0_17.pet_info[l_47_6.k]
      if l_47_7 then
        l_47_7.state = l_47_6.v
        l_0_17.update_pet_info(l_47_7)
      end
    end
  end
end

l_0_16.on_pet_roll_s2c = function(l_48_0, l_48_1)
  if l_48_0 ~= 0 then
    return 
  end
  if l_48_1.pet_id then
    local l_48_2 = l_0_17.pet_info[l_48_1.pet_id]
    if l_48_2 then
      l_48_2.roll_value = l_48_1.roll_value
      l_48_2.roll_info = l_48_1.roll_info
      l_0_5.brocast(l_0_18.event.update_pet_info, l_48_2, l_0_18.pet_data_type.roll)
      l_0_17.update_up_insight_teacher_lv_progress()
      l_0_12.update_red_point("pet_resharp_btn_red_point")
    end
  end
end

l_0_16.on_pet_skill_learn_s2c = function(l_49_0, l_49_1)
  if l_49_0 ~= 0 then
    return 
  end
  if l_49_1.flag == 0 and l_49_1.pet_id then
    local l_49_2 = l_0_17.pet_info[l_49_1.pet_id]
    if l_49_2 then
      l_49_2.skill_learn = l_49_1.skill_learn
      l_0_5.brocast(l_0_18.event.update_pet_info, l_49_2, l_0_18.pet_data_type.skill_learn)
    elseif l_49_1.pet_info then
      local l_49_3 = l_0_17.update_pet_info(l_49_1.pet_info)
      l_0_5.brocast(l_0_18.event.update_pet_info, l_49_3, l_0_18.pet_data_type.skill_learn_and_confirm)
      l_0_17.update_up_insight_teacher_lv_progress()
    end
  end
end

l_0_16.on_pet_confirm_skill_learn_s2c = function(l_50_0, l_50_1)
  if l_50_0 ~= 0 then
    return 
  end
  if l_50_1.op == 0 and l_50_1.pet_id then
    local l_50_2 = l_0_17.pet_info[l_50_1.pet_id]
    if l_50_2 then
      l_50_2.skill_learn = false
      l_0_5.brocast(l_0_18.event.update_pet_info, l_50_2, l_0_18.pet_data_type.normal)
    elseif l_50_1.pet_info then
      local l_50_3 = {}
      local l_50_4 = l_0_17.get_pet_info_by_id(l_50_1.pet_info.pet_id)
      if l_50_4 and l_50_4.passivity_skill_list then
        l_50_3.before_passivity_skill_list = clone(l_50_4.passivity_skill_list)
      end
      local l_50_5 = l_0_17.update_pet_info(l_50_1.pet_info)
      l_50_3.cur_passivity_skill_list = l_50_5.passivity_skill_list
      l_0_5.brocast(l_0_18.event.update_pet_info, l_50_5, l_0_18.pet_data_type.normal)
      l_0_17.update_up_insight_teacher_lv_progress()
      l_0_6.open_view("PetSkillLearnSuccessView", l_50_3)
    end
  end
end

l_0_16.on_pet_inherit_s2c = function(l_51_0, l_51_1)
  if l_51_0 ~= 0 then
    return 
  end
  if l_51_1.pet_info then
    local l_51_2 = l_0_17.update_pet_info(l_51_1.pet_info)
    l_0_5.brocast(l_0_18.event.update_pet_info, l_51_2, l_0_18.pet_data_type.inherit)
    l_0_17.update_up_insight_teacher_lv_progress()
  end
end

l_0_16.on_pet_reset_s2c = function(l_52_0, l_52_1)
  if l_52_0 ~= 0 then
    return 
  end
  if l_52_1.pet_info then
    local l_52_2 = l_0_17.update_pet_info(l_52_1.pet_info)
    l_0_5.brocast(l_0_18.event.update_pet_info, l_52_2, l_0_18.pet_data_type.reset)
  end
end

l_0_16.on_pet_add_point_s2c = function(l_53_0, l_53_1)
  if l_53_0 ~= 0 then
    return 
  end
  if l_53_1.pet_info then
    local l_53_2 = l_0_17.update_pet_info(l_53_1.pet_info)
    l_0_5.brocast(l_0_18.event.update_pet_info, l_53_2, l_0_18.pet_data_type.add_point)
  end
end

l_0_16.on_pet_unlock_point_plan_s2c = function(l_54_0, l_54_1)
  if l_54_0 ~= 0 then
    return 
  end
  if l_54_1.pet_info then
    local l_54_2 = l_0_17.update_pet_info(l_54_1.pet_info)
    l_0_5.brocast(l_0_18.event.update_pet_info, l_54_2, l_0_18.pet_data_type.unlock_point_plan)
  end
end

l_0_16.on_pet_set_point_plan_s2c = function(l_55_0, l_55_1)
  if l_55_0 ~= 0 then
    return 
  end
  if l_55_1.pet_id then
    local l_55_2 = l_0_17.pet_info[l_55_1.pet_id]
    if l_55_2 and l_55_2.point_plan_list then
      for l_55_6,l_55_7 in pairs(l_55_2.point_plan_list) do
        if l_55_7.plan_id == l_55_2.plan_id then
          l_55_7.onekey_list = l_55_1.onekey_list
        end
      end
      l_0_5.brocast(l_0_18.event.update_pet_info, l_55_2, l_0_18.pet_data_type.set_point_plan)
    end
  end
end

l_0_16.on_pet_change_point_plan_s2c = function(l_56_0, l_56_1)
  if l_56_0 ~= 0 then
    return 
  end
  if l_56_1.pet_info then
    local l_56_2 = l_0_17.update_pet_info(l_56_1.pet_info)
    l_0_5.brocast(l_0_18.event.update_pet_info, l_56_2, l_0_18.pet_data_type.change_point_plan)
  end
end

l_0_16.on_pet_reset_point_plan_s2c = function(l_57_0, l_57_1)
  if l_57_0 ~= 0 then
    return 
  end
  if l_57_1.pet_info then
    local l_57_2 = l_0_17.update_pet_info(l_57_1.pet_info)
    l_0_5.brocast(l_0_18.event.update_pet_info, l_57_2, l_0_18.pet_data_type.reset_point_plan)
  end
end

l_0_16.on_pet_change_point_plan_name_s2c = function(l_58_0, l_58_1)
  if l_58_0 ~= 0 then
    return 
  end
  if l_58_1.pet_info then
    local l_58_2 = l_0_17.update_pet_info(l_58_1.pet_info)
    l_0_5.brocast(l_0_18.event.update_pet_info, l_58_2, l_0_18.pet_data_type.change_plan_name)
  end
end

l_0_16.on_pet_use_inner_pill_s2c = function(l_59_0, l_59_1)
  BroadcastTips.broadcast_tips("\230\136\144\229\138\159\228\189\191\231\148\168\231\165\158\229\133\189\230\162\166\230\160\184\229\188\128\229\144\175\230\138\128\232\131\189\230\160\188")
end

l_0_16.on_pet_use_candy_pill_s2c = function(l_60_0, l_60_1)
  l_0_4.broadcast_tips("\232\142\183\229\190\151\229\177\158\230\128\167\231\130\185")
end

l_0_16.on_pet_update_flash_list_s2c = function(l_61_0, l_61_1)
  if l_61_0 ~= 0 then
    return 
  end
  l_0_17.set_default_flash_list(l_61_1)
  l_0_17.has_changed_flash_list = false
  l_0_5.brocast(l_0_18.event.update_pet_flash_list)
end

l_0_16.on_pet_skill_synthesis_s2c = function(l_62_0, l_62_1)
  if l_62_0 ~= 0 then
    l_0_4.broadcast_tips("\229\144\136\230\136\144\229\164\177\232\180\165")
    return 
  end
  l_0_5.brocast(l_0_18.event.pet_skill_synthesis)
end

l_0_16.on_pet_get_info_s2c = function(l_63_0, l_63_1)
  if l_63_0 ~= 0 then
    return 
  end
  if l_63_1.pet_info then
    l_0_17.update_pet_info(l_63_1.pet_info)
    l_0_5.brocast(l_0_18.event.update_pet_info, l_63_1.pet_info, l_0_18.pet_data_type.normal)
    l_0_17.update_up_insight_teacher_lv_progress()
  end
end

l_0_16.on_pet_skill_slot_unlock_s2c = function(l_64_0, l_64_1)
  if l_64_0 ~= 0 then
    return 
  end
  if l_64_1.pet_id then
    local l_64_2 = l_0_17.add_pet_passivity_skill_slot(l_64_1.pet_id, l_64_1.unlock_index)
    if l_64_2 then
      l_0_5.brocast(l_0_18.event.update_pet_info, l_64_2)
    end
    BroadcastTips.broadcast_tips("\230\136\144\229\138\159\232\167\163\233\148\129\230\138\128\232\131\189\230\160\188")
  end
end

l_0_16.on_pet_add_notice_s2c = function(l_65_0, l_65_1)
  if l_65_0 ~= 0 then
    return 
  end
  local l_65_2 = l_0_10.get_config(l_65_1.c_id)
  local l_65_3 = l_0_9.get_config(l_65_1.c_id, 0)
  if l_65_2 then
    local l_65_4 = l_65_2.star
    local l_65_5 = l_0_11.get_string(l_65_3.name)
    l_0_4.broadcast_tips(l_0_2("\232\142\183\229\190\151\229\174\160\231\137\169<color=%s>[%s]</color>", l_0_18.pet_name_color[l_65_4], l_65_5))
  end
end

l_0_16.on_pet_flash_new_s2c = function(l_66_0, l_66_1)
  if l_66_0 ~= 0 then
    return 
  end
  l_0_17.update_flash_new_list(l_66_1.pet_id, l_66_1.is_flash_new)
  l_0_5.brocast(l_0_18.event.update_pet_flash_list)
  l_0_12.update_red_point(l_0_18.red_point.pet_flash_btn_green_point)
end

l_0_16.pet_equip_roll_c2s = function(l_67_0)
  local l_67_1 = {}
  l_67_1.equip_id = l_67_0
  l_0_3.send("pet_equip_roll_c2s", l_67_1)
end

l_0_16.pet_equip_confirm_roll_c2s = function(l_68_0)
  local l_68_1 = {}
  l_68_1.equip_id = l_68_0
  l_0_3.send("pet_equip_confirm_roll_c2s", l_68_1)
end

l_0_16.pet_equip_extra_roll_c2s = function(l_69_0)
  local l_69_1 = {}
  l_69_1.equip_id = l_69_0
  l_0_3.send("pet_equip_extra_roll_c2s", l_69_1)
end

l_0_16.pet_equip_confirm_extra_roll_c2s = function(l_70_0)
  local l_70_1 = {}
  l_70_1.equip_id = l_70_0
  l_0_3.send("pet_equip_confirm_extra_roll_c2s", l_70_1)
end

l_0_16.pet_equip_amulet_roll_c2s = function(l_71_0)
  local l_71_1 = {}
  l_71_1.equip_id = l_71_0
  l_0_3.send("pet_equip_amulet_roll_c2s", l_71_1)
end

l_0_16.pet_equip_confirm_amulet_roll_c2s = function(l_72_0, l_72_1)
  local l_72_2 = {}
  l_72_2.equip_id = l_72_0
  l_72_2.index = l_72_1
  l_0_3.send("pet_equip_confirm_amulet_roll_c2s", l_72_2)
end

l_0_16.pet_equip_amulet_skill_roll_c2s = function(l_73_0)
  local l_73_1 = {}
  l_73_1.equip_id = l_73_0
  l_0_3.send("pet_equip_amulet_skill_roll_c2s", l_73_1)
end

l_0_16.pet_equip_confirm_amulet_skill_roll_c2s = function(l_74_0, l_74_1)
  local l_74_2 = {}
  l_74_2.equip_id = l_74_0
  l_74_2.index = l_74_1
  l_0_3.send("pet_equip_confirm_amulet_skill_roll_c2s", l_74_2)
end

l_0_16.pet_equip_amulet_bind_c2s = function(l_75_0, l_75_1)
  local l_75_2 = {}
  l_75_2.pet_id = l_75_0
  l_75_2.equip_id = l_75_1
  l_0_3.send("pet_equip_amulet_bind_c2s", l_75_2)
end

l_0_16.pet_equip_synthesis_c2s = function(l_76_0)
  local l_76_1 = {}
  l_76_1.equip_id_list = l_76_0
  l_0_3.send("pet_equip_synthesis_c2s", l_76_1)
end

l_0_16.pet_equip_put_on_c2s = function(l_77_0, l_77_1)
  local l_77_2 = {}
  l_77_2.pet_id = l_77_0
  l_77_2.equip_id = l_77_1
  local l_77_3 = l_0_17.get_pet_info_by_id(l_77_0)
  if l_77_3 then
    l_0_17.temp_equip_put_on_pet_info = clone(l_77_3)
  end
  l_0_3.send("pet_equip_put_on_c2s", l_77_2)
end

l_0_16.pet_equip_take_off_c2s = function(l_78_0)
  local l_78_1 = {}
  l_78_1.equip_id = l_78_0
  l_0_3.send("pet_equip_take_off_c2s", l_78_1)
end

l_0_16.on_pet_equip_roll_s2c = function(l_79_0, l_79_1)
  if l_79_0 ~= 0 then
    return 
  end
  if l_79_1.equip_id then
    local l_79_2 = l_0_17.get_pet_equip_info_by_id(l_79_1.equip_id)
    l_0_5.brocast(l_0_18.equip_event.update_pet_equip_info, l_79_2, l_0_18.pet_equip_data_type.roll)
  end
end

l_0_16.on_pet_equip_confirm_roll_s2c = function(l_80_0, l_80_1)
  if l_80_0 ~= 0 then
    return 
  end
  if l_80_1.equip_id then
    local l_80_2 = l_0_17.get_pet_equip_info_by_id(l_80_1.equip_id)
    l_0_5.brocast(l_0_18.equip_event.update_pet_equip_info, l_80_2, l_0_18.pet_equip_data_type.confirm_roll)
  end
end

l_0_16.on_pet_equip_extra_roll_s2c = function(l_81_0, l_81_1)
  if l_81_0 ~= 0 then
    return 
  end
  if l_81_1.equip_id then
    local l_81_2 = l_0_17.get_pet_equip_info_by_id(l_81_1.equip_id)
    l_0_5.brocast(l_0_18.equip_event.update_pet_equip_info, l_81_2, l_0_18.pet_equip_data_type.extra_roll)
  end
end

l_0_16.on_pet_equip_confirm_extra_roll_s2c = function(l_82_0, l_82_1)
  if l_82_0 ~= 0 then
    return 
  end
  if l_82_1.equip_id then
    local l_82_2 = l_0_17.get_pet_equip_info_by_id(l_82_1.equip_id)
    l_0_5.brocast(l_0_18.equip_event.update_pet_equip_info, l_82_2, l_0_18.pet_equip_data_type.confirm_extra_roll)
  end
end

l_0_16.on_pet_equip_amulet_roll_s2c = function(l_83_0, l_83_1)
  if l_83_0 ~= 0 then
    return 
  end
  if l_83_1.equip_id then
    local l_83_2 = l_0_17.get_pet_equip_info_by_id(l_83_1.equip_id)
    l_0_5.brocast(l_0_18.equip_event.update_pet_equip_info, l_83_2, l_0_18.pet_equip_data_type.amulet_roll)
  end
end

l_0_16.on_pet_equip_confirm_amulet_roll_s2c = function(l_84_0, l_84_1)
  if l_84_0 ~= 0 then
    return 
  end
  if l_84_1.equip_id then
    local l_84_2 = l_0_17.get_pet_equip_info_by_id(l_84_1.equip_id)
    l_0_5.brocast(l_0_18.equip_event.update_pet_equip_info, l_84_2, l_0_18.pet_equip_data_type.confirm_amulet_roll)
  end
end

l_0_16.on_pet_equip_amulet_skill_roll_s2c = function(l_85_0, l_85_1)
  if l_85_0 ~= 0 then
    return 
  end
  if l_85_1.equip_id then
    local l_85_2 = l_0_17.get_pet_equip_info_by_id(l_85_1.equip_id)
    l_0_5.brocast(l_0_18.equip_event.update_pet_equip_info, l_85_2, l_0_18.pet_equip_data_type.amulet_skill_roll)
  end
end

l_0_16.on_pet_equip_confirm_amulet_skill_roll_s2c = function(l_86_0, l_86_1)
  if l_86_0 ~= 0 then
    return 
  end
  if l_86_1.equip_id then
    local l_86_2 = l_0_17.get_pet_equip_info_by_id(l_86_1.equip_id)
    l_0_5.brocast(l_0_18.equip_event.update_pet_equip_info, l_86_2, l_0_18.pet_equip_data_type.confirm_amulet_skill_roll)
  end
end

l_0_16.on_pet_equip_amulet_bind_s2c = function(l_87_0, l_87_1)
  if l_87_0 ~= 0 then
    return 
  end
  if l_87_1.equip_id then
    local l_87_2 = l_0_17.get_pet_equip_info_by_id(l_87_1.equip_id)
    l_0_4.broadcast_tips("\232\174\164\228\184\187\230\136\144\229\138\159")
    l_0_5.brocast(l_0_18.equip_event.update_pet_equip_info, l_87_2, l_0_18.pet_equip_data_type.bind)
  end
end

l_0_16.on_pet_equip_synthesis_s2c = function(l_88_0, l_88_1)
  if l_88_0 ~= 0 then
    return 
  end
  if l_88_1.equip_id then
    local l_88_2 = l_0_17.get_pet_equip_info_by_id(l_88_1.equip_id)
    l_0_17.reset_synthesis_equip_list()
    local l_88_3 = l_0_4.broadcast_tips
    local l_88_4 = l_0_11.get_string
    local l_88_5 = "TID_PET_EQUIP_GET_TIPS"
    local l_88_6 = {}
    l_88_6.equip_name = l_88_2.name
    l_88_6.item_id = l_88_2.c_id
    l_88_4 = l_88_4(l_88_5, l_88_6)
    l_88_3(l_88_4, l_88_5, l_88_6)
    l_88_3 = l_0_5
    l_88_3 = l_88_3.brocast
    l_88_4 = l_0_18
    l_88_4 = l_88_4.equip_event
    l_88_4 = l_88_4.update_pet_equip_info
    l_88_5 = l_88_2
    l_88_6 = l_0_18
    l_88_6 = l_88_6.pet_equip_data_type
    l_88_6 = l_88_6.synthesis
    l_88_3(l_88_4, l_88_5, l_88_6)
  end
end

l_0_16.on_pet_equip_put_on_s2c = function(l_89_0, l_89_1)
  if l_89_0 ~= 0 then
    return 
  end
  if l_89_1.equip_id then
    local l_89_2 = l_0_17.get_pet_equip_info_by_id(l_89_1.equip_id)
    l_0_5.brocast(l_0_18.equip_event.update_pet_equip_info, l_89_2, l_0_18.pet_equip_data_type.take_on)
    local l_89_3 = l_0_17.get_pet_info_by_id(l_89_2.pet_id)
    if l_89_3 then
      l_0_15.check_pet_equip_skill_effect(l_89_3, l_89_2)
    end
    if l_0_17.temp_equip_put_on_pet_info and l_0_17.temp_equip_put_on_pet_info.pet_id == l_89_2.pet_id then
      l_0_17.temp_equip_put_on_pet_info = false
    end
  end
end

l_0_16.on_pet_equip_take_off_s2c = function(l_90_0, l_90_1)
  if l_90_0 ~= 0 then
    return 
  end
  if l_90_1.equip_id then
    local l_90_2 = l_0_17.get_pet_equip_info_by_id(l_90_1.equip_id)
    local l_90_3 = l_0_4.broadcast_tips
    local l_90_4 = l_0_11.get_string
    local l_90_5 = "TID_PET_EQUIP_DEMOUNT_TIPS"
    local l_90_6 = {}
    l_90_6.equip_name = l_90_2.name
    l_90_6.item_id = l_90_2.c_id
    l_90_4 = l_90_4(l_90_5, l_90_6)
    l_90_3(l_90_4, l_90_5, l_90_6)
    l_90_3 = l_0_5
    l_90_3 = l_90_3.brocast
    l_90_4 = l_0_18
    l_90_4 = l_90_4.equip_event
    l_90_4 = l_90_4.update_pet_equip_info
    l_90_5 = l_90_2
    l_90_6 = l_0_18
    l_90_6 = l_90_6.pet_equip_data_type
    l_90_6 = l_90_6.take_off
    l_90_3(l_90_4, l_90_5, l_90_6)
  end
end

l_0_16.on_pet_equip_rand_suit_s2c = function(l_91_0, l_91_1)
  if l_91_0 ~= 0 then
    return 
  end
  l_0_5.brocast(l_0_18.equip_event.update_pet_equip_suit_info, l_91_1.equip_id)
end

l_0_16.on_pet_equip_confirm_rand_suit_s2c = function(l_92_0, l_92_1)
  if l_92_0 ~= 0 then
    return 
  end
  if l_92_1.equip_id then
    local l_92_2 = l_0_17.get_pet_equip_info_by_id(l_92_1.equip_id)
    l_0_5.brocast(l_0_18.equip_event.update_pet_equip_info, l_92_2)
    l_0_5.brocast(l_0_18.equip_event.update_pet_equip_suit_info, l_92_1.equip_id)
  end
end

l_0_16.on_pet_flash_plan_list_s2c = function(l_93_0, l_93_1)
  l_0_17.update_flash_plan_list(l_93_1)
  l_0_5.brocast("update_pet_flash_list")
  l_0_12.update_red_point(l_0_18.red_point.pet_flash_btn_green_point)
end

l_0_16.on_pet_balance_info_s2c = function(l_94_0, l_94_1)
  if l_94_0 ~= 0 then
    return 
  end
  l_0_17.update_pet_balanced_attr_list(l_94_1)
  l_0_5.brocast("update_pet_balanced_attr_list")
end

l_0_16.on_pet_flash_cnt_s2c = function(l_95_0, l_95_1)
  if l_95_0 ~= 0 then
    return 
  end
  l_0_17.set_pet_flash_unlock_count(l_95_1.flash_cnt)
  l_0_5.brocast("update_pet_flash_list")
end

l_0_16.on_pet_up_insight_teacher_lv_s2c = function(l_96_0, l_96_1)
  if l_96_0 ~= 0 then
    return 
  end
  if l_96_1.new_lv then
    l_0_17.update_insight_teacher_lv(l_96_1.new_lv)
  end
end

l_0_16.on_pet_reset_talent_pill_s2c = function(l_97_0, l_97_1)
  if l_97_0 ~= 0 then
    return 
  end
  BroadcastTips.broadcast_tips("\232\181\132\232\180\168\232\189\175\231\179\150\233\135\141\231\189\174\230\136\144\229\138\159")
end

return l_0_16

