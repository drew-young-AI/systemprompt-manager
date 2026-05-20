# Installation Guide

## 快速安裝

### 步驟 1: Clone Repository
```bash
git clone https://github.com/yourusername/system-prompt-manager.git
cd system-prompt-manager
```

### 步驟 2: 自動安裝腳本
建立以下安裝腳本使安裝更簡單：

```bash
#!/bin/bash
# install.sh

echo "🚀 Installing System Prompt Manager..."

# Create skill directory if not exists
mkdir -p ~/.copilot/skills

# Copy skill
cp skills/systemprompt.md ~/.copilot/skills/systemprompt.md
echo "✅ Copilot skill installed"

# Copy configs
cp config/copilot-instructions.md ~/.copilot/copilot-instructions.md
echo "✅ Copilot config installed"

cp config/gemini-instructions.md ~/.gemini/GEMINI.md 2>/dev/null || \
  echo "⚠️  Gemini CLI not found, skipping"

cp config/antigravity-instructions.md ~/.antigravity/system-prompt.md 2>/dev/null || \
  echo "⚠️  Antigravity not found, skipping"

# Copy update script
cp scripts/update-systemprompt.sh ~/.copilot/
chmod +x ~/.copilot/update-systemprompt.sh
echo "✅ Update script installed"

echo ""
echo "✨ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Start Copilot CLI: copilot"
echo "2. Check instructions: /env"
echo "3. Verify the system prompt is loaded"
```

### 步驟 3: 運行安裝
```bash
bash install.sh
```

## 手動安裝

如果不想用自動化腳本，可以手動複製：

### 複製 Skill 檔案
```bash
mkdir -p ~/.copilot/skills
cp skills/systemprompt.md ~/.copilot/skills/
```

### 複製配置檔案
```bash
# Copilot CLI
cp config/copilot-instructions.md ~/.copilot/copilot-instructions.md

# Gemini CLI
cp config/gemini-instructions.md ~/.gemini/GEMINI.md

# Antigravity
cp config/antigravity-instructions.md ~/.antigravity/system-prompt.md
```

### 複製更新工具
```bash
cp scripts/update-systemprompt.sh ~/.copilot/
chmod +x ~/.copilot/update-systemprompt.sh
```

## 驗證安裝

### 驗證 Copilot CLI
```bash
copilot
# 在 Copilot CLI 中執行
/env
# 應該看到 "instructions" 部分顯示你的 system prompt
```

### 驗證 Gemini CLI
啟動 Gemini，應該會自動讀取 `~/.gemini/GEMINI.md`

### 驗證 Antigravity
在 Antigravity 設定中檢查 AI Assistant 是否讀取了 system prompt

## 更新 System Prompt

### 快速更新
準備新的 prompt 文件並執行：
```bash
cat new-prompt.txt | bash ~/.copilot/update-systemprompt.sh
```

### 在 Copilot 中直接更新
```bash
copilot
# 在 CLI 中
/systemprompt update
# 貼入新的 prompt
```

## 故障排除

### Copilot 沒有讀取 instruction
- 檢查 `~/.copilot/copilot-instructions.md` 是否存在
- 執行 `copilot /env` 檢查加載狀態
- 重啟 Copilot CLI

### Gemini 沒有讀取配置
- 檢查 `~/.gemini/GEMINI.md` 是否存在
- 重啟 Gemini CLI
- 檢查檔案許可 (應該是 `-rw-r--r--`)

### 腳本許可被拒絕
```bash
chmod +x ~/.copilot/update-systemprompt.sh
```

## 支援

有問題？提交 GitHub Issue 或查看 README.md
