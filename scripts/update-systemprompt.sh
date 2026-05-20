#!/bin/bash
# System Prompt Update Script for Copilot CLI, Gemini CLI, Antigravity
# Usage: bash ~/.copilot/update-systemprompt.sh < prompt.txt

COPILOT_FILE="$HOME/.copilot/copilot-instructions.md"
GEMINI_FILE="$HOME/.gemini/GEMINI.md"
ANTIGRAVITY_FILE="$HOME/.antigravity/system-prompt.md"

# Read input from stdin
PROMPT_CONTENT=$(cat)

# Update all three files
echo "$PROMPT_CONTENT" > "$COPILOT_FILE"
echo "$PROMPT_CONTENT" > "$GEMINI_FILE"
echo "$PROMPT_CONTENT" > "$ANTIGRAVITY_FILE"

# Verify
echo "✅ System Prompt Updated Successfully"
echo ""
echo "Updated files:"
echo "  1. Copilot CLI: $COPILOT_FILE ($(wc -l < "$COPILOT_FILE") lines)"
echo "  2. Gemini CLI: $GEMINI_FILE ($(wc -l < "$GEMINI_FILE") lines)"
echo "  3. Antigravity: $ANTIGRAVITY_FILE ($(wc -l < "$ANTIGRAVITY_FILE") lines)"
echo ""
echo "Verification:"
grep "^1\." "$COPILOT_FILE" && echo "  ✓ Copilot prompt active"
grep "^1\." "$GEMINI_FILE" && echo "  ✓ Gemini prompt active"
grep "^1\." "$ANTIGRAVITY_FILE" && echo "  ✓ Antigravity prompt active"
