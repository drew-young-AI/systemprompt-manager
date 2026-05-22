#!/bin/bash
# Multi-CLI System Prompt Synchronizer (Merge Mode)
# Supports: Gemini, Copilot, Claude Code, and Generic Agents

SOURCE_FILE="/Users/drew/Project/systemprompt-manager/skills/systemprompt.md"
START_MARKER="### UNIVERSAL_PRINCIPLES_START ###"
END_MARKER="### UNIVERSAL_PRINCIPLES_END ###"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "❌ Error: Source file $SOURCE_FILE not found."
    exit 1
fi

# Determine OS Paths
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    BASE_HOME="$USERPROFILE"
else
    BASE_HOME="$HOME"
fi

# Define Target Files
TARGETS=(
    "$BASE_HOME/.gemini/GEMINI.md"
    "$BASE_HOME/.copilot/copilot-instructions.md"
    "$BASE_HOME/.claudecode/CLAUDE.md"
    "$BASE_HOME/.agent/AGENT.md"
)

update_file() {
    local file=$1
    if [ ! -f "$file" ]; then
        mkdir -p "$(dirname "$file")"
        touch "$file"
    fi

    # Check if markers exist, if not, append them
    if ! grep -q "$START_MARKER" "$file"; then
        echo -e "\n$START_MARKER\n$END_MARKER" >> "$file"
    fi

    # Use a temporary file for the merge
    local temp_file=$(mktemp)
    
    # Logic: Keep everything before START, inject SOURCE, Keep everything after END
    sed -e "/$START_MARKER/,/$END_MARKER/ { /$START_MARKER/! { /$END_MARKER/!d; }; }" "$file" > "$temp_file"
    
    # Inject content
    sed -i '' "/$START_MARKER/r $SOURCE_FILE" "$temp_file" 2>/dev/null || sed -i "/$START_MARKER/r $SOURCE_FILE" "$temp_file"

    cp "$temp_file" "$file"
    rm "$temp_file"
    echo "✅ Blended: $file"
}

for target in "${TARGETS[@]}"; do
    update_file "$target"
done

echo "🚀 All System Prompts Synchronized with Multi-CLI Support."
