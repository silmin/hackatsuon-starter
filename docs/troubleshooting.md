# トラブルシューティング

当日つまずきやすい順に並んでいます。まずエラーメッセージをよく読む(または AI に貼り付ける)のが一番の近道です。

## Codespace まわり

**Q. 「Create codespace」を押しても起動しない / エラーになる**
- GitHub のメール認証が済んでいるか確認(登録メールに届いた確認リンクを踏む)
- ブラウザをリロードして再試行
- https://github.com/codespaces を開き、既に作成済みの Codespace があればそれを開く

**Q. 起動したけどターミナルが見当たらない**
- 左上メニュー(≡) → Terminal → New Terminal
- ショートカット: `Ctrl + @`(Windows)/ `Cmd + J`(Mac)

**Q. セットアップが終わる前にターミナルを触ってしまった**
- 以下を手動実行すればOK:
  ```bash
  bash .devcontainer/setup.sh
  source ~/.bashrc
  ```

## Claude Code まわり

**Q. `claude: command not found`**
```bash
source ~/.bashrc
```
それでもダメなら:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

**Q. APIキーが無効と言われる**
- `export ANTHROPIC_API_KEY=...` のコピペミスが9割。前後に空白や改行が入っていないか確認
- カードのキーを最初から貼り直す
- 貼り直したら `claude` を起動し直す

**Q. Claude Code の返答が途中で止まる / 429 エラー**
- 混雑しています。1〜2分待ってから続きを頼んでください
- (会場全体で同じ組織のキーを使っているため、同時利用が集中すると起きます)

**Q. AIが作ったものが動かない**
- エラーメッセージやスクリーンショットの内容をそのまま AI に貼り付けて「直して」と言う
- 直らないときは「一度シンプルな構成に作り直して」と頼むのも有効

## プレビューまわり

**Q. `http-server public -p 8080` してもページが開かない**
- 画面右下の通知「ポート8080が利用可能です」から Open を押す
- または「ポート」タブ(ターミナル横)→ 8080 の地球儀アイコンをクリック
- 変更が反映されないときはブラウザをスーパーリロード(`Ctrl+Shift+R` / `Cmd+Shift+R`)

## デプロイ(Cloudflare / wrangler)まわり

**Q. `Authentication error` / `10000` エラー**
- `CLOUDFLARE_API_TOKEN` と `CLOUDFLARE_ACCOUNT_ID` の export をやり直す
- トークンの Permissions が「Account / Cloudflare Pages / Edit」になっているか確認
- トークンを作り直すのが一番早いことも多いです

**Q. `Project name must be...` と怒られる**
- プロジェクト名は半角英数字とハイフンのみ。日本語・スペース・アンダースコア不可

**Q. `wrangler login` を実行してしまい、ブラウザ認証から戻ってこない**
- Codespaces では `wrangler login` は使いません。`Ctrl + C` で中断し、
  README の 5-2〜5-4(APIトークン方式)でやり直してください

**Q. デプロイは成功したのに、URLを開くと古いページが表示される**
- 数十秒待ってからスーパーリロード
- それでもダメなら、もう一度 `wrangler pages deploy ...` を実行

## その他

**Q. 無料枠が心配**
- Codespaces の無料枠は個人アカウントに月120コア時間(2コアで実質60時間)。今日1日では使い切りません
- 使い終わったら https://github.com/codespaces で該当の Codespace を「Stop」しておくと安心です

**Q. 家に帰ってから続きをやるには?**
- https://github.com/codespaces → 自分の Codespace をクリックで再開
- わからないことは Discord の #helpdesk へ
