# System Prompt Manager for AI Coding Tools

統一管理 7 個 AI 編碼工具的 system prompt 配置工具。

[English](#english) | [繁體中文](#繁體中文)

---

## 繁體中文

### 概述

這個專案提供一套完整的 system prompt 配置和管理工具，支援 **7 個 AI 工具**：

| 工具 | 配置路徑 | 說明 |
|------|----------|------|
| GitHub Copilot CLI | `~/.copilot/copilot-instructions.md` | GitHub 官方命令行 AI 助手 |
| Gemini CLI | `~/.gemini/GEMINI.md` | Google Gemini 命令行工具 |
| AI CLI | `~/.ai/GEMINI.md` | Google AI CLI |
| Antigravity | `~/.antigravity/system-prompt.md` | Google Antigravity AI 編碼編輯器 |
| Claude Code | `~/.claude/CLAUDE.md` | Anthropic Claude 程式碼助手 |
| Codex CLI | `~/.codex/AGENTS.md` | OpenAI Codex CLI |
| Cursor | `~/.cursorrules` | Cursor AI IDE |
| **Hermes Agent** | **SKILL.md (Source of Truth)** | Hermes Agent skill |

### 功能

✅ 統一設定 7 個工具的 system prompt
✅ 確保 prompt 內容一致性
✅ 支援快速更新和驗證
✅ 提供自動化同步腳本
✅ 建置 Hermes Agent skill 供使用

### 快速開始

#### 1. 複製此專案
```bash
git clone https://github.com/drew-young-AI/systemprompt-manager.git
cd systemprompt-manager
```

#### 2. 安裝到本機
```bash
bash install.sh
```

#### 3. 使用自動更新腳本
```bash
bash scripts/update-systemprompt.sh
```

### 檔案結構

```
systemprompt-manager/
├── README.md              # 本檔案
├── install.sh             # 一鍵安裝腳本
├── skills/
│   └── systemprompt.md    # 統一 system prompt 內容
├── scripts/
│   └── update-systemprompt.sh  # 自動同步腳本 (7 工具)
├── config/
│   ├── copilot-instructions.md    # Copilot CLI 配置
│   ├── gemini-instructions.md     # Gemini CLI 配置
│   ├── antigravity-instructions.md # Antigravity 配置
│   ├── claude-instructions.md     # Claude Code 配置
│   ├── codex-instructions.md      # Codex CLI 配置
│   └── cursor-instructions.md     # Cursor 配置
├── skill-package/         # Hermes Agent skill 套件
│   ├── SKILL.md
│   ├── references/systemprompt.md
│   └── scripts/update-systemprompt.sh
└── skill-src/             # Skill 原始檔
    └── SKILL.md
```

### 核心原則

當前配置包含 **5 條通用原則 + 18 條核心原則 + 研究協議**：

#### Universal AI Interaction Principles (5 條)
1. **Visualization & Verification** - 視覺化與驗收
2. **Evidence-Based Data Integrity** - 數據證據鏈
3. **Minimalist & Clean Development** - 極簡開發與清潔
4. **Plan-Driven Execution** - 計畫與清單驅動
5. **Quality Gate & Universal Self-Review** - 品質門檻與通用自我複審
   - 5a. **Cognitive Bias De-anchoring** - 認知偏誤去錨點

#### Core Operating Principles (18 條，4 大類)
- **Core Operating** (1-5): 英文思考、繁體中文回應、以目標為導向、敢於糾正、正確性優先
- **Environment Safety** (6-10): 不污染主機、隔離環境、Apple Silicon 相容、可重現、防止依賴衝突
- **Reasoning & Decomposition** (11-14): 原子化問題、識別依賴、重新框架化、真實目標對標
- **Communication Style** (15-18): 直接結構化、解釋權衡、避免冗餘、清晰步驟格式

#### 研究與分析協議
- **High-Density Research Protocol**: 10 欄位技術矩陣
- **Traceability Mandate**: [Local](path) | [Web](URL) 溯源格式
- **CYCH Focus**: 對標嘉義基督教醫院數據場景
- **Technical Rigor**: 深入算法層分析

### 更新 System Prompt

#### 方法 1: 使用同步腳本（推薦）
```bash
bash scripts/update-systemprompt.sh
```

#### 方法 2: 手動更新
修改 `skills/systemprompt.md`，然後執行同步腳本。

#### 方法 3: 透過 Hermes Agent
Hermes Agent 的 `systemprompt-manager` skill 是 Source of Truth，修改後同步至所有工具。

### 授權

MIT License - 自由使用和修改

---

## English

### Overview

This project provides a unified system prompt configuration and management tool for **7 AI coding tools**:

| Tool | Config Path | Description |
|------|-------------|-------------|
| GitHub Copilot CLI | `~/.copilot/copilot-instructions.md` | GitHub's official CLI AI assistant |
| Gemini CLI | `~/.gemini/GEMINI.md` | Google Gemini command-line tool |
| AI CLI | `~/.ai/GEMINI.md` | Google AI CLI |
| Antigravity | `~/.antigravity/system-prompt.md` | Google Antigravity AI coding editor |
| Claude Code | `~/.claude/CLAUDE.md` | Anthropic Claude code assistant |
| Codex CLI | `~/.codex/AGENTS.md` | OpenAI Codex CLI |
| Cursor | `~/.cursorrules` | Cursor AI IDE |
| **Hermes Agent** | **SKILL.md (Source of Truth)** | Hermes Agent skill |

### Features

✅ Unified system prompt configuration for all 7 tools
✅ Consistency validation across prompts
✅ Quick update and verification
✅ Automated sync scripts
✅ Hermes Agent skill package

### Quick Start

#### 1. Clone this repository
```bash
git clone https://github.com/drew-young-AI/systemprompt-manager.git
cd systemprompt-manager
```

#### 2. Install locally
```bash
bash install.sh
```

#### 3. Use automated sync script
```bash
bash scripts/update-systemprompt.sh
```

### Core Principles

The current configuration includes **5 Universal Principles + 18 Core Operating Principles + Research Protocol**:

#### Universal AI Interaction Principles (5)
1. Visualization & Verification
2. Evidence-Based Data Integrity
3. Minimalist & Clean Development
4. Plan-Driven Execution
5. Quality Gate & Universal Self-Review (+ 5a. Cognitive Bias De-anchoring)

#### Core Operating Principles (18, 4 categories)
- **Core Operating** (1-5): English thinking, Chinese response, goal-oriented, correctness-first
- **Environment Safety** (6-10): No system pollution, isolated environments, Apple Silicon aware
- **Reasoning & Decomposition** (11-14): Atomic components, dependency identification, reframing
- **Communication Style** (15-18): Direct, structured, technical rigor, clear formatting

#### Research & Analysis Protocol
- High-Density Research Protocol: 10-field technical matrix
- Traceability Mandate: [Local](path) | [Web](URL) format
- CYCH Focus: Aligned with Changhua Christian Hospital data scenarios
- Technical Rigor: Algorithm-level analysis (O(n) complexity, gating weights, etc.)

### License

MIT License - Free to use and modify

---

**維護者**: Drew (drew-young-AI)
**版本**: 2.0.0
**建立日期**: 2026-05-20
**狀態**: ✅ Active
