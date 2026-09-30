"""Execute selected static Lua 5.1 config chunks and export exact JSON tables.

Requires `pip install lupa`. The original 32-bit size_t chunks are structurally
repacked in memory for the 64-bit Lua 5.1 runtime. The source files stay intact.
"""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

from lupa.lua51 import LuaRuntime

from repack_lua51 import repack


ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "reverse/lua-bytecode/manifest.json"
OUTPUT = ROOT / "analysis/data"
NAMES = [
    "ai.ai", "ai_misc.ai_misc", "attr.attr", "attr_rules.attr_rules",
    "battle.battle", "battle_env.battle_env", "battle_gain.battle_gain",
    "fight_misc.attr_const", "fight_misc.attr_parabola", "free_battle_misc.free_battle_misc",
    "free_battle_robot.free_battle_robot", "ranked_match_misc.ranked_match_misc",
    "ranked_match_balance.ranked_match_balance", "ranked_match_rank.ranked_match_rank",
    "team_misc.team_misc", "team_robot_misc.team_robot_misc", "team_robot_invite.team_robot_invite",
    "robot.robot", "robot_plan.robot_plan", "robot_role.robot_role",
    "robot_tactic.robot_tactic", "robot_tactic.talk_trigger",
    "skill.skill", "passive_skill.passive_skill",
    "weapon.weapon", "weapon_job.weapon_job", "weapon_class.weapon_class",
    "weapon_strength.weapon_strength", "weapon_injection.weapon_injection",
    "weapon_amplification.weapon_amplification_0", "weapon_amplification.weapon_amplification_543",
    "weapon_enchant.weapon_enchant",
    "weapon_master.weapon_master", "weapon_star.weapon_star",
    "pet.pet", "pet_level.pet_level", "pet_evo.pet_evo", "pet_talent.pet_talent",
    "pet_misc.pet_misc", "pet_skill_learn.pet_skill_learn",
    "gem_level.gem_level", "gem_synthesis.gem_synthesis", "gem_skill.gem_skill",
    "equip_strengthen.lv", "equip_skill_level.equip_skill_level_0", "equip_skill_level.equip_skill_level_543",
    "exp.player", "team_target.main",
    "language_define.skill", "language_define.passive_skill", "language_define.attr",
    "language_define.battle_env", "language_define.weapon_class", "language_define.weapon_job",
    "gacha_misc.gacha_misc", "gacha_guarantee.gacha_guarantee", "gacha_pool.gacha_pool",
    "gacha.gacha_0", "gacha.gacha_543", "gacha_wish.gacha_wish",
    "shop.shop_0", "shop.shop_543", "shop_class.shop_class",
    "seven_sign.seven_sign_0", "seven_sign.seven_sign_543",
    "task_liveness.task_liveness", "tasks.tasks_0", "tasks.tasks_543",
    "battlepass_misc.battlepass_misc", "battlepass_common.battlepass_common",
    "season_misc.season_misc", "season_reset.season_reset",
    "season_rank.season_rank", "season_cup.season_cup", "season_cultivate.season_cultivate",
    "season_pvp_elo.pvp_elo",
    "open_func.open_func_0", "open_func.open_func_543",
    "gameplay.gameplay", "skill_base_upgrade.skill_base_upgrade_0",
    "item.item", "item.item_0", "item.item_543", "language_define.item",
    "buff.buff", "language_define.buff",
    "weapon_class_up.weapon_class_up", "gem_misc.gem_misc",
    "equip.equip", "equip.equip_0", "equip.equip_543", "equip.attr_library",
    "season_gameplay.season_gameplay", "season_new.season_new_0", "season_new.season_new_543",
    "season_newbie.season_newbie_0", "season_newbie.season_newbie_543",
    "battlepass_season.battlepass_season", "battlepass_reward.item_0", "battlepass_reward.item_543",
    "battlepass_common_reward.item_0", "battlepass_common_reward.item_543",
    "language_define.battlepass", "language_define.battlepass_common_reward",
    "open_func.open_func", "gacha.gacha", "shop.shop", "tasks.tasks",
    "skill_base_upgrade.skill_base_upgrade", "skill_base_upgrade.skill_base_upgrade_543",
    "language_define.tasks", "language_define.pet", "language_define.weapon", "language_define.open_func",
    "preset_rank_battle.preset_rank_battle", "rank_define.normal",
    "character_rating.character_rating", "recommend_rating.character_rating", "demo_plan.demo_plan",
    "misc.skill", "misc.attr", "misc.task", "misc.equip", "misc.season",
    "attr_trans.pet", "attr_trans.attr_trans", "attr_trans_pet.attr_trans_pet",
    "seven_sign.seven_sign", "language_define.seven_sign",
]


def convert(value, table_type, get_metatable, depth=0, inherited_table=False):
    if depth > 100:
        raise ValueError("Cyclic/deep config table")
    if isinstance(value, bytes):
        return value.decode("utf-8", "replace")
    if isinstance(value, table_type):
        meta = get_metatable(value)
        index = meta[b"__index"] if isinstance(meta, table_type) else None
        inherited = {}
        if isinstance(index, table_type):
            converted_index = convert(index, table_type, get_metatable, depth + 1, True)
            inherited = converted_index if isinstance(converted_index, dict) else {
                str(i): v for i, v in enumerate(converted_index, 1)}
        pairs = [(key, item) for key, item in value.items()
                 if not (inherited_table and key in {b"__index", b"__newindex", b"__metatable"})]
        keys = {key for key, _ in pairs}
        if not inherited and pairs and all(isinstance(key, int) for key, _ in pairs) and keys == set(range(1, len(pairs) + 1)):
            return [convert(value[index], table_type, get_metatable, depth+1) for index in range(1, len(pairs) + 1)]
        inherited.update({str(convert(key, table_type, get_metatable, depth+1)):
                          convert(item, table_type, get_metatable, depth+1) for key, item in pairs})
        return inherited
    return value


def main() -> None:
    entries = {entry["name"]: entry for entry in json.loads(MANIFEST.read_text(encoding="utf-8"))}
    OUTPUT.mkdir(parents=True, exist_ok=True)
    provenance = []
    for short_name in NAMES:
        name = "auto_gen.package_include.config." + short_name
        entry = entries.get(name)
        if entry is None:
            print(f"SKIP absent: {name}")
            continue
        source = ROOT / "reverse/lua-bytecode" / entry["file"]
        original = source.read_bytes()
        runtime = LuaRuntime(encoding=None, register_eval=False, register_builtins=False)
        table_type = type(runtime.table())
        globals_ = runtime.globals()
        for forbidden in ("os", "io", "package", "debug", "require", "dofile", "loadfile", "loadstring"):
            globals_[forbidden.encode()] = None
        # Config chunks reference config.head.et, the shared empty table. An
        # entirely blank import stub turns intentional empty defaults into nil.
        config_head = runtime.table()
        config_head[b"et"] = runtime.table()
        module_head = runtime.table()
        globals_[b"import"] = lambda name: config_head if name == b"..head" else module_head
        data = convert(runtime.execute(repack(original)), table_type, runtime.eval(b"getmetatable"))
        target = OUTPUT / (short_name.replace(".", "_") + ".json")
        target.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        provenance.append({
            "name": name, "source": entry["file"], "sha256": hashlib.sha256(original).hexdigest(),
            "output": target.name, "rows": len(data), "resolved_table_defaults": True,
        })
        print(f"{short_name}: {len(data)} rows")
    (OUTPUT / "manifest.json").write_text(json.dumps(provenance, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
