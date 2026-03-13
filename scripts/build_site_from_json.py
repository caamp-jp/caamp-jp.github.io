#!/usr/bin/env python3
from __future__ import annotations

import json
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE_JSON = ROOT / "SITE_CONTENT.json"

sys.path.insert(0, str(Path(__file__).resolve().parent))
import build_static_site


def load_site_content(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def main() -> None:
    content = load_site_content(SOURCE_JSON)
    build_static_site.build_from_content_data(content, copy_assets=False)


if __name__ == "__main__":
    main()
