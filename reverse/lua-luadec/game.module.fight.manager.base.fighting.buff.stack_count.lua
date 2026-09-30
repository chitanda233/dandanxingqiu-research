-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.buff.stack_count_3947469040785240344.bin 

local l_0_0 = UIFollowTargetMgr.instance
local l_0_1 = Game.module.art_number
local l_0_2 = Game.module.fight
local l_0_3 = l_0_2.ways.base
l_0_3.init_buff_stack_count = function(l_1_0)
  l_1_0.buff_id_to_stack_count_art_obj = {}
end

l_0_3.clear_buff_stack_count = function(l_2_0)
  for l_2_4,l_2_5 in pairs(l_2_0.buff_id_to_stack_count_art_obj) do
    l_2_0:try_to_hide_buff_stack_count_by_buff_id(l_2_4)
  end
  l_2_0.buff_id_to_stack_count_art_obj = nil
end

l_0_3.try_to_show_buff_stack_count = function(l_3_0, l_3_1)
  if not l_3_1.count then
    return 
  end
  local l_3_2 = l_3_1.cf_info.args
  if not l_3_2 then
    return 
  end
  if not l_3_2.is_show_stack_count then
    return 
  end
  local l_3_3 = l_3_1.owner
  if not l_3_3 then
    return 
  end
  if not l_3_3.model then
    return 
  end
  local l_3_4 = l_0_1.get_art_obj
  local l_3_5 = {}
  l_3_5.tp_art = "normal_atk"
  l_3_5.content = tostring(l_3_1.count)
  l_3_5.in_scene_camera = true
  l_3_4 = l_3_4(l_3_5)
  l_3_5 = l_3_0.buff_id_to_stack_count_art_obj
  l_3_5[l_3_1.id] = l_3_4
  l_3_5 = temp_vec3
  l_3_5.x = 0
  l_3_5 = temp_vec3
  l_3_5.y = l_3_3.collision_size.h_h * 2 * 0.01
  l_3_5 = temp_vec3
  l_3_5.z = 0
  l_3_5 = l_0_0
  l_3_5(l_3_5, l_3_4.go, l_3_3.model.gameObject, temp_vec3, false, true, nil)
  l_3_5 = l_3_5:BindWorldObj
end

l_0_3.try_to_update_buff_stack_count = function(l_4_0, l_4_1)
  l_4_0:try_to_hide_buff_stack_count_by_buff_id(l_4_1.id)
  l_4_0:try_to_show_buff_stack_count(l_4_1)
end

l_0_3.try_to_hide_buff_stack_count = function(l_5_0, l_5_1)
  l_5_0:try_to_hide_buff_stack_count_by_buff_id(l_5_1.id)
end

l_0_3.try_to_hide_buff_stack_count_by_buff_id = function(l_6_0, l_6_1)
  if not l_6_0.buff_id_to_stack_count_art_obj then
    return 
  end
  local l_6_2 = l_6_0.buff_id_to_stack_count_art_obj[l_6_1]
  if not l_6_2 then
    return 
  end
  if l_6_2.go then
    l_0_0:UnBind(l_6_2.go)
  end
  l_0_1.recycle_art_obj(l_6_2)
  l_6_0.buff_id_to_stack_count_art_obj[l_6_1] = nil
end


