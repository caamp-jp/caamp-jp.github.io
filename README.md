# caamp.jp

このリポジトリは、WordPress 管理だった `caamp.jp` を `github.io` 上の静的サイトへ移行するためのものです。公開物は `docs/` 配下で管理します。

## 移行の流れ

1. WordPress 管理の `caamp.jp` を `github.io` の静的サイトへ置き換えます。
2. 置き換えにあたり、まずオリジナルの `caamp.jp` を `site/caamp.jp` にクロールします。
3. クロール結果を元に、公開用ページを `docs/` に生成します。
4. `site/` は作業用の一時データなので GitHub には残さず、コミットしません。
5. `caamp.jp` を `github.io` に置き換えた後は、再クロールは移行期に必要な場合だけ行います。

## 構成

- `docs/`
  公開用の静的サイトです。日本語ページ、英語ページ、`assets/`、`.nojekyll` をこの配下で管理します。
- `scripts/build_static_site.py`
  `site/caamp.jp` に置いたクロール結果を元に、`docs/` 配下の静的ページを再生成するスクリプトです。
- `scripts/serve_static_site.py`
  `docs/` をローカル HTTP サーバーで配信するスクリプトです。
- `scripts/crawl_source_site.sh`
  元サイト `https://caamp.jp/` を `site/caamp.jp` にクロールする補助スクリプトです。
- `site/`
  オリジナルの `caamp.jp` を一時的に保存する作業ディレクトリです。リポジトリには含めません。

## 前提

- Python 3
- `beautifulsoup4`
- `wget` (`scripts/crawl_source_site.sh` を使う場合)

`beautifulsoup4` が未導入の場合は、以下で追加します。

```bash
python3 -m pip install beautifulsoup4
```

## クロール

移行作業中にオリジナルの `caamp.jp` を取り込む必要がある場合だけ実行します。

```bash
bash scripts/crawl_source_site.sh
```

既定では `site/caamp.jp/` に保存されます。`site/` はコミットしません。

## 再生成

クロール結果を元に `docs/` を作り直します。

```bash
python3 scripts/build_static_site.py
```

このコマンドは `docs/` の内容を上書きします。

## ローカル確認

以下で `docs/` をローカル配信できます。

```bash
python3 scripts/serve_static_site.py
```

既定では `http://127.0.0.1:8000/` で確認できます。
