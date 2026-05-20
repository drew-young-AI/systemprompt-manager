# 推送測試和驗證指南

## 推送前檢查清單

### ✅ 本機準備檢查

```bash
cd ~/github-systemprompt-manager

# 1. 檢查 git 狀態
git status
# 結果應為: "nothing to commit, working tree clean"

# 2. 檢查 commits
git log --oneline | head -10
# 應該看到至少 7 個 commits

# 3. 檢查檔案
ls -la | grep -E "README|install|PUSH"
# 應該看到所有關鍵檔案
```

### 📋 GitHub 前置準備檢查

在執行推送前，確認：

- [ ] 已訪問 https://github.com/settings/tokens 
- [ ] 已建立 PAT token (格式: ghp_xxx)
- [ ] PAT 有 `repo` scope
- [ ] PAT 已複製到剪貼板
- [ ] 已訪問 https://github.com/new
- [ ] 已建立空 repository `system-prompt-manager`
- [ ] Repository 設為 Public
- [ ] 未初始化任何檔案 (readme, gitignore 等)

## 推送執行步驟

### 方法 A: 一行命令 (推薦)

```bash
cd ~/github-systemprompt-manager

# 互動式輸入 (會提示你輸入)
bash PAT_INPUT.sh

# 或直接提供參數
bash PAT_INPUT.sh your-username your-pat-token
```

### 方法 B: 手動推送

```bash
cd ~/github-systemprompt-manager

# 1. 設定認證
git config credential.helper store
echo "https://your-username:your-pat-token@github.com" | git credential approve

# 2. 新增 remote
git remote add origin https://github.com/your-username/system-prompt-manager.git

# 3. 推送
git push -u origin main

# 4. 驗證
git branch -a
# 應該顯示: * main (指向 origin/main)
```

## 推送驗證

### 成功標誌

推送成功後，會看到：

```
✅ Successfully pushed to GitHub!

📍 Repository URL:
   https://github.com/your-username/system-prompt-manager

🎯 Next Steps:
   1. Visit the URL above to verify
   2. Others can clone: git clone https://github.com/your-username/system-prompt-manager.git
   3. Use in Copilot: cd ~/github-systemprompt-manager && copilot
```

### 在 GitHub 上驗證

訪問 `https://github.com/your-username/system-prompt-manager`，確認：

- [ ] README.md 內容顯示
- [ ] 7 個 commits 可見
- [ ] 所有資料夾存在 (config/, skills/, scripts/)
- [ ] README 用中英雙語顯示

### 測試大家能否 Clone

```bash
# 在另一個位置測試
cd /tmp
git clone https://github.com/your-username/system-prompt-manager.git
cd system-prompt-manager
ls -la
# 應該看到所有檔案
```

### 測試安裝

```bash
cd system-prompt-manager
bash install.sh

# 驗證安裝
ls -la ~/.copilot/skills/systemprompt.md
ls -la ~/.copilot/copilot-instructions.md
```

## 常見問題排查

### ❌ "401 Unauthorized"
- 檢查 PAT 是否正確複製（無空格）
- 確保 PAT 未過期
- 驗證 PAT 有 `repo` scope

### ❌ "404 Not Found"
- 確認 GitHub 上的 repo 已建立
- 檢查 repo 名稱是否正確: `system-prompt-manager`
- 確認 repo 是 Public

### ❌ "fatal: 'origin' does not appear to be a git repository"
- 確認在正確目錄: `cd ~/github-systemprompt-manager`
- 檢查 `.git` 資料夾是否存在: `ls -la .git`

### ❌ 推送後 repo 是空的
- 檢查 commits 是否真的存在: `git log --oneline`
- 嘗試手動推送: `git push -u origin main`
- 重新整理 GitHub 頁面

## 推送後的工作流程

### 更新 Prompt

在本機編輯:
```bash
cd ~/github-systemprompt-manager
nano config/copilot-instructions.md
```

提交和推送:
```bash
git add config/copilot-instructions.md
git commit -m "Update Copilot prompt"
git push origin main
```

### 給大家用

他人可以:
```bash
git clone https://github.com/your-username/system-prompt-manager.git
cd system-prompt-manager
bash install.sh
```

## 在 Copilot CLI 中操作

```bash
cd ~/github-systemprompt-manager
copilot

# 在 CLI 中
/env                          # 檢查環境
! git status                 # 查看 git 狀態
! git log --oneline -5       # 查看最近 5 個 commits
/systemprompt verify         # 驗證 system prompt 已安裝
```

---

**準備好了？** 執行: `bash PAT_INPUT.sh`
