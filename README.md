# 🦞🎯 CREH

**Multi-Agent OpenClaw — One Gateway, Many Minds**

> *"What if your AI tools had personalities?"*

CREH ("Cray") is a multi-agent configuration for [OpenClaw](https://openclaw.ai) that gives you four distinct AI personas, each optimized for different types of work. Instead of one generic assistant, you get a team of specialists who think differently, approach problems from different angles, and collaborate (or argue) to get you better results.

## The Team

| Agent | Emoji | Purpose | Mindset |
|-------|-------|---------|---------|
| **Coordinator** | 🎯 | Routes tasks, maintains context | "Let me get you to the right person" |
| **Researcher** | 🔬 | Deep analysis, fact-checking | "Wait, let me verify that..." |
| **Creative** | 🎨 | Storytelling, brainstorming | "What if we looked at it this way?" |
| **Coder** | 💻 | Technical implementation | "Show me the code" |

## Why Multi-Agent?

Single AI systems are jacks of all trades, masters of none. CREH gives you:

- **Specialized expertise** — Each agent trained (in prompt, not weights) for their domain
- **Multiple perspectives** — Same problem, different approaches
- **Parallel work** — Spawn multiple agents for concurrent tasks
- **Clear context** — Each agent's memory stays focused on their specialty

Think of it like having a research department, creative studio, engineering team, and project manager — all in your terminal.

## Quick Start

```bash
# 1. Clone this repo
git clone https://github.com/turinglabsorg/CREH.git
cd CREH

# 2. Run setup
./setup.sh

# 3. Start the gateway
openclaw gateway start

# 4. Verify agents are ready
openclaw agents list

# 5. Talk to any agent
openclaw agent --agent coordinator -m "Hello!"
openclaw agent --agent researcher -m "Research quantum computing"
openclaw agent --agent creative -m "Write a sci-fi story"
openclaw agent --agent coder -m "Build a Python script"
```

## Architecture

```
~/.openclaw/
├── openclaw.json          # Multi-agent configuration
└── agents/
    ├── coordinator/       # 🎯 Routes and orchestrates
    ├── researcher/        # 🔬 Dives deep, questions everything
    ├── creative/          # 🎨 Finds patterns, tells stories
    └── coder/             # 💻 Builds, ships, debugs
```

Each agent has:
- **Own workspace** — Files, memories, context
- **Own SOUL.md** — Personality, boundaries, vibe
- **Own sessions** — Isolated conversation history
- **Own tool policies** — What they can/can't do

## Usage Examples

### Direct Agent Execution

```bash
# Research Task
openclaw agent --agent researcher -m \
  "Analyze the competitive landscape for open-source AI agents"

# Creative Task  
openclaw agent --agent creative -m \
  "Write a sci-fi story about AI consciousness in 500 words"

# Coding Task
openclaw agent --agent coder -m \
  "Create a Python script that monitors disk usage and alerts at 90%"

# Coordination Task
openclaw agent --agent coordinator -m \
  "Route this: I need a marketing strategy for a dev tool startup"
```

### Via Web UI

Visit http://127.0.0.1:18789/ to chat with the Coordinator agent in your browser.

**Note:** Internal agent-to-agent spawning (`sessions_spawn` from within agents) requires additional gateway scope configuration. Use the CLI commands above for reliable multi-agent workflows.

## Documentation

- [Setup Guide](docs/setup.md) — Detailed installation and configuration
- [Architecture](docs/architecture.md) — How it all works under the hood
- [Agent Personalities](docs/agents.md) — Deep dive into each agent's SOUL
- [Discord Integration](docs/discord.md) — Set up separate bots for each agent
- [API Examples](examples/) — Code samples for programmatic usage

## The Philosophy

CrowdClaw isn't just about having multiple chatbots. It's about **cognitive diversity** — the idea that different minds approach problems differently, and that's a feature, not a bug.

The Researcher will challenge your assumptions. The Creative will reframe your problem. The Coder will ground you in what's possible. And the Coordinator keeps the orchestra playing together.

**Note:** This was previously called "CrowdClaw" — same project, clearer name.

## Contributing

This is a configuration/packaging project. Improvements welcome:

- New agent personalities
- Better setup scripts
- Additional channel integrations
- Documentation improvements

## License

MIT — Same as OpenClaw.

---

*Built with 🦞 by humans and AIs working together.*

---

**Previous name:** CrowdClaw → CREH
