"""Extract only TextAsset payloads from cached Unity Lua bundles."""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "zhancheng-card-research" / "tools" / "python"))
import UnityPy  # noqa: E402


def safe_name(name: str) -> str:
    return re.sub(r"[^\w.\-]+", "_", name)[:160]


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("source", type=Path)
    ap.add_argument("output", type=Path)
    args = ap.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    manifest = []
    for package in sorted(args.source.glob("*.ab")):
        try:
            env = UnityPy.load(str(package))
            counts = {}
            for obj in env.objects:
                kind = obj.type.name
                counts[kind] = counts.get(kind, 0) + 1
                if kind != "TextAsset":
                    continue
                data = obj.read()
                name = str(data.m_Name)
                payload = data.m_Script.encode("utf-8", "surrogateescape") if isinstance(data.m_Script, str) else bytes(data.m_Script)
                target_dir = args.output / package.stem
                target_dir.mkdir(exist_ok=True)
                target = target_dir / f"{safe_name(name)}_{obj.path_id}.bin"
                target.write_bytes(payload)
                manifest.append({"bundle": package.name, "name": name, "path_id": obj.path_id, "file": target.relative_to(args.output).as_posix(), "bytes": len(payload), "head": payload[:16].hex()})
            print(f"{package.name}: {counts}")
        except Exception as exc:
            print(f"ERROR {package.name}: {exc}")
    (args.output / "manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"EXTRACTED {len(manifest)} TextAssets")


if __name__ == "__main__":
    main()
