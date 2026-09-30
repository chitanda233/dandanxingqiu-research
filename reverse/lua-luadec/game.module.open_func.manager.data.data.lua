-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua11_573512\game.module.open_func.manager.data.data_4241039344027210586.bin 

local l_0_0 = table.insert
local l_0_1 = assert(table.concat)
local l_0_2 = assert(string.split)
local l_0_3 = Game.redpoint_helper
local l_0_4 = Game.module.main_view.event
local l_0_5 = import("..head")
local l_0_6 = assert(l_0_5.data)
local l_0_7 = assert(l_0_5.event)
local l_0_8 = assert(l_0_5.const)
local l_0_9 = Game.ui_manager
local l_0_10 = Game.events
local l_0_11 = Game.module.cloud_data
local l_0_12 = Game.module.popup
local l_0_13 = DataConfigs
local l_0_14 = l_0_13.open_func
local l_0_15 = nil
local l_0_16 = {}
l_0_6.init = function()
  l_0_6.reset()
end

l_0_6.clear = function()
  l_0_6.reset()
end

local l_0_17 = {}
for l_0_21,l_0_22 in pairs(l_0_14.get_all_cfg()) do
  if l_0_22.ispreview then
    l_0_0(l_0_17, l_0_22)
  end
end
table.sort(l_0_17, function(l_3_0, l_3_1)
  return l_3_0.index < l_3_1.index
end
)
l_0_6.reset = function()
  l_0_6.open_func = {}
  l_0_6.role_open_func = {}
  l_0_6.reward_list = {}
  l_0_6.main_btn_open_func = {}
  l_0_6.is_cloud_data_init = false
  l_0_6.is_func_open_data_init = false
  l_0_6.show_func_open_anim_dict = nil
  l_0_6.is_update_show_func_open_anim_dict = false
  l_0_6.wait_update_all_open_func_msg = nil
end

l_0_6.on_got_cloud_data_init = function()
  if not l_0_6.is_cloud_data_init then
    l_0_6.is_cloud_data_init = true
    if l_0_6.wait_update_all_open_func_msg then
      local l_5_0 = l_0_6.wait_update_all_open_func_msg
      l_0_6.wait_update_all_open_func_msg = nil
      l_0_6.update_all(l_5_0)
    end
  end
end

l_0_6.is_open = function(l_6_0)
  if l_0_6.open_func and l_0_6.open_func[l_6_0] and l_0_11.is_open(l_6_0) then
    local l_6_1 = l_0_14.get_cfg_by_id(l_6_0)
    if l_6_1 and l_6_1.plat and not GameEnv.is_editor then
      if l_6_1.plat == 1 and not GameDefine.MINIGAME_MODE then
        return false
      elseif l_6_1.plat == 2 and not GameDefine.UNITY_ANDROID and not GameDefine.UNITY_IOS and not GameDefine.UNITY_OPENHARMONY then
        return false
      end
    end
    return true
  end
  return false
end

l_0_6.update_all = function(l_7_0)
  if not l_0_6.is_cloud_data_init then
    l_0_6.wait_update_all_open_func_msg = l_7_0
    return 
  end
  l_0_6.is_func_open_data_init = true
  if not l_7_0.list then
    local l_7_1, l_7_6, l_7_12, l_7_14, l_7_16 = {}
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  for l_7_5 = 1, #l_7_1 do
    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

      l_0_6.open_func[l_7_1[l_7_16]] = true
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

end
for l_7_11 = 1, #{} do
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_0_6.reward_list[({})[l_0_6.open_func]] = true
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end
l_0_6.register_main_btn_check_open_func()
l_0_6.show_open_func_view_by_cloud_data_diff()
l_0_10.brocast(l_0_7.update_all)
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_6.update_list = function(l_8_0)
  if not l_0_6.is_func_open_data_init and l_0_6.wait_update_all_open_func_msg then
    local l_8_1 = l_0_6.wait_update_all_open_func_msg.list
    local l_8_2 = {}
    if l_8_1 then
      for l_8_6,l_8_7 in pairs(l_8_1) do
        l_8_2[l_8_7] = true
      end
    end
    if l_8_0.open_list then
      for l_8_11,l_8_12 in pairs(l_8_0.open_list) do
        l_8_2[l_8_12] = true
      end
    end
    if l_8_0.close_list then
      for l_8_16,l_8_17 in pairs(l_8_0.close_list) do
        l_8_2[l_8_17] = false
      end
    end
    local l_8_18, l_8_24 = {}
    l_8_24 = pairs
    l_8_24 = l_8_24(l_8_2)
    for l_8_22,l_8_23 in l_8_24 do
       -- DECOMPILER ERROR: Confused at declaration of local variable

      if (null) then
        table.insert(l_8_18, l_8_17)
      end
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_0_6.wait_update_all_open_func_msg.list = l_8_18
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
  return 
  l_0_5.clear_check_open_func_anim_timer()
  table.clear(l_0_16)
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_8_0.open_list then
    l_0_6.update_open_func_list_status(l_8_0.open_list, true, l_0_16)
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_8_0.close_list then
    l_0_6.update_open_func_list_status(l_8_0.close_list, false, l_0_16)
  end
  if next(l_0_16) then
    l_0_10.brocast(l_0_7.update_item_list, l_0_16)
  end
  l_0_3.update_red_point("open_func_preview_red_point")
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_6.update_open_func_list_status = function(l_9_0, l_9_1, l_9_2)
  assert(l_9_0)
  for l_9_6 = 1, #l_9_0 do
    if l_0_6.update_open_status(l_9_0[l_9_6], l_9_1) then
      l_9_2[l_9_0[l_9_6]] = l_9_1
    end
  end
  l_0_6.check_save_view_opened_func_to_cloud_data()
end

l_0_6.update_open_status = function(l_10_0, l_10_1)
  if l_0_6.open_func == nil then
    return 
  end
  local l_10_2 = l_0_6.is_open(l_10_0)
  l_0_6.open_func[l_10_0] = l_10_1
  if l_10_2 ~= l_10_1 then
    if l_10_1 then
      local l_10_3 = l_0_6.main_btn_open_func[l_10_0]
      if l_10_3 and not l_10_3() then
        do return end
      end
      if l_0_14.get_show_flag(l_10_0) then
        if not l_0_5.get_gm_show_open_func_anim_state() then
          local l_10_4 = l_0_12.add_pop_view
          local l_10_5 = {}
          l_10_5.name = "OpenFuncView"
          l_10_5.func = function()
            l_0_9.open_view("OpenFuncView", l_10_0)
               end
          l_10_4(l_10_5)
        end
        l_0_6.set_show_func_open_anim_success(l_10_0)
      end
    end
    l_0_10.brocast(l_0_7.update_item, l_10_0, l_10_1)
    return true
  end
  return false
end

l_0_6.update_role_open_func = function(l_11_0)
  local l_11_1 = l_0_6.role_open_func
  local l_11_2 = l_11_0.open_id
  l_11_1[l_11_2] = {}
  l_11_1 = ipairs
  l_11_2 = l_11_0.close_role_list
  if not l_11_2 then
    l_11_2 = {}
  end
  l_11_1 = l_11_1(l_11_2)
  for i_1,i_2 in l_11_1 do
    l_0_6.role_open_func[l_11_0.open_id][l_11_5] = true
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_6.show_open_func_view_by_cloud_data_diff = function()
  l_0_5.clear_check_open_func_anim_timer()
  local l_12_0 = l_0_6.get_view_opened_func_from_cloud_data()
  if l_0_6.open_func and l_12_0 then
    for l_12_4,l_12_5 in pairs(l_0_6.open_func) do
      do
        if l_12_5 and l_12_0[l_12_4] ~= l_12_5 and l_0_14.get_show_flag(l_12_4) then
          local l_12_6 = l_0_6.main_btn_open_func[l_12_4]
          local l_12_7 = true
          if l_12_6 then
            l_12_7 = l_12_6()
          end
          if l_12_7 then
            if not l_0_5.get_gm_show_open_func_anim_state() then
              local l_12_8 = l_0_12.add_pop_view
              local l_12_9 = {}
              l_12_9.name = "OpenFuncView"
              l_12_9.func = function()
                l_0_9.open_view("OpenFuncView", l_12_4)
                     end
              l_12_8(l_12_9)
            end
            l_0_6.set_show_func_open_anim_success(l_12_4)
          end
        end
      end
    end
    l_0_6.check_save_view_opened_func_to_cloud_data()
  end
end

l_0_6.check_save_view_opened_func_to_cloud_data = function()
  if l_0_6.is_update_show_func_open_anim_dict then
    l_0_6.is_update_show_func_open_anim_dict = false
    l_0_6.save_view_opened_func_to_cloud_data()
  end
end

l_0_6.save_view_opened_func_to_cloud_data = function()
  if not l_0_15 then
    l_0_15 = {}
  end
  table.clear(l_0_15)
  if l_0_6.show_func_open_anim_dict then
    for l_14_3,l_14_4 in pairs(l_0_6.show_func_open_anim_dict) do
      l_0_0(l_0_15, l_14_3)
    end
  end
  l_0_11.try_add_val_to_server("view_opened_func", l_0_1(l_0_15, ","))
end

l_0_6.set_show_func_open_anim_success = function(l_15_0)
  if l_0_6.show_func_open_anim_dict == nil or l_0_6.show_func_open_anim_dict[l_15_0] then
    return 
  end
  l_0_6.is_update_show_func_open_anim_dict = true
  l_0_6.show_func_open_anim_dict[l_15_0] = true
end

l_0_6.get_view_opened_func_from_cloud_data = function()
  if l_0_6.show_func_open_anim_dict then
    return l_0_6.show_func_open_anim_dict
  end
  l_0_6.show_func_open_anim_dict = {}
  local l_16_0 = l_0_11.try_get_val_from_server("view_opened_func")
  if not l_16_0 then
    return l_0_6.show_func_open_anim_dict
  end
  local l_16_1 = l_0_2(l_16_0, ",")
  if l_16_1 == nil then
    return l_0_6.show_func_open_anim_dict
  end
  for l_16_5 = 1, #l_16_1 do
    local l_16_6 = tonumber(l_16_1[l_16_5])
    if l_16_6 then
      l_0_6.show_func_open_anim_dict[l_16_6] = true
    end
  end
  return l_0_6.show_func_open_anim_dict
end

l_0_6.receive_reward = function(l_17_0)
  l_0_6.reward_list[l_17_0] = true
end

l_0_6.get_cur_show_preview = function()
  for l_18_3,l_18_4 in ipairs(l_0_17) do
    do
      if l_0_5.is_open(l_18_4.id) then
        local l_18_11 = l_0_6.reward_list
        l_18_11 = l_18_11[l_18_4.id]
         -- DECOMPILER ERROR: Confused at declaration of local variable

        if not l_18_11 then
          l_18_11 = l_18_4.id
           -- DECOMPILER ERROR: Confused at declaration of local variable

          return l_18_11
        end
         -- DECOMPILER ERROR: Confused about usage of registers for local variables.

      end
    end
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- DECOMPILER ERROR: Confused at declaration of local variable

  return l_0_6.get_cur_open_preview()
end

l_0_6.get_cur_open_preview = function()
  local l_19_0 = l_0_17[#l_0_17].id
  for l_19_4,l_19_5 in ipairs(l_0_17) do
    if not l_0_5.is_open(l_19_5.id) then
      l_19_0 = l_19_5.id
  else
    end
  end
  return l_19_0
end

l_0_6.has_not_get_reward = function()
  local l_20_0 = l_0_5.get_func_preview_reward_list_by_type()
  for l_20_4,l_20_5 in ipairs(l_20_0) do
    if l_20_5.is_open and not l_20_5.is_geted then
      return true
    end
  end
  return false
end

l_0_6.register_main_btn_check_open_func = function()
  local l_21_0 = assert(l_0_13.mainview_btns)
  for l_21_4,l_21_5 in pairs(l_21_0.get_all_cfg()) do
    if l_21_5.check_open_func and l_21_5.open_func_id then
      local l_21_6 = l_0_6.main_btn_open_func
      local l_21_7 = l_21_5.open_func_id
      l_21_6[l_21_7] = l_21_5.check_open_func
    end
  end
end

l_0_6.init_cloud_data = function()
end

return l_0_6

