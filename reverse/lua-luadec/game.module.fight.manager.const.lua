-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua4_573711\game.module.fight.manager.const_-4675006337339581731.bin 

local l_0_0 = import(".head")
local l_0_1 = {}
l_0_1.normal = 0
l_0_1.watch = 1
l_0_1.playback = 2
l_0_0.client_type = l_0_1
l_0_1 = {right = 1, left = 2, up = 3, down = 4}
l_0_0.role_directions = l_0_1
l_0_1 = {idle = 1, moving = 2, falling = 3, target_falling = 4, blowing = 6, push_out_land = 7, hook_rope = 8}
l_0_0.role_status = l_0_1
l_0_1 = {l_0_0.role_status.idle = "idle", l_0_0.role_status.moving = "moving", l_0_0.role_status.falling = "falling", l_0_0.role_status.target_falling = "target_falling", l_0_0.role_status.blowing = "blowing", l_0_0.role_status.push_out_land = "push_out_land", l_0_0.role_status.hook_rope = "hook_rope"}
l_0_0.role_status_str = l_0_1
l_0_1 = {role = 1, monster = 2, robot = 3, placement = 4, pet = 5, partner = 6}
l_0_0.unit_type = l_0_1
l_0_1 = {l_0_0.unit_type.role = "role", l_0_0.unit_type.monster = "monster", l_0_0.unit_type.robot = "role", l_0_0.unit_type.placement = "placement", l_0_0.unit_type.pet = "pet", l_0_0.unit_type.partner = "partner"}
l_0_0.unit_type_name = l_0_1
l_0_1 = {fire = 1, freeze = 2, hole = 3, thaw = 4, position = 5, visible = 6, clean = 7}
l_0_0.command = l_0_1
l_0_1 = {jihuo = 101, move = 102, skill = 103, land = 201, ctrl = 202}
l_0_0.commander_action = l_0_1
l_0_1 = {action = 1, yuanzhu = 2}
l_0_0.commander_action_type = l_0_1
l_0_1 = {action = 1, power = 2, watch = 3, fire_done = 4, pet_action = 5, done = 6}
l_0_0.unit_round_status = l_0_1
local l_0_2 = {}
l_0_2[l_0_1.action] = "action"
l_0_2[l_0_1.power] = "power"
l_0_2[l_0_1.watch] = "watch"
l_0_2[l_0_1.fire_done] = "fire_done"
l_0_2[l_0_1.pet_action] = "pet_action"
l_0_2[l_0_1.done] = "done"
l_0_0.unit_round_status_str = l_0_2
l_0_2 = {normal = 1, wait_done = 2, done = 3}
l_0_0.round_perform_status = l_0_2
local l_0_3 = {}
l_0_3[l_0_2.normal] = "normal"
l_0_3[l_0_2.wait_done] = "wait_done"
l_0_3[l_0_2.done] = "done"
l_0_0.round_perform_status_str = l_0_3
l_0_3 = {idle = 1, falling = 2}
l_0_0.tomb_status = l_0_3
l_0_3 = {highest = 0, high = 1, normal = 2, low = 3, lowest = 4}
l_0_0.load_priority = l_0_3
l_0_3 = {default = 0, manual = 10, btree = 20, force = 999}
l_0_0.camera_priority = l_0_3
l_0_3 = {throw = 2, fire = 1}
l_0_0.fire_action_type = l_0_3
local l_0_4 = {}
local l_0_5 = l_0_3.throw
local l_0_6 = {}
l_0_6.ready = "ready_throw"
l_0_6.ready_duration = 300
l_0_6.holding_fire = "ready_throw"
l_0_6.holding_fire_power = "power_throw_power"
l_0_6.fire = "throw"
l_0_6.delay_down = 300
l_0_6.done = "finish_throw"
l_0_4[l_0_5] = l_0_6
l_0_5 = l_0_3.fire
l_0_6 = {ready = "ready_attack", ready_duration = 300, holding_fire = "ready_attack", holding_fire_power = "power_attack_power", fire = "attack", delay_down = 300, done = "finish_attack"}
l_0_4[l_0_5] = l_0_6
l_0_0.fire_ani = l_0_4
l_0_4 = {start = 1, moving = 2, stop = 3}
l_0_0.move_option = l_0_4
l_0_4 = {freeze = 1, stealth = 2, avoid_hole = 3, imprison = 4, silent = 6, forbid_recover_energy = 7, avoid_hurt = 8, charge = 9, lock_updown = 10, dizziness = 13, immobilized = 18, immune_add_buff = 19, skill_unselectable = 20, black_hole = 21, forbid_add_delay = 22, be_taunted = 23}
l_0_4.avoid_skill = 24
l_0_4.move_lift = 26
l_0_4.move_ground_paste = 27
l_0_4.expel = 29
l_0_4.lock_target = 30
l_0_4.forbid_move = 31
l_0_4.aim_type_2 = 32
l_0_4.aim_type_no = 33
l_0_4.fire_dance_shining = 37
l_0_4.fly_free = 39
l_0_4.hit_fly_preview = 40
l_0_4.continue_fire = 41
l_0_4.power_blackbox = 43
l_0_4.power_radar = 44
l_0_4.hide_hp = 10000
l_0_4.recommend_force_no_wind = 10001
l_0_4.butterfly = 10002
l_0_4.cant_trigger_hit_fly_again = 10003
l_0_4.cant_trigger_hit_fly = 10004
l_0_4.show_snowman_progress = 10005
l_0_4.snowball_target = 10006
l_0_4.sound_wave = 10007
l_0_0.buff_states = l_0_4
l_0_5 = l_0_0.buff_states
l_0_5 = l_0_5.freeze
l_0_5 = l_0_0.buff_states
l_0_5 = l_0_5.dizziness
l_0_5 = l_0_0.buff_states
l_0_5 = l_0_5.expel
l_0_4 = {l_0_5 = true, l_0_5 = true, l_0_5 = true}
l_0_0.forbid_round_action_buff_states = l_0_4
l_0_4 = {none = 0, positive = 1, negative = 2, control = 3, force_control = 4}
l_0_0.buff_type = l_0_4
l_0_0.processing_type, l_0_4 = l_0_4, {normal = 1, fly = 2, freeze = 3, blink = 4, tornado = 5, suicide = 6, leave = 7, hole = 8, segmentation = 9, relive = 10, move = 11, blowing = 12, air_drop = 13, hook_rope = 15, move_ground_paste = 16, pet_flash = 17}
l_0_4 = {quick = 1, magic = 2, normal = 3, cure = 4, avoid_hurt = 7}
l_0_0.dmg_type = l_0_4
l_0_0.power_accurate_num = 8000
l_0_4 = {burning = 1, bleed = 2, electric_flow = 3, laser = 4}
l_0_0.dmg_from = l_0_4
l_0_4 = {bullet = 1, skill = 2}
l_0_0.dmg_from_type = l_0_4
l_0_4 = {manual = 1, timeout = 2, timeout_no_op = 3}
l_0_0.const_pass_type = l_0_4
l_0_4 = {disable = 0, able = 1, die = 2, pass = 3}
l_0_0.const_quit_type = l_0_4
l_0_4 = {1 = "strength", 2 = "energy", 3 = "anger", 4 = "wakan"}
l_0_0.const_attr_str = l_0_4
l_0_4 = {wakan = true}
l_0_0.attr_str_belong_soul = l_0_4
l_0_4 = {star = 1, probe = 2, smoke = 8, fog = 9, radar = 10, transfer_from = 100, transfer_to = 101}
l_0_0.placement_spec_type = l_0_4
l_0_4 = {fire = -1, use_skill_cost = -2, move = -100, sync_pos = -101}
l_0_4.update_dir = -102
l_0_4.bullet = 1
l_0_4.skill = 2
l_0_4.passive_skill = 3
l_0_4.other = 100
l_0_4.fire_wheel_bullet_remove = 101
l_0_0.node_type = l_0_4
l_0_4 = {config = 1, skill = 2, pet = 3, ultimate_skill = 4}
l_0_4.equip = 5
l_0_4.pet_exchange = 6
l_0_4.weapon = 7
l_0_4.monster = 9
l_0_4.monster_hide = 10
l_0_4.pick = 100
l_0_0.skill_source = l_0_4
l_0_4 = {pet_exchange = 8}
l_0_0.skill_id_const = l_0_4
l_0_4 = {tempest = 7, jump = 31, copy = 61, laser = 65, thunder = 69}
l_0_0.skill_effect_id = l_0_4
l_0_4 = "weapon_camp_passive_icon"
l_0_6 = 1501
l_0_6 = 1502
l_0_6 = 1503
l_0_5 = {l_0_6 = "weapon_img_tuji", l_0_6 = "weapon_img_yineng", l_0_6 = "weapon_img_gongcheng"}
l_0_0[l_0_4] = l_0_5
l_0_4 = "bullet_cf_id"
l_0_6 = 2001
l_0_6 = 2002
l_0_5 = {fly = l_0_6, freeze = l_0_6}
l_0_0[l_0_4] = l_0_5
l_0_4 = "bullet_eff_type"
l_0_6 = 0
l_0_6 = 1
l_0_6 = 2
l_0_6 = "signal"
l_0_6 = "holy_orb"
l_0_6 = 6
l_0_5 = {normal = l_0_6, fly = l_0_6, freeze = l_0_6, l_0_6 = 4, l_0_6 = 5, hook_rope = l_0_6}
l_0_0[l_0_4] = l_0_5
l_0_4 = "bullet_ext_type"
l_0_6 = 0
l_0_6 = "guide"
l_0_6 = "division"
l_0_6 = "bouncing"
l_0_5 = {normal = l_0_6, l_0_6 = 1, l_0_6 = 2, l_0_6 = 3}
l_0_6 = "trident"
l_0_5[l_0_6] = 4
l_0_6 = "chain"
l_0_5[l_0_6] = 5
l_0_6 = "division_bezier"
l_0_5[l_0_6] = 6
l_0_6 = 7
l_0_5.tempest = l_0_6
l_0_6 = "ball"
l_0_5[l_0_6] = 8
l_0_6 = 9
l_0_5.black_hole = l_0_6
l_0_6 = "spring"
l_0_5[l_0_6] = 10
l_0_6 = "ground_rolling"
l_0_5[l_0_6] = 11
l_0_6 = "jellyfish"
l_0_5[l_0_6] = 12
l_0_6 = "spider"
l_0_5[l_0_6] = 13
l_0_6 = "refraction"
l_0_5[l_0_6] = 14
l_0_6 = "fire_wheel"
l_0_5[l_0_6] = 15
l_0_6 = "transfer_gate"
l_0_5[l_0_6] = 16
l_0_0[l_0_4] = l_0_5
l_0_4 = "bullet_state"
l_0_6 = 1
l_0_6 = 2
l_0_6 = 3
l_0_5 = {idle = l_0_6, fire = l_0_6, falling = l_0_6}
l_0_0[l_0_4] = l_0_5
l_0_4 = "bullet_status_str"
l_0_6 = "bullet_state"
l_0_6 = l_0_0[l_0_6]
l_0_6 = l_0_6.idle
l_0_6 = "bullet_state"
l_0_6 = l_0_0[l_0_6]
l_0_6 = l_0_6.fire
l_0_6 = "bullet_state"
l_0_6 = l_0_0[l_0_6]
l_0_6 = l_0_6.falling
l_0_5 = {l_0_6 = "idle", l_0_6 = "fire", l_0_6 = "falling"}
l_0_0[l_0_4] = l_0_5
l_0_4 = "trajectory_type"
l_0_6 = "parabola"
l_0_6 = "line"
l_0_6 = "bezier"
l_0_6 = "normal_parabola"
l_0_6 = "ground_rolling"
l_0_6 = "ground_paste"
l_0_5 = {l_0_6 = 1, l_0_6 = 2, l_0_6 = 3, l_0_6 = 4, l_0_6 = 5, l_0_6 = 6}
l_0_0[l_0_4] = l_0_5
l_0_4 = "soul_status"
l_0_6 = 1
l_0_6 = 2
l_0_5 = {idle = l_0_6, moving = l_0_6}
l_0_0[l_0_4] = l_0_5
l_0_4 = "skill_proto_type"
l_0_6 = "max"
l_0_6 = 1005
l_0_6 = 1009
l_0_6 = 1001
l_0_5 = {l_0_6 = 109, fly = l_0_6, clean = l_0_6, freeze = l_0_6}
l_0_0[l_0_4] = l_0_5
l_0_4 = "skill_pos"
l_0_6 = 101
l_0_5 = {fly = l_0_6}
l_0_0[l_0_4] = l_0_5
l_0_4 = "drop_type"
l_0_6 = 1
l_0_6 = 2
l_0_6 = "gain"
l_0_5 = {equip = l_0_6, skill = l_0_6, l_0_6 = 3}
l_0_0[l_0_4] = l_0_5
l_0_4 = "gain_type"
l_0_6 = "shield"
l_0_5 = {l_0_6 = 1}
l_0_0[l_0_4] = l_0_5
l_0_4 = "shield_type"
l_0_6 = 1
l_0_6 = "invincible"
l_0_5 = {normal = l_0_6, l_0_6 = 2}
l_0_0[l_0_4] = l_0_5
l_0_4 = "shield_overlap_type"
l_0_6 = "add_level"
l_0_5 = {l_0_6 = 3}
l_0_0[l_0_4] = l_0_5
l_0_4 = "score_id"
l_0_6 = "wave"
l_0_6 = "build_snowman"
l_0_6 = "score_camp_1"
l_0_6 = "score_camp_2"
l_0_5 = {l_0_6 = 200, l_0_6 = 225001, l_0_6 = 1001, l_0_6 = 1002}
l_0_0[l_0_4] = l_0_5
l_0_4 = "drop_status"
l_0_6 = "create"
l_0_6 = "leap"
l_0_6 = "wait_pick_up"
l_0_6 = "pick_up"
l_0_5 = {l_0_6 = "create", l_0_6 = "leap", l_0_6 = "wait_pick_up", l_0_6 = "pick_up"}
l_0_0[l_0_4] = l_0_5
l_0_4 = "drop_gravity"
l_0_5 = 4905
l_0_0[l_0_4] = l_0_5
l_0_4 = "play_speed_to_time_scale_per_frame"
l_0_6 = 1
l_0_6 = 2
l_0_5 = {l_0_6 = 1, l_0_6 = 1}
l_0_0[l_0_4] = l_0_5
l_0_4 = DataConfigs
l_0_5 = "fight_misc"
l_0_4 = l_0_4[l_0_5]
l_0_5 = "fight_speed"
l_0_4 = l_0_4[l_0_5]
l_0_5 = "value"
l_0_4 = l_0_4[l_0_5]
l_0_5 = "play_speed_to_animation_time_scale"
l_0_6 = {}
l_0_0[l_0_5] = l_0_6
if l_0_4 then
  l_0_5 = pairs
  l_0_6 = l_0_4
  l_0_5 = l_0_5(l_0_6)
  for i_1,i_2 in l_0_5 do
    local l_0_10 = l_0_0.play_speed_to_animation_time_scale
    local l_0_11 = l_0_9[1]
    l_0_10[l_0_11] = l_0_9[2]
  end
else
  log_error("~~~~~~~~~~~~fight_misc\232\161\168\231\188\186\229\164\177\233\133\141\231\189\174fight_speed")
end
 -- DECOMPILER ERROR: Confused at declaration of local variable

 -- DECOMPILER ERROR: Confused at declaration of local variable

local l_0_14 = "frog"
l_0_0.const_battle_env, l_0_14 = {l_0_14 = 3, none = l_0_14}, 6
l_0_14 = 1
l_0_14 = 2
l_0_14 = 4
l_0_0.collide_type, l_0_14 = {none = 0, all = l_0_14, monster_place_land = l_0_14, land = 3, unit = l_0_14, target_unit = l_0_14}, 100
do
  local l_0_15 = "assassin"
   -- DECOMPILER ERROR: Overwrote pending register.

   -- DECOMPILER ERROR: Overwrote pending register.

   -- DECOMPILER ERROR: Overwrote pending register.

   -- DECOMPILER ERROR: Overwrote pending register.

  l_0_0.brawl_identity, l_0_14, l_0_15 = l_0_14, {l_0_15 = 1, l_0_15 = 2, l_0_15 = 3, suicide = l_0_15, l_0_15 = 5, l_0_15 = 6}, "guard"
  l_0_0.role_spec_kv, l_0_14 = l_0_14, 401001
   -- DECOMPILER ERROR: Overwrote pending register.

   -- DECOMPILER ERROR: Overwrote pending register.

  l_0_0.spec_kv_type, l_0_14, l_0_15 = l_0_14, {l_0_15 = 119001, l_0_15 = 119002, l_0_15 = 119003}, "javelin_fight_bullet_total_count"
  return l_0_0
end
 -- DECOMPILER ERROR: Confused about usage of registers for local variables.


