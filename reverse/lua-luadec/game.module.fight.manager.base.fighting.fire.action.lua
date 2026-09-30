-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.base.fighting.fire.action_8233120917423957862.bin 

local l_0_0 = require("game.other.server_time")
local l_0_1 = require("game.utils.layer_type_helper")
local l_0_2 = Game.module.skin
local l_0_3 = table.insert
local l_0_4 = TransformUtils
local l_0_5 = math.min
local l_0_6 = Vector3.zero
local l_0_7 = GameFunctions
local l_0_8 = GlobalConst
local l_0_9 = l_0_8.avatar_pos
local l_0_10 = DataConfigs
local l_0_11 = l_0_10.weapon
local l_0_12 = l_0_10.avatar_item
local l_0_13 = l_0_10.avatar_boom
local l_0_14 = assert(l_0_10.boom)
local l_0_15 = assert(l_0_10.fight_misc)
local l_0_16 = l_0_10.skill
local l_0_17 = Game.module.fight
local l_0_18 = l_0_17.ways.base
local l_0_19 = {}
local l_0_20 = {}
local l_0_21 = {}
l_0_21.func = "try_to_change_weapon"
local l_0_22 = {}
l_0_22.func = "try_to_add_unit_weapon_attack_eff"
local l_0_23 = {}
l_0_23.func = "show_or_hide_weapon_star_eff"
l_0_23.args = false
local l_0_24 = {}
l_0_24.func = "play_weapon_active_eff"
l_0_24.args = false
local l_0_25 = {}
l_0_25.func = "set_unit_weapon_active"
l_0_25.args = false
local l_0_26 = {}
l_0_26.func = "pre_create_all_related_bullets"
local l_0_27 = {}
l_0_27.func = "try_to_play_ready_fire_ani"
local l_0_28 = {}
l_0_28.func = "calculate_play_fire_camera_zoom_eff"
local l_0_29 = {}
l_0_29.func = "ultimate_camera_look_at"
local l_0_30 = {}
local l_0_31 = {}
 -- DECOMPILER ERROR: No list found. Setlist fails

 -- DECOMPILER ERROR: Overwrote pending register.

l_0_29.args, l_0_30.check_context_signs = l_0_30, l_0_31
local l_0_32 = {}
 -- DECOMPILER ERROR: Unhandled construct in list

local l_0_33 = {}
 -- DECOMPILER ERROR: Unhandled construct in list

local l_0_34 = {}
 -- DECOMPILER ERROR: Unhandled construct in list

local l_0_35 = {}
l_0_35.func, l_0_34, l_0_33, l_0_32, l_0_33, l_0_31, l_0_32, l_0_30, l_0_31 = "add_bullets_to_unit_bone", {func = "try_to_del_holding_fire_bullet"}, {func = "play_fire_ani"}, {func = "delay", args = l_0_33}, {duration = 850, check_context_signs = l_0_34}, {func = "camera_zoom", args = l_0_32}, {target_width = 6, duration = 300, check_context_signs = l_0_33}, {func = "play_camera_effect", args = l_0_31}, {tp_camera = "ui_camera", eff_id = "fire_camera_zoom".value, layer = l_0_1.LAYER_UI, local_pos = l_0_6, check_context_signs = l_0_32}
local l_0_36 = {}
l_0_36.func = "delay_bullet_born"
local l_0_37 = {}
l_0_37.func = "play_fire_effect"
local l_0_38 = {}
l_0_38.func = "detach_all_bullets"
local l_0_39 = {}
l_0_39.func = "try_to_play_fire_done_ani"
local l_0_40 = {}
l_0_40.func = "try_to_recover_ultimate_camera_offset"
local l_0_41 = {}
l_0_41.func = "camera_zoom"
local l_0_42 = {}
l_0_42.target_width = 10
l_0_42.duration = 300
local l_0_43 = {}
 -- DECOMPILER ERROR: No list found. Setlist fails

local l_0_44 = {}
l_0_44.func, l_0_43, l_0_42, l_0_41.args, l_0_42.check_context_signs = "show_or_hide_weapon_star_eff", {func = "set_unit_weapon_active", args = true}, {func = "play_weapon_active_eff", args = true}, l_0_42, l_0_43
l_0_44.args = true
local l_0_45 = {}
l_0_45.func = "try_to_remove_unit_weapon_attack_eff"
local l_0_46 = {}
l_0_46.func = "delay"
local l_0_47 = {}
l_0_47.duration = 100
l_0_46.args = l_0_47
l_0_47 = {func = "try_to_revert_weapon"}
 -- DECOMPILER ERROR: No list found. Setlist fails

l_0_22 = {func = "try_to_change_weapon"}
l_0_23 = {func = "try_to_add_unit_weapon_attack_eff"}
l_0_24 = {func = "pre_create_all_related_bullets"}
l_0_25 = {func = "try_to_play_ready_fire_ani"}
l_0_26 = {func = "calculate_play_fire_camera_zoom_eff"}
l_0_30 = "fire_camera_zoom"
l_0_29 = {l_0_30}
l_0_28 = {check_context_signs = l_0_29}
l_0_27 = {func = "ultimate_camera_look_at", args = l_0_28}
l_0_30 = l_0_15.skill_camera_fx
l_0_30 = l_0_30.value
l_0_30 = l_0_1.LAYER_UI
l_0_31 = "fire_camera_zoom"
l_0_30 = {l_0_31}
l_0_29 = {tp_camera = "ui_camera", eff_id = l_0_30, layer = l_0_30, local_pos = l_0_6, check_context_signs = l_0_30}
l_0_28 = {func = "play_camera_effect", args = l_0_29}
l_0_32 = "fire_camera_zoom"
l_0_31 = {l_0_32}
l_0_30 = {target_width = 6, duration = 300, check_context_signs = l_0_31}
l_0_29 = {func = "camera_zoom", args = l_0_30}
l_0_33 = "fire_camera_zoom"
l_0_32 = {l_0_33}
l_0_31 = {duration = 850, check_context_signs = l_0_32}
l_0_30 = {func = "delay", args = l_0_31}
l_0_31 = {func = "play_fire_ani"}
l_0_32 = {func = "delay_bullet_born"}
l_0_33 = {func = "play_fire_effect"}
l_0_34 = {func = "try_to_del_holding_fire_bullet"}
l_0_35 = {func = "create_all_bullets"}
l_0_36 = {func = "try_to_play_fire_done_ani"}
l_0_37 = {func = "try_to_recover_ultimate_camera_offset"}
l_0_41 = "fire_camera_zoom"
l_0_40 = {l_0_41}
l_0_39 = {target_width = 10, duration = 300, check_context_signs = l_0_40}
l_0_38 = {func = "camera_zoom", args = l_0_39}
l_0_39 = {func = "try_to_remove_unit_weapon_attack_eff"}
l_0_41 = {duration = 100}
l_0_40 = {func = "delay", args = l_0_41}
l_0_41 = {func = "try_to_revert_weapon"}
l_0_21 = {l_0_22, l_0_23, l_0_24, l_0_25, l_0_26, l_0_27, l_0_28, l_0_29, l_0_30, l_0_31, l_0_32, l_0_33, l_0_34, l_0_35, l_0_36, l_0_37, l_0_38, l_0_39, l_0_40, l_0_41}
l_0_23 = {func = "pre_create_all_related_bullets"}
l_0_24 = {func = "play_fire_ani"}
l_0_25 = {func = "try_to_del_holding_fire_bullet"}
l_0_26 = {func = "add_bullets_to_unit_bone"}
l_0_27 = {func = "delay_bullet_born"}
l_0_28 = {func = "play_fire_effect"}
l_0_29 = {func = "detach_all_bullets"}
l_0_22 = {l_0_23, l_0_24, l_0_25, l_0_26, l_0_27, l_0_28, l_0_29}
l_0_24 = {func = "pre_create_all_related_bullets"}
l_0_25 = {func = "play_fire_ani"}
l_0_26 = {func = "delay_bullet_born"}
l_0_27 = {func = "play_fire_effect"}
l_0_28 = {func = "try_to_del_holding_fire_bullet"}
l_0_29 = {func = "create_all_bullets"}
l_0_23 = {l_0_24, l_0_25, l_0_26, l_0_27, l_0_28, l_0_29}
l_0_26 = l_0_17.fire_action_type
l_0_26 = l_0_26.throw
l_0_26 = l_0_17.fire_action_type
l_0_26 = l_0_26.fire
l_0_25 = {l_0_26 = l_0_20, l_0_26 = l_0_21}
l_0_26 = l_0_17.fire_action_type
l_0_26 = l_0_26.throw
l_0_26 = l_0_17.fire_action_type
l_0_26 = l_0_26.fire
l_0_25 = {l_0_26 = l_0_22, l_0_26 = l_0_23}
l_0_24 = {role = l_0_25, monster = l_0_25}
l_0_26 = {func = "try_to_add_unit_weapon_attack_eff"}
l_0_27 = {func = "show_or_hide_weapon_star_eff", args = false}
l_0_28 = {func = "play_weapon_active_eff", args = false}
l_0_29 = {func = "set_unit_weapon_active", args = false}
l_0_30 = {func = "try_to_play_ready_fire_ani"}
l_0_31 = {func = "add_ultimate_bg_mask"}
l_0_33 = {duration = 330}
l_0_32 = {func = "delay", args = l_0_33}
l_0_25 = {l_0_26, l_0_27, l_0_28, l_0_29, l_0_30, l_0_31, l_0_32}
l_0_27 = {func = "del_multimate_bg_mask"}
l_0_26 = {l_0_27}
l_0_27 = function(l_1_0, l_1_1)
  local l_1_2 = l_1_0:get_ctrl_unit()
  local l_1_3 = {}
  l_1_3.cur_count = 1
  l_1_3.all_count = 1
  local l_1_4 = {}
  l_1_4.fight_way = l_1_0
  l_1_4.unit = l_1_2
  l_1_4.dest_alpha = 0.5
  l_1_4.alpha_time = 300
  l_1_4.fire_info = l_1_3
  l_1_4.fire_action_type = l_1_0:get_unit_fire_action_type(l_1_2)
  l_0_7.run_actions(l_0_19, l_0_25, l_1_4, function()
    if l_1_1 ~= nil then
      l_1_1(true)
    end
   end)
end

l_0_18.do_pre_throw_start_action = l_0_27
l_0_27 = function(l_2_0, l_2_1)
  local l_2_2 = {}
  l_2_2.fight_way = l_2_0
  l_0_7.run_actions(l_0_19, l_0_26, l_2_2, function()
    if l_2_1 ~= nil then
      l_2_1(true)
    end
   end)
end

l_0_18.do_pre_throw_ended_action = l_0_27
l_0_27 = function(l_3_0, l_3_1, l_3_2)
  local l_3_3 = l_3_0:get_unit_fire_action_type(l_3_1)
  if not l_3_3 then
    return 
  end
  local l_3_4 = l_0_17.fire_ani[l_3_3]
  if not l_3_4 then
    return 
  end
  if l_3_1.ani_trigger ~= l_3_4.fire and l_3_1.ani_trigger ~= l_3_4.ready and l_3_1.ani_trigger ~= l_3_4.holding_fire then
    if l_3_1.state ~= l_0_17.role_status.moving then
      l_3_0:set_unit_holding_fire(l_3_1, true)
      if not l_3_1.role or not l_3_1.role.cf_monster or l_3_1.role.ext_monster_ani and l_3_1.role.ext_monster_ani[l_3_4.ready] then
        l_3_0:set_unit_ani_trigger(l_3_1, l_3_4.ready)
      else
        l_3_1.move_end_holding_fire = true
      end
    end
  end
end

l_0_18.do_fire_ready_action = l_0_27
l_0_27 = function(l_4_0, l_4_1, l_4_2)
  l_4_1.move_end_holding_fire = false
  l_4_0:cancel_holding_fire_action(l_4_1)
  l_4_0:set_unit_holding_fire(l_4_1, false)
end

l_0_18.cancel_fire_ready_action = l_0_27
l_0_27 = function(l_5_0, l_5_1, l_5_2)
  if not l_5_2.show_ultimate_flag == 1 and l_5_2.cur_count == 1 and l_5_1.role ~= nil then
    return false
  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

  if l_5_0.is_group_action then
    return l_5_0:is_ctrl_unit(l_5_1)
  else
    return true
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
end

l_0_18.is_need_play_ultimate_ani = l_0_27
l_0_27 = function(l_6_0, l_6_1, l_6_2)
  local l_6_3 = l_6_0:get_unit_fire_action_type(l_6_1)
  local l_6_4 = l_6_2.fire_info.change_weapon_cfg_id
  if l_6_4 and l_6_4 ~= 0 then
    local l_6_5 = l_0_11[l_6_4]
    if l_6_5 and next(l_6_5.skin_list) then
      local l_6_6 = l_6_5.skin_list[1]
      local l_6_7 = l_0_12[l_6_6]
      if l_6_7 then
        l_6_3 = l_6_7.fire_action_type
      else
        l_6_0:fight_log_error("do_fire_action, weapon skin config not found,cf_weapon_skin_id:" .. l_6_6)
      end
    else
      l_6_0:fight_log_error("do_fire_action, weapon config not found,cf_weapon_id:" .. l_6_4)
    end
  end
  return l_6_3
end

l_0_28 = function(l_7_0, l_7_1, l_7_2)
  local l_7_3 = l_0_27(l_7_0, l_7_1, l_7_2)
  local l_7_4 = assert(l_0_24[l_7_1.type], l_7_1.type)
  local l_7_5 = assert(l_7_4[l_7_3], l_7_3)
  local l_7_6 = l_7_2.bullets[1]
  local l_7_7 = l_7_6.bullet_node.cf_bullet_id
  local l_7_8 = l_0_14[l_7_7]
  if not l_7_8 then
    l_7_0:fight_log_error("do_fire_action,cf_boom_id:{0}", l_7_7)
  end
  local l_7_9 = l_7_0:get_bullet_skin_id(l_7_1, l_7_6)
  local l_7_10 = l_0_13[l_7_9]
  if not l_7_10 then
    l_7_0:fight_log_error("create_bullet,cf_bullet_skin_id:{0}", l_7_9)
  end
  local l_7_11, l_7_12 = l_7_0:push_one_round_fire_actions, l_7_0
  local l_7_13 = l_7_1
  local l_7_14 = {}
  l_7_14.unit = l_7_1
  l_7_14.fire_info = l_7_2.fire_info
  l_7_14.bullets = l_7_2.bullets
  l_7_14.fire_action_type = l_7_3
  l_7_14.cf_bullet = l_7_8
  l_7_14.cf_bullet_skin = l_7_10
  l_7_14.fight_way = l_7_0
  l_7_14.cf_action = l_7_5
  l_7_14.is_ultimate_ani = nil
  l_7_11(l_7_12, l_7_13, l_7_14)
  l_7_1.can_firing_change_angle = true
  l_7_11, l_7_12 = l_7_0:do_next_fire_action, l_7_0
  l_7_13 = l_7_1
  l_7_11(l_7_12, l_7_13)
end

l_0_18.do_fire_action = l_0_28
l_0_28 = function(l_8_0)
  do
    local l_8_2 = l_8_0:is_multi_player_physics_env
    l_8_2 = l_8_2(l_8_0)
    if l_8_2 then
      l_8_2 = l_8_0.cur_run_time
      l_8_2 = l_8_2 * 1000
      return l_8_2
    end
    l_8_2 = l_0_0
    l_8_2 = l_8_2.get_mil_server_timer
     -- DECOMPILER ERROR: Confused at declaration of local variable

    return l_8_2()
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_29 = function(l_9_0, l_9_1, l_9_2)
  if not l_9_2.is_ultimate_ani then
    l_9_1.last_fire_time = l_0_28(l_9_0)
  end
  local l_9_3 = nil
  local l_9_4 = l_0_7.run_actions(l_0_19, l_9_2.cf_action, l_9_2, function()
    l_9_3 = true
    l_9_0:clear_round_fire_action_context(l_9_1)
    l_9_0:do_next_fire_action(l_9_1)
   end)
  if l_9_2.fire_info.all_count <= l_9_2.fire_info.cur_count then
    l_9_1.can_firing_change_angle = false
    if l_9_1.id == l_9_0.ctrl_unit_id then
      Game.events.brocast("fight_ctrl_all_bullet_fired", l_9_1)
    end
  end
  if not l_9_3 then
    l_9_0:record_round_fire_action_context(l_9_1, l_9_4)
  end
end

l_0_30 = function(l_10_0, l_10_1)
  if l_10_0:is_unit_doing_fire_action(l_10_1) then
    return 
  end
  if l_10_1.wait_for_fire then
    return 
  end
  local l_10_2 = l_10_0:pop_one_round_fire_actions(l_10_1)
  if not l_10_2 then
    return 
  end
  if l_10_2.is_ultimate_ani then
    l_0_29(l_10_0, l_10_1, l_10_2)
    return 
  end
  local l_10_3 = l_10_2.fire_info.cur_count
  if l_10_3 == 1 then
    l_0_29(l_10_0, l_10_1, l_10_2)
    return 
  end
  local l_10_4 = l_10_2.cf_bullet.attack_interval
  if l_10_0.cf_play_info.attack_interval and next(l_10_0.cf_play_info.attack_interval) then
    l_10_4 = l_10_0.cf_play_info.attack_interval
  end
  if not l_10_4[l_10_3] then
    local l_10_5 = l_10_4[#l_10_4]
  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    if l_10_5 - (l_0_28(l_10_0) - (l_10_1.last_fire_time or 0)) <= 0 then
      l_0_29(l_10_0, l_10_1, l_10_2)
      return 
    end
    l_10_1.wait_for_fire = true
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_10_0:run_after_in_this_round(l_10_5 - (l_0_28(l_10_0) - (l_10_1.last_fire_time or 0)), function()
    l_10_1.wait_for_fire = nil
    l_0_29(l_10_0, l_10_1, l_10_2)
   end)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_18.do_next_fire_action = l_0_30
l_0_30 = function(l_11_0, l_11_1)
  if not l_11_1 then
    return 
  end
  l_11_1.stop = true
  local l_11_2 = assert(l_11_1.data)
  local l_11_3 = assert(l_11_2.args)
  local l_11_4 = l_11_2.timers
  if l_11_4 then
    for l_11_8,l_11_9 in pairs(l_11_4) do
      l_11_0:del_this_round_timer(l_11_8)
    end
    l_11_2.timers = nil
  end
  local l_11_10 = assert(l_11_3.unit)
  if l_11_10.ani_trigger ~= "idle" then
    l_11_0:set_unit_ani_trigger(l_11_10, "idle")
  end
  l_11_0:camera_zoom(l_11_0:get_camera_fix_width(), 0)
  if l_11_3.is_ultimate_ani then
    l_11_0:try_to_enable_touch()
    local l_11_11 = l_11_2.id_to_camera_effects
    if l_11_11 then
      for l_11_15,l_11_16 in pairs(l_11_11) do
        l_11_0:del_camera_effect(l_11_16)
      end
      l_11_2.id_to_camera_effects = nil
    end
    local l_11_17 = l_11_2.skin
    if l_11_17 then
      l_0_2.hide_ui_skins("FightUltiSkill")
      l_11_2.skin = nil
    end
    if l_11_2.t_ult_unit_root then
      l_11_0:recycle_empty_go(l_11_2.t_ult_unit_root.gameObject)
      l_11_2.t_ult_unit_root = nil
    end
    if l_11_2.ultimate_bg_mask_load_info then
      l_11_0:dispose_load_info(l_11_2.ultimate_bg_mask_load_info)
      l_11_2.ultimate_bg_mask_load_info = nil
    end
  end
  if l_11_2.change_weapon and l_11_10.temp_cf_weapon_skin_id then
    if l_11_10.model and l_11_10.model.skin then
      local l_11_18, l_11_19 = l_11_10.model.skin:show_look, l_11_10.model.skin
      local l_11_20 = {}
      l_11_20.type = l_0_9.weapon
      l_11_20.val = l_11_10.temp_cf_weapon_skin_id
      l_11_18(l_11_19, l_11_20, nil)
    end
    l_11_0:set_unit_weapon_skin_id(l_11_10, l_11_10.temp_cf_weapon_skin_id)
    l_11_10.temp_cf_weapon_skin_id = nil
  end
end

l_0_18.clear_fire_action_context = l_0_30
l_0_30 = function(l_12_0, l_12_1, l_12_2)
  if l_12_1 <= 0 then
    l_12_2()
    return 
  end
  if not l_12_0.data.timers then
    local l_12_3, l_12_4, l_12_5, l_12_6 = {}
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_12_0.data.timers = l_12_3
   -- DECOMPILER ERROR: Overwrote pending register.

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_12_3[nil] = true
     -- DECOMPILER ERROR: Confused about usage of registers!

    return nil
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_31 = function(l_13_0, l_13_1, l_13_2, l_13_3)
  if not l_13_1.data.timers then
    local l_13_4, l_13_5, l_13_6 = {}
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_13_1.data.timers = l_13_4
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_13_4[l_13_0:run_every_in_this_round(l_13_2, function()
    l_13_3()
   end)] = true
    return l_13_0:run_every_in_this_round(l_13_2, function()
    l_13_3()
   end)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_32 = function(l_14_0, l_14_1)
  assert(l_14_0)
  local l_14_2 = l_14_0.data.signs
  if not l_14_2 then
    return true
  end
  if not l_14_1 then
    return true
  end
  for l_14_6,l_14_7 in ipairs(l_14_1) do
    if not l_14_2[l_14_7] then
      return false
    end
  end
  return true
end

l_0_33 = function(l_15_0, l_15_1, l_15_2, l_15_3)
  local l_15_4 = l_15_1.fire_info.change_weapon_cfg_id
  if not l_15_4 or l_15_4 == 0 then
    l_15_2(true)
    return 
  end
  local l_15_5 = l_15_1.unit
  local l_15_6 = assert(l_0_11[l_15_4], l_15_4)
  local l_15_7 = l_15_6.skin_list[1]
  if l_15_7 == l_15_5.cf_weapon_skin_id then
    l_15_2(true)
    return 
  end
  l_15_0.data.change_weapon = true
  l_15_5.temp_cf_weapon_skin_id = l_15_5.cf_weapon_skin_id
  l_15_1.fight_way:set_unit_weapon_skin_id(l_15_5, l_15_7)
  if not l_15_5.role then
    l_15_2(true)
    return 
  end
  local l_15_8 = l_15_5.model
  if l_15_8.loading_skin ~= false then
    l_15_2(true)
    return 
  end
  if l_15_8.skin then
    local l_15_9, l_15_10 = l_15_8.skin:show_look, l_15_8.skin
    local l_15_11 = {}
    l_15_11.type = l_0_9.weapon
    l_15_11.val = l_15_7
    l_15_9(l_15_10, l_15_11, nil)
  end
  l_15_2(true)
end

l_0_19.try_to_change_weapon = l_0_33
l_0_33 = function(l_16_0, l_16_1, l_16_2, l_16_3)
  local l_16_4 = l_16_1.fire_info.change_weapon_cfg_id
  if not l_16_4 or l_16_4 == 0 then
    l_16_2(true)
    return 
  end
  local l_16_5 = l_16_1.unit
  l_16_0.data.change_weapon = nil
  local l_16_6 = l_16_5.temp_cf_weapon_skin_id
  if l_16_6 then
    l_16_1.fight_way:set_unit_weapon_skin_id(l_16_5, l_16_6)
    l_16_5.temp_cf_weapon_skin_id = nil
  end
  if not l_16_5.role then
    l_16_2(true)
    return 
  end
  local l_16_7 = l_16_5.model
  if l_16_7.loading_skin ~= false then
    l_16_2(true)
    return 
  end
  if l_16_7.skin and l_16_6 then
    local l_16_8, l_16_9 = l_16_7.skin:show_look, l_16_7.skin
    local l_16_10 = {}
    l_16_10.type = l_0_9.weapon
    l_16_10.val = l_16_6
    l_16_8(l_16_9, l_16_10, nil)
  end
  l_16_2(true)
end

l_0_19.try_to_revert_weapon = l_0_33
l_0_33 = function(l_17_0, l_17_1, l_17_2, l_17_3)
   -- DECOMPILER ERROR: unhandled construct in 'if'

  if not l_17_3 and l_17_1.fire_info.cur_count ~= 1 then
    l_17_2(true)
    return 
    do return end
    if l_17_1.fire_info.all_count > 0 and l_17_1.fire_info.cur_count ~= l_17_1.fire_info.all_count then
      l_17_2(true)
      return 
    end
  end
  l_17_1.fight_way:set_unit_component_active(l_17_1.unit, l_0_9.weapon, l_17_3)
  l_17_2(true)
end

l_0_19.set_unit_weapon_active = l_0_33
l_0_33 = function(l_18_0, l_18_1, l_18_2, l_18_3)
   -- DECOMPILER ERROR: unhandled construct in 'if'

  if not l_18_3 and l_18_1.fire_info.cur_count ~= 1 then
    l_18_2(true)
    return 
    do return end
    if l_18_1.fire_info.cur_count ~= l_18_1.fire_info.all_count then
      l_18_2(true)
      return 
    end
  end
  local l_18_4 = l_18_1.unit
  local l_18_5 = l_18_1.fight_way
  if not l_18_5:get_unit_bone_node(l_18_4, "weapon_gd") then
    local l_18_6, l_18_7 = l_18_4.model.transform
  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    l_18_5:play_effect(l_0_15.weapon_action_fx.value, l_18_6, nil, l_0_6, l_18_5:can_play_unit_effect(l_18_4), true, nil, nil, false, true)
    l_18_2(true)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_19.play_weapon_active_eff = l_0_33
l_0_33 = function(l_19_0, l_19_1, l_19_2, l_19_3)
  if l_19_1.fire_action_type ~= l_0_17.fire_action_type.throw then
    l_19_2(true)
    return 
  end
   -- DECOMPILER ERROR: unhandled construct in 'if'

  if not l_19_3 and l_19_1.fire_info.cur_count ~= 1 then
    l_19_2(true)
    return 
    do return end
    if l_19_1.fire_info.cur_count ~= l_19_1.fire_info.all_count then
      l_19_2(true)
      return 
    end
  end
  local l_19_4 = l_19_1.unit
  if l_19_4.model and l_19_4.model.skin and l_19_4.model.skin.set_look_effect_active then
    local l_19_5, l_19_6 = l_19_4.model.skin:set_look_effect_active, l_19_4.model.skin
    local l_19_7 = GlobalConst.avatar_pos.weapon
    l_19_5(l_19_6, l_19_7, l_19_3 == true)
  end
  l_19_2(true)
end

l_0_19.show_or_hide_weapon_star_eff = l_0_33
l_0_33 = function(l_20_0, l_20_1, l_20_2)
  local l_20_3 = l_0_17.fire_ani[l_20_1.fire_action_type]
  local l_20_4 = l_20_1.unit
  if l_20_4.role and l_20_4.role.cf_monster and (not l_20_4.role.ext_monster_ani or not l_20_4.role.ext_monster_ani[l_20_3.ready]) then
    l_20_2(true)
    return 
  end
  if l_20_4.ani_trigger ~= l_20_3.fire and l_20_4.ani_trigger ~= l_20_3.ready and l_20_4.ani_trigger ~= l_20_3.holding_fire then
    l_20_1.fight_way:set_unit_ani_trigger(l_20_4, l_20_3.ready)
  end
  l_20_2(true)
end

l_0_19.try_to_play_ready_fire_ani = l_0_33
l_0_33 = function(l_21_0, l_21_1, l_21_2)
  local l_21_3 = nil
   -- DECOMPILER ERROR: Confused about usage of registers!

  if l_21_1.cf_bullet.born_delay then
    l_21_3 = l_21_1.cf_bullet.born_delay[l_21_1.fire_info.cur_count]
  end
  if l_21_3 and l_21_3 == 0 then
    l_21_2(true)
    return 
  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Overwrote pending register.

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

    if #l_21_1.unit.cf_weapon_skin.fire_action >= l_21_1.fire_info.cur_count or l_21_1.unit.cf_weapon_skin.fire_action_type ~= l_0_17.fire_action_type.throw then
      l_21_1.fight_way:set_unit_fire_ani_name(l_21_1.unit, l_21_1.unit.cf_weapon_skin.fire_action[l_21_1.fire_info.cur_count], not l_21_1.unit.cf_weapon_skin or type(l_21_1.unit.cf_weapon_skin.fire_action) ~= "table")
    end
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused about usage of registers!

  l_21_1.fight_way:set_unit_ani_trigger(l_21_1.unit, l_0_17.fire_ani[l_21_1.fire_action_type].fire)
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_21_2(true)
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_19.play_fire_ani = l_0_33
l_0_33 = function(l_22_0, l_22_1, l_22_2)
  local l_22_3 = l_22_1.unit
  local l_22_4 = l_22_1.fight_way
  local l_22_5 = nil
  if l_22_3.role then
    local l_22_6 = l_0_15.throw_boom_path.value
    l_22_5 = l_22_4:get_unit_bone_node(l_22_3, l_22_6)
  end
  local l_22_7 = 1
  if l_22_3.model then
    if not l_22_5 then
      l_22_5 = l_22_3.model.transform
    end
    l_22_7 = not l_22_3.model.skin or l_22_5 == nil or l_22_5 == l_22_3.model.transform or l_22_5 == l_22_3.model.t_skin_root or not l_22_3.model.skin or l_22_3.model.skin.scale or 1
  end
  local l_22_8 = {}
  local l_22_9 = l_22_1.bullets
  for l_22_13,l_22_14 in ipairs(l_22_9) do
    local l_22_15 = l_22_14.bullet_node.id
    local l_22_16 = l_22_4.id_to_bullet[l_22_15]
    if l_22_16 and l_22_16.transform then
      if not l_22_3.role then
        l_22_16.go:SetActive(false)
      end
      l_22_16.transform:SetParent(l_22_5)
      local l_22_17 = l_22_16.cf_skin_info.scale * 0.01 / (l_22_7)
      l_0_4.SetPS(l_22_16.transform, 0, 0, 0, l_22_17, l_22_17, l_22_17)
      l_22_4:set_bullet_in_hand(l_22_16, true)
      l_0_3(l_22_8, l_22_16)
    end
  end
  l_22_0.data.wait_fire_bullets = l_22_8
  l_22_2(true)
end

l_0_19.add_bullets_to_unit_bone = l_0_33
l_0_33 = function(l_23_0, l_23_1, l_23_2)
  local l_23_3 = 0
  local l_23_4 = l_23_1.cf_bullet.born_delay
  l_23_3 = not l_23_4 or l_23_4[l_23_1.fire_info.cur_count] or l_23_4[1] or 0
  l_0_30(l_23_0, l_23_3, function()
    l_23_2(true)
   end)
end

l_0_19.delay_bullet_born = l_0_33
l_0_33 = function(l_24_0, l_24_1, l_24_2)
  local l_24_3 = l_24_1.cf_bullet_skin
  if not l_24_3.fire_fx or l_24_3.fire_fx == 0 then
    l_24_2(true)
    return 
  end
  local l_24_4 = l_24_1.unit
  local l_24_5 = l_24_1.fight_way
  local l_24_6 = l_24_4.model
  local l_24_7 = l_24_6.transform
  if l_24_6.loading_skin == false then
    local l_24_8 = l_24_3.fire_fx_path
    if l_24_8.parent == "role" then
      l_24_7 = l_24_5:get_unit_bone_node(l_24_4, l_24_8.node_name)
    elseif l_24_8.parent == "weapon" then
      l_24_7 = l_24_5:get_unit_component_go_by_pos(l_24_4, l_0_9.weapon).transform:Find(l_24_8.node_path)
    end
    if not l_24_7 then
      l_24_5:fight_log_error("\229\173\144\229\188\185\230\140\130\231\130\185\229\188\130\229\184\184\239\188\154\229\173\144\229\188\185ID={0}, \231\137\185\230\149\136\233\133\141\231\189\174\239\188\154{1}", l_24_3.id, table_string(l_24_8, "", 20))
    end
  end
  local l_24_9 = l_24_5:can_play_unit_effect(l_24_4)
  l_24_5:play_effect(l_24_3.fire_fx, l_24_7, nil, l_0_6, l_24_9, true, nil, nil, l_24_5:is_main_eff_by_unit(l_24_4))
  l_24_2(true)
end

l_0_19.play_fire_effect = l_0_33
l_0_33 = function(l_25_0, l_25_1, l_25_2)
  local l_25_3 = l_25_1.fight_way
  local l_25_4 = l_25_0.data.wait_fire_bullets
  for l_25_8,l_25_9 in ipairs(l_25_4) do
    local l_25_10, l_25_11 = l_25_3:set_bullet_state, l_25_3
    local l_25_12 = l_25_9
    local l_25_13 = l_0_17.bullet_state.fire
    local l_25_14 = {}
    l_25_14.play_audio = l_25_8 == 1
    l_25_10(l_25_11, l_25_12, l_25_13, l_25_14)
  end
  l_25_0.data.wait_fire_bullets = nil
  l_25_2(true)
end

l_0_19.detach_all_bullets = l_0_33
l_0_33 = function(l_26_0, l_26_1, l_26_2)
  if l_26_1.fire_info.cur_count < l_26_1.fire_info.all_count then
    l_26_2(true)
    return 
  end
  local l_26_3 = l_26_1.fight_way
  local l_26_4 = l_0_17.fire_ani[l_26_1.fire_action_type]
   -- DECOMPILER ERROR: Confused while interpreting a jump as a 'while'

end
l_0_30(l_26_0, l_26_4.delay_down, function()
    if l_26_1.unit.ani_trigger ~= l_26_4.done then
      if not l_26_1.unit.role or not l_26_1.unit.role.cf_monster or not "idle" then
        local l_27_0, l_27_1 = l_26_4.done
      end
       -- DECOMPILER ERROR: Confused about usage of registers!

      l_26_3:set_unit_ani_trigger(l_26_1.unit, l_27_0)
    end
    l_26_2(true)
   end)
end

l_0_19.try_to_play_fire_done_ani = l_0_33
l_0_33 = function(l_27_0, l_27_1, l_27_2)
  local l_27_3 = l_27_1.unit
  local l_27_4 = l_27_1.fight_way
  local l_27_5 = l_27_1.bullets
  for l_27_9,l_27_10 in ipairs(l_27_5) do
    local l_27_11 = l_27_10.bullet_node.id
    local l_27_12 = l_27_4.id_to_bullet[l_27_11]
    if l_27_12 and l_27_12.transform then
      local l_27_13, l_27_14 = l_27_4:set_bullet_state, l_27_4
      local l_27_15 = l_27_12
      local l_27_16 = l_0_17.bullet_state.fire
      local l_27_17 = {}
      l_27_17.play_audio = l_27_9 == 1
      l_27_13(l_27_14, l_27_15, l_27_16, l_27_17)
    end
  end
  l_27_2(true)
end

l_0_19.create_all_bullets = l_0_33
l_0_33 = function(l_28_0, l_28_1, l_28_2, l_28_3)
  if l_28_3 == true then
    l_28_1.fight_way:try_to_enable_touch()
  else
    l_28_1.fight_way:try_to_disable_touch()
  end
  l_28_2(true)
end

l_0_19.set_is_touch_able = l_0_33
l_0_33 = function(l_29_0, l_29_1, l_29_2, l_29_3)
  assert(l_29_3)
  if not l_0_32(l_29_0, l_29_3.check_context_signs) then
    l_29_2(true)
    return 
  end
  local l_29_5 = assert(l_29_3.target_width)
  l_29_5 = l_29_5 / 10 * l_29_1.fight_way:get_camera_fix_width()
   -- DECOMPILER ERROR: Confused at declaration of local variable

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

    l_29_1.fight_way:camera_zoom(l_29_5, assert(l_29_3.duration))
    l_29_2(true)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_19.camera_zoom = l_0_33
l_0_33 = function(l_30_0, l_30_1, l_30_2, l_30_3)
  assert(l_30_3)
  if not l_0_32(l_30_0, l_30_3.check_context_signs) then
    l_30_2(true)
    return 
  end
  do
    local l_30_4, l_30_5 = l_30_3.duration or 0
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_0_30(l_30_0, l_30_4, function()
    l_30_2(true)
   end)
end

l_0_19.delay = l_0_33
l_0_33 = function(l_31_0, l_31_1, l_31_2, l_31_3)
  local l_31_4 = l_0_15.ultimate_model_bg_pos_partner.value
  if l_31_1.fight_way:is_enemy(l_31_1.unit) then
    l_31_4 = l_0_15.ultimate_model_bg_pos_enemy.value
  end
  l_31_0.data.camera_eff_pos = l_31_4
  l_31_2(true)
end

l_0_19.calculate_ultimate_model_bg_eff_pos = l_0_33
l_0_33 = function(l_32_0, l_32_1, l_32_2, l_32_3)
  assert(l_32_3)
  if not l_0_32(l_32_0, l_32_3.check_context_signs) then
    l_32_2(true)
    return 
  end
  local l_32_4 = l_32_3.eff_id
  if not l_32_0.data.camera_eff_pos then
    local l_32_5, l_32_6, l_32_8, l_32_9, l_32_11 = l_32_3.local_pos
  end
  l_32_0.data.camera_eff_pos = nil
  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

  end
  if not l_32_0.data.id_to_camera_effects then
    l_32_0.data.id_to_camera_effects = {}
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Overwrote pending register.

    do
       -- DECOMPILER ERROR: Confused at declaration of local variable

       -- DECOMPILER ERROR: Confused about usage of registers!

      if not nil then
        l_32_2(true)
        return 
      end
       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

      if l_32_5 then
        nil:SetLocalPos(l_32_5.x, l_32_5.y, l_32_5.z)
      end
       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

      if l_32_3.layer then
        nil:SetLayer(l_0_1.get_layer_int(l_32_3.layer))
      end
       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

       -- DECOMPILER ERROR: Confused about usage of registers!

      {}[nil.id] = nil
       -- DECOMPILER ERROR: Confused about usage of registers!

      l_32_2(true)
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

     -- Warning: missing end command somewhere! Added here
  end
end

l_0_19.play_camera_effect = l_0_33
l_0_33 = function(l_33_0, l_33_1, l_33_2)
  local l_33_3 = l_33_0.data
  local l_33_4 = assert(l_33_1.fight_way)
  do
    local l_33_5, l_33_7, l_33_9, l_33_10 = l_33_1.dest_alpha or 1
  do
    end
     -- DECOMPILER ERROR: Confused at declaration of local variable

  do
    end
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if not l_33_4.ultimate_bg_mask_load_info then
      l_33_4:load_asset({res_path = "Scene/Fight/CustomPrefab/UltimateBgMask.ab"})
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    if not l_33_1.wait_mask_done then
      l_33_2(true)
    end
     -- DECOMPILER ERROR: Confused about usage of registers for local variables.

  end
   -- Warning: undefined locals caused missing assignments!
end

l_0_19.add_ultimate_bg_mask = l_0_33
l_0_33 = function(l_34_0, l_34_1, l_34_2)
  local l_34_3 = l_34_1.fight_way
  if not l_34_3.ultimate_bg_mask_load_info then
    return 
  end
  l_34_3:dispose_load_info(l_34_3.ultimate_bg_mask_load_info)
  l_34_3.ultimate_bg_mask_load_info = nil
  l_34_2(true)
end

l_0_19.del_multimate_bg_mask = l_0_33
l_0_33 = function(l_35_0, l_35_1, l_35_2)
  if not l_35_0.data.signs then
    local l_35_3, l_35_4, l_35_5 = {}
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_35_0.data.signs = l_35_3
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_35_3.fire_camera_zoom = false
   -- DECOMPILER ERROR: Confused at declaration of local variable

  if l_35_1.fight_way.is_touching then
    l_35_2(true)
    return 
  end
  if not l_35_1.fire_info or l_35_1.fire_info.cur_count ~= 1 then
    l_35_2(true)
    return 
  end
   -- DECOMPILER ERROR: Confused at declaration of local variable

  if not l_35_1.unit then
    l_35_2(true)
    return 
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

   -- DECOMPILER ERROR: Confused at declaration of local variable

   -- DECOMPILER ERROR: Confused at declaration of local variable

  if l_0_16.get_config(l_35_1.unit.mutual_fire_skill_id).is_camera_focus ~= 1 then
    l_35_2(true)
    return 
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  do
     -- DECOMPILER ERROR: Confused at declaration of local variable

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

     -- DECOMPILER ERROR: Confused about usage of registers!

    if (not l_35_1.fight_way.round.cur_attacker_infos or #l_35_1.fight_way.round.cur_attacker_infos ~= 1) and not l_35_1.fight_way:is_ctrl_unit(l_35_1.unit) then
      l_35_2(true)
      return 
    end
     -- DECOMPILER ERROR: Confused about usage of registers!

    l_35_3.fire_camera_zoom = true
    l_35_2(true)
  end
   -- DECOMPILER ERROR: Confused about usage of registers for local variables.

end

l_0_19.calculate_play_fire_camera_zoom_eff = l_0_33
l_0_33 = function(l_36_0, l_36_1, l_36_2)
  if not l_36_0.data.signs then
    local l_36_3, l_36_4, l_36_5 = {}
  end
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_36_0.data.signs = l_36_3
   -- DECOMPILER ERROR: Confused about usage of registers!

  l_36_3.play_camera_zoom_eff = not l_36_1.fight_way.is_touching
  l_36_2(true)
end

l_0_19.calculate_play_camera_zoom_eff = l_0_33
l_0_33 = function(l_37_0, l_37_1, l_37_2, l_37_3)
  local l_37_4 = assert(l_37_1.unit)
  local l_37_5 = assert(l_37_1.fight_way)
  if l_37_5.is_touching then
    l_37_2(true)
    return 
  end
  if not l_0_32(l_37_0, l_37_3.check_context_signs) then
    l_37_2(true)
    return 
  end
  l_37_0.data.camera_focus_offset_x = l_37_5.camera_focus_offset_x
  l_37_0.data.camera_focus_offset_y = l_37_5.camera_focus_offset_y
  l_37_5:set_camera_focus_offset(0, 0)
  l_37_5:camera_follow_target(l_37_4.model.transform, 0.3, nil)
  l_37_2(true)
end

l_0_19.ultimate_camera_look_at = l_0_33
l_0_33 = function(l_38_0, l_38_1, l_38_2)
  local l_38_3 = l_38_0.data.camera_focus_offset_x
  local l_38_4 = l_38_0.data.camera_focus_offset_y
  if not l_38_3 and not l_38_4 then
    l_38_2(true)
    return 
  end
  l_38_1.fight_way:set_camera_focus_offset(l_38_3, l_38_4)
  l_38_2(true)
end

l_0_19.try_to_recover_ultimate_camera_offset = l_0_33
l_0_33 = function(l_39_0, l_39_1, l_39_2)
  local l_39_3 = assert(l_39_1.unit)
  local l_39_4 = assert(l_39_1.fight_way)
  l_39_4:try_to_add_unit_weapon_attack_eff(l_39_3)
  l_39_2(true)
end

l_0_19.try_to_add_unit_weapon_attack_eff = l_0_33
l_0_33 = function(l_40_0, l_40_1, l_40_2)
  if l_40_1.fire_info.all_count > 0 and l_40_1.fire_info.cur_count ~= l_40_1.fire_info.all_count then
    l_40_2(true)
    return 
  end
  local l_40_3 = assert(l_40_1.unit)
  local l_40_4 = assert(l_40_1.fight_way)
  l_40_4:try_to_remove_unit_weapon_attack_eff(l_40_3)
  l_40_2(true)
end

l_0_19.try_to_remove_unit_weapon_attack_eff = l_0_33
l_0_33 = function(l_41_0, l_41_1, l_41_2)
  local l_41_3 = assert(l_41_1.unit)
  local l_41_4 = assert(l_41_1.fight_way)
  l_41_4:try_to_del_holding_fire_bullet(l_41_3)
  l_41_2(true)
end

l_0_19.try_to_del_holding_fire_bullet = l_0_33
l_0_33 = function(l_42_0, l_42_1, l_42_2)
  local l_42_3 = l_42_1.unit
  local l_42_4 = l_42_1.fight_way
  local l_42_5 = l_42_1.bullets
  for l_42_9,l_42_10 in ipairs(l_42_5) do
    local l_42_11 = l_42_4:create_bullet(l_42_3, l_42_10)
    if l_42_11.go then
      l_42_11.go:SetActive(false)
    end
  end
  l_42_2(true)
end

l_0_19.pre_create_all_related_bullets = l_0_33
l_0_33 = function(l_43_0, l_43_1, l_43_2, l_43_3)
  if not l_43_3 then
    return 
  end
  local l_43_4 = l_43_3.audio_name
  if not l_43_4 then
    return 
  end
  l_43_1.fight_way:try_to_play_audio(l_43_4, l_43_1.unit)
  l_43_2(true)
end

l_0_19.play_audio = l_0_33
l_0_33 = function(l_44_0, l_44_1, l_44_2)
  local l_44_3 = assert(l_44_1.unit)
  local l_44_4 = assert(l_44_1.fight_way)
  local l_44_5, l_44_6 = l_44_4:set_unit_holding_fire, l_44_4
  local l_44_7 = l_44_3
  l_44_5(l_44_6, l_44_7, l_44_1.holding_fire == true)
  l_44_5 = l_44_2
  l_44_6 = true
  l_44_5(l_44_6)
end

l_0_19.try_set_unit_holding_fire = l_0_33

