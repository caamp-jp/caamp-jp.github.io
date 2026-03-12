# caamp.jp

`caamp.jp` の静的化作業用リポジトリです。

## 構成

- `site/caamp.jp`
  WordPress サイトをクロールした生データです。元コンテンツの参照用として残しています。
- `preview/`
  ローカル確認用の静的サイト一式です。日本語ページ、英語ページ、`assets/` をこの配下にまとめています。
- `scripts/build_static_site.py`
  生クロールデータを元に、`preview/` 配下の静的ページを再生成するスクリプトです。
- `scripts/serve_static_site.py`
  `preview/` をローカル HTTP サーバーで配信するスクリプトです。

## 再生成

プレビュー用ページを作り直すときは以下を実行します。

```bash
python3 scripts/build_static_site.py
```

## ローカル確認

以下で `preview/` をローカル配信できます。

```bash
python3 scripts/serve_static_site.py
```

既定では `http://127.0.0.1:8000/` で確認できます。

静的サイトをリポジトリ直下ではなく `preview/` にまとめているため、GitHub 側で Pages を有効化しない限り、そのまま公開される構成にはなりません。
