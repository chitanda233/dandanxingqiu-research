"""Check report links, source line anchors, and original-file hashes."""

from __future__ import annotations

import hashlib
import json
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import unquote, urlparse


ROOT = Path(__file__).resolve().parents[1]
DOCS = ROOT / "docs"
REPO_PATH = "/chitanda233/dandanxingqiu-research/blob/main/"


class Links(HTMLParser):
    def __init__(self) -> None:
        super().__init__()
        self.links: list[str] = []
        self.ids: set[str] = set()

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        attributes = dict(attrs)
        if attributes.get("id"):
            self.ids.add(attributes["id"])
        if tag == "a" and attributes.get("href"):
            self.links.append(attributes["href"])
        if tag == "link" and attributes.get("href"):
            self.links.append(attributes["href"])


def parse(path: Path) -> Links:
    result = Links()
    result.feed(path.read_text(encoding="utf-8"))
    return result


def main() -> None:
    problems: list[str] = []
    pages = sorted(DOCS.rglob("*.html"))
    parsed = {page: parse(page) for page in pages}
    checked = 0
    for page, content in parsed.items():
        for link in content.links:
            uri = urlparse(link)
            checked += 1
            if uri.scheme in {"https", "http"}:
                if uri.netloc != "github.com" or not uri.path.startswith(REPO_PATH):
                    continue
                target = ROOT / unquote(uri.path[len(REPO_PATH):])
                if not target.is_file():
                    problems.append(f"Missing source: {page.relative_to(ROOT)} → {link}")
                elif uri.fragment.startswith("L") and uri.fragment[1:].isdigit():
                    count = sum(1 for _ in target.open(encoding="utf-8", errors="replace"))
                    if int(uri.fragment[1:]) > count:
                        problems.append(f"Line beyond EOF: {page.relative_to(ROOT)} → {link} ({count} lines)")
                continue
            if uri.scheme or link.startswith("mailto:"):
                continue
            target = (page.parent / unquote(uri.path)).resolve() if uri.path else page
            if not target.is_file():
                problems.append(f"Missing local link: {page.relative_to(ROOT)} → {link}")
            elif uri.fragment and target.suffix == ".html" and uri.fragment not in parsed.get(target, parse(target)).ids:
                problems.append(f"Missing section: {page.relative_to(ROOT)} → {link}")

    manifest = json.loads((ROOT / "raw" / "manifest.json").read_text(encoding="utf-8"))
    for item in manifest["files"]:
        target = ROOT / item["file"]
        if not target.is_file():
            problems.append(f"Missing original: {item['file']}")
            continue
        if target.stat().st_size != item["bytes"] or hashlib.sha256(target.read_bytes()).hexdigest() != item["sha256"]:
            problems.append(f"Original hash/size mismatch: {item['file']}")

    derived = json.loads((ROOT / "analysis/data/manifest.json").read_text(encoding="utf-8"))
    for item in derived:
        source = ROOT / "reverse/lua-bytecode" / item["source"]
        output = ROOT / "analysis/data" / item["output"]
        if not source.is_file() or hashlib.sha256(source.read_bytes()).hexdigest() != item["sha256"]:
            problems.append(f"Derived table source mismatch: {item['name']}")
        if not output.is_file() or len(json.loads(output.read_text(encoding="utf-8"))) != item["rows"]:
            problems.append(f"Derived table row count mismatch: {item['name']}")

    if problems:
        raise SystemExit("\n".join(problems))
    print(f"PASS: {len(pages)} pages, {checked} links, {len(manifest['files'])} originals, {len(derived)} derived tables checked")


if __name__ == "__main__":
    main()
