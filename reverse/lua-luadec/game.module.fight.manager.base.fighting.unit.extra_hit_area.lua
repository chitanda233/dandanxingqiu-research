-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.unit.extra_hit_area_-3145557070561309176.bin 

local l_0_0 = Game.module.art_number
local l_0_1 = assert(DataConfigs)
local l_0_2 = l_0_1.extra_hit_area
local l_0_3 = remove_obj_from_array
local l_0_4 = UIFollowTargetMgr.instance
local l_0_5 = Vector3.New(0, 0, 0)
local l_0_6 = Game.module.fight
local l_0_7 = l_0_6.ways.base
l_0_7.init_unit_extra_hit_area = function(l_1_0, l_1_1)
  l_1_1.cf_id_to_ext_area = {}
  local l_1_2 = l_1_1.ext_hit_area_list
  if not l_1_2 then
    return 
  end
  for l_1_6,l_1_7 in ipairs(l_1_2) do
    l_1_0:add_extra_hit_area(l_1_1, l_1_7)
  end
end

l_0_7.clear_unit_extra_hit_area = function(l_2_0, l_2_1)
  if not l_2_1.cf_id_to_ext_area then
    return 
  end
  for l_2_5,l_2_6 in pairs(l_2_1.cf_id_to_ext_area) do
    l_2_0:del_extra_hit_area(l_2_1, l_2_6, false)
  end
  l_2_1.cf_id_to_ext_area = nil
  l_2_1.ext_hit_area_list = nil
end

l_0_7.update_extra_hit_area_by_msgs = function(l_3_0, l_3_1, l_3_2, l_3_3)
  if not l_3_2 then
    return nil
  end
  do
    local l_3_4 = nil
    for l_3_8,l_3_9 in ipairs(l_3_2) do
      if l_3_3 then
        if not l_3_4 then
          l_3_4 = {}
        end
        l_3_4[l_3_9.area_cfg_id] = true
      end
      if l_3_1.cf_id_to_ext_area[l_3_9.area_cfg_id] then
        l_3_0:update_extra_hit_area(l_3_1, l_3_9)
        for l_3_8,l_3_9 in l_3_5 do
        end
        l_3_0:add_extra_hit_area(l_3_1, l_3_9)
      end
      return l_3_4
    end
     -- Warning: missing end command somewhere! Added here
  end
end

l_0_7.add_extra_hit_area = function(l_4_0, l_4_1, l_4_2)
  l_4_1.cf_id_to_ext_area[l_4_2.area_cfg_id] = l_4_2
  l_4_0:add_extra_hit_area_skin(l_4_1, l_4_2)
  l_4_0:refresh_extra_hit_area_count(l_4_1, l_4_2)
  l_4_0:show_unit_ext_hit_area(l_4_1, l_4_2)
end

l_0_7.update_extra_hit_area = function(l_5_0, l_5_1, l_5_2)
  local l_5_3 = l_5_1.cf_id_to_ext_area[l_5_2.area_cfg_id]
  local l_5_4 = l_5_3.remain_count
  clone_to(l_5_2, l_5_3)
  if l_5_4 ~= l_5_2.remain_count then
    l_5_0:refresh_extra_hit_area_count(l_5_1, l_5_3)
  end
end

l_0_7.del_extra_hit_area_by_id = function(l_6_0, l_6_1, l_6_2, l_6_3)
  local l_6_4 = assert(l_6_1.cf_id_to_ext_area[l_6_2], l_6_2)
  l_6_0:clear_unit_ext_hit_area(l_6_1, l_6_4)
  l_6_0:del_extra_hit_area(l_6_1, l_6_4, l_6_3)
end

l_0_7.del_extra_hit_area = function(l_7_0, l_7_1, l_7_2, l_7_3)
  l_7_1.cf_id_to_ext_area[l_7_2.area_cfg_id] = nil
  if l_7_1.ext_hit_area_list then
    l_0_3(l_7_1.ext_hit_area_list, l_7_2)
  end
  l_7_0:hide_extra_hit_area_count(l_7_1, l_7_2)
  l_7_0:del_extra_hit_area_skin(l_7_1, l_7_2)
  if not l_7_3 then
    return 
  end
  local l_7_4 = l_7_2.cf_info
  if not l_7_4 then
    return 
  end
  if l_7_4.del_action then
    l_7_0:set_unit_ani_trigger(l_7_1, l_7_4.del_action)
  end
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

end
l_7_0:add_run_after_to_unit(l_7_1, (((((((not l_7_2.remain_count < 0 or not l_7_4.del_eff_id2) and not l_7_2.remain_count < 0 or l_7_4.del_delay_ms2 or not l_7_2.remain_count < 0 or l_7_4.del_sound2 or not l_7_2.remain_count < 0 or l_7_4.del_sound_delay2 or not l_7_4.del_eff_id or l_7_4.del_eff_id <= 0)))))) or 0, function()
    l_7_0:play_unit_effect(l_7_1, l_7_6, true, nil, nil, nil, true, nil, nil, nil)
   end)
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

 -- DECOMPILER ERROR: Confused about usage of registers!

 -- DECOMPILER ERROR: Confused at declaration of local variable

 -- DECOMPILER ERROR: Confused about usage of registers!

 -- DECOMPILER ERROR: Confused at declaration of local variable

 -- DECOMPILER ERROR: Confused at declaration of local variable

 -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

end
l_7_0:add_run_after_to_unit(l_7_1, not l_7_4.del_sound or 0, function()
  l_7_0:play_audio(l_7_8)
end
)
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_7.update_extra_hit_area_center_pos = function(l_8_0, l_8_1, l_8_2)
  if not l_8_2.center_pos then
    local l_8_3 = Vector2.New(0, 0)
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_8_2.center_pos = l_8_3
   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_8_3.x = l_8_1.pos.x + l_8_2.cf_info.shift_pos[1] * (l_8_1.direction == l_0_6.role_directions.right and 1 or -1)
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_8_3.y = l_8_1.pos.y + l_8_2.cf_info.shift_pos[2]
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_8_3.x = l_8_0:cal_unit_offset_pos(l_8_1, l_8_3, 0, l_8_2.cf_info.half_wh[2])
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_8_3.y = l_8_0
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_7.add_extra_hit_area_skin = function(l_9_0, l_9_1, l_9_2)
  local l_9_3 = assert(l_9_2.area_cfg_id)
  local l_9_4 = assert(l_0_2[l_9_3], l_9_3)
  l_9_2.cf_info = l_9_4
  l_9_0:update_extra_hit_area_center_pos(l_9_1, l_9_2)
  do
    local l_9_5, l_9_6 = l_9_4.bone_path or "skin_root"
  end
  if not l_9_4.eff_id or l_9_4.eff_id == 0 then
    return 
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_9_2.effect = l_9_0:play_unit_effect(l_9_1, l_9_4.eff_id, true, l_9_5, nil, nil, false, nil, nil, nil)
end

l_0_7.del_extra_hit_area_skin = function(l_10_0, l_10_1, l_10_2)
  if not l_10_2.effect then
    return 
  end
  l_10_0:del_unit_effect(l_10_1, l_10_2.effect)
  l_10_2.effect = nil
end

l_0_7.try_get_extra_hit_area_center_pos = function(l_11_0, l_11_1)
  if not l_11_1.cf_id_to_ext_area or not next(l_11_1.cf_id_to_ext_area) then
    return nil
  end
  local l_11_2 = -1
  local l_11_3 = nil
  for l_11_7,l_11_8 in pairs(l_11_1.cf_id_to_ext_area) do
    if l_11_2 < l_11_7 then
      l_11_2 = l_11_7
      l_11_3 = l_11_8
    end
  end
  if not l_11_3 then
    return nil
  end
  l_11_0:update_extra_hit_area_center_pos(l_11_1, l_11_3)
  return l_11_3.center_pos.x, l_11_3.center_pos.y
end

local l_0_8 = {}
l_0_8[2] = true
l_0_8[4] = true
l_0_7.refresh_extra_hit_area_count = function(l_12_0, l_12_1, l_12_2)
  if l_12_2.remain_count == nil then
    return 
  end
  local l_12_3 = l_12_2.area_cfg_id
  if not l_12_3 then
    return 
  end
  local l_12_4 = l_0_2[l_12_3]
  if not l_12_4 then
    return 
  end
  if not l_0_8[l_12_4.type] then
    return 
  end
  if l_12_4.is_show_remain_hit_count == 0 then
    return 
  end
  l_12_0:hide_extra_hit_area_count(l_12_1, l_12_2)
  local l_12_5 = l_12_2.remain_count
  local l_12_6 = "normal_atk"
  local l_12_7 = tostring(l_12_5)
  local l_12_8 = 1.8
  if l_12_4.type == 4 then
    l_12_6 = "magic_normal_atk"
    l_12_8 = 2.5
  elseif l_12_5 == 0 then
    l_12_6 = "cure"
    l_12_7 = "0"
    l_12_8 = 1.5
  elseif l_12_5 < 0 then
    l_12_6 = "critical_atk"
    l_12_7 = "-" .. math.abs(l_12_5)
    l_12_8 = 1.4
  end
  if l_12_4.hit_count_scale then
    l_12_8 = l_12_4.hit_count_scale * 0.01
  end
  local l_12_9 = l_0_0.add_art_obj_to_scene
  local l_12_10 = {}
  l_12_10.tp_art = l_12_6
  l_12_10.content = l_12_7
  l_12_9 = l_12_9(l_12_10)
  l_12_2.art_num_obj = l_12_9
  l_12_9 = l_12_2.art_num_obj
  if l_12_9 then
    l_12_9 = TransformUtils
    l_12_9 = l_12_9.SetS
    l_12_10 = l_12_2.art_num_obj
    l_12_10 = l_12_10.transform
    l_12_9(l_12_10, l_12_8, l_12_8, l_12_8)
    l_12_9 = l_0_5
    l_12_9.x = 0
    l_12_9 = l_0_5
    l_12_9.y = 2.5
    l_12_9 = l_0_5
    l_12_9.z = 0
    l_12_9 = l_12_4.type
    if l_12_9 == 4 then
      l_12_9 = l_0_5
      l_12_10 = l_12_4.half_wh
      l_12_10 = l_12_10[2]
      l_12_10 = l_12_10 * 0.01
      l_12_9.y = l_12_10
    end
    l_12_9 = l_12_4.hit_count_offset
    if l_12_9 then
      l_12_9 = l_12_4.hit_count_offset
      l_12_9 = #l_12_9
      if l_12_9 == 2 then
        l_12_9 = l_0_5
        l_12_10 = l_0_5
        l_12_10 = l_12_10.x
        l_12_10 = l_12_10 + l_12_4.hit_count_offset[1]
        if not l_12_10 then
          l_12_10 = 0
        end
        l_12_9.x = l_12_10
        l_12_9 = l_0_5
        l_12_10 = l_0_5
        l_12_10 = l_12_10.y
        l_12_10 = l_12_10 + l_12_4.hit_count_offset[2]
        if not l_12_10 then
          l_12_10 = 0
        end
        l_12_9.y = l_12_10
      end
    end
    l_12_9 = l_0_4
    l_12_9, l_12_10 = l_12_9:BindWorldObj, l_12_9
     -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

  end
  l_12_9(l_12_10, l_12_2.art_num_obj.go, l_12_1.model.gameObject, l_0_5, false, true, nil)
end
end

l_0_7.hide_extra_hit_area_count = function(l_13_0, l_13_1, l_13_2)
  if not l_13_2.art_num_obj then
    return 
  end
  l_0_4:UnBind(l_13_2.art_num_obj.go)
  l_0_0.recycle_art_obj(l_13_2.art_num_obj)
  l_13_2.art_num_obj = nil
end


