#!/bin/bash
# System Prompt Update Script
# Updates system prompts for various CLI tools from the repository source

SOURCE_FILE="/Users/drew/Project/systemprompt-manager/skills/systemprompt.md"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "❌ Error: Source file $SOURCE_FILE not found."
    exit 1
fi

COPILOT_FILE="$HOME/.copilot/copilot-instructions.md"
GEMINI_FILE="$HOME/.gemini/GEMINI.md"
ANTIGRAVITY_FILE="$HOME/.antigravity/system-prompt.md"

# Copy content
cp "$SOURCE_FILE" "$COPILOT_FILE"
cp "$SOURCE_FILE" "$GEMINI_FILE"
cp "$SOURCE_FILE" "$ANTIGRAVITY_FILE"

echo "✅ System Prompt Updated Successfully from $SOURCE_FILE"
