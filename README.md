# Second Brain Skills

**[Subscribe on Substack](https://yuvigerstein.substack.com/subscribe)** for new skills and the stories behind them.

Two [Claude Code](https://claude.com/claude-code) skills I use to get insights from my Obsidian vault. The background is in my articles: [Part 1](https://yuvigerstein.substack.com/p/what-happened-when-claude-read-the) · Part 2 (coming soon).

| Skill | What it does |
|---|---|
| **vault-insights** | Reads your notes and returns four insights: 🟢 positive · 🔵 interesting observation · 🟡 one point to improve · 🟣 between the lines. It keeps a log so it never repeats itself. |
| **youtube-insights** | Takes transcripts of videos you watched and connects each video's ideas to your own notes. |

## Install

1. Copy the `vault-insights` and `youtube-insights` folders into `~/.claude/skills/`.
2. Open Claude Code in your vault's folder.
3. Type `/vault-insights` or `/youtube-insights`.

Each skill has a **Setup** table at the top with the folder names it expects. Change them to match your vault, or just ask Claude to adapt the skill to your folders.

## Suggested vault layout

```
Your Vault/
├── (your own notes)
├── Me.md                     ← a short note about yourself: a good place to start
├── Morning Pages/            ← optional private folder the skills never read
└── AI-Context/
    ├── yt-transcripts/       ← one transcript file per video
    ├── watched-videos-ai-insights/   ← created by youtube-insights
    ├── Vault insights.md             ← created on the first run
    └── Vault insights — threads.md   ← created on the first run
```

## Ground rules built in

- The skills **never edit your notes.** They only write to their own log files.
- Everything you mark as private stays unread unless you ask.
- Every insight cites the notes it came from, so you can check it.

Not comfortable installing a skill? Paste a `SKILL.md` into a chat with your AI and ask it to build its own version for your setup.

## Credit

Created by [Yuvi Gerstein](https://yuvigerstein.substack.com). Released under the [MIT License](LICENSE): free to use and adapt, just keep the credit.
