# 🚀 GitHub 推送指南 - 已準備就緒

## 目前狀態

✅ **本機 repo 完全準備好**
- 位置: `~/github-systemprompt-manager`
- Commits: 4 個
- 所有檔案已追蹤和提交

✅ **自動化推送腳本已建立**
- 檔案: `PUSH_INSTRUCTIONS.sh`
- 功能: 一鍵推送到 GitHub

---

## 一旦你有 PAT，執行這個命令

### 第 1 步：準備 PAT

1. 訪問 https://github.com/settings/tokens
2. 點擊 "Generate new token (classic)"
3. 設定:
   - Token name: `system-prompt-manager-push`
   - Scopes 勾選: `repo` (完整控制)
   - Expiration: 按需要選擇
4. 複製生成的 token (格式: `ghp_xxx...`)

### 第 2 步：在 GitHub 建立空 Repository

1. 訪問 https://github.com/new
2. 設定:
   - Repository name: `system-prompt-manager`
   - Description: `Unified System Prompt Manager for Copilot CLI, Gemini CLI, Antigravity`
   - Visibility: **Public**
   - 都不初始化
3. 點擊 "Create repository"

### 第 3 步：執行推送

替換下面的 `your-username` 和 `your-pat-token`，然後執行:

```bash
cd ~/github-systemprompt-manager

# 執行自動推送腳本
bash PUSH_INSTRUCTIONS.sh your-username your-pat-token
```

**例子:**
```bash
bash PUSH_INSTRUCTIONS.sh mydrawname ghp_1234567890abcdefghijklmnopqrstuv
```

---

## 腳本會做什麼

自動推送腳本會:

1. ✅ 檢查 git 狀態 (提交任何未追蹤的檔案)
2. ✅ 設定 GitHub 認證 (使用你的 PAT)
3. ✅ 配置 git remote (連接到你的 GitHub repo)
4. ✅ 推送所有 commits 到 main 分支
5. ✅ 驗證推送成功
6. ✅ 清理敏感資訊 (安全移除 PAT)
7. ✅ 顯示結果和後續步驟

---

## 推送成功後

### 1. 驗證
訪問: `https://github.com/your-username/system-prompt-manager`
應該看到所有檔案和 README 內容

### 2. 大家可以 Clone
```bash
git clone https://github.com/your-username/system-prompt-manager.git
cd system-prompt-manager
bash install.sh  # 一鍵安裝
```

### 3. 用 Copilot CLI 操作
```bash
cd ~/github-systemprompt-manager
copilot

# 在 CLI 中
/env                    # 檢查環境
! git status           # 查看 git 狀態
! git log --oneline    # 查看 commits
/systemprompt update   # 更新 prompt
```

---

## 如果推送失敗

### 常見問題

**❌ "401 Unauthorized"**
- 檢查 PAT 是否正確複製
- 確保 PAT 有 `repo` 權限

**❌ "404 Not Found"**
- GitHub 上的 repo 可能不存在
- 確保你已在 https://github.com/new 建立 repo

**❌ "Permission denied"**
- 檢查腳本是否有執行權限: `chmod +x PUSH_INSTRUCTIONS.sh`

### 手動推送（替代方案）

如果腳本失敗，可以手動執行:

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
git remote -v
```

---

## 安全提醒

- ✅ PAT 不會被保存 (推送後自動清除)
- ✅ 不要在腳本中硬編碼 PAT
- ✅ 不要把 PAT 提交到 git
- ✅ 定期更新或撤銷舊的 tokens

---

## 下一步

1. ✅ 準備 PAT 和 repo
2. ✅ 執行推送腳本
3. ✅ 驗證 GitHub 上的檔案
4. ✅ 分享 repo 連結給大家
5. ✅ 在 Copilot CLI 中操作此 repo

**準備好了？** 只要執行:
```bash
bash ~/github-systemprompt-manager/PUSH_INSTRUCTIONS.sh your-username your-pat
```
