-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua1_573660\game.module.main_view.manager.config.right_up_config_-6643782486772910893.bin 

local l_0_0 = Game.module.open_func.const
local l_0_1 = l_0_0.type
local l_0_2 = Game.module.open_func.event
local l_0_3 = Game.ui_manager
local l_0_4 = Game.ui_const
local l_0_5 = Game.module.open_func
local l_0_6 = assert(DataConfigs.language_define)
local l_0_7 = DataConfigs.misc
local l_0_8 = DataConfigs.language_define
local l_0_9 = Game.module.jump_to
local l_0_10 = Game.module.main_view.event
local l_0_11 = Game.module.main_view.const
local l_0_12 = Game.events
local l_0_13 = {}
local l_0_14 = {}
l_0_14.open_func_id = l_0_0.type.daily_task
l_0_14.click_handler = function()
  l_0_9.jump_to("TaskDailyView")
end

local l_0_15 = {}
local l_0_16 = l_0_2.update_item
l_0_15[l_0_16] = function(l_2_0, l_2_1)
  if l_2_1 == l_0_0.type.daily_task then
    l_0_12.brocast(l_0_10.main_view_update_btn, l_0_11.right_up_btn.daily)
  end
end

l_0_14.event_handler = l_0_15
l_0_14.redpoint_id = "daily_task_red_point"
l_0_13.daily = l_0_14
l_0_15 = l_0_1.shop
l_0_15 = function()
  l_0_3.open_view("ShopView")
end

l_0_16 = l_0_2.update_item
l_0_15 = {l_0_16 = function(l_4_0, l_4_1)
  if l_4_1 == l_0_1.shop then
    l_0_12.brocast(l_0_10.main_view_update_btn, "shop")
  end
end
}
l_0_14 = {open_func_id = l_0_15, redpoint_id = "main_view_shop_btn", click_handler = l_0_15, event_handler = l_0_15}
l_0_13.shop = l_0_14
l_0_15 = function()
  l_0_3.open_view("WelfareMainView")
end

l_0_15 = function()
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- DECOMPILER ERROR: Confused at declaration of local variable

  return Game.module.welfare.is_open()
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_16 = l_0_2.update_all
l_0_16 = l_0_2.update_item
l_0_15 = {l_0_16 = function()
  l_0_12.brocast(l_0_10.main_view_update_btn, "welfare")
end
, l_0_16 = function()
  l_0_12.brocast(l_0_10.main_view_update_btn, "welfare")
end
}
l_0_14 = {redpoint_id = "main_view_welfare_red", click_handler = l_0_15, check_open_func = l_0_15, event_handler = l_0_15}
l_0_13.welfare = l_0_14
l_0_15 = function()
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- DECOMPILER ERROR: Confused at declaration of local variable

  return Game.module.game_club.is_community_entry_open()
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_15 = function()
  if not Game.module.game_club.is_community_entry_open() then
    return 
  end
  local l_10_0 = Game.module.game_club.should_only_show_player_group()
  local l_10_1 = l_0_3.open_view
  local l_10_2 = l_0_4.GameClubMainView.name
  local l_10_3 = {}
  l_10_3.type = 4
  l_10_3.index = l_10_0 and 2 or nil
  l_10_3.only_show_player_group = l_10_0
  l_10_1(l_10_2, l_10_3)
end

l_0_16 = l_0_2.update_item
l_0_15 = {l_0_16 = function(l_11_0, l_11_1)
  if l_11_1 == l_0_1.game_club then
    l_0_12.brocast(l_0_10.main_view_update_btn, "game_circle")
  end
end
}
l_0_14 = {check_open_func = l_0_15, click_handler = l_0_15, redpoint_id = "main_game_club_red_point", event_handler = l_0_15}
l_0_13.game_circle = l_0_14
return l_0_13

