"""Inspect local WeChat wxapkg members without changing the cache."""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path

from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes


def unpack(path: Path, appid: str) -> dict[str, bytes]:
    raw = path.read_bytes()
    if raw.startswith(b"V1MMWX"):
        key = hashlib.pbkdf2_hmac("sha1", appid.encode(), b"saltiest", 1000, 32)
        first = Cipher(algorithms.AES(key), modes.CBC(b"the iv: 16 bytes")).decryptor().update(raw[6:1030])[:1023]
        raw = first + bytes(b ^ ord(appid[-2]) for b in raw[1030:])
    if not raw.startswith(b"\xbe"):
        raise ValueError(f"Unknown package format: {path}")
    count = int.from_bytes(raw[16:18], "big")
    pos = 18
    files = {}
    for _ in range(count):
        length = int.from_bytes(raw[pos:pos+4], "big")
        pos += 4
        name = raw[pos:pos+length].decode("utf-8")
        pos += length
        start = int.from_bytes(raw[pos:pos+4], "big")
        size = int.from_bytes(raw[pos+4:pos+8], "big")
        pos += 8
        files[name] = raw[start:start+size]
    return files


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("root", type=Path)
    ap.add_argument("--since", default="2026-09-28")
    ap.add_argument("--text", default="弹弹星球")
    ap.add_argument("--list-members", action="store_true")
    ap.add_argument("--extract-appid")
    ap.add_argument("--output", type=Path)
    args = ap.parse_args()
    needle = args.text.encode("utf-8")
    for path in sorted(args.root.rglob("*.wxapkg")):
        if args.extract_appid and path.parent.parent.name != args.extract_appid:
            continue
        if path.stat().st_mtime < __import__("datetime").datetime.fromisoformat(args.since).timestamp():
            continue
        appid = path.parent.parent.name
        try:
            members = unpack(path, appid)
        except Exception as exc:
            print(f"ERROR {path}: {exc}")
            continue
        hits = [(name, data.find(needle)) for name, data in members.items() if needle in data]
        print(f"PACKAGE {appid}/{path.parent.name}/{path.name} members={len(members)} sha256={hashlib.sha256(path.read_bytes()).hexdigest()} hits={hits}")
        if args.list_members:
            for name, data in members.items():
                print(f"  {name} ({len(data)})")
        if args.output and args.extract_appid:
            destination = args.output / path.parent.name / path.stem
            for name, data in members.items():
                target = destination / name.lstrip("/")
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes(data)


if __name__ == "__main__":
    main()
