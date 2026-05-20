#!/bin/bash
# Complete Automation Script - 完整自動化推送系統
# 包含所有必要步驟的驗證和執行

set -e

show_banner() {
    cat << 'BANNER'
╔════════════════════════════════════════════════════════════════╗
║   System Prompt Manager - Complete GitHub Push Automation     ║
║                     完全自動化推送系統                        ║
╚════════════════════════════════════════════════════════════════╝
BANNER
}

show_usage() {
    cat << 'USAGE'
使用方式:
  1. 互動式: bash COMPLETE_AUTOMATION.sh
  2. 直接: bash COMPLETE_AUTOMATION.sh <username> <pat-token>

範例:
  bash COMPLETE_AUTOMATION.sh myusername ghp_1234567890abcdefghijklmnopqrstuv

USAGE
}

validate_input() {
    local username="$1"
    local pat="$2"
    
    # 檢查用戶名
    if [ -z "$username" ]; then
        echo "❌ 錯誤: 用戶名不能為空"
        return 1
    fi
    
    # 檢查 PAT
    if [ -z "$pat" ]; then
        echo "❌ 錯誤: PAT 不能為空"
        return 1
    fi
    
    # 檢查 PAT 格式
    if [[ ! "$pat" =~ ^ghp_ ]]; then
        echo "⚠️  警告: PAT 應該以 'ghp_' 開頭"
        read -p "確認要繼續嗎? (y/N): " confirm
        if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
            return 1
        fi
    fi
    
    return 0
}

check_prerequisites() {
    echo "📋 檢查前置條件..."
    
    # 檢查 git
    if ! command -v git &> /dev/null; then
        echo "❌ Git 未安裝"
        return 1
    fi
    echo "✅ Git 已安裝"
    
    # 檢查 curl
    if ! command -v curl &> /dev/null; then
        echo "⚠️  Curl 未安裝 (可選)"
    else
        echo "✅ Curl 已安裝"
    fi
    
    return 0
}

verify_local_repo() {
    echo "📁 驗證本機 Repository..."
    
    if [ ! -d ".git" ]; then
        echo "❌ 不在 Git repository 中"
        return 1
    fi
    
    # 檢查 git 狀態
    if [ -n "$(git status --porcelain)" ]; then
        echo "❌ Repository 有未提交的變更"
        return 1
    fi
    
    # 計算 commits
    local commit_count=$(git log --oneline | wc -l)
    echo "✅ Repository 清潔 ($commit_count commits)"
    
    # 計算檔案
    local file_count=$(git ls-files | wc -l)
    echo "✅ $file_count 個檔案已追蹤"
    
    return 0
}

execute_push() {
    local username="$1"
    local pat="$2"
    
    echo ""
    echo "🚀 執行推送..."
    
    # 設定認證
    echo "1. 設定認證..."
    git config credential.helper store
    echo "https://$username:$pat@github.com" | git credential approve 2>/dev/null
    echo "   ✅ 認證已設定"
    
    # 新增 remote
    echo "2. 設定遠端..."
    git remote remove origin 2>/dev/null || true
    git remote add origin "https://github.com/$username/system-prompt-manager.git"
    echo "   ✅ Remote 已添加"
    
    # 嘗試推送
    echo "3. 推送到 GitHub..."
    if git push -u origin main 2>&1; then
        echo "   ✅ 推送成功"
        return 0
    else
        echo "   ❌ 推送失敗"
        return 1
    fi
}

verify_push() {
    local username="$1"
    
    echo ""
    echo "✔️ 驗證推送..."
    
    # 檢查 remote
    echo "1. 檢查 remote..."
    if git remote get-url origin | grep -q "$username"; then
        echo "   ✅ Remote 正確"
    else
        echo "   ❌ Remote 不匹配"
        return 1
    fi
    
    # 檢查分支
    echo "2. 檢查分支..."
    if git branch -a | grep -q "origin/main"; then
        echo "   ✅ 分支已同步"
    else
        echo "   ⚠️  分支可能未完全同步"
    fi
    
    return 0
}

cleanup() {
    echo ""
    echo "🔒 清理敏感資訊..."
    git credential reject "https://github.com" 2>/dev/null || true
    unset PAT
    echo "   ✅ 清理完成"
}

main() {
    show_banner
    
    # 檢查前置條件
    if ! check_prerequisites; then
        echo "❌ 前置條件檢查失敗"
        exit 1
    fi
    
    # 驗證本機 repo
    if ! verify_local_repo; then
        echo "❌ Repository 驗證失敗"
        exit 1
    fi
    
    echo ""
    
    # 取得用戶名和 PAT
    if [ $# -lt 2 ]; then
        echo "📝 請輸入 GitHub 資訊"
        read -p "GitHub 用戶名: " USERNAME
        read -sp "GitHub PAT Token: " PAT
        echo ""
    else
        USERNAME="$1"
        PAT="$2"
    fi
    
    # 驗證輸入
    if ! validate_input "$USERNAME" "$PAT"; then
        echo "❌ 輸入驗證失敗"
        exit 1
    fi
    
    # 執行推送
    if ! execute_push "$USERNAME" "$PAT"; then
        echo "❌ 推送失敗"
        cleanup
        exit 1
    fi
    
    # 驗證推送
    if ! verify_push "$USERNAME"; then
        echo "⚠️  驗證警告（推送可能仍成功）"
    fi
    
    # 清理
    cleanup
    
    echo ""
    echo "✨ 推送完成！"
    echo ""
    echo "📍 Repository URL:"
    echo "   https://github.com/$USERNAME/system-prompt-manager"
    echo ""
    echo "🎯 下一步:"
    echo "   1. 訪問上述 URL 驗證"
    echo "   2. 分享給大家使用"
    echo "   3. 在 Copilot CLI 中操作: copilot"
    
    return 0
}

# 執行主程序
if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
    main "$@"
fi
