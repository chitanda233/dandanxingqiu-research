"""Best-effort decompile selected local Lua bytecode with unluac."""

from __future__ import annotations

import argparse
import json
import subprocess
from pathlib import Path


CONFIGS = {
    "fight_misc", "battle", "battle_env", "battle_result_board", "battle_gain",
    "ranked_match_misc", "ranked_match_rank_type", "ranked_match_rank",
    "ranked_match_season", "ranked_match_pve_battle", "rank_type", "rank_system",
    "team_misc", "team_target", "free_battle_misc", "free_battle_robot",
    "gameplay", "season_gameplay", "season_rank", "season_rank_type",
    "weapon_strength", "equip_strengthen", "main_weapon_develop", "player_level",
    "level_up", "gacha_misc", "task_liveness", "battlepass_misc", "open_func",
    "rank_settlement", "ranked_match_rank_reward", "2v2_rank_reward", "weapon_star",
    "exp", "skill_base_upgrade", "pet_level", "title", "role_property",
}
MODULE_PREFIXES = (
    "game.module.team.manager.", "game.module.season.manager.",
    "game.module.fight.manager.base.fighting.round.",
    "game.module.fight.manager.base.fighting.bullet.",
    "game.module.fight.manager.base.fighting.result.",
    "game.module.main_weapon_develop.manager.",
    "game.module.gacha.manager.", "game.module.task.manager.",
    "game.module.rank.manager.", "game.module.shop.manager.",
    "game.module.game_room.manager.",
)
MODULE_SUFFIXES = (".core", ".const", ".network", ".data", ".perform", ".timer")
EXTRA = {
    "game.module.fight.manager.base.core", "game.module.fight.manager.base.network",
    "game.module.fight.manager.base.reconnect", "game.module.fight.manager.base.loading.core",
    "game.module.fight.manager.base.ending.core", "game.module.fight.manager.base.fighting.core",
    "game.module.fight.manager.base.fighting.fire.core", "game.module.fight.manager.base.fighting.skill.core",
    "game.module.fight.manager.base.fighting.trajectory", "game.module.fight.manager.base.fighting.recommand_force",
    "game.module.fight.manager.base.fighting.gain", "game.module.fight.manager.base.fighting.battle_env",
    "game.module.fight.manager.base.fighting.cmd.network", "game.module.main_view.manager.core",
    "game.module.main_view.manager.config.bottom_btn_config", "game.module.main_view.manager.config.right_up_config",
    "game.module.main_view.manager.config.left_up_config", "game.module.main_view.manager.config.pop_config",
    "game.module.open_func.manager.core", "game.module.open_func.manager.const",
    "auto_gen.package_include.config.open_func.open_func",
}


def selected(name: str) -> bool:
    bits = name.split(".")
    if len(bits) > 4 and name.startswith("auto_gen.package_include.config."):
        return bits[3] in CONFIGS and bits[-1] not in {"init", "body"}
    return name in EXTRA or (name.startswith(MODULE_PREFIXES) and name.endswith(MODULE_SUFFIXES))


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("assets", type=Path)
    ap.add_argument("output", type=Path)
    ap.add_argument("--java", type=Path, required=True)
    ap.add_argument("--jar", type=Path, required=True)
    args = ap.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    manifest = json.loads((args.assets / "manifest.json").read_text(encoding="utf-8"))
    result = []
    for row in manifest:
        name = row["name"]
        if not selected(name):
            continue
        source = args.assets / row["file"]
        target = args.output / f"{name}.lua"
        if target.exists() and target.stat().st_size:
            result.append({"name": name, "source": row["file"], "output": target.name, "status": "existing", "bytes": target.stat().st_size})
            continue
        try:
            proc = subprocess.run([str(args.java), "-jar", str(args.jar), str(source)], capture_output=True, timeout=30)
            target.write_bytes(proc.stdout)
            result.append({"name": name, "source": row["file"], "output": target.name, "exit": proc.returncode, "bytes": len(proc.stdout), "stderr": proc.stderr.decode("utf-8", "replace")[-700:]})
        except Exception as exc:
            result.append({"name": name, "source": row["file"], "error": str(exc)})
    (args.output / "manifest.json").write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding="utf-8")
    for row in result:
        print(row["name"], row.get("exit", "ERR"), row.get("bytes", 0))
    print("TOTAL", len(result))


if __name__ == "__main__":
    main()
