"""Enable this repository's GitHub Pages site from main/docs.

Uses the local Git credential helper in memory; no token is written to disk.
"""

from __future__ import annotations

import json
import subprocess
from urllib.error import HTTPError
from urllib.request import Request, urlopen


URL = "https://api.github.com/repos/chitanda233/dandanxingqiu-research/pages"
credential = subprocess.run(
    ["git", "credential", "fill"],
    input="protocol=https\nhost=github.com\n\n",
    text=True,
    capture_output=True,
    check=True,
)
fields = dict(line.split("=", 1) for line in credential.stdout.splitlines() if "=" in line)
token = fields.get("password")
if not token:
    raise SystemExit("No GitHub credential available from Git credential manager")

headers = {
    "Accept": "application/vnd.github+json",
    "Authorization": f"Bearer {token}",
    "User-Agent": "dandanxingqiu-research",
    "X-GitHub-Api-Version": "2026-03-10",
}
payload = json.dumps({"source": {"branch": "main", "path": "/docs"}}).encode()
try:
    response = urlopen(Request(URL, data=payload, headers=headers, method="POST"), timeout=30)
    print("GitHub Pages configured:", json.load(response).get("html_url"))
except HTTPError as error:
    if error.code == 409:
        print("GitHub Pages configuration already exists")
    else:
        detail = error.read().decode("utf-8", "replace")[:800]
        raise SystemExit(f"GitHub Pages API returned HTTP {error.code}: {detail}") from None
