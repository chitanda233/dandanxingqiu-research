-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua3_573410\game.module.gacha.manager.network.network_-1573414781650070484.bin 

local l_0_0 = assert
local l_0_1 = require("game.network.network_utils")
local l_0_2 = Game.events
local l_0_3 = Game.module.open_func
local l_0_4 = DataConfigs
local l_0_5 = l_0_4.gacha
local l_0_6 = import("..head")
local l_0_7 = l_0_0(l_0_6.network)
local l_0_8 = l_0_0(l_0_6.data)
local l_0_9 = l_0_0(l_0_6.const)
l_0_7.init = function()
  local l_1_0 = l_0_7
  local l_1_1 = {}
  l_1_1.gacha_info_s2c = l_0_7.on_gacha_info_s2c
  l_1_1.gacha_wish_info_s2c = l_0_7.on_gacha_wish_info_s2c
  l_1_1.gacha_update_wish_info_s2c = l_0_7.on_gacha_update_wish_info_s2c
  l_1_1.gacha_set_wish_job_s2c = l_0_7.on_gacha_set_wish_job_s2c
  l_1_1.gacha_set_wish_s2c = l_0_7.on_gacha_set_wish_s2c
  l_1_1.gacha_spin_s2c = l_0_7.on_gacha_spin_s2c
  l_1_1.gacha_preview_info_s2c = l_0_7.on_gacha_preview_info_s2c
  l_1_1.gacha_refresh_preview_s2c = l_0_7.on_gacha_refresh_preview_s2c
  l_1_1.gacha_update_preview_s2c = l_0_7.on_gacha_update_preview_s2c
  l_1_1.gacha_draw_preview_s2c = l_0_7.on_gacha_draw_preview_s2c
  l_1_1.gacha_single_info_s2c = l_0_7.on_gacha_single_info_s2c
  l_1_1.gacha_set_storage_id_s2c = l_0_7.on_gacha_set_storage_id_s2c
  l_1_0.net_events = l_1_1
  l_1_0 = l_0_1
  l_1_0 = l_1_0.listen_net_events
  l_1_1 = l_0_7
  l_1_1 = l_1_1.net_events
  l_1_0(l_1_1, "gacha")
end

l_0_7.clear = function()
  l_0_1.unlisten_net_events(l_0_7.net_events)
  l_0_7.net_events = nil
end

l_0_7.gacha_info_c2s = function()
  l_0_1.send("gacha_info_c2s", {})
end

l_0_7.gacha_wish_info_c2s = function(l_4_0)
  local l_4_1 = l_0_1.send
  local l_4_2 = "gacha_wish_info_c2s"
  local l_4_3 = {}
  l_4_3.cid = l_4_0
  l_4_1(l_4_2, l_4_3)
end

l_0_7.gacha_set_wish_job_c2s = function(l_5_0, l_5_1, l_5_2)
  local l_5_3 = l_0_1.send
  local l_5_4 = "gacha_set_wish_job_c2s"
  local l_5_5 = {}
  l_5_5.cid = l_5_0
  l_5_5.job = l_5_1
  l_5_5.old_job = l_5_2
  l_5_3(l_5_4, l_5_5)
end

l_0_7.gacha_set_wish_c2s = function(l_6_0, l_6_1, l_6_2)
  local l_6_3 = l_0_1.send
  local l_6_4 = "gacha_set_wish_c2s"
  local l_6_5 = {}
  l_6_5.cid = l_6_0
  l_6_5.job = l_6_1
  l_6_5.item_list = l_6_2
  l_6_3(l_6_4, l_6_5)
end

l_0_7.gacha_spin_c2s = function(l_7_0, l_7_1)
  local l_7_2 = l_0_6.get_auto_forge_setting()
  local l_7_3 = {}
  if l_0_3.is_open(l_0_3.const.type.resolve_equip_filter) then
    if l_7_2 and l_7_2.cond1 and l_7_2.cond1_l_data and l_7_2.cond1_l_data.attr_id and l_7_2.cond1_l_data.attr_id > 0 then
      table.insert(l_7_3, l_7_2.cond1_l_data.attr_id)
    end
    if l_7_2 and l_7_2.cond2 and l_7_2.cond2_l_data and l_7_2.cond2_l_data.attr_id and l_7_2.cond2_l_data.attr_id > 0 then
      table.insert(l_7_3, l_7_2.cond2_l_data.attr_id)
    end
  end
  local l_7_4 = {}
  l_7_4.c_id = l_7_0
  l_7_4.times = l_7_1
  l_7_4.attr_list = l_7_3
  local l_7_5 = l_0_5.get_config(l_7_0)
  if l_7_5 and l_7_5.type == l_0_9.page_type.weapon then
    l_0_8.cache_weapon_info()
  end
  l_0_2.brocast("wait_reward_start")
  l_0_1.send("gacha_spin_c2s", l_7_4, l_7_3)
end

l_0_7.gacha_preview_info_c2s = function(l_8_0)
  local l_8_1 = l_0_1.send
  local l_8_2 = "gacha_preview_info_c2s"
  local l_8_3 = {}
  l_8_3.c_id = l_8_0
  l_8_1(l_8_2, l_8_3)
end

l_0_7.gacha_refresh_preview_c2s = function(l_9_0, l_9_1)
  local l_9_2 = l_0_1.send
  local l_9_3 = "gacha_refresh_preview_c2s"
  local l_9_4 = {}
  l_9_4.c_id = l_9_0
  l_9_4.type = l_9_1
  l_9_2(l_9_3, l_9_4)
end

l_0_7.gacha_draw_preview_c2s = function(l_10_0)
  local l_10_1 = l_0_1.send
  local l_10_2 = "gacha_draw_preview_c2s"
  local l_10_3 = {}
  l_10_3.c_id = l_10_0
  l_10_1(l_10_2, l_10_3)
end

l_0_7.gacha_set_storage_id_c2s = function(l_11_0, l_11_1)
  local l_11_2 = l_0_1.send
  local l_11_3 = "gacha_set_storage_id_c2s"
  local l_11_4 = {}
  l_11_4.cid = l_11_0
  l_11_4.storage_id = l_11_1
  l_11_2(l_11_3, l_11_4)
end

l_0_7.on_gacha_info_s2c = function(l_12_0, l_12_1)
  if l_12_0 ~= 0 then
    return 
  end
  l_0_8.gacha_info = {}
  if l_12_1.list then
    for l_12_5,l_12_6 in pairs(l_12_1.list) do
      l_0_8.update_gacha_info(l_12_6)
      local l_12_7 = l_0_2.brocast
      local l_12_8 = l_0_9.event.update_gacha_info
      local l_12_9 = {}
      l_12_9.c_id = l_12_6.c_id
      l_12_7(l_12_8, l_12_9)
    end
    l_0_2.brocast(l_0_9.event.update_all_gacha_info)
  end
end

l_0_7.on_gacha_wish_info_s2c = function(l_13_0, l_13_1)
  if l_13_0 ~= 0 then
    return 
  end
  l_0_8.update_gacha_wish_info(l_13_1.cid, l_13_1.list, l_13_1.num)
  l_0_2.brocast(l_0_9.event.update_gacha_wish_info, l_13_1.cid)
end

l_0_7.on_gacha_update_wish_info_s2c = function(l_14_0, l_14_1)
  if l_14_0 ~= 0 then
    return 
  end
  l_0_8.update_gacha_wish_info(l_14_1.cid, l_14_1.list, l_14_1.num)
  l_0_2.brocast(l_0_9.event.update_gacha_wish_info, l_14_1.cid)
end

l_0_7.on_gacha_set_wish_job_s2c = function(l_15_0, l_15_1)
  if l_15_0 ~= 0 then
    return 
  end
  l_0_8.update_gacha_wish_job(l_15_1.cid, l_15_1.job, l_15_1.old_job)
  l_0_2.brocast(l_0_9.event.update_gacha_wish_info, l_15_1.cid)
end

l_0_7.on_gacha_set_wish_s2c = function(l_16_0, l_16_1)
  if l_16_0 ~= 0 then
    return 
  end
  l_0_8.update_gacha_wish(l_16_1.cid, l_16_1.job, l_16_1.item_list)
  l_0_2.brocast(l_0_9.event.update_gacha_wish_info, l_16_1.cid)
end

l_0_7.on_gacha_spin_s2c = function(l_17_0, l_17_1)
  Game.events.brocast(l_0_9.event.interrupt_main_view, false)
  if l_17_0 ~= 0 then
    l_0_8.clear_cache()
    return 
  end
  if l_17_1.list then
    l_0_8.cache_spin_gacha_item(l_17_1.list)
    local l_17_2 = 1
    local l_17_3 = l_0_8.cache_selected_id
    if l_17_1.info and l_17_1.info.c_id then
      l_17_3 = l_17_1.info.c_id
    end
    local l_17_4 = l_0_8.get_gacha_info(l_17_3)
    if l_17_4 then
      l_17_2 = l_17_4.lv
    end
    local l_17_5 = l_0_2.brocast
    local l_17_6 = l_0_9.event.spin_gacha_info
    local l_17_7 = {}
    l_17_7.gacha_lv = l_17_2
    l_17_5(l_17_6, l_17_7)
  end
  if l_17_1.info then
    l_0_8.update_gacha_info(l_17_1.info)
    local l_17_8 = l_0_2.brocast
    local l_17_9 = l_0_9.event.update_gacha_info
    local l_17_10 = {}
    l_17_10.c_id = l_17_1.info.c_id
    l_17_10.not_update_immediatly = true
    l_17_8(l_17_9, l_17_10)
    l_17_8 = l_0_8
    l_17_8 = l_17_8.spin_cache
    l_17_9 = l_17_1.info
    l_17_9 = l_17_9.c_id
    l_17_8[l_17_9] = true
  end
end

l_0_7.on_gacha_preview_info_s2c = function(l_18_0, l_18_1)
  if l_18_0 ~= 0 then
    return 
  end
  l_0_8.update_gacha_preview_info(l_18_1.info)
  l_0_2.brocast(l_0_9.event.update_gacha_preview_info, l_18_1.info.c_id)
end

l_0_7.on_gacha_refresh_preview_s2c = function(l_19_0, l_19_1)
  if l_19_0 ~= 0 then
    return 
  end
  l_0_2.brocast(l_0_9.event.refresh_gacha_preview)
end

l_0_7.on_gacha_update_preview_s2c = function(l_20_0, l_20_1)
  if l_20_0 ~= 0 then
    return 
  end
  l_0_8.update_gacha_preview_info(l_20_1.info)
  l_0_2.brocast(l_0_9.event.update_gacha_preview_info, l_20_1.info.c_id)
end

l_0_7.on_gacha_draw_preview_s2c = function(l_21_0, l_21_1)
  if l_21_0 ~= 0 then
    return 
  end
  l_0_8.update_gacha_preview_draw_info(l_21_1.c_id, l_21_1.index)
  l_0_2.brocast(l_0_9.event.update_gacha_preview_info, l_21_1.c_id, l_21_1.index)
end

l_0_7.on_gacha_single_info_s2c = function(l_22_0, l_22_1)
  if l_22_0 ~= 0 then
    return 
  end
  l_0_8.update_gacha_info(l_22_1.gacha)
  local l_22_2 = Game.events.brocast
  local l_22_3 = l_0_9.event.update_gacha_info
  local l_22_4 = {}
  l_22_4.c_id = l_22_1.gacha.c_id
  l_22_2(l_22_3, l_22_4)
end

l_0_7.on_gacha_set_storage_id_s2c = function(l_23_0, l_23_1)
  if l_23_0 ~= 0 then
    return 
  end
  l_0_8.update_gacha_storage_info(l_23_1.cid, l_23_1.storage_id)
  local l_23_2 = Game.events.brocast
  local l_23_3 = l_0_9.event.update_gacha_info
  local l_23_4 = {}
  l_23_4.c_id = l_23_1.cid
  l_23_2(l_23_3, l_23_4)
end

return l_0_7

