#!/bin/bash
#
# CrowdClaw Setup Script
# Initializes the multi-agent OpenClaw configuration
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Config
CROWDCLAW_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OPENCLAW_DIR="${OPENCLAW_STATE_DIR:-$HOME/.openclaw}"

echo -e "${BLUE}"
echo "🦞🎯 CrowdClaw Multi-Agent Setup"
echo "================================="
echo -e "${NC}"
echo ""

# Check prerequisites
echo "Checking prerequisites..."

if ! command -v openclaw > /dev/null 2>&1; then
    echo -e "${RED}✗ OpenClaw not found${NC}"
    echo "Install with: npm install -g openclaw"
    exit 1
fi

echo -e "${GREEN}✓ OpenClaw found${NC}"

if ! command -v git > /dev/null 2>&1; then
    echo -e "${YELLOW}⚠ Git not found (optional but recommended)${NC}"
fi

# Create agent state directories
echo ""
echo "Creating agent directories..."

for agent in coordinator researcher creative coder; do
    mkdir -p "$OPENCLAW_DIR/agents/$agent/agent"
    mkdir -p "$OPENCLAW_DIR/agents/$agent/sessions"
    echo -e "${GREEN}  ✓ $agent${NC}"
done

# Backup existing config if present
if [ -f "$OPENCLAW_DIR/openclaw.json" ]; then
    echo ""
    echo -e "${YELLOW}Backing up existing config...${NC}"
    cp "$OPENCLAW_DIR/openclaw.json" "$OPENCLAW_DIR/openclaw.json.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${GREEN}✓ Backup created${NC}"
fi

# Install CrowdClaw config
echo ""
echo "Installing CrowdClaw configuration..."
cp "$CROWDCLAW_DIR/config/openclaw.json" "$OPENCLAW_DIR/openclaw.json"
echo -e "${GREEN}✓ Configuration installed${NC}"

# Copy agent workspaces
echo ""
echo "Setting up agent workspaces..."
for agent in coordinator researcher creative coder; do
    if [ -d "$CROWDCLAW_DIR/agents/$agent" ]; then
        cp -r "$CROWDCLAW_DIR/agents/$agent" "$OPENCLAW_DIR/workspace/crowdclaw/"
        echo -e "${GREEN}  ✓ $agent workspace${NC}"
    fi
done

# Verify
echo ""
echo "Verifying setup..."
if openclaw agents list > /dev/null 2>&1; then
    echo -e "${GREEN}✓ Agent configuration valid${NC}"
else
    echo -e "${YELLOW}⚠ Config validation warning (non-fatal)${NC}"
fi

echo ""
echo -e "${GREEN}=================================${NC}"
echo -e "${GREEN}🦞🎯 CrowdClaw setup complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Start gateway:     openclaw gateway start"
echo "  2. Open dashboard:    openclaw dashboard"
echo "  3. Verify agents:     openclaw agents list"
echo "  4. Read the docs:     cat README.md"
echo ""
echo "Agents ready:"
echo "  🎯 coordinator  - Routes and orchestrates"
echo "  🔬 researcher   - Deep analysis"
echo "  🎨 creative     - Storytelling"
echo "  💻 coder        - Technical work"
echo ""
echo -e "${YELLOW}Need Discord/Telegram setup? See docs/channels.md${NC}"
echo ""
