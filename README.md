# Hackatsuon Starter 🐟

気仙沼発ハッカソン **Hackatsuon** のワークショップ用スターターキットです。
ブラウザだけで、AIと一緒にアプリを作って、世界に公開するところまで行きます。

> 完成しなくて大丈夫。今日のゴールは「自分の手で作って、外に出す」体験をすることと、
> 今日の続きをやれる環境を持ち帰ることです。困ったら Discord で聞いてください。

---

## 全体の流れ

1. このテンプレートから自分のリポジトリを作る
2. Codespace(ブラウザ上の開発環境)を起動する
3. AI(Claude Code)を起動する
4. 作りたいものを日本語で伝えて、アプリを作る
5. Cloudflare にデプロイして、URLを世界に公開する

---

## Step 1. 自分のリポジトリを作る

1. このページ右上の緑のボタン **「Use this template」** をクリック
2. **「Create a new repository」** を選択
3. Repository name に好きな名前を入力(例: `my-hackatsuon-app`)
4. **「Create repository」** をクリック

これで「自分のプロジェクト」ができました。

## Step 2. Codespace を起動する

1. 自分のリポジトリのページで、緑の **「Code」** ボタンをクリック
2. **「Codespaces」** タブ → **「Create codespace on main」** をクリック
3. ブラウザ上にエディタ(VS Code)が開くまで待つ(初回は3〜5分かかります)
4. 画面下部の **ターミナル** に「🐟 Hackatsuon Starter へようこそ!」と表示されたらOK

> ターミナルが見えないときは、メニューの ハンバーガー(≡) → Terminal → New Terminal

## Step 3. AI(Claude Code)を起動する

配布された **APIキー** のキーを使います。ターミナルに以下を入力:

```bash
export ANTHROPIC_API_KEY=sk-ant...（API キーをコピーして貼り付け）
```

続けて、Claude Code を起動:

```bash
claude
```

初回はいくつか質問されます。APIキーの使用を聞かれたら **Yes** を選択してください。

> `claude: command not found` と出たら、ターミナルで `source ~/.bashrc` を実行してからもう一度。

## Step 4. アプリを作る

Claude Code に、作りたいものを **日本語で** 伝えてください。例:

```
public/index.html を書き換えて、気仙沼の観光スポットを紹介する
ページを作ってください。スマホでも見やすくしてください。
```

```
潮の満ち引きの時間をメモできる簡単なアプリにしてください。
データはブラウザに保存されれば十分です。
```

途中で動作を見たいときは、**別のターミナル**(+ボタンで追加)で:

```bash
http-server public -p 8080
```

を実行すると、プレビューが開きます。

**コツ**
- 一度に全部作ろうとせず、少しずつ注文する
- 気に入らなかったら「もっと〇〇にして」と遠慮なく言う
- エラーが出たら、エラーメッセージをそのままAIに貼り付ける

## Step 5. 世界に公開する(Cloudflare Pages)

### 5-1. Cloudflare アカウントを作る(無料・クレカ不要)

1. https://dash.cloudflare.com/sign-up でアカウント作成
2. メール認証を済ませる

### 5-2. APIトークンを作る

1. https://dash.cloudflare.com/profile/api-tokens を開く
2. **「Create Token」** → 一番下の **「Create Custom Token」** の Get started
3. 設定:
   - Token name: `hackatsuon`
   - Permissions: **Account** / **Cloudflare Pages** / **Edit**
4. **「Continue to summary」** → **「Create Token」**
5. 表示されたトークンをコピー(この画面を閉じると二度と見られません!)

### 5-3. アカウントIDを調べる

1. https://dash.cloudflare.com を開き、左メニューの **Workers & Pages** をクリック
2. 右側(または Account Details)に表示される **Account ID** をコピー

### 5-4. デプロイ!

ターミナルで(Claude Code を使っている場合は + で新しいターミナルを開く):

```bash
export CLOUDFLARE_API_TOKEN=ここにトークンを貼り付け
export CLOUDFLARE_ACCOUNT_ID=ここにアカウントIDを貼り付け

wrangler pages deploy public --project-name=あなたのプロジェクト名
```

> プロジェクト名は半角英数字とハイフンのみ(例: `taro-kesennuma-app`)
> 「Create a new project?」と聞かれたら Enter(Yes)

成功すると `https://〜.pages.dev` というURLが表示されます。
**それがあなたのアプリの、世界に公開されたアドレスです。** スマホで開いてみてください 🎉

---

## うまくいかないとき

- まず [docs/troubleshooting.md](docs/troubleshooting.md) を見る
- 会場ではスタッフに声をかける
- 帰ってからは **Discord の #dev-help** に、エラーメッセージのスクショと一緒に投稿

## 今日のあとも続けるには

- この Codespace はあなたの GitHub アカウントに残っています。
  https://github.com/codespaces からいつでも再開できます(無料枠: 月120コア時間)
- 使い終わったら Codespace を **Stop** しておくと無料枠の節約になります
- ワークショップのAPIキーには有効期限があります。切れたあとの選択肢は Discord で案内します
