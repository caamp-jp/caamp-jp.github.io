#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT_ROOT="$ROOT_DIR/site"
BASE_URL="${CAAMP_BASE_URL:-https://caamp.jp}"
BASE_URL="${BASE_URL%/}"
HOST="${BASE_URL#https://}"
HOST="${HOST#http://}"
HOST="${HOST%%/*}"

if ! command -v wget >/dev/null 2>&1; then
  echo "error: wget is required" >&2
  exit 1
fi

mkdir -p "$OUTPUT_ROOT"

page_urls=(
  "$BASE_URL/"
  "$BASE_URL/about/"
  "$BASE_URL/technology/"
  "$BASE_URL/related-work/"
  "$BASE_URL/news/"
  "$BASE_URL/publications/"
  "$BASE_URL/contact/"
  "$BASE_URL/en/"
  "$BASE_URL/en/about/"
  "$BASE_URL/en/technology/"
  "$BASE_URL/en/related-work/"
  "$BASE_URL/en/news/"
  "$BASE_URL/en/publications/"
  "$BASE_URL/en/contact/"
)

wget \
  --recursive \
  --level=1 \
  --page-requisites \
  --timestamping \
  --continue \
  --no-parent \
  --execute robots=off \
  --directory-prefix "$OUTPUT_ROOT" \
  --domains "$HOST" \
  "${page_urls[@]}"

echo "Source crawl updated at $OUTPUT_ROOT/$HOST"
