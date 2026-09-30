-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua3_573410\game.module.gacha.manager.core_-7991379755632502889.bin 

local l_0_0 = assert(string.format)
local l_0_1 = Game
local l_0_2 = l_0_1.events
local l_0_3 = l_0_1.redpoint_helper
local l_0_4 = l_0_1.module.bag
local l_0_5 = l_0_4.const
local l_0_6 = l_0_1.module.open_func
local l_0_7 = l_0_6.const
local l_0_8 = l_0_6.event
local l_0_9 = l_0_1.ui_manager
local l_0_10 = l_0_1.ui_const
local l_0_11 = l_0_1.module.activity
local l_0_12 = l_0_1.module.cloud_data
local l_0_13 = require("game.other.server_time")
local l_0_14 = DataConfigs
local l_0_15 = l_0_14.gacha
local l_0_16 = l_0_14.item
local l_0_17 = import(".head")
local l_0_18 = l_0_17.data
local l_0_19 = l_0_17.network
local l_0_20 = l_0_17.const
l_0_17.init = function()
  l_0_18.init()
  l_0_19.init()
  l_0_17.init_red_points()
  l_0_17.setup_events()
  l_0_17.register_jump_to()
end

l_0_17.clear = function()
  l_0_17.clear_events()
  l_0_17.clear_red_points()
  l_0_19.clear()
  l_0_18.clear()
end

l_0_17.init_req = function()
end

l_0_17.register_jump_to = function()
end

l_0_17.on_open_func_event_update_all = function()
  if l_0_6.is_open(l_0_7.type.gacha) then
    l_0_19.gacha_info_c2s()
  end
end

l_0_17.on_open_func_event_update_item = function(l_6_0, l_6_1)
  if l_6_0 == l_0_7.type.gacha and l_6_1 then
    l_0_19.gacha_info_c2s()
  end
  if l_6_0 ~= l_0_7.type.gacha_one or l_6_1 then
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_17.on_package_gain_after_reward_display = function(l_7_0)
  l_0_17.pop_weapon_acquire_view(l_7_0.items, 1, l_7_0.source)
end

l_0_17.pop_weapon_acquire_view = function(l_8_0, l_8_1, l_8_2, l_8_3, l_8_4)
  if (l_8_2 and l_8_2 == 36002) or not l_8_0 then
    return 
  end
  for l_8_8 = l_8_1, #l_8_0 do
    do
      local l_8_9 = l_8_0[l_8_8]
      if not l_8_9.item_cid then
        local l_8_10, l_8_11 = l_8_9[1]
      end
       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused at declaration of local variable

      do
         -- DECOMPILER ERROR: Confused at declaration of local variable

         -- DECOMPILER ERROR: Confused at declaration of local variable

         -- DECOMPILER ERROR: Confused at declaration of local variable

         -- DECOMPILER ERROR: Confused at declaration of local variable

         -- DECOMPILER ERROR: Confused about usage of registers!

        if l_8_9 and (l_8_4 or 1 < l_0_16.get_item(l_8_10).quality or not l_8_2 or l_8_2 == 25002) and l_0_16.get_item(l_8_10).item_type == 11 then
          l_0_9.open_view("WeaponAcquireView", {c_id = l_8_10, show_btn_wear = l_8_3, show_btn_preview = true, layer = l_0_10.sorting_layer_type.MaskView}, function()
        l_0_17.pop_weapon_acquire_view(l_8_0, l_8_8 + 1)
         end)
        end
      end
       -- DECOMPILER ERROR: Confused about usage of registers for local variables.

    end
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- Warning: undefined locals caused missing assignments!
end

l_0_17.update_gacha_red_point = function(l_9_0, l_9_1)
  if not l_0_6.is_open(l_0_7.type.gacha_max_not_tips_again) then
    l_0_18.red_point_show_times_cacha[l_0_0("gacha_max_draw_redpoint_%d", l_9_1)] = nil
  end
  l_0_3.update_red_point(l_0_0("gacha_max_draw_redpoint_%d", l_9_1))
end

l_0_17.on_bag_update_items = function(l_10_0, l_10_1)
  local l_10_2 = GlobalConst.resources.weapon_gacha
  local l_10_3 = GlobalConst.resources.gacha
  local l_10_4 = GlobalConst.resources.equip_gacha
  local l_10_5 = false
  local l_10_6 = false
  local l_10_7 = false
  for l_10_11,l_10_12 in pairs(l_10_1) do
    if l_10_12.cfg_id == l_10_2 and not l_10_5 then
      if not l_0_6.is_open(l_0_7.type.gacha_max_not_tips_again) then
        l_0_18.red_point_show_times_cacha[l_0_0("gacha_max_draw_redpoint_%d", 101)] = nil
      end
      l_0_3.update_red_point(l_0_0("gacha_max_draw_redpoint_%d", 101))
      l_10_5 = true
      do return end
      if l_10_12.cfg_id == l_10_3 and not l_10_6 then
        if not l_0_6.is_open(l_0_7.type.gacha_max_not_tips_again) then
          l_0_18.red_point_show_times_cacha[l_0_0("gacha_max_draw_redpoint_%d", 1001)] = nil
        end
        l_0_3.update_red_point(l_0_0("gacha_max_draw_redpoint_%d", 1001))
        l_10_6 = true
        do return end
        if l_10_12.cfg_id == l_10_4 and not l_10_7 then
          if not l_0_6.is_open(l_0_7.type.gacha_max_not_tips_again) then
            l_0_18.red_point_show_times_cacha[l_0_0("gacha_max_draw_redpoint_%d", 102)] = nil
          end
          l_0_3.update_red_point(l_0_0("gacha_max_draw_redpoint_%d", 102))
          l_10_7 = true
        end
      end
    end
    if l_10_5 and l_10_6 and l_10_7 then
      do return end
    end
  end
  if l_10_5 or l_10_6 or l_10_7 then
    l_0_3.update_red_point("gacha_main_view_redpoint")
  end
end

l_0_17.check_gacha_pool_open = function(l_11_0)
  do
    local l_11_1 = l_0_15.get_config(l_11_0)
    if not l_11_1 then
      return false
    end
    for l_11_5,l_11_6 in pairs(l_11_1.open_cond) do
       -- DECOMPILER ERROR: unhandled construct in 'if'

      if l_11_6[1] == l_0_20.open_cond_type.open_day and require("game.other.server_time").get_server_open_day() < l_11_6[2] then
        return false
        for l_11_5,l_11_6 in l_11_2 do
           -- DECOMPILER ERROR: unhandled construct in 'if'

          if l_11_6[1] == l_0_20.open_cond_type.level and l_0_1.module.data.get_player().level < l_11_6[2] then
            return false
            for l_11_5,l_11_6 in l_11_2 do
              if l_11_6[1] == l_0_20.open_cond_type.draw_count then
                local l_11_7 = l_11_6[2]
                local l_11_8 = l_11_6[3]
                do
                  local l_11_9 = l_0_18.get_gacha_info(l_11_7)
                  if not l_11_9 or l_11_9.count < l_11_8 then
                    return false
                  end
                  for l_11_5,l_11_6 in l_11_2 do
                  end
                  if l_11_6[1] == l_0_20.open_cond_type.activity then
                    local l_11_10 = l_11_6[2]
                    return l_0_11.data.is_activity_open(l_11_10)
                  end
                end
              end
            end
          end
          return true
        end
         -- Warning: missing end command somewhere! Added here
      end
       -- Warning: missing end command somewhere! Added here
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_17.check_gacha_open_by_type = function(l_12_0)
  local l_12_1 = l_0_15.get_all_config()
  for l_12_5,l_12_6 in pairs(l_12_1) do
    if l_12_6.type == l_12_0 and l_0_17.check_gacha_pool_open(l_12_6.id) then
      return true
    end
  end
  return false
end

l_0_17.try_to_open_gacha_view = function(l_13_0)
  if not l_0_6.is_open(l_0_7.type.gacha) then
    local l_13_1 = BroadcastTips.broadcast_tips
    local l_13_2, l_13_3, l_13_4, l_13_8 = l_0_6.get_no_open_tips(l_0_7.type.gacha)
    return l_13_1(l_13_2, l_13_3, l_13_4, l_13_8)
  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    if l_13_0 or not l_0_17.check_gacha_open_by_type(l_0_20.page_type.weapon) then
      return BroadcastTips.broadcast_tips("\229\176\154\230\156\170\229\188\128\229\144\175\232\175\165\229\141\161\230\177\160")
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_0_9.open_view("GachaMainView", {type = l_0_20.page_type.weapon})
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_17.check_job_is_selected_in_wish_view = function(l_14_0, l_14_1)
  if l_0_18.cache_wish_info[l_14_1].is_use ~= 1 then
    return not l_0_18.cache_wish_info[l_14_1]
  end
  do return end
  if l_0_18.gacha_wish_info[l_14_0][l_14_1].is_use ~= 1 then
    return not l_0_18.gacha_wish_info[l_14_0] or not l_0_18.gacha_wish_info[l_14_0][l_14_1]
  end
  do return end
  return false
end

l_0_17.setup_events = function()
  local l_15_0 = l_0_17
  do
    local l_15_1 = {}
     -- DECOMPILER ERROR: No list found. Setlist fails

     -- DECOMPILER ERROR: Overwrote pending register.

    if l_15_0 then
      return 
    end
     -- DECOMPILER ERROR: Overwrote pending register.

     -- DECOMPILER ERROR: Overwrote pending register.

     -- DECOMPILER ERROR: Overwrote pending register.

     -- DECOMPILER ERROR: Overwrote pending register.

     -- DECOMPILER ERROR: Overwrote pending register.

    l_15_0(l_15_1, l_0_20.event.spin_gacha_info, false)
  end
   -- Warning: undefined locals caused missing assignments!
end

l_0_17.clear_events = function()
  if not l_0_17.has_setup then
    return 
  end
  l_0_17.has_setup = false
  l_0_2.remove_listeners(l_0_17.listen_events, l_0_17, false)
end

l_0_17.on_bag_items_changing = function(l_17_0)
end

l_0_17.on_pet_gacha_changed = function()
  l_0_17.update_gacha_red_point(GlobalConst.resources.gacha, 1001)
end

l_0_17.on_weapon_gacha_changed = function()
  l_0_17.update_gacha_red_point(GlobalConst.resources.weapon_gacha, 101)
end

l_0_17.on_equip_gacha_changed = function()
  l_0_17.update_gacha_red_point(GlobalConst.resources.equip_gacha, 102)
end

l_0_17.on_weapon_camp_gacha_changed = function()
  l_0_17.update_gacha_red_point(GlobalConst.resources.camp_gacha, 6001)
end

l_0_17.on_spin_gacha_info = function(l_22_0)
  if l_0_20.show_main_animation_view_limit < l_22_0.gacha_lv then
    l_0_9.open_view("GachaMainAnimationView")
  else
    l_0_9.open_view("GachaRewardView")
  end
end

l_0_17.on_finish_main_animation_view = function()
  local l_23_0 = l_0_9.open_view
  l_23_0("GachaRewardView", nil, function()
    l_0_9.close_view("GachaMainAnimationView")
   end)
end

end
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

 -- Warning: undefined locals caused missing assignments!

