#!/bin/bash
# PAT Input Handler - 接收 PAT 並自動推送
# 將 PAT 寫入檔案，此腳本會監測並執行推送

PAT_FILE="$HOME/.copilot/github-pat-temp"
USERNAME_FILE="$HOME/.copilot/github-username-temp"

show_usage() {
    echo "使用方式："
    echo ""
    echo "方法 1: 命令行參數"
    echo "  bash PAT_INPUT.sh <username> <pat-token>"
    echo ""
    echo "方法 2: 互動式輸入"
    echo "  bash PAT_INPUT.sh"
    echo ""
    echo "例子："
    echo "  bash PAT_INPUT.sh myusername ghp_1234567890abcdefghijklmnopqrstuv"
}

if [ $# -eq 0 ]; then
    # 互動式模式
    echo "🔐 GitHub PAT 輸入"
    echo ""
    read -p "GitHub 用戶名: " GITHUB_USERNAME
    read -sp "GitHub PAT Token: " GITHUB_PAT
    echo ""
else
    GITHUB_USERNAME="$1"
    GITHUB_PAT="$2"
fi

if [ -z "$GITHUB_USERNAME" ] || [ -z "$GITHUB_PAT" ]; then
    echo "❌ 缺少必要資訊"
    show_usage
    exit 1
fi

# 驗證 PAT 格式
if [[ ! "$GITHUB_PAT" =~ ^ghp_ ]]; then
    echo "⚠️  警告: PAT 應該以 'ghp_' 開頭"
fi

echo ""
echo "準備推送..."
echo "  用戶名: $GITHUB_USERNAME"
echo "  Token: ${GITHUB_PAT:0:10}...${GITHUB_PAT: -5}"
echo ""

# 執行推送
cd "$(dirname "$0")" || exit 1
bash PUSH_INSTRUCTIONS.sh "$GITHUB_USERNAME" "$GITHUB_PAT"

EXIT_CODE=$?

# 清理
if [ $EXIT_CODE -eq 0 ]; then
    echo ""
    echo "✨ 推送成功！"
fi

exit $EXIT_CODE
