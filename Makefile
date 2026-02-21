# CrowdClaw Makefile
# Common tasks for managing the multi-agent system

.PHONY: help setup start status stop logs agents clean

help: ## Show this help
	@echo "🦞🎯 CrowdClaw Commands"
	@echo "======================="
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

setup: ## Run initial setup
	./scripts/setup.sh

start: ## Start the OpenClaw gateway
	openclaw gateway start

status: ## Check gateway and agent status
	openclaw status
	@echo ""
	@echo "Agents:"
	@openclaw agents list

stop: ## Stop the gateway
	openclaw gateway stop

logs: ## Tail gateway logs
	openclaw logs --follow

agents: ## List all agents
	openclaw agents list --bindings

clean: ## Remove agent sessions (keeps config)
	@echo "Removing session files..."
	@rm -rf ~/.openclaw/agents/*/sessions/*.jsonl
	@echo "✓ Sessions cleared"

verify: ## Verify configuration
	@echo "Checking config..."
	@openclaw agents list > /dev/null 2>&1 && echo "✓ Config valid" || echo "✗ Config error"

update: ## Update OpenClaw to latest
	openclaw update
