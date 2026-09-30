-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: reverse\lua-bytecode\lua2_573512\game.module.main_weapon_develop.manager.const_8548236632900169532.bin 

local l_0_0 = import(".head")
local l_0_1 = l_0_0.const
l_0_1.template_url = "serverlists/announcement/%s"
l_0_1.job_tag = DataConfigs.misc.weapon_job_name.val
l_0_1.equip_tag_color = {}
local l_0_2 = DataConfigs.weapon_tag
for l_0_6,l_0_7 in pairs(l_0_2.get_all_cfg()) do
  local l_0_8 = l_0_1.equip_tag_color
  local l_0_9 = l_0_7.id
  l_0_8[l_0_9] = l_0_7.color
end
l_0_1.max_weapon_num = 5
l_0_1.weapon_pos = 1
do
  local l_0_10 = {}
  l_0_10.Summon = 1
  l_0_10.Counterattack = 2
  l_0_10.DigTrap = 3
  l_0_10.ComboAttack = 4
  l_0_10.LeopardSpeed = 5
  l_0_10.CriticalHit = 6
  l_0_10.Bleeding = 7
  l_0_10.Electrocution = 8
  l_0_10.Burning = 9
  l_0_1.job_type = l_0_10
  l_0_10 = {bag = 1, star = 2, strength = 3}
  l_0_1.tag = l_0_10
  l_0_10 = {1205010011 = true, 1205010012 = true, 1205010013 = true, 1205010014 = true, 1205010015 = true, 1205010016 = true}
  l_0_1.feedback_stone_dic = l_0_10
  l_0_10 = {1205010001, 1205010002, 1205010003, 1205010004, 1205010005, 1205010006}
  l_0_1.strengthen_item_cids = l_0_10
  l_0_1.max_tag_num = 2
  l_0_10 = {"fx_ui_weapon_green", "fx_ui_weapon_blue", "fx_ui_weapon_purple", "fx_ui_weapon_orange", "fx_ui_weapon_red", "fx_ui_weapon_pink"}
  l_0_1.weapon_fx = l_0_10
  l_0_10 = {hurt = 1, help = 2}
  l_0_1.wear_type = l_0_10
  l_0_10 = {normal_attack = 1, magic_attack = 2}
  l_0_1.dmg_type = l_0_10
  l_0_10 = {machine = 1, energy = 2, magic = 3}
  l_0_1.weapon_camp_type = l_0_10
  l_0_1.normal_luck_node_cid = 1207010001
  l_0_1.high_luck_node_cid = 1207010002
end
return l_0_1

