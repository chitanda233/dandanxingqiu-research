"""Organize the research checkout and preserve originals with hashes.

Run once against the same local cache version used for this study. The script
never changes the WeChat cache and refuses paths outside this repository.
"""

from __future__ import annotations

import hashlib
import argparse
import json
import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
APP = "wx64969d55b91a6963"
VERSION = "242"


def inside_repo(path: Path) -> Path:
    result = path.resolve()
    if not result.is_relative_to(ROOT):
        raise ValueError(f"Path is outside repository: {result}")
    return result


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--packages-dir", type=Path, required=True, help="Original wxapkg directory")
    parser.add_argument("--lua-bundles-dir", type=Path, required=True, help="Original res/Zero/Lua directory")
    parser.add_argument("--appid", default=APP)
    parser.add_argument("--version", default=VERSION)
    args = parser.parse_args()

    for old, new in (
        ("cache-extract", "reverse/unpacked-wxapkg"),
        ("lua-assets", "reverse/lua-bytecode"),
        ("decompiled", "reverse/lua-decompiled"),
    ):
        source, dest = inside_repo(ROOT / old), inside_repo(ROOT / new)
        if dest.exists():
            continue
        dest.parent.mkdir(parents=True, exist_ok=True)
        source.rename(dest)

    source_dirs = ((args.packages_dir, "wechat-packages", "*.wxapkg"), (args.lua_bundles_dir, "lua-bundles", "*.ab"))
    inventory = []
    for source_dir, category, pattern in source_dirs:
        files = sorted(source_dir.glob(pattern))
        if not files:
            raise FileNotFoundError(f"No original files at {source_dir}")
        for source in files:
            dest = inside_repo(ROOT / "raw" / category / source.name)
            dest.parent.mkdir(parents=True, exist_ok=True)
            if not dest.exists():
                shutil.copy2(source, dest)
            source_hash = sha256(source)
            if sha256(dest) != source_hash:
                raise ValueError(f"Copy failed integrity check: {dest}")
            inventory.append({"category": category, "file": dest.relative_to(ROOT).as_posix(), "bytes": source.stat().st_size, "sha256": source_hash})

    manifest = {"game": "弹弹星球", "appid": args.appid, "cache_package_version": args.version, "snapshot_date": "2026-09-30", "files": inventory}
    inside_repo(ROOT / "raw" / "manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Organized reverse output; copied and hash-checked {len(inventory)} original files.")


if __name__ == "__main__":
    main()
