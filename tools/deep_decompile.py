"""Cross-check gameplay modules with LuaDec text AND original instruction listings.

LuaDec's high-level output is not executable proof. Keep its warnings and use
the instruction listing when a branch or temporary register is ambiguous.
"""
from __future__ import annotations
import concurrent.futures
import hashlib
import json
import subprocess
from pathlib import Path
from lua51_disassemble import disassemble

ROOT = Path(__file__).resolve().parents[1]
EXACT = {
    "game.module.data.manager.player.local_player", "game.module.data.manager.player.player",
    "game.module.data.manager.core", "game.module.data.manager.network",
    "game.module.fight.manager.base.fighting.trajectory",
    "game.module.fight.manager.base.fighting.recommand_force",
    "game.module.fight.manager.base.fighting.battle_env",
    "game.module.fight.manager.base.core", "game.module.fight.manager.base.network",
    "game.module.fight.manager.base.reconnect", "game.module.fight.manager.base.ending.core",
    "game.module.fight.manager.const", "auto_gen.package_include.config.skill.const",
    "game.module.main_view.manager.config.bottom_btn_config",
    "game.module.main_view.manager.config.right_up_config",
    "game.module.fight.manager.base.fighting.ui.core",
    "game.module.fight.manager.base.fighting.touch",
    "auto_gen.package_include.config.init",
    "auto_gen.package_include.config.skill_base_upgrade.init",
    "auto_gen.package_include.config.season_newbie.init",
    "auto_gen.package_include.config.season_new.init",
    "auto_gen.package_include.config.attr_trans.init",
}
PREFIXES = (
    "game.module.fight.manager.base.fighting.skill.",
    "game.module.fight.manager.base.fighting.fire.",
    "game.module.fight.manager.base.fighting.round.",
    "game.module.fight.manager.base.fighting.cmd.",
    "game.module.fight.manager.base.fighting.unit.",
    "game.module.fight.manager.base.fighting.buff.",
    "game.module.skill.manager.", "game.module.pet.manager.",
    "game.module.main_weapon_develop.manager.", "game.module.equip.manager.",
    "game.module.team.manager.", "game.module.season.manager.",
    "game.module.battle_pass.manager.", "game.module.gacha.manager.",
    "game.module.task.manager.", "game.module.shop.manager.",
    "game.module.open_func.manager.",
)

def main() -> None:
    entries = json.loads((ROOT / "reverse/lua-bytecode/manifest.json").read_text(encoding="utf-8"))
    rows = [r for r in entries if r["name"] in EXACT or (
        r["name"].startswith(PREFIXES) and not r["name"].endswith((".init", ".head")))]
    exe = ROOT / "vendor/luadec51-bin/Luadec51.exe"
    for folder in ("lua-luadec", "lua-disassembled"):
        (ROOT / "reverse" / folder).mkdir(exist_ok=True)

    def process(row: dict) -> dict:
        source = ROOT / "reverse/lua-bytecode" / row["file"]
        result = {"name": row["name"], "source": row["file"],
                  "sha256": hashlib.sha256(source.read_bytes()).hexdigest()}
        listing=ROOT/"reverse/lua-disassembled"/(row["name"]+".txt")
        listing.write_text(disassemble(source.read_bytes(),row["name"]),encoding="utf8")
        result["lua-disassembled"]=listing.relative_to(ROOT).as_posix()
        for mode, folder, suffix in (([], "lua-luadec", ".lua"),):
            target = ROOT / "reverse" / folder / (row["name"] + suffix)
            if not target.exists() or not target.stat().st_size:
                proc = subprocess.run([str(exe), *mode, str(source.relative_to(ROOT))],
                                      cwd=ROOT, capture_output=True, timeout=90)
                target.write_bytes(proc.stdout)
                if proc.returncode:
                    result[folder + "_error"] = {"exit":proc.returncode,"stderr":proc.stderr.decode("utf-8", "replace")[:500]}
            if not target.stat().st_size:
                target.unlink()
                result[folder+"_error"]=result.get(folder+"_error", "Empty decompiler output")
                continue
            result[folder] = str(target.relative_to(ROOT)).replace("\\", "/")
        return result

    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
        output = list(pool.map(process, rows))
    (ROOT / "reverse/lua-disassembled/manifest.json").write_text(
        json.dumps(output, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Cross-decompiled and disassembled {len(output)} modules; originals preserved.")

if __name__ == "__main__":
    main()
