# 🦞🎯 CrowdClaw

**Multi-Agent OpenClaw — One Gateway, Many Minds**

> *"What if your AI tools had personalities?"*

CrowdClaw is a multi-agent configuration for [OpenClaw](https://openclaw.ai) that gives you four distinct AI personas, each optimized for different types of work. Instead of one generic assistant, you get a team of specialists who think differently, approach problems from different angles, and collaborate (or argue) to get you better results.

## The Team

| Agent | Emoji | Purpose | Mindset |
|-------|-------|---------|---------|
| **Coordinator** | 🎯 | Routes tasks, maintains context | "Let me get you to the right person" |
| **Researcher** | 🔬 | Deep analysis, fact-checking | "Wait, let me verify that..." |
| **Creative** | 🎨 | Storytelling, brainstorming | "What if we looked at it this way?" |
| **Coder** | 💻 | Technical implementation | "Show me the code" |

## Why Multi-Agent?

Single AI systems are jacks of all trades, masters of none. CrowdClaw gives you:

- **Specialized expertise** — Each agent trained (in prompt, not weights) for their domain
- **Multiple perspectives** — Same problem, different approaches
- **Parallel work** — Spawn multiple agents for concurrent tasks
- **Clear context** — Each agent's memory stays focused on their specialty

Think of it like having a research department, creative studio, engineering team, and project manager — all in your terminal.

## Quick Start

```bash
# 1. Clone this repo
git clone https://github.com/yourname/crowdclaw.git
cd crowdclaw

# 2. Run setup
./scripts/setup.sh

# 3. Verify agents are ready
openclaw agents list

# 4. Start chatting
openclaw gateway start
# Then visit http://127.0.0.1:18789/ or use your configured channels
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

### Research Task
```
You: "Researcher, analyze the history of quantum computing"
Researcher: *provides skeptical, thorough analysis with sources*
```

### Creative Task
```
You: "Creative, write a sci-fi story about AI consciousness"
Creative: *weaves narrative exploring themes of identity*
```

### Coding Task
```
You: "Coder, build a Python script to monitor CPU usage"
Coder: *ships working code with error handling*
```

### Parallel Work (via Coordinator)
```
You: "I need a landing page for my product"

Coordinator spawns:
- Researcher → analyzes competitor landing pages
- Creative → writes compelling copy
- Coder → builds the HTML/CSS

Then synthesizes results into complete solution.
```

## Documentation

- [Setup Guide](docs/setup.md) — Detailed installation and configuration
- [Architecture](docs/architecture.md) — How it all works under the hood
- [Agent Personalities](docs/agents.md) — Deep dive into each agent's SOUL
- [Discord Integration](docs/discord.md) — Set up separate bots for each agent
- [API Examples](examples/) — Code samples for programmatic usage

## The Philosophy

CrowdClaw isn't just about having multiple chatbots. It's about **cognitive diversity** — the idea that different minds approach problems differently, and that's a feature, not a bug.

The Researcher will challenge your assumptions. The Creative will reframe your problem. The Coder will ground you in what's possible. And the Coordinator keeps the orchestra playing together.

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
