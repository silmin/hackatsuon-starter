#!/usr/bin/env bash
# Hackatsuon Starter - 環境セットアップスクリプト
# Codespace の初回起動時に自動実行されます(数分かかります)

set -x

# 1. Claude Code(AIコーディングエージェント)のインストール
curl -fsSL https://claude.ai/install.sh | bash

# PATH を通す(bash / zsh 両対応)
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.profile"

# 2. wrangler(Cloudflare デプロイ用CLI)のインストール
npm install -g wrangler

# 3. 簡易プレビュー用の http-server
npm install -g http-server

# 完了メッセージ
cat << 'EOF'

========================================
 Hackatsuon Starter のセットアップ完了!
 README.md の手順に沿って進めてください
========================================

EOF
