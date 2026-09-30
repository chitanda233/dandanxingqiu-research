-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.touch_-4936954064824169068.bin 

local l_0_0 = require("game.utils.events")
local l_0_1 = require("game.utils.layer_type_helper")
local l_0_2 = Game
local l_0_3 = l_0_2.module.camera
local l_0_4 = string.format
local l_0_5 = Physics
local l_0_6 = UGUITools
local l_0_7 = TransformUtils
local l_0_8 = TouchSceneHelper.instance
local l_0_9 = Vector3
local l_0_10 = l_0_9.New
local l_0_11 = l_0_9.zero
local l_0_12 = math.abs
local l_0_13 = math.max
local l_0_14 = l_0_10(0, 0, 0)
local l_0_15 = l_0_10(0, 0, 0)
local l_0_16 = 0.8
local l_0_17 = 0.5
local l_0_18 = 0.4
local l_0_19 = l_0_2.module.fight
local l_0_20 = l_0_19.ways.base
l_0_20.try_to_install_touch = function(l_1_0)
  if l_1_0.is_installed_touch then
    return 
  end
  l_1_0.is_installed_touch = true
  l_1_0.is_touching = false
  l_1_0.last_touch_timestamp = nil
  local l_1_1 = GameObject.New("Ground")
  l_1_0.go_ground = l_1_1
  l_1_1.layer = l_0_1.get_layer_int(l_0_1.LAYER_GROUND)
  local l_1_2 = l_1_1.transform
  l_1_2:SetParent(l_1_0.t_fight_root)
  l_0_7.SetPSR(l_1_2, 0, 0, 0.2, 1, 1, 0.1, 0, 0, 0)
  l_1_0.ground_collider = l_0_6.AddComponent(l_1_1, "BoxCollider")
  l_1_0.ground_collider.size = l_0_11:Set(100, 100, 1)
  l_1_0:try_to_enable_touch()
end

l_0_20.fit_touch_ground_collider = function(l_2_0)
  if not l_2_0.ground_collider then
    return 
  end
  local l_2_1, l_2_2 = l_0_3.get_t_scene_camera():GetPositionEx(nil, nil, nil)
  l_2_0.ground_collider.center = l_0_11:Set(l_2_1, l_2_2, 1)
end

l_0_20.try_to_uninstall_touch = function(l_3_0)
  if not l_3_0.is_installed_touch then
    return 
  end
  l_3_0.is_installed_touch = false
  l_3_0.is_touching = false
  l_3_0.last_touch_timestamp = nil
  l_3_0:try_to_disable_touch()
  GameObject.Destroy(l_3_0.go_ground)
  l_3_0.go_ground = nil
  l_3_0.ground_collider = nil
end

l_0_20.try_to_enable_touch = function(l_4_0)
  if l_4_0.is_enable_touch then
    return 
  end
  l_4_0.is_enable_touch = true
  l_4_0.update_frame_count = 0
  l_0_8:EnableTouch(l_0_2.camera.get_scene_camera(), false, function(l_1_0)
    l_4_0:on_touch_start(l_1_0)
   end, function(l_2_0, l_2_1, l_2_2, l_2_3)
    l_4_0:on_touch_update(l_2_0, l_2_1, l_2_2, l_2_3)
   end, function(l_3_0)
    l_4_0:on_touch_click(l_3_0)
   end, function(l_4_0, l_4_1)
    l_4_0:on_touch_up(l_4_0, l_4_1)
   end, l_0_1.LAYER_GROUND)
end

l_0_20.try_to_disable_touch = function(l_5_0)
  if not l_5_0.is_enable_touch then
    return 
  end
  l_5_0.is_enable_touch = false
  l_5_0.update_frame_count = 0
  l_0_8:DisableTouch()
end

l_0_20.reset_touch_data = function(l_6_0)
  if not l_6_0.is_enable_touch then
    return 
  end
  l_0_8:ResetTouch()
  l_6_0:stop_touch()
end

l_0_20.stop_touch = function(l_7_0)
  l_7_0.move_dis = 0
  l_7_0.is_touching = false
  l_7_0.last_touch_timestamp = nil
  l_7_0.double_touch_down_mark = false
  l_7_0.double_touch_down_time = nil
  l_7_0.touch_down_time = nil
end

end
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

 -- Warning: undefined locals caused missing assignments!

