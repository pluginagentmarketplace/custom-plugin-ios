#!/bin/bash

# Developer Roadmap Plugin Installation Script
# Single-command installation for Claude Code

set -e

echo "🚀 Developer Roadmap Plugin Installer"
echo "======================================"
echo ""

# Detect OS
OS=$(uname -s)
HOME_DIR="$HOME"

# Claude Code plugin directory
PLUGIN_DIR="$HOME_DIR/.claude-code/plugins"

# Clone URL
REPO_URL="https://github.com/pluginagentmarketplace/developer-roadmap-plugin.git"
PLUGIN_NAME="developer-roadmap-plugin"

echo "📦 Step 1: Creating plugin directory..."
mkdir -p "$PLUGIN_DIR"

echo "📥 Step 2: Installing Developer Roadmap Plugin..."

# Check if directory already exists
if [ -d "$PLUGIN_DIR/$PLUGIN_NAME" ]; then
    echo "⚠️  Plugin already installed. Updating..."
    cd "$PLUGIN_DIR/$PLUGIN_NAME"
    git pull origin main
else
    echo "🔄 Cloning plugin repository..."
    cd "$PLUGIN_DIR"
    git clone "$REPO_URL"
fi

cd "$PLUGIN_DIR/$PLUGIN_NAME"

echo "✅ Step 3: Installation complete!"
echo ""
echo "📍 Plugin installed at: $PLUGIN_DIR/$PLUGIN_NAME"
echo ""
echo "🎯 Next Steps:"
echo "1. Open Claude Code"
echo "2. Load plugin from: $PLUGIN_DIR/$PLUGIN_NAME"
echo "3. Run: /learn"
echo "4. Follow interactive prompts to get started"
echo ""
echo "📚 Available Commands:"
echo "   /learn           - Get personalized learning path"
echo "   /browse-roadmap  - Explore 75+ developer roadmaps"
echo "   /assess          - Evaluate your knowledge level"
echo "   /compare-paths   - Compare different specializations"
echo ""
echo "🌐 Resources:"
echo "   Documentation: $PLUGIN_DIR/$PLUGIN_NAME/README.md"
echo "   Installation Help: $PLUGIN_DIR/$PLUGIN_NAME/INSTALL.md"
echo "   GitHub: $REPO_URL"
echo ""
echo "✨ Ready to start learning? Run /learn in Claude Code!"
echo ""
