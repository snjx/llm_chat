# llm_chat

Rails 8 で作ったシンプルなチャットアプリです。メッセージの送受信と、Active Agent を使った LLM 連携を想定しています。

## 必要要件

- Ruby (プロジェクトの `.ruby-version` に合わせる)
- SQLite3

## セットアップ

```sh
bin/setup
bin/rails db:prepare
```

## 起動

```sh
bin/dev
```

起動後は `http://localhost:3000` にアクセスします。

## テスト

```sh
bin/rails test
```

## LLM 設定

`config/active_agent.yml` がデフォルト設定です。以下の環境変数で上書きできます。

- `OPENAI_ACCESS_TOKEN`
- `OPENAI_HOST`
- `OPENAI_MODEL`

トークンなどの秘密情報はコミットせず、Rails credentials か環境変数で管理してください。

## 主なディレクトリ

- `app/controllers/messages_controller.rb` メッセージ送受信
- `app/agents/` Agent 実装
- `app/views/messages/` チャット UI
- `app/models/` データモデル
- `test/` Minitest

