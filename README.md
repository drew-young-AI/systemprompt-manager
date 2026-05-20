# System Prompt Manager for AI Coding Tools

統一管理 GitHub Copilot CLI、Gemini CLI、Antigravity 的 system prompt 配置工具。

[English](#english) | [繁體中文](#繁體中文)

---

## 繁體中文

### 概述

這個專案提供一套完整的 system prompt 配置和管理工具，支援：
- **GitHub Copilot CLI** - GitHub 官方命令行 AI 助手
- **Gemini CLI** - Google Gemini 命令行工具
- **Antigravity IDE** - Google Antigravity AI 編碼編輯器

### 功能

✅ 統一設定三個工具的 system prompt  
✅ 確保 prompt 內容一致性  
✅ 支援快速更新和驗證  
✅ 提供自動化腳本  
✅ 建置 Copilot CLI skill 供大家使用  

### 快速開始

#### 1. 複製此專案
```bash
git clone https://github.com/yourusername/system-prompt-manager.git
cd system-prompt-manager
```

#### 2. 安裝到本機
```bash
# 複製 skill
cp skills/systemprompt.md ~/.copilot/skills/

# 複製 config 到各工具目錄
cp config/copilot-instructions.md ~/.copilot/copilot-instructions.md
cp config/gemini-instructions.md ~/.gemini/GEMINI.md
cp config/antigravity-instructions.md ~/.antigravity/system-prompt.md
```

#### 3. 使用自動更新腳本
```bash
# 準備新的 system prompt
cat > my-prompt.txt << 'EOF'
[你的 system prompt 內容]
EOF

# 應用到三個工具
bash scripts/update-systemprompt.sh < my-prompt.txt
```

### 檔案結構

```
system-prompt-manager/
├── README.md                          # 本檔案
├── skills/
│   └── systemprompt.md               # Copilot CLI skill
├── scripts/
│   └── update-systemprompt.sh        # 自動更新腳本
└── config/
    ├── copilot-instructions.md       # Copilot CLI 配置
    ├── gemini-instructions.md        # Gemini CLI 配置
    └── antigravity-instructions.md   # Antigravity 配置
```

### 配置檔案說明

#### config/copilot-instructions.md
GitHub Copilot CLI 的 system prompt，存放位置：
- `~/.copilot/copilot-instructions.md` (全局)
- `<project>/.github/copilot-instructions.md` (專案級)

#### config/gemini-instructions.md
Gemini CLI 的 system prompt，存放位置：
- `~/.gemini/GEMINI.md`

#### config/antigravity-instructions.md
Antigravity IDE 的 system prompt，存放位置：
- `~/.antigravity/system-prompt.md`

### 核心 Principles

當前配置包含 18 條核心原則，分為 4 大類：

#### 1. Core Operating Principles (5條)
- 英文思考，繁體中文回應
- 以目標為導向
- 敢於糾正錯誤假設
- 優先考慮正確性和精確度
- 避免冗餘，專注實用價值

#### 2. Environment Safety (5條)
- 不污染主機系統
- 使用隔離環境 (venv, Docker 等)
- Apple Silicon 相容性
- 可重現性
- 防止依賴衝突

#### 3. Reasoning & Problem Decomposition (4條)
- 原子化問題
- 識別依賴和先決條件
- 重新框架化誤導性請求
- 確保解決方案符合真實目標

#### 4. Communication Style (4條)
- 直接、結構化、技術嚴謹
- 解釋權衡取捨
- 避免冗餘解釋
- 清晰的步驟格式

### 更新 System Prompt

#### 方法 1: 使用腳本
```bash
cat new-prompt.txt | bash scripts/update-systemprompt.sh
```

#### 方法 2: 直接編輯配置檔
```bash
nano config/copilot-instructions.md
# 然後複製到各工具目錄
cp config/copilot-instructions.md ~/.copilot/copilot-instructions.md
cp config/copilot-instructions.md ~/.gemini/GEMINI.md
cp config/copilot-instructions.md ~/.antigravity/system-prompt.md
```

#### 方法 3: 在 Copilot CLI 中使用 skill
```bash
copilot
# 在 CLI 中
/systemprompt update
# 貼入新的 prompt 內容
```

### GitHub Copilot CLI 整合

如果你有 GitHub 帳號並已認證 Copilot CLI，可以用以下指令：

```bash
# 檢查 Copilot 狀態
copilot /version

# 查看已加載的 system prompt
copilot /env

# 在 Copilot 中使用此 skill
copilot /skills
```

### 貢獻

歡迎提交 Pull Requests 改進 system prompt 或新增功能。

### 授權

MIT License - 自由使用和修改

---

## English

### Overview

This project provides a unified system prompt configuration and management tool for:
- **GitHub Copilot CLI** - Official GitHub command-line AI assistant
- **Gemini CLI** - Google Gemini command-line tool
- **Antigravity IDE** - Google Antigravity AI coding editor

### Features

✅ Unified system prompt configuration for all three tools  
✅ Consistency validation across prompts  
✅ Quick update and verification  
✅ Automated scripts  
✅ Copilot CLI skill for easy management  

### Quick Start

#### 1. Clone this repository
```bash
git clone https://github.com/yourusername/system-prompt-manager.git
cd system-prompt-manager
```

#### 2. Install locally
```bash
# Copy skill
cp skills/systemprompt.md ~/.copilot/skills/

# Copy config to tool directories
cp config/copilot-instructions.md ~/.copilot/copilot-instructions.md
cp config/gemini-instructions.md ~/.gemini/GEMINI.md
cp config/antigravity-instructions.md ~/.antigravity/system-prompt.md
```

#### 3. Use automated update script
```bash
# Prepare new system prompt
cat > my-prompt.txt << 'EOF'
[Your system prompt content]
EOF

# Apply to all three tools
bash scripts/update-systemprompt.sh < my-prompt.txt
```

### File Structure

```
system-prompt-manager/
├── README.md                          # This file
├── skills/
│   └── systemprompt.md               # Copilot CLI skill
├── scripts/
│   └── update-systemprompt.sh        # Automated update script
└── config/
    ├── copilot-instructions.md       # Copilot CLI config
    ├── gemini-instructions.md        # Gemini CLI config
    └── antigravity-instructions.md   # Antigravity config
```

### Core 18 Principles

The current configuration includes 18 core principles organized into 4 categories:

1. **Core Operating Principles** - English thinking, Chinese response, goal-oriented, correctness-first
2. **Environment Safety** - No system pollution, isolated environments, Apple Silicon aware
3. **Reasoning & Problem Decomposition** - Atomic components, dependency identification, reframing
4. **Communication Style** - Direct, structured, technical rigor, clear formatting

### License

MIT License - Free to use and modify

---

**維護者**: Drew  
**建立日期**: 2026-05-20  
**狀態**: ✅ Active
