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
]


def convert(value, table_type):
    if isinstance(value, bytes):
        return value.decode("utf-8", "replace")
    if isinstance(value, table_type):
        pairs = list(value.items())
        keys = {key for key, _ in pairs}
        if pairs and all(isinstance(key, int) for key, _ in pairs) and keys == set(range(1, len(pairs) + 1)):
            return [convert(value[index], table_type) for index in range(1, len(pairs) + 1)]
        return {str(convert(key, table_type)): convert(item, table_type) for key, item in pairs}
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
        globals_[b"import"] = lambda _: runtime.table()
        data = convert(runtime.execute(repack(original)), table_type)
        target = OUTPUT / (short_name.replace(".", "_") + ".json")
        target.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        provenance.append({
            "name": name, "source": entry["file"], "sha256": hashlib.sha256(original).hexdigest(),
            "output": target.name, "rows": len(data),
        })
        print(f"{short_name}: {len(data)} rows")
    (OUTPUT / "manifest.json").write_text(json.dumps(provenance, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
