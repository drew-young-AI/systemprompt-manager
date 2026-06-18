#!/bin/bash
# Universal System Prompt Update Script v2.0
# Syncs system prompt to ALL 7 AI tools
# Source: https://github.com/drew-young-AI/systemprompt-manager

# 優先從本地開發路徑讀取，否則從 Hermes 技能路徑讀取
LOCAL_SOURCE="/Users/drew/Project/systemprompt-manager/skills/systemprompt.md"
HERMES_SOURCE="$HOME/.hermes/skills/productivity/systemprompt-manager/SKILL.md"

if [ -f "$LOCAL_SOURCE" ]; then
  SOURCE_FILE="$LOCAL_SOURCE"
elif [ -f "$HERMES_SOURCE" ]; then
  SOURCE_FILE="$HERMES_SOURCE"
else
  echo "❌ Error: Source file not found in local path or Hermes skill path."
  exit 1
fi

# Extract principles section
if [[ "$SOURCE_FILE" == *"systemprompt.md" ]]; then
  # 本地檔案直接使用全部內容
  cat "$SOURCE_FILE" > /tmp/_systemprompt_temp.md
else
  # Hermes SKILL.md 需要從 # Machine Identity 開始擷取
  sed -n '/^# Machine Identity/,$ p' "$SOURCE_FILE" > /tmp/_systemprompt_temp.md
fi

# Define all 7 sync targets (Format: "Name|Path")
TARGETS=(
  "Copilot_CLI|$HOME/.copilot/copilot-instructions.md"
  "Gemini_CLI|$HOME/.gemini/GEMINI.md"
  "AI_CLI|$HOME/.ai/GEMINI.md"
  "Antigravity|$HOME/.antigravity/system-prompt.md"
  "Claude_Code|$HOME/.claude/CLAUDE.md"
  "Codex_CLI|$HOME/.codex/AGENTS.md"
  "Cursor|$HOME/.cursorrules"
)

SUCCESS=0
FAILED=0

for item in "${TARGETS[@]}"; do
  tool="${item%%|*}"
  target="${item#*|}"
  target_dir=$(dirname "$target")
  target_dir=$(dirname "$target")
  
  if mkdir -p "$target_dir" 2>/dev/null; then
    if cp /tmp/_systemprompt_temp.md "$target" 2>/dev/null; then
      echo "✅ $tool → $target"
      ((SUCCESS++))
    else
      echo "❌ $tool → $target (write failed)"
      ((FAILED++))
    fi
  else
    echo "⚠️  $tool → $target (mkdir failed)"
    ((FAILED++))
  fi
done

rm -f /tmp/_systemprompt_temp.md

echo ""
echo "=============================="
echo "📊 Sync Summary: $SUCCESS succeeded, $FAILED failed"
echo "📁 Source: $SOURCE_FILE"
echo "=============================="
