local L0_0, L1_1, L2_2, L3_3
L0_0 = TransformUtils
local L1_1, L10_10, L11_11, L12_12, L13_13, L14_14 = table, L10_10, L11_11, L12_12, L13_13, L14_14
L1_1 = L1_1.insert
L2_2 = GameFunctions
L3_3 = DataConfigs
L10_10 = assert
L11_11 = L3_3.boom
L10_10 = L10_10(L11_11)
L11_11 = L3_3.avatar_boom
L12_12 = assert
L13_13 = L3_3.fight_misc
L12_12 = L12_12(L13_13)
L13_13 = assert
L14_14 = L3_3.misc
L13_13 = L13_13(L14_14)
L14_14 = require
local L14_14, L9_9 = L14_14("game.utils.events"), L9_9
L9_9 = Game
L9_9 = L9_9.module
L9_9 = L9_9.fight
function L9_9.ways.base.init_bullet(A0_15)
	A0_15.bullets = {}
	A0_15.id_to_bullet = {}
end
function L9_9.ways.base.clear_bullet(A0_16)
	A0_16:del_all_bullets()
	A0_16.bullets = nil
	A0_16.id_to_bullet = nil
end
function L9_9.ways.base.bullet_is_show_by_msg(A0_17, A1_18, A2_19)
	if not A0_17:ctrl_unit_can_see_this_unit(A1_18) and A2_19.bullet_node.cf_bullet_id == _ENV.bullet_cf_id.fly then
		return false
	end
	local L3_20 = L3_20
	local L3_20, L5_21 = L3_20(A0_17, A2_19), L5_21
	if L3_20 then
		L3_20 = false
		return L3_20
	end
	L3_20 = true
	return L3_20
end
;({})[L9_9.bullet_ext_type.division] = true
;({})[L9_9.bullet_ext_type.bouncing] = true
;({})[L9_9.bullet_ext_type.trident] = true
;({})[L9_9.bullet_ext_type.chain] = true
;({})[L9_9.bullet_ext_type.division_bezier] = true
;({})[L9_9.bullet_ext_type.tempest] = true
;({})[L9_9.bullet_ext_type.ball] = true
;({})[L9_9.bullet_ext_type.black_hole] = true
;({})[L9_9.bullet_ext_type.spring] = true
;({})[L9_9.bullet_ext_type.ground_rolling] = true
;({})[L9_9.bullet_ext_type.jellyfish] = true
;({})[L9_9.bullet_ext_type.spider] = true
;({})[L9_9.bullet_ext_type.refraction] = true
function L9_9.ways.base.is_the_bullet_that_need_to_be_hidden_first(A0_22, A1_23)
	local L2_24, L3_25
	L2_24 = A1_23.bullet_node
	L2_24 = L2_24.ext_arg
	if L2_24 then
		L3_25 = L2_24.belong_id
		if L3_25 then
			L3_25 = L2_24.belong_id
			if 0 < L3_25 then
				L3_25 = true
				return L3_25
			end
		end
	end
	L3_25 = false
	return L3_25
end
function L9_9.ways.base.get_bullet_skin_id(A0_26, A1_27, A2_28)
	local L3_29
	L3_29 = A2_28.bullet_node
	L3_29 = L3_29.cf_bullet_id
	return L3_29
end
function L9_9.ways.base.need_update_bullet_resistance_by_step(A0_30)
	local L1_31 = A0_30:is_physics_env()
	if L1_31 then
		L1_31 = A0_30.physics_env_drag
		L1_31 = L1_31 ~= 0
	end
	return L1_31
end
function L9_9.ways.base.get_bullet_resistance(A0_32, A1_33)
	local L2_34
	if A0_32:need_update_bullet_resistance_by_step() then
		L2_34 = A0_32.physics_env_drag * 1000 * Time.fixedDeltaTime
	else
		L2_34 = A0_32.cf_battle.air_resistance_factor * A1_33.air_resistance_factor
	end
	return L2_34
end
function L9_9.ways.base.get_bullet_mother_bullet(A0_35, A1_36)
	local L2_37, L3_38, L4_39
	L2_37 = A1_36.battle_node
	L2_37 = L2_37.bullet_node
	L2_37 = L2_37.ext_arg
	if not L2_37 then
		L3_38 = nil
		return L3_38
	end
	L3_38 = L2_37.belong_id
	if not L3_38 then
		L3_38 = nil
		return L3_38
	end
	L3_38 = L2_37.belong_id
	L4_39 = A0_35.id_to_bullet
	L4_39 = L4_39[L3_38]
	return L4_39
end
function L9_9.ways.base.create_bullet(A0_40, A1_41, A2_42)
	local L3_43
	L3_43 = A2_42.bullet_node
	local L4_44, L5_45 = L4_44, L5_45
	local L6_46 = L6_46
	L4_44 = L4_44(L5_45, L6_46, A2_42)
	L5_45 = L3_43.cf_bullet_id
	L6_46 = _ENV
	L6_46 = L6_46[L5_45]
	if not L6_46 then
		A0_40:fight_log_error("create_bullet,cf_bullet_id:{0}", L5_45)
	end
	local L7_47, L8_48 = L7_47, L8_48
	L7_47 = L7_47(L8_48, A1_41, A2_42)
	L8_48 = L5_5
	L8_48 = L8_48[L7_47]
	if not L8_48 then
		local L9_49 = L9_49
		L9_49(A0_40, "create_bullet,cf_bullet_skin_id:{0}", L7_47)
	end
	L9_49 = {}
	L9_49.id = L3_43.id
	L9_49.type = L3_43.bullet_type
	L9_49.eff_type = L3_43.eff_type
	L9_49.battle_node = A2_42
	L9_49.is_show = L4_44
	L9_49.attacker = A1_41
	L9_49.angle = L3_43.angle * 0.01
	L9_49.pos = clone(L3_43.from_pos)
	L9_49.last_pos = clone(L3_43.from_pos)
	L9_49.from_pos = L3_43.from_pos
	L9_49.cf_info = L6_46
	L9_49.cf_skin_info = L8_48
	L9_49.fly_time = 0
	L9_49.force = L3_43.force
	L9_49.perform_id = A0_40:add_perform()
	L9_49.is_partner_firer = A0_40:is_partner(A1_41)
	L9_49.collide_type = L3_43.collide_type
	L9_49.trajectory_type = L3_43.locus_type
	L9_49.bullet_scale = L3_43.bullet_scale
	L9_49.mass = L6_46.mass
	if not L3_43.v_x then
	end
	L9_49.v0_x = 0 * 0.001
	if not L3_43.v_y then
	end
	L9_49.v0_y = 0 * 0.001
	L9_49.v_x = L9_49.v0_x
	L9_49.v_y = L9_49.v0_y
	if not L3_43.a_x then
	end
	L9_49.a_x = 0 * 0.001
	if not L3_43.a_y then
	end
	L9_49.a_y = 0 * 0.001
	L9_49.world_pos = Vector2.New(0, 0)
	A0_40.land_data:land_to_world_pos(L9_49.pos.x, L9_49.pos.y, L9_49.world_pos)
	L9_49.last_world_pos = clone(L9_49.world_pos)
	L9_49.last_world_pos.x = L9_49.last_world_pos.x - L9_49.v_x * 0.1
	L9_49.last_world_pos.y = L9_49.last_world_pos.y - L9_49.v_y * 0.1
	L9_49.resistance = A0_40:get_bullet_resistance(L6_46)
	L9_49.g_resistance = A0_40.cf_battle.gravity * L6_46.gravity_factor * L6_46.mass * -1
	local L10_50 = L10_50
	L10_50 = L10_50(L9_49.world_pos)
	L9_49.origin_position = L10_50
	L10_50 = A2_42.bullet_node
	L10_50 = L10_50.ext_arg
	if L10_50 and L10_50.gen_bullet_ms then
		L9_49.wait_born_time = L10_50.gen_bullet_ms + A0_40.cur_fixed_deltatime * 1000
	end
	if L9_49.type == _UPVALUE2_.tempest then
		L9_49.wait_born_time = L6_6.tempest_bullet_wait_born_time.value
	elseif L9_49.type == _UPVALUE2_.jellyfish then
		if A0_40:is_physics_env() then
			L9_49.wait_born_time = 0
		else
			L9_49.wait_born_time = A2_42.bullet_node.ext_arg.gen_bullet_ms + A0_40.cur_fixed_deltatime * 1000
		end
	elseif L9_49.type == _UPVALUE2_.spider then
		({}).x = A2_42.bullet_node.ext_arg.edge_x
		L9_49.edge, ({}).y = {}, A2_42.bullet_node.ext_arg.edge_y
	end
	L1_1(A0_40.bullets, L9_49)
	A0_40.id_to_bullet[L9_49.id] = L9_49
	if not A0_40:is_the_bullet_that_need_to_be_hidden_first(A2_42) then
		A0_40:new_bullet_skin(L9_49)
	end
	local L11_51 = L11_51
	L11_51 = L11_51(A0_40, L9_49)
	if L9_49.type == L9_9.bullet_ext_type.division then
		if L11_51 and L11_51.battle_node.bullet_node.boom_pos then
			L9_49.mother_boom_pos = L11_51.battle_node.bullet_node.boom_pos
		end
	elseif L9_49.type == L9_9.bullet_ext_type.fire_wheel then
		if L11_51 then
			L11_51.should_remove = true
		end
		A0_40:try_to_add_bullet_link(L9_49)
	end
	A0_40:set_bullet_state(L9_49, L9_9.bullet_state.idle)
	local L15_55 = L15_55
	L15_55 = L8_8
	L15_55 = L15_55.brocast
	local L13_53 = L13_53
	L15_55(L13_53, L9_49)
	local L14_54 = L14_54
	return L9_49
end
function L9_9.ways.base.new_bullet_skin(A0_56, A1_57)
	local L2_58, L3_59 = L2_58, L3_59
	local L2_58, L3_59, L4_60 = L2_58(L3_59, A1_57)
	L4_60 = L2_58.transform
	L4_60:SetParent(A0_56.t_bullet_root)
	_ENV.ResetPSR(L4_60)
	L4_60.position = A1_57.world_pos
	if not L3_59 or not L2_58 then
	end
	A1_57.physics_go = nil
	A1_57.go = L2_58
	A1_57.transform = L4_60
	A1_57.go_asset = nil
	A1_57.t_asset = nil
	A1_57.go:SetActive(A1_57.is_show)
	if L3_59 then
		A0_56:bullet_skin_extra_deal_on_physic_env(A1_57)
	end
	A0_56:init_changgan_bullet_rotate(A1_57)
	local L5_61, L6_62 = L5_61, L6_62
	L5_61(L6_62, A1_57)
	local L7_63 = L7_63
end
function L9_9.ways.base.bullet_skin_extra_deal_on_physic_env(A0_64, A1_65)
	local L2_66
	L2_66 = A1_65.go
	if not L2_66 then
		return
	end
	A1_65.comp_scene_obj = L2_66:GetComponent(typeof(Box2DBodyBullet))
	A1_65.comp_scene_obj.objID = A1_65.id
	A1_65.comp_scene_obj.ownerObjID = A1_65.attacker.id
	if A1_65.eff_type == _ENV.hook_rope then
		A1_65.comp_scene_obj.enableBoom = false
	else
		A1_65.comp_scene_obj.enableBoom = true
	end
	A1_65.comp_scene_obj:SetBoomParameters(200, 500, A1_65.cf_info.physics_time_factor)
	A1_65.comp_scene_obj:SetCollisionCategory(CollisionCategory.Bullet)
	Box2DManager.Instance:RegisterBody(A1_65.comp_scene_obj)
	A1_65.comp_scene_obj:MovePosition(A1_65.world_pos.x, A1_65.world_pos.y, true, false)
	local L8_72 = L8_72
	L8_72 = A1_65.comp_scene_obj
	L8_72 = L8_72.SetIsSimulated
	local L4_68 = L4_68
	L8_72(L4_68, false)
	L8_72 = A1_65.comp_scene_obj
	L8_72 = L8_72.fixtures
	L4_68 = L8_72.Count
	_FOR_ = 1
	for _FORV_8_ = _FOR_, _FOR_, _FOR_ do
		if not A1_65.cf_info.density then
		end
		L8_72[_FORV_8_].density = 150
	end
	L10_74 = A0_64.update_bullet_collision_masks_on_physic_env
	L10_74(A0_64, A1_65)
	L10_74 = A0_64.update_bullet_ignore_collision_obj_types_on_physic_env
	local L6_70 = L6_70
	L10_74(L6_70, A1_65)
	local L7_71 = L7_71
end
function L9_9.ways.base.update_bullet_ignore_collision_obj_types_on_physic_env(A0_75, A1_76)
	local L2_77
	L2_77 = A1_76.comp_scene_obj
	if not L2_77 then
		return
	end
	L2_77 = {}
	L7_82 = _ENV
	L7_82(L2_77, OBJ_TYPE.Bullet)
	L7_82 = _ENV
	L7_82(L2_77, OBJ_TYPE.Wind)
	L7_82 = _ENV
	L7_82(L2_77, OBJ_TYPE.Chain)
	L7_82 = A1_76.comp_scene_obj
	L7_82 = L7_82.SetIgnoreTypes
	L7_82(L6_81, unpack(L2_77))
	L7_82 = A0_75.need_ignore_bullet_boom_obj_ids
	if L7_82 then
		L7_82 = ipairs
		L6_81 = A0_75.need_ignore_bullet_boom_obj_ids
		L7_82, L6_81, _FOR_ = L7_82(L6_81)
		for _FORV_6_, _FORV_7_ in L7_82, L6_81, _FOR_ do
			A1_76.comp_scene_obj:AddIgnoreObjID(_FORV_7_)
		end
	end
end
function L9_9.ways.base.update_bullet_collision_masks_on_physic_env(A0_86, A1_87)
	local L2_88, L3_89
	L2_88 = A1_87.comp_scene_obj
	if not L2_88 then
		return
	end
	L2_88 = {}
	L3_89 = A1_87.collide_type
	if L3_89 == _ENV.collide_type.none then
		L1_1(L2_88, CollisionCategory.None)
	elseif L3_89 == _ENV.collide_type.monster_place_land then
		L1_1(L2_88, CollisionCategory.Monster)
		L1_1(L2_88, CollisionCategory.Placement)
		L1_1(L2_88, CollisionCategory.Land)
		L1_1(L2_88, CollisionCategory.Wind)
		L1_1(L2_88, CollisionCategory.Obstacle)
		L1_1(L2_88, CollisionCategory.Chain)
	elseif L3_89 == _ENV.collide_type.land then
		L1_1(L2_88, CollisionCategory.Land)
		L1_1(L2_88, CollisionCategory.Wind)
		L1_1(L2_88, CollisionCategory.Obstacle)
		L1_1(L2_88, CollisionCategory.Chain)
	elseif L3_89 == _ENV.collide_type.unit then
		L1_1(L2_88, CollisionCategory.Monster)
		L1_1(L2_88, CollisionCategory.Placement)
		L1_1(L2_88, CollisionCategory.Role)
		L1_1(L2_88, CollisionCategory.Wind)
		L1_1(L2_88, CollisionCategory.Chain)
	elseif L3_89 == _ENV.collide_type.target_unit then
		if A1_87.type == _UPVALUE2_.division_bezier then
			L1_1(L2_88, CollisionCategory.None)
		else
			L1_1(L2_88, CollisionCategory.None)
			if not (A1_87.battle_node.bullet_node.ext_arg and A1_87.battle_node.bullet_node.ext_arg.tar_obj_id) then
				goto lbl_180
			end
			A1_87.comp_scene_obj.targetObjID = A1_87.battle_node.bullet_node.ext_arg.tar_obj_id
			if not A0_86:get_unit_by_id(A1_87.battle_node.bullet_node.ext_arg.tar_obj_id) then
				goto lbl_180
			end
			if A0_86:get_unit_by_id(A1_87.battle_node.bullet_node.ext_arg.tar_obj_id).type == "monster" then
				L1_1(L2_88, CollisionCategory.Monster)
			elseif A0_86:get_unit_by_id(A1_87.battle_node.bullet_node.ext_arg.tar_obj_id).type == "placement" then
				L1_1(L2_88, CollisionCategory.Placement)
			else
				if A0_86:get_unit_by_id(A1_87.battle_node.bullet_node.ext_arg.tar_obj_id).type ~= "role" then
					goto lbl_180
				end
				L1_1(L2_88, CollisionCategory.Role)
				local L8_94 = L8_94
				repeat
					do break end -- pseudo-goto
					L8_94 = L1_1
					L8_94(L2_88, CollisionCategory.All)
				until true
			end
		end
	end
	::lbl_180::
	L8_94 = next
	L8_94 = L8_94(L2_88)
	if L8_94 then
		L8_94 = A1_87.type
		if L8_94 == _ENV.bullet_ext_type.fire_wheel then
			L8_94 = {}
			L2_88 = L8_94
			L8_94 = L1_1
			local L5_91 = L5_91
			L8_94(L5_91, CollisionCategory.None)
		end
		L8_94 = A1_87.comp_scene_obj
		L5_91 = L8_94
		L8_94 = L8_94.SetCollisionMask
		local L6_92 = L6_92
		local L6_92, L7_93 = L6_92(L2_88)
		L8_94(L5_91, L6_92, L7_93, L6_92(L2_88))
	end
end
function L9_9.ways.base.new_bullet_go(A0_95, A1_96)
	if A0_95:is_physics_env() then
		return A0_95:get_physics_go("bullet"), true
	else
		local L2_97, L3_98 = L2_97, L3_98
		local L5_100 = "bullet" .. A1_96.id
		L2_97 = L2_97(L3_98, L5_100)
		L3_98 = false
		return L2_97, L3_98
	end
end
function L9_9.ways.base.try_to_load_bullet_asset(A0_101, A1_102)
	if not A0_101:is_need_create_bullet_skin(A1_102) then
		return
	end
	A0_101:load_bullet_asset(A1_102)
	local L4_103 = L4_103
end
function L9_9.ways.base.load_bullet_asset(A0_104, A1_105)
	local L2_106
	L2_106 = {}
	L2_106.res_path = A0_104:get_bullet_res_path(A1_105.cf_skin_info)
	function L2_106.cb(A0_117)
		_ENV.go_asset = A0_117
		_ENV.t_asset = A0_117.transform
		_ENV.t_asset:SetParent(_ENV.transform)
		local L1_118 = L1_118
		L1_118(A0_117, true)
		L1_118 = _ENV
		L1_118 = L1_118.cf_skin_info
		L1_118 = L1_118.scale
		L1_118 = L1_118 * 0.01
		if _ENV.bullet_scale ~= nil and _ENV.bullet_scale ~= 0 then
			L1_118 = L1_118 * _ENV.bullet_scale * 1.0E-4
		end
		local L6_123 = L6_123
		local L7_124 = L7_124
		local L8_125 = L8_125
		local L9_126 = L9_126
		local L10_127 = L10_127
		local L11_128 = L11_128
		L6_123(L7_124, L8_125, L9_126, L10_127, L11_128, L1_118, L1_118, 0, 0, 0)
		local L12_129 = L12_129
		L6_123 = _ENV
		L6_123 = L6_123.is_partner_firer
		if not L6_123 then
			L6_123 = A0_104
			L7_124 = L6_123
			L6_123 = L6_123.try_to_set_go_war_fog_layer
			L8_125 = A0_117
			L6_123(L7_124, L8_125)
		end
		L6_123 = L2_2
		L6_123 = L6_123.replay_particlesystem
		L7_124 = A0_117
		L6_123(L7_124)
		L6_123 = A0_104
		L7_124 = L6_123
		L6_123 = L6_123.set_bullet_in_hand
		L8_125 = _ENV
		L9_126 = _ENV
		L9_126 = L9_126.is_in_hand
		L6_123(L7_124, L8_125, L9_126)
		L6_123 = _ENV
		L6_123 = L6_123.is_in_hand
		if not L6_123 then
			L6_123 = A0_104
			L7_124 = L6_123
			L6_123 = L6_123.try_to_attach_all_effects_to_bullet
			L8_125 = _ENV
			L6_123(L7_124, L8_125)
		end
	end
	A1_105.load_info = L2_106
	A0_104:load_asset(L2_106)
	local L3_107 = L3_107
	L3_107 = L3_107(A0_104, A1_105.attacker)
	local L4_108 = L4_108
	L4_108 = L4_108(A0_104, L3_107)
	local L5_109, L6_110 = L5_109, L6_110
	L5_109, L6_110 = L5_109(L6_110, L3_107)
	local L7_111 = L7_111
	local L8_112 = L8_112
	local L9_113 = L9_113
	if not L4_108 then
	end
	local L10_114 = L10_114
	if not L5_109 then
	end
	local L11_115 = L11_115
	if not L6_110 then
	end
	L7_111(L8_112, L9_113, L10_114, L11_115, 9)
	local L12_116 = L12_116
end
function L9_9.ways.base.get_bullet_res_pool_capacity(A0_130, A1_131)
	local L2_132, L3_133
	L2_132 = 10
	L3_133 = 9
	return L2_132, L3_133
end
function L9_9.ways.base.get_bullet_res_clean_pool_interval(A0_134, A1_135)
	return 120
end
function L9_9.ways.base.set_bullet_in_hand(A0_136, A1_137, A2_138)
	local L3_139
	A1_137.is_in_hand = A2_138
	L3_139 = A1_137.t_asset
	if not L3_139 then
		return
	end
	L3_139 = A1_137.cf_skin_info
	L3_139 = L3_139.rotate_offset
	if A2_138 then
		L3_139 = A1_137.cf_skin_info.rotate_offset_in_hand
	end
	if not L3_139 then
		return
	end
	if IsObjNil(A1_137.t_asset) then
		return
	end
	local L4_140 = L4_140
	local L5_141 = L5_141
	local L6_142 = L6_142
	local L7_143 = L7_143
	L4_140(L5_141, L6_142, L7_143, L3_139.z)
	local L8_144 = L8_144
end
function L9_9.ways.base.is_bullet_critical(A0_145, A1_146)
	local L5_150, L2_147 = A1_146, L2_147
	L2_147(L5_150)
	L2_147 = A1_146.battle_node
	L2_147 = L2_147.processings
	if not L2_147 then
		L5_150 = false
		return L5_150
	end
	L5_150 = pairs
	L6_151 = L2_147
	L5_150, L6_151, L7_152 = L5_150(L6_151)
	for L8_153, _FORV_7_ in L5_150, L6_151, L7_152 do
		if _FORV_7_.is_dmg_critical then
			return true
		end
	end
	L5_150 = false
	return L5_150
end
function L9_9.ways.base.is_need_create_bullet_skin(A0_154, A1_155)
	local L2_156
	L2_156 = A0_154.is_reconnecting_from_replay
	if L2_156 then
		L2_156 = false
		return L2_156
	end
	L2_156 = true
	return L2_156
end
