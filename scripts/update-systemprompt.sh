#!/bin/bash
# Universal System Prompt Update Script (macOS/Windows)
# Updates system prompts for various CLI tools from the repository source

SOURCE_FILE="/Users/drew/Project/systemprompt-manager/skills/systemprompt.md"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "❌ Error: Source file $SOURCE_FILE not found."
    exit 1
fi

# Determine OS and set paths
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # Windows paths (adjust if necessary for your specific setup)
    COPILOT_FILE="$USERPROFILE/.copilot/copilot-instructions.md"
    GEMINI_FILE="$USERPROFILE/.gemini/GEMINI.md"
    ANTIGRAVITY_FILE="$USERPROFILE/.antigravity/system-prompt.md"
else
    # macOS/Linux paths
    COPILOT_FILE="$HOME/.copilot/copilot-instructions.md"
    GEMINI_FILE="$HOME/.gemini/GEMINI.md"
    ANTIGRAVITY_FILE="$HOME/.antigravity/system-prompt.md"
fi

# Ensure directories exist
mkdir -p "$(dirname "$COPILOT_FILE")"
mkdir -p "$(dirname "$GEMINI_FILE")"
mkdir -p "$(dirname "$ANTIGRAVITY_FILE")"

# Copy content
cp "$SOURCE_FILE" "$COPILOT_FILE"
cp "$SOURCE_FILE" "$GEMINI_FILE"
cp "$SOURCE_FILE" "$ANTIGRAVITY_FILE"

echo "✅ System Prompt Updated Successfully from $SOURCE_FILE for $(uname -s)"
EOF
