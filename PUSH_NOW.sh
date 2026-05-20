#!/bin/bash
# 立即推送到 GitHub - 最簡單的方式
# Simply paste your PAT when prompted

set -e

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║     System Prompt Manager - GitHub Push (立即推送)            ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# 檢查當前目錄
if [ ! -d ".git" ]; then
    echo "❌ 錯誤: 必須在 git repository 目錄執行"
    exit 1
fi

echo "📍 Repository: $(pwd)"
echo ""

# 檢查 git 狀態
if [ -n "$(git status --porcelain)" ]; then
    echo "❌ 錯誤: Repository 有未提交的變更"
    git status
    exit 1
fi

echo "✅ Repository 狀態: 清潔"
echo ""

# 取得用戶名
read -p "📝 GitHub 用戶名: " USERNAME

if [ -z "$USERNAME" ]; then
    echo "❌ 用戶名不能為空"
    exit 1
fi

echo ""

# 取得 PAT
echo "🔐 GitHub PAT Token (會隱藏輸入)"
read -sp "PAT (ghp_...): " PAT
echo ""

if [ -z "$PAT" ]; then
    echo "❌ PAT 不能為空"
    exit 1
fi

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "⏳ 執行推送..."
echo "═══════════════════════════════════════════════════════════════════"
echo ""

# 設定認證
git config credential.helper store
echo "https://$USERNAME:$PAT@github.com" | git credential approve 2>/dev/null || true

# 移除舊 remote
git remote remove origin 2>/dev/null || true

# 添加新 remote
git remote add origin "https://github.com/$USERNAME/system-prompt-manager.git"
echo "✅ Remote 已設定"

# 推送
if git push -u origin main 2>&1; then
    echo ""
    echo "═══════════════════════════════════════════════════════════════════"
    echo "✨ 推送成功！"
    echo "═══════════════════════════════════════════════════════════════════"
    echo ""
    echo "📍 Repository 位置:"
    echo "   https://github.com/$USERNAME/system-prompt-manager"
    echo ""
    echo "🎯 下一步:"
    echo "   1. 訪問上述 URL 驗證"
    echo "   2. 分享給大家: git clone https://github.com/$USERNAME/system-prompt-manager.git"
    echo "   3. 他人執行: bash install.sh"
    echo ""
else
    echo ""
    echo "❌ 推送失敗"
    echo ""
    echo "常見問題:"
    echo "  - 檢查 PAT 是否正確"
    echo "  - 檢查 repository 是否存在"
    echo "  - 檢查 PAT 有 'repo' scope"
    exit 1
fi

# 清理
echo ""
echo "🔒 清理敏感資訊..."
git credential reject "https://github.com" 2>/dev/null || true
unset PAT
echo "✅ 完成"

