#!/bin/bash
# One-click installer for System Prompt Manager
# Usage: bash install.sh

set -e

echo "🚀 Installing System Prompt Manager..."
echo ""

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macOS"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="Linux"
else
    OS="Unknown"
fi

echo "📦 System: $OS"
echo "📁 Install from: $REPO_DIR"
echo ""

# Create skill directory
echo "📋 Setting up Copilot CLI skill..."
mkdir -p ~/.copilot/skills
cp "$REPO_DIR/skills/systemprompt.md" ~/.copilot/skills/systemprompt.md
echo "✅ Copilot skill installed"

# Install Copilot config
echo "⚙️ Installing Copilot CLI configuration..."
cp "$REPO_DIR/config/copilot-instructions.md" ~/.copilot/copilot-instructions.md
echo "✅ Copilot configuration installed"

# Install Gemini config (if Gemini CLI exists)
if [ -d ~/.gemini ]; then
    echo "⚙️ Installing Gemini CLI configuration..."
    cp "$REPO_DIR/config/gemini-instructions.md" ~/.gemini/GEMINI.md
    echo "✅ Gemini configuration installed"
else
    echo "⚠️  Gemini CLI not found, skipping"
fi

# Install Antigravity config (if Antigravity exists)
if [ -d ~/.antigravity ]; then
    echo "⚙️ Installing Antigravity configuration..."
    mkdir -p ~/.antigravity
    cp "$REPO_DIR/config/antigravity-instructions.md" ~/.antigravity/system-prompt.md
    echo "✅ Antigravity configuration installed"
else
    echo "⚠️  Antigravity not found, skipping"
fi

# Install update script
echo "🔧 Installing update script..."
cp "$REPO_DIR/scripts/update-systemprompt.sh" ~/.copilot/
chmod +x ~/.copilot/update-systemprompt.sh
echo "✅ Update script installed"

# Summary
echo ""
echo "✨ Installation Complete!"
echo ""
echo "📍 Installed locations:"
echo "   - Copilot skill: ~/.copilot/skills/systemprompt.md"
echo "   - Copilot config: ~/.copilot/copilot-instructions.md"
echo "   - Update script: ~/.copilot/update-systemprompt.sh"
echo ""
echo "🚀 Next steps:"
echo "   1. Start Copilot CLI: copilot"
echo "   2. Check environment: /env"
echo "   3. Verify system prompt is loaded"
echo ""
echo "📚 Documentation: $REPO_DIR/README.md"
