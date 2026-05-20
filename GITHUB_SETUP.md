# 上傳到 GitHub 指南

## 步驟 1: 在 GitHub 建立空 Repository

1. 登入 GitHub (https://github.com)
2. 點擊右上角 **+** → **New repository**
3. 設定：
   - **Repository name**: `system-prompt-manager`
   - **Description**: `Unified System Prompt Manager for Copilot CLI, Gemini CLI, and Antigravity`
   - **Visibility**: Public (讓大家使用)
   - **初始化選項**: 都不選（因為你已有 git repo）
4. 點擊 **Create repository**

## 步驟 2: 連接本機 Repo 到 GitHub

在終端執行（將 `yourusername` 改成你的 GitHub 用戶名）：

```bash
cd ~/github-systemprompt-manager

# 檢查目前狀態
git status

# 新增 GitHub remote
git remote add origin https://github.com/yourusername/system-prompt-manager.git

# 重新命名預設分支為 main（如果還不是）
git branch -M main

# Push 到 GitHub
git push -u origin main
```

## 步驟 3: 驗證上傳成功

```bash
# 檢查 remote
git remote -v
# 應該顯示:
# origin  https://github.com/yourusername/system-prompt-manager.git (fetch)
# origin  https://github.com/yourusername/system-prompt-manager.git (push)

# 檢查 push 狀態
git log --oneline
```

## 步驟 4: 在 GitHub 上驗證

1. 瀏覽 https://github.com/yourusername/system-prompt-manager
2. 應該看到：
   - README.md 的內容顯示
   - 所有檔案（skills/、scripts/、config/）
   - 1 個 commit

## 使用 GitHub Copilot CLI 操作

### 在本機 repo 中使用 Copilot CLI

```bash
cd ~/github-systemprompt-manager

# 啟動 Copilot CLI
copilot

# 在 CLI 中，可以做：
# 1. 檢查 repo 狀態
! git status

# 2. 查看最新 commit
! git log --oneline -3

# 3. 建立新分支提交更改
! git checkout -b feat/update-prompt

# 4. 提交變更
! git add config/copilot-instructions.md
! git commit -m "Update system prompt"
! git push origin feat/update-prompt
```

### 使用 Copilot 建立 Pull Request

```bash
copilot

# 在 CLI 提示符中
/delegate
# Copilot 會幫助建立 PR 並推送到 GitHub
```

## 常見 Git 命令（在 Copilot 中使用）

### 查看遠端狀態
```bash
copilot
! git remote -v
! git branch -a
```

### 同步來自 GitHub 的最新變更
```bash
! git pull origin main
```

### 建立新分支
```bash
! git checkout -b feature/new-prompt
```

### 提交並推送
```bash
! git add .
! git commit -m "Your commit message"
! git push origin feature/new-prompt
```

## 驗證工作流程

### 完整工作流示例

```bash
# 1. 進入本機 repo
cd ~/github-systemprompt-manager

# 2. 啟動 Copilot
copilot

# 3. 在 Copilot 中查看狀態
! git status

# 4. 編輯 prompt（編輯器中）
nano config/copilot-instructions.md

# 5. 提交並推送
! git add config/copilot-instructions.md
! git commit -m "Update Copilot prompt with new principles"
! git push origin main

# 6. 查看結果
! git log --oneline -2
```

## 讓大家使用你的 Repo

現在別人可以：

### 1. Clone 你的 Repo
```bash
git clone https://github.com/yourusername/system-prompt-manager.git
cd system-prompt-manager
bash install.sh  # 自動安裝
```

### 2. 或者手動安裝
```bash
# 複製 skill
cp skills/systemprompt.md ~/.copilot/skills/

# 複製配置
cp config/*.md ~/.copilot/
```

### 3. 在 Copilot 中使用
```bash
copilot
/systemprompt verify  # 檢查已安裝的 skill
```

## 更新流程（未來）

1. 在本機編輯 prompt
2. 測試驗證
3. 提交到 GitHub
4. 他人 pull/clone 最新版本

---

**提示**: 你現在可以在終端執行上述 git 命令，或在 Copilot CLI 中用 `!` 前綴執行它們。
