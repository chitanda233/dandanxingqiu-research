-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua2_573512\game.module.main_weapon_develop.manager.network.network_-2900653104787120745.bin 

local l_0_0 = require("game.utils.events")
local l_0_1 = require("game.network.network_utils")
local l_0_2 = Game.redpoint_helper
local l_0_3 = Game.ui_manager
local l_0_4 = Game.ui_const
local l_0_5 = import("..head")
local l_0_6 = l_0_5.network
local l_0_7 = l_0_5.data
local l_0_8 = l_0_5.event
local l_0_9 = l_0_5.plan_data
local l_0_10 = assert(DataConfigs.language_define)
local l_0_11 = Game.module.bag
local l_0_12 = l_0_11.data
local l_0_13 = require("game.other.player_prefs")
l_0_6.init = function()
  local l_1_0 = l_0_6
  local l_1_1 = {}
  l_1_1.weapon_pos_info_s2c = l_0_6.on_weapon_pos_info_s2c
  l_1_1.weapon_update_pos_s2c = l_0_6.on_weapon_update_pos_s2c
  l_1_1.weapon_wear_s2c = l_0_6.on_weapon_wear_s2c
  l_1_1.weapon_remove_s2c = l_0_6.on_weapon_remove_s2c
  l_1_1.weapon_strengthen_s2c = l_0_6.on_weapon_strengthen_s2c
  l_1_1.weapon_star_up_s2c = l_0_6.on_weapon_star_up_s2c
  l_1_1.weapon_master_info_s2c = l_0_6.on_weapon_master_info_s2c
  l_1_1.weapon_master_s2c = l_0_6.on_weapon_master_s2c
  l_1_1.weapon_bond_info_s2c = l_0_6.on_weapon_bond_info_s2c
  l_1_1.weapon_bond_s2c = l_0_6.on_weapon_bond_s2c
  l_1_0.net_event_names = l_1_1
  l_1_0 = l_0_1
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_6
  l_1_1 = l_1_1.net_event_names
  l_1_0(l_1_1, "main_weapon_develop")
end

l_0_6.weapon_bond_c2s = function(l_2_0)
  local l_2_1 = l_0_1.send
  local l_2_2 = "weapon_bond_c2s"
  local l_2_3 = {}
  l_2_3.bond_id = l_2_0
  l_2_1(l_2_2, l_2_3)
end

l_0_6.weapon_bond_info_c2s = function()
  l_0_1.send("weapon_bond_info_c2s", {})
end

l_0_6.weapon_master_info_c2s = function()
  l_0_1.send("weapon_master_info_c2s", {})
end

l_0_6.weapon_master_c2s = function()
  l_0_1.send("weapon_master_c2s", {})
end

l_0_6.weapon_pos_info_c2s = function()
  l_0_1.send("weapon_pos_info_c2s", {})
end

l_0_6.on_weapon_pos_info_s2c = function(l_7_0, l_7_1)
  if l_7_0 ~= 0 then
    return 
  end
  l_0_7.init_weapon_pos_info(l_7_1.list)
  l_0_7.refresh_weapon_open_dic()
  l_0_7.refresh_weapon_unlock_dic()
  l_0_7.refresh_weapon_rating_dic()
  l_0_7.refresh_weapon_can_star_up_dic()
  l_0_9.update_default_weapon_plan_weapon_list(l_7_1.list)
  l_0_9.refresh_hot_plan_pool()
  l_0_9.refresh_recommend_plan_pool()
  l_0_0.brocast(l_0_8.update_main_weapon_develop_info)
  l_0_2.update_red_point("weapon_equip_mode_red_point")
  l_0_2.update_red_point("main_weapon_develop_star_up_red_point")
  l_0_2.update_red_point("main_weapon_develop_show_star_up_red_point")
  l_0_2.update_red_point("main_weapon_develop_star_up_cur_red_point")
  l_0_2.update_red_point("main_weapon_develop_unlock_red_point")
  l_0_2.update_red_point("main_weapon_develop_strength_red_point")
  l_0_2.update_red_point("equip_stone_inlay_1")
  l_0_2.update_red_point("weapon_plan_red_point")
  l_0_2.update_red_point("cur_default_weapon_plan_red_point")
  l_0_2.update_red_point("weapon_bond_need_active_red_point")
  for l_7_5 = 1, 5 do
    l_0_2.update_red_point(string.format("weapon_plan_%s_red_point", l_7_5))
  end
end

l_0_6.on_weapon_update_pos_s2c = function(l_8_0, l_8_1)
  if l_8_0 ~= 0 then
    return 
  end
  l_0_7.update_weapon_pos_info(l_8_1.list)
  l_0_7.refresh_weapon_is_equip_dic()
  l_0_9.update_default_weapon_plan_weapon_list(l_8_1.list)
  l_0_0.brocast(l_0_8.update_main_weapon_develop_info)
  l_0_2.update_red_point("weapon_equip_mode_red_point")
  l_0_2.update_red_point("main_weapon_develop_star_up_red_point")
  l_0_2.update_red_point("main_weapon_develop_show_star_up_red_point")
  l_0_2.update_red_point("main_weapon_develop_star_up_cur_red_point")
  l_0_2.update_red_point("main_weapon_develop_unlock_red_point")
  l_0_2.update_red_point("main_weapon_develop_strength_red_point")
  l_0_2.update_red_point("equip_stone_inlay_1")
  l_0_2.update_red_point("weapon_plan_red_point")
  l_0_2.update_red_point("cur_default_weapon_plan_red_point")
  l_0_2.update_red_point("weapon_bond_need_active_red_point")
  for l_8_5 = 1, 5 do
    l_0_2.update_red_point(string.format("weapon_plan_%s_red_point", l_8_5))
  end
end

l_0_6.weapon_wear_c2s = function(l_9_0)
  l_0_7.set_value("wear_weapon_count", l_0_5.get_wear_weapon_count())
  local l_9_1 = l_0_1.send
  local l_9_2 = "weapon_wear_c2s"
  local l_9_3 = {}
  l_9_3.list = l_9_0
  l_9_1(l_9_2, l_9_3)
end

l_0_6.on_weapon_wear_s2c = function(l_10_0, l_10_1)
  if l_10_0 ~= 0 then
    return 
  end
  local l_10_2 = l_0_7.get_value("wear_weapon_count")
  local l_10_3 = l_0_7.get_value("is_main_weapon_auto_wear")
  if l_10_3 then
    l_0_7.set_value("is_main_weapon_auto_wear")
    BroadcastTips.broadcast_tips("\228\184\128\233\148\174\232\163\133\233\133\141\229\174\140\230\136\144")
  end
  local l_10_4 = l_0_7.get_value("is_replace_weapon")
  if l_10_4 then
    l_0_7.set_value("is_replace_equip")
    BroadcastTips.broadcast_tips("\229\183\178\230\155\191\230\141\162\228\189\142\229\147\129\232\180\168\230\173\166\229\153\168")
  end
  local l_10_5 = Game.module.guide_system
  l_10_5.trigger(l_10_5.const.trigger_type.weapon_wear_s2c)
  l_0_7.set_value("wear_weapon_count")
end

l_0_6.weapon_remove_c2s = function(l_11_0)
  l_0_7.set_value("remove_pos", l_11_0)
  local l_11_1 = l_0_1.send
  local l_11_2 = "weapon_remove_c2s"
  local l_11_3 = {}
  l_11_3.pos = l_11_0
  l_11_1(l_11_2, l_11_3)
end

l_0_6.on_weapon_remove_s2c = function(l_12_0, l_12_1)
  if l_12_0 ~= 0 then
    return 
  end
  local l_12_2 = l_0_7.get_value("remove_pos")
  l_0_7.remove_weapon(l_12_2)
  l_0_7.refresh_weapon_is_equip_dic()
  l_0_9.update_default_weapon_plan_weapon_list(l_0_7.weapon_dic)
  l_0_7.set_value("remove_pos", nil)
  l_0_0.brocast(l_0_8.update_main_weapon_develop_info)
  l_0_2.update_red_point("weapon_equip_mode_red_point")
  l_0_2.update_red_point("equip_stone_inlay_1")
  l_0_2.update_red_point("weapon_plan_red_point")
  l_0_2.update_red_point("cur_default_weapon_plan_red_point")
  l_0_2.update_red_point("weapon_bond_need_active_red_point")
  for l_12_6 = 1, 5 do
    l_0_2.update_red_point(string.format("weapon_plan_%s_red_point", l_12_6))
  end
end

l_0_6.weapon_strengthen_c2s = function(l_13_0, l_13_1, l_13_2)
  l_0_7.set_value("play_strengthen_anim", true)
  local l_13_3 = l_0_1.send
  local l_13_4 = "weapon_strengthen_c2s"
  local l_13_5 = {}
  l_13_5.items = l_13_0
  l_13_5.is_use = l_13_1
  l_13_5.use_type = l_13_2
  l_13_3(l_13_4, l_13_5)
end

l_0_6.on_weapon_strengthen_s2c = function(l_14_0, l_14_1)
  if l_14_0 ~= 0 then
    local l_14_2 = DataConfigs.error_code
    do
      if not l_14_2.get_dsc(l_14_0) then
        local l_14_3 = tostring(l_14_1)
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    else
      local l_14_4, l_14_5 = l_0_10.get_string(l_14_3)
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    BroadcastTips.broadcast_tips(l_14_4)
    return 
  end
  l_0_7.update_strength_return_num(l_14_1.return_num)
  l_0_7.strength_success(l_14_1)
  l_0_0.brocast(l_0_8.weapon_equip_strengthen, l_14_1.result)
  l_0_2.update_red_point("weapon_master_red_point")
  local l_14_6 = Game.module.guide_system
  l_14_6.trigger(l_14_6.const.trigger_type.weapon_strengthen_s2c)
end

l_0_6.weapon_star_up_c2s = function(l_15_0, l_15_1)
  local l_15_2 = l_0_1.send
  local l_15_3 = "weapon_star_up_c2s"
  local l_15_4 = {}
  l_15_4.item_cid = l_15_0
  l_15_4.up_num = l_15_1
  l_15_2(l_15_3, l_15_4)
end

l_0_6.on_weapon_star_up_s2c = function(l_16_0, l_16_1)
  if l_16_0 ~= 0 then
    return 
  end
  do
    local l_16_2, l_16_3, l_16_4, l_16_5, l_16_6, l_16_7, l_16_8, l_16_9, l_16_10, l_16_11, l_16_12, l_16_13 = l_0_7.pre_weapon_star_dic[l_16_1.item_cid] or l_0_7.weapon_star_dic[l_16_1.item_cid] or 0
  end
  l_0_7.star_up(l_16_1)
  l_0_7.refresh_weapon_unlock_dic()
  l_0_7.refresh_weapon_can_star_up_dic(l_16_1.item_cid)
  l_0_7.get_weapon_rating(l_16_1.item_cid, true)
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_0_0.brocast("weapon_star_up", l_16_2, l_16_1.star)
  l_0_2.update_red_point("main_weapon_develop_star_up_red_point")
  l_0_2.update_red_point("main_weapon_develop_show_star_up_red_point")
  l_0_2.update_red_point("main_weapon_develop_star_up_cur_red_point")
  l_0_2.update_red_point("main_weapon_develop_unlock_red_point")
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_0_5.try_record_star_upgrade_info(l_16_1, l_16_2)
end

l_0_6.on_weapon_master_info_s2c = function(l_17_0, l_17_1)
  l_0_7.weapon_master_lv = l_17_1.lv
  l_0_2.update_red_point("weapon_master_red_point")
  l_0_0.brocast("update_weapon_master_lv")
end

l_0_6.on_weapon_master_s2c = function(l_18_0, l_18_1)
  l_0_7.weapon_master_lv = l_18_1.lv
  l_0_2.update_red_point("weapon_master_red_point")
  l_0_0.brocast("update_weapon_master_lv")
end

l_0_6.on_weapon_bond_info_s2c = function(l_19_0, l_19_1)
  l_0_7.update_weapon_bond_info(l_19_1)
end

l_0_6.on_weapon_bond_s2c = function(l_20_0, l_20_1)
  l_0_7.active_weapon_bond_info(l_20_1)
  l_0_7.update_weapon_bond_rating_cache()
  l_0_0.brocast("update_main_weapon_develop_info")
  l_0_2.update_red_point("weapon_bond_need_active_red_point")
end

l_0_6.clear = function()
  l_0_1.unlisten_net_events(l_0_6.net_event_names)
end


