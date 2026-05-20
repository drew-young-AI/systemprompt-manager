# 快速檢查清單

## ✅ 本機準備完成

- [x] Git repository 初始化
- [x] 所有檔案已加入 
- [x] 2 個 commits 已建立
- [x] 本機 repo 位置: `~/github-systemprompt-manager`

## 📋 下一步 (需要你執行)

### 1️⃣ 在 GitHub 建立 Repository
```
瀏覽 https://github.com/new
- Repository name: system-prompt-manager
- Description: Unified System Prompt Manager for Copilot CLI, Gemini CLI, Antigravity
- Visibility: Public
- 其他選項都不勾選
點擊 "Create repository"
```

### 2️⃣ 推送本機 Repo 到 GitHub
執行以下命令（改 `yourusername` 為你的 GitHub 用戶名）：

```bash
cd ~/github-systemprompt-manager

# 新增 remote
git remote add origin https://github.com/yourusername/system-prompt-manager.git

# 推送主分支
git push -u origin main
```

### 3️⃣ 驗證上傳
```bash
# 檢查 remote
git remote -v

# 訪問 https://github.com/yourusername/system-prompt-manager
```

## 🎯 最終結果

完成後，你的 GitHub repo 將包含：

```
system-prompt-manager/
├── README.md                    # 專案介紹
├── INSTALL.md                   # 安裝指南
├── GITHUB_SETUP.md             # GitHub 設定指南
├── config/
│   ├── copilot-instructions.md
│   ├── gemini-instructions.md
│   └── antigravity-instructions.md
├── scripts/
│   └── update-systemprompt.sh
└── skills/
    └── systemprompt.md
```

## 🚀 使用 Copilot CLI 操作此 Repo

### 啟動 Copilot CLI
```bash
cd ~/github-systemprompt-manager
copilot
```

### 在 Copilot 中執行 Git 命令
```bash
# 查看狀態
! git status

# 查看 commits
! git log --oneline

# 查看遠端
! git remote -v

# 建立新分支
! git checkout -b feature/your-feature

# 提交並推送
! git add .
! git commit -m "Your message"
! git push origin feature/your-feature
```

### 使用 Copilot Skill 更新 Prompt
```bash
# 在 Copilot CLI 中
/systemprompt update
# 貼入新的 system prompt
# 自動更新三個工具配置並提交到 GitHub
```

## 📊 當前狀態

**本機 Repo 狀態**: ✅ Ready to push

```
Commits: 2
Files: 8
Location: ~/github-systemprompt-manager
Remote: (未設定，等待你建立 GitHub repo)
```

## ⚠️ 常見問題

**Q: 需要用 SSH 還是 HTTPS?**
A: HTTPS 更簡單（之後可升級到 SSH）

**Q: 如果忘記用戶名？**
A: 訪問 https://github.com/settings/profile

**Q: 如何驗證 GitHub 帳號？**
A: 首次 push 時會提示認證

**Q: 推送後想修改?**
A: 編輯檔案 → commit → push 即可

---

**準備好了嗎？** 按上面的步驟執行，完成後告訴我，我可以幫你驗證 Copilot CLI 是否能正常操作此 repo。
