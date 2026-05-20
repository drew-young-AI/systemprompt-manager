#!/bin/bash
# GitHub Push Instructions for System Prompt Manager
# Usage: bash PUSH_INSTRUCTIONS.sh "your-github-username" "your-pat-token"

if [ $# -lt 2 ]; then
    echo "❌ Usage: bash PUSH_INSTRUCTIONS.sh <github-username> <pat-token>"
    echo ""
    echo "Example:"
    echo "  bash PUSH_INSTRUCTIONS.sh myusername ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    exit 1
fi

GITHUB_USERNAME="$1"
GITHUB_PAT="$2"
REPO_NAME="system-prompt-manager"
REPO_PATH=$(cd "$(dirname "$0")" && pwd)

echo "🚀 Pushing System Prompt Manager to GitHub"
echo ""
echo "Configuration:"
echo "  GitHub Username: $GITHUB_USERNAME"
echo "  Repository: $REPO_NAME"
echo "  Local Path: $REPO_PATH"
echo ""

# Step 1: Verify we're in the repo
cd "$REPO_PATH" || exit 1

# Step 2: Check git status
echo "📋 Checking Git Status..."
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️  Uncommitted changes detected. Committing..."
    git add -A
    git commit -m "Auto-commit before GitHub push"
fi

# Step 3: Configure git credential helper
echo "🔐 Setting up Git Credentials..."
git config credential.helper store
echo "https://$GITHUB_USERNAME:$GITHUB_PAT@github.com" | git credential approve

# Step 4: Add remote if not exists
if ! git remote | grep -q origin; then
    echo "🔗 Adding GitHub remote..."
    git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
else
    echo "✅ Remote already configured"
    git remote set-url origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
fi

# Step 5: Push to GitHub
echo "📤 Pushing to GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully pushed to GitHub!"
    echo ""
    echo "📍 Repository URL:"
    echo "   https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo ""
    echo "🎯 Next Steps:"
    echo "   1. Visit the URL above to verify"
    echo "   2. Others can clone: git clone https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
    echo "   3. Use in Copilot: cd ~/github-systemprompt-manager && copilot"
else
    echo ""
    echo "❌ Push failed. Possible reasons:"
    echo "   - Invalid PAT or username"
    echo "   - Repository doesn't exist on GitHub yet"
    echo "   - Network issue"
    echo ""
    echo "Solutions:"
    echo "   1. Create repository: https://github.com/new"
    echo "   2. Verify PAT: https://github.com/settings/tokens"
    echo "   3. Check network connection"
    exit 1
fi

# Step 6: Clean up sensitive data
echo ""
echo "🔒 Cleaning up credentials..."
git credential reject "https://github.com"
unset GITHUB_PAT

echo "✨ All done!"
