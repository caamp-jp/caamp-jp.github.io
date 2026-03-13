# Repository Guidelines

## Purpose

- This repository migrates `caamp.jp` from WordPress to a static site hosted from GitHub Pages.
- The published site lives in `docs/`.

## Structure

- `docs/`: deployed static site, including Japanese pages, English pages under `docs/en/`, and shared assets.
- `scripts/build_static_site.py`: rebuilds `docs/` from a local crawl in `site/caamp.jp`.
- `scripts/serve_static_site.py`: serves `docs/` locally for review.
- `scripts/crawl_source_site.sh`: crawls the original `https://caamp.jp/` into `site/caamp.jp`.
- `site/`: temporary local crawl data. Do not commit it.

## Workflow

1. During migration, crawl the original site into `site/caamp.jp` when needed.
2. Rebuild the static pages into `docs/`.
3. Review locally by serving `docs/`.
4. Commit only the generated site, scripts, and documentation. Never commit `site/`.

## Editing Notes

- Keep asset and page links relative so the site can work under different GitHub Pages paths.
- Treat `docs/` as generated output when changing page structure. Prefer updating the generator when possible.
- Re-crawling is only expected during the migration period.
