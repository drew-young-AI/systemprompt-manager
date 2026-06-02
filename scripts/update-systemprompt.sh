#!/bin/bash
# Universal System Prompt Update Script v2.0
# Syncs system prompt to ALL 7 AI tools
# Source: https://github.com/drew-young-AI/systemprompt-manager

SOURCE_FILE="$HOME/.hermes/skills/productivity/systemprompt-manager/SKILL.md"

if [ ! -f "$SOURCE_FILE" ]; then
  echo "❌ Error: Source file $SOURCE_FILE not found."
  echo "   Please install the systemprompt-manager skill first."
  exit 1
fi

# Extract principles section (skip YAML frontmatter and Hermes-specific header)
# Copy everything from "# Machine Identity" onwards
sed -n '/^# Machine Identity/,$ p' "$SOURCE_FILE" > /tmp/_systemprompt_temp.md

# Define all 7 sync targets
declare -A TARGETS=(
  ["Copilot CLI"]="$HOME/.copilot/copilot-instructions.md"
  ["Gemini CLI"]="$HOME/.gemini/GEMINI.md"
  ["AI CLI"]="$HOME/.ai/GEMINI.md"
  ["Antigravity"]="$HOME/.antigravity/system-prompt.md"
  ["Claude Code"]="$HOME/.claude/CLAUDE.md"
  ["Codex CLI"]="$HOME/.codex/AGENTS.md"
  ["Cursor"]="$HOME/.cursorrules"
)

SUCCESS=0
FAILED=0

for tool in "${!TARGETS[@]}"; do
  target="${TARGETS[$tool]}"
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
