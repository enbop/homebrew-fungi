#!/usr/bin/env python3

import argparse
import hashlib
import json
import re
import sys
import urllib.request
from pathlib import Path


ASSETS = {
    "fungi": {
        "repo": "enbop/fungi",
        "cask_path": Path("Casks/fungi.rb"),
        "assets": {
            "aarch64": "fungi-macos-aarch64.tar.gz",
            "x86_64": "fungi-macos-x86_64.tar.gz",
        },
    },
    "fungi-app": {
        "repo": "enbop/fungi-app",
        "cask_path": Path("Casks/fungi-app.rb"),
        "assets": {
            "aarch64": "fungi-app-macos-aarch64.tar.gz",
            "x86_64": "fungi-app-macos-x86_64.tar.gz",
        },
    },
}


def fetch_json(url: str) -> dict:
    req = urllib.request.Request(
        url,
        headers={
            "Accept": "application/vnd.github+json",
            "User-Agent": "homebrew-fungi-updater",
        },
    )
    with urllib.request.urlopen(req) as response:
        return json.load(response)


def sha256_url(url: str) -> str:
    req = urllib.request.Request(url, headers={"User-Agent": "homebrew-fungi-updater"})
    h = hashlib.sha256()
    with urllib.request.urlopen(req) as response:
        while True:
            chunk = response.read(1024 * 1024)
            if not chunk:
                break
            h.update(chunk)
    return h.hexdigest()


def replace_once(content: str, pattern: str, replacement: str) -> str:
    new_content, count = re.subn(pattern, replacement, content, count=1, flags=re.MULTILINE)
    if count != 1:
        raise RuntimeError(f"expected one match for pattern: {pattern}")
    return new_content


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("token", choices=sorted(ASSETS.keys()))
    args = parser.parse_args()

    config = ASSETS[args.token]
    release = fetch_json(f"https://api.github.com/repos/{config['repo']}/releases/latest")

    tag = release["tag_name"]
    version = tag[1:] if tag.startswith("v") else tag

    release_assets = {asset["name"]: asset["browser_download_url"] for asset in release["assets"]}
    arm_asset = config["assets"]["aarch64"]
    intel_asset = config["assets"]["x86_64"]

    missing = [name for name in (arm_asset, intel_asset) if name not in release_assets]
    if missing:
        raise RuntimeError(f"missing release assets for {args.token}: {', '.join(missing)}")

    arm_sha = sha256_url(release_assets[arm_asset])
    intel_sha = sha256_url(release_assets[intel_asset])

    cask_path = config["cask_path"]
    content = cask_path.read_text()
    content = replace_once(content, r'^  version ".*"$', f'  version "{version}"')
    content = replace_once(
        content,
        r'^  sha256 arm:\s+".*",\n\s+intel: ".*"$',
        f'  sha256 arm:   "{arm_sha}",\n         intel: "{intel_sha}"',
    )
    cask_path.write_text(content)

    print(f"updated {cask_path} to {version}")
    print(f"arm sha256:   {arm_sha}")
    print(f"intel sha256: {intel_sha}")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as exc:
        print(f"error: {exc}", file=sys.stderr)
        raise SystemExit(1)
