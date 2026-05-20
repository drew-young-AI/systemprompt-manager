# 最終檢查清單 - 推送前準備

## ✅ 本機準備完成確認

```bash
cd ~/github-systemprompt-manager

# 1. 確認 git 清潔
git status
# ✅ 應顯示: nothing to commit, working tree clean

# 2. 確認 commits
git log --oneline | wc -l
# ✅ 應顯示: 8 個 commits

# 3. 確認所有檔案
git ls-files | wc -l
# ✅ 應顯示: 15 個檔案

# 4. 確認 remote 未設定（尚未推送）
git remote -v
# ✅ 應無輸出（或為空）

# 5. 確認推送腳本可執行
ls -la PUSH_INSTRUCTIONS.sh PAT_INPUT.sh install.sh
# ✅ 應顯示: -rwxr-xr-x (可執行)
```

## 📋 GitHub 帳號準備

必須完成的步驟:

1. **建立 PAT Token**
   - [ ] 訪問: https://github.com/settings/tokens
   - [ ] 點擊 "Generate new token (classic)"
   - [ ] Token name: `system-prompt-manager-push`
   - [ ] ⚠️ IMPORTANT: 勾選 `repo` scope
   - [ ] 點擊 "Generate token"
   - [ ] ✅ 複製整個 token (格式: ghp_xxx)

2. **記下你的 GitHub 用戶名**
   - [ ] 訪問: https://github.com
   - [ ] 登入後右上角找你的頭像
   - [ ] 點擊 "Profile"
   - [ ] ✅ 複製 @ 符號後的用戶名

3. **在 GitHub 建立空 Repository**
   - [ ] 訪問: https://github.com/new
   - [ ] Repository name: `system-prompt-manager`
   - [ ] Description: (可選)
   - [ ] ⚠️ IMPORTANT: Visibility 選擇 **Public**
   - [ ] ⚠️ IMPORTANT: 都不勾選初始化選項
   - [ ] 點擊 "Create repository"

## 🚀 推送執行步驟

### 準備資訊

收集以下資訊（不要遺漏）:
```
GitHub Username: _______________________
GitHub PAT Token: ghp_____________________
Repository: system-prompt-manager
URL 將是: https://github.com/[USERNAME]/system-prompt-manager
```

### 執行推送

```bash
cd ~/github-systemprompt-manager

# 執行推送（選擇其中一個方法）

# 方法 1: 互動式（推薦）
bash PAT_INPUT.sh

# 方法 2: 直接提供
bash PAT_INPUT.sh your-username ghp_your-token

# 方法 3: 手動
bash PUSH_INSTRUCTIONS.sh your-username ghp_your-token
```

### 期望結果

成功時應顯示:
```
✅ Successfully pushed to GitHub!

📍 Repository URL:
   https://github.com/your-username/system-prompt-manager

🎯 Next Steps:
   1. Visit the URL above to verify
   2. Others can clone: git clone ...
   3. Use in Copilot: cd ~/github-systemprompt-manager && copilot
```

## ✔️ 推送後驗證

### 立即驗證（終端）

```bash
# 1. 檢查 remote 已設定
cd ~/github-systemprompt-manager
git remote -v
# ✅ 應顯示 origin URL

# 2. 檢查分支
git branch -a
# ✅ 應顯示 * main -> remotes/origin/main

# 3. 檢查 commits 已推送
git log origin/main --oneline | wc -l
# ✅ 應顯示 8 個 commits
```

### 在 GitHub 上驗證

訪問 `https://github.com/your-username/system-prompt-manager`

檢查清單:
- [ ] README.md 內容可見
- [ ] 左側顯示 8 commits
- [ ] 資料夾結構完整 (config/, scripts/, skills/)
- [ ] .gitignore 存在
- [ ] install.sh 可見

### 測試大家能否使用

```bash
# 在 tmp 目錄測試 clone
cd /tmp
git clone https://github.com/your-username/system-prompt-manager.git test-repo
cd test-repo

# 列出檔案
ls -la

# 應該看到:
# - config/
# - scripts/
# - skills/
# - README.md
# - install.sh
# 等所有檔案
```

### 測試安裝流程

```bash
# 還在 test-repo 中
bash install.sh

# 驗證安裝
ls ~/.copilot/copilot-instructions.md
ls ~/.copilot/skills/systemprompt.md
ls ~/.copilot/update-systemprompt.sh

# 都應該存在
```

### 測試 Copilot CLI

```bash
cd ~/github-systemprompt-manager
copilot

# 在 CLI 中執行
/env
# 應該看到 "instructions" 顯示你的 system prompt

! git status
# 應該顯示 clean

! git remote -v
# 應該顯示 origin 指向 GitHub
```

## 🎯 完成標誌

所有檢查都通過後:

✅ 本機準備完成  
✅ GitHub 帳號準備完成  
✅ 推送執行成功  
✅ GitHub 上驗證成功  
✅ Clone 和安裝測試通過  
✅ Copilot CLI 可操作  

**任務 100% 完成！** 🎉

---

## ⚠️ 如果推送失敗

參考 TEST_PUSH.md 的 "常見問題排查" 段落

最常見的原因:
- ❌ PAT 格式錯誤 (應以 ghp_ 開頭)
- ❌ PAT 沒有 repo scope
- ❌ GitHub 上的 repo 不存在
- ❌ repo 初始化時選了不應有的選項

**解決:** 查看 TEST_PUSH.md 的故障排除部分
