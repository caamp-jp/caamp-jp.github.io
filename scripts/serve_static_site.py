#!/usr/bin/env python3
from __future__ import annotations

import argparse
import os
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PREVIEW_ROOT = ROOT / "preview"


def main() -> None:
    parser = argparse.ArgumentParser(description="Serve the generated static site locally.")
    parser.add_argument("--host", default="127.0.0.1")
    parser.add_argument("--port", type=int, default=8000)
    args = parser.parse_args()

    os.chdir(PREVIEW_ROOT)
    server = ThreadingHTTPServer((args.host, args.port), SimpleHTTPRequestHandler)
    print(f"Serving {PREVIEW_ROOT} at http://{args.host}:{args.port}/")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()


if __name__ == "__main__":
    main()
