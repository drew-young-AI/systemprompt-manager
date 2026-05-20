# 使用指南 - System Prompt Manager

## 🚀 快速開始 (5 分鐘)

### Step 1: 準備 GitHub 帳號資訊

訪問 **https://github.com/settings/tokens**
- 點擊 "Generate new token (classic)"
- Token name: `system-prompt-manager-push`
- ⚠️ **重要**: 勾選 `repo` scope
- 點擊 "Generate token"
- 複製整個 token (只會顯示一次)

記下你的 **GitHub 用戶名** (https://github.com 右上角 → Profile)

### Step 2: 建立 GitHub Repository

訪問 **https://github.com/new**
- Repository name: `system-prompt-manager`
- ⚠️ **重要**: Visibility 選擇 **Public**
- ⚠️ **重要**: 都不勾選初始化選項
- 點擊 "Create repository"

### Step 3: 執行推送

```bash
cd ~/github-systemprompt-manager

# 方法 A: 互動式 (推薦給第一次使用)
bash COMPLETE_AUTOMATION.sh

# 方法 B: 直接提供參數
bash COMPLETE_AUTOMATION.sh your-username ghp_your-token

# 或使用原始腳本
bash PAT_INPUT.sh your-username ghp_your-token
```

**完成！** ✨ 推送應該在 30 秒內完成

---

## 📊 完成後的驗證

### 在終端驗證

```bash
cd ~/github-systemprompt-manager

# 檢查 remote
git remote -v
# 應顯示: origin https://github.com/your-username/system-prompt-manager.git

# 檢查分支同步
git branch -a
# 應顯示: * main 和 remotes/origin/main
```

### 在 GitHub 上驗證

訪問 **https://github.com/your-username/system-prompt-manager**
- [ ] 能看到 README.md 內容
- [ ] 左側顯示 10 個 commits
- [ ] 資料夾結構完整 (config/, scripts/, skills/)
- [ ] 10 個檔案都存在

---

## 🎯 使用方式

### 給大家分享使用

```bash
# 他人可以 clone
git clone https://github.com/your-username/system-prompt-manager.git
cd system-prompt-manager

# 一鍵安裝
bash install.sh
```

### 在 Copilot CLI 中操作

```bash
cd ~/github-systemprompt-manager
copilot

# 在 CLI 中
/env                          # 檢查已加載的 system prompt
! git status                 # 查看 git 狀態
! git log --oneline -3       # 查看最近 3 個 commits

/systemprompt update         # 更新 system prompt
# 貼入新的 prompt 內容
# 自動推送到 GitHub
```

### 更新 System Prompt

在本機編輯:
```bash
cd ~/github-systemprompt-manager
nano config/copilot-instructions.md
# 編輯 Copilot prompt

nano config/gemini-instructions.md
# 編輯 Gemini prompt

nano config/antigravity-instructions.md
# 編輯 Antigravity prompt
```

提交和推送:
```bash
git add config/
git commit -m "Update system prompts"
git push origin main
```

或使用自動化工具:
```bash
bash scripts/update-systemprompt.sh < new-prompt.txt
git add config/
git commit -m "Update system prompts"
git push origin main
```

---

## 🔧 自動化工具

### install.sh - 一鍵安裝

```bash
# 給大家用（clone 後執行）
bash install.sh

# 自動:
# - 複製 Copilot CLI skill
# - 安裝系統 prompt 到三個工具
# - 安裝更新腳本
# - 檢測已安裝的工具
```

### scripts/update-systemprompt.sh - 本機工具

```bash
# 更新三個工具的 prompt
cat new-prompt.txt | bash ~/.copilot/update-systemprompt.sh

# 驗證安裝
bash ~/.copilot/update-systemprompt.sh
```

### COMPLETE_AUTOMATION.sh - 完整推送

```bash
# 互動式
bash COMPLETE_AUTOMATION.sh

# 直接參數
bash COMPLETE_AUTOMATION.sh username pat-token

# 功能:
# - 驗證輸入
# - 檢查前置條件
# - 驗證本機 repo
# - 執行推送
# - 驗證結果
# - 清理敏感資訊
```

---

## 📚 文檔位置

| 檔案 | 用途 |
|------|------|
| **README.md** | 專案介紹 (給大家看) |
| **INSTALL.md** | 安裝步驟 |
| **USAGE_GUIDE.md** | 本檔案 - 使用指南 |
| **FINAL_CHECKLIST.md** | 最終檢查清單 |
| **TEST_PUSH.md** | 測試和故障排除 |
| **COMPLETE_AUTOMATION.sh** | 完整自動化推送 |
| **PAT_INPUT.sh** | 互動式 PAT 輸入 |

---

## 🐛 故障排除

### 推送失敗 "401 Unauthorized"

**原因**: PAT 無效或格式錯誤

**解決**:
1. 檢查 PAT 是否正確複製（無多餘空格）
2. 確保 PAT 未過期
3. 驗證 PAT 有 `repo` scope
4. 重新建立新的 PAT

### 推送失敗 "404 Not Found"

**原因**: GitHub 上的 repository 不存在

**解決**:
1. 訪問 https://github.com/new 建立新 repo
2. Repository name 必須是 `system-prompt-manager`
3. 確認設為 Public
4. 重新執行推送

### 推送後 GitHub 是空的

**原因**: Commits 未完全推送

**解決**:
1. 檢查本機 commits: `git log --oneline`
2. 手動推送: `git push -u origin main --force`
3. 重新整理 GitHub 頁面

---

## ✅ 常見問題

**Q: PAT 會被保存嗎?**
A: 不會。推送完成後自動清除。

**Q: 可以改 repo 名稱嗎?**
A: 不建議。腳本預設 `system-prompt-manager`。如要改名需編輯腳本。

**Q: 多個人可以 contribute 嗎?**
A: 是的。可以接受 Pull Requests。設定 Collaborators 即可。

**Q: 可以私密嗎?**
A: 不建議。System Prompt 通常不含敏感資訊。如需隱私可設為 Private。

**Q: 推送多次會怎樣?**
A: 第一次 push 會建立分支。後續 push 只更新。不會有問題。

---

## 🎓 學習更多

- Git 教程: https://git-scm.com/doc
- GitHub 文檔: https://docs.github.com
- Copilot CLI 指南: https://github.com/github/copilot-cli

---

**準備好了？** 執行:
```bash
bash ~/github-systemprompt-manager/COMPLETE_AUTOMATION.sh
```

需要幫助？查看 **TEST_PUSH.md** 的故障排除段落。
