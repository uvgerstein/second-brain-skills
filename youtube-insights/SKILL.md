---
name: youtube-insights
description: Check the vault's YouTube transcript folder for videos that haven't been processed yet and generate one personalized insight note per new transcript — each insight grounded in a specific idea from the video, connected to the user's own notes via [[wikilinks]], and personally relevant rather than generic. Also appends the sharpest 1–2 insights per video to the running insights log so /vault-insights can use them later. Use whenever the user asks to "process my transcripts", "check for new YouTube transcripts", "insights from videos I watched", invokes /youtube-insights, or otherwise wants insight notes built from newly transcribed videos.
metadata:
  author: Yuvi Gerstein
  version: "1.0"
---

# YouTube Insights

Turn newly transcribed YouTube videos into personalized insight notes that connect
each video's ideas back to the user's own vault. The value is **personal synthesis** —
not a summary a stranger could write. Every insight must earn an "I hadn't thought of
it that way." Generic advice is a failure.

## Setup (adjust to your vault)

All paths are relative to the vault root. Change these to match your folders
(and update the two variables at the top of `scripts/find-unprocessed.sh`):

| What | Default path |
|---|---|
| Transcripts (one `.txt` or `.md` per video) | `AI-Context/yt-transcripts/` |
| Insight notes this skill writes | `AI-Context/watched-videos-ai-insights/` |
| A short profile of the user | `AI-Context/Me.md` |
| Running insights log (shared with /vault-insights) | `AI-Context/Vault insights.md` |
| Thread index | `AI-Context/Vault insights — threads.md` |
| Private folder that is off-limits | `Morning Pages/` |

## Hard constraints

- **NEVER** create, edit, rewrite, or paraphrase the body content of any existing note. The ideas are the user's alone.
- **NEVER** read, reference, or open anything in the private folder. Skip it in every survey.
- Write to **only** these locations:
  - the insight-notes folder — one new note per video
  - the insights log — **append-only**
  - the thread index — one-line status updates

## Step 1 — Find unprocessed transcripts

Run the discovery script from the vault root:

```bash
bash "$HOME/.claude/skills/youtube-insights/scripts/find-unprocessed.sh"
```

It prints one transcript path per video that has **no** matching note (same base
name) in the insight-notes folder. If it reports `No new transcripts to process`,
tell the user and **stop**.

## Step 2 — For each unprocessed transcript

1. Read the transcript.
2. Read the user's profile note — use it to make insights personally relevant.
3. Read the thread index — the fast map of the user's recurring patterns plus a
   **"Retracted / handle with care"** section. Connect a video's insight to an
   existing thread by name where it fits, and never build on a retracted framing.
   Skim only the recent tail of the insights log if you need fresh wording.
4. Survey the vault broadly — **except the private folder**. Favor notes sharing
   themes with the transcript.
5. Generate **2–3 insights** — quality over quantity. Lead with the sharpest.
   Three only when all three clear the quality bar; never pad to hit a number.
   Use *different* types across them:
   - **Connects to existing knowledge** — reinforces or expands something already in the vault.
   - **Challenges or reframes** — contradicts or complicates something the user has written or believes.
   - **Actionable** — a concrete thing to try or decide, tied to the video's ideas.
   - **Between the lines** — an implication the user probably hasn't consciously connected to their situation.
6. Write the note (format below).
7. Append to the log (Step 3).

### Insight quality bar

Each insight must:
- Be grounded in a **specific** idea from the transcript — include a quote or close paraphrase.
  **Check the quote in context:** don't attach a speaker's side remark or anecdote
  to a claim they never made.
- Connect explicitly to the user's notes via `[[wikilinks]]`.
- Be personally relevant — not advice a stranger could give.

Test: would the user say "I hadn't thought of it that way"? If not, push further.

### Output note format

```markdown
---
title: [Video title]
source: [path to transcript]
channel: [if detectable]
processed: YYYY-MM-DD
tags:
  - yt-insight
---

# [Video Title]

---

## Insight 1: [Short title]
[2–4 sentences. Lead with the idea from the video, then connect it to the user's notes and life.]
> *"[Quote or close paraphrase from transcript]"*
**In your notes:** [[relevant-note]], [[another-note]]

---

## Insight 2: [Short title]
...
```

## Step 3 — Append to the insights log

- Read the log first to find today's date section; append within it, or add a new `## YYYY-MM-DD` section at the end.
- Pick **1–2 of the sharpest** insights from the video — not all of them.
- Use the same emoji scheme as /vault-insights: 🟢 positive · 🔵 observation · 🟡 to improve · 🟣 between the lines.
- Always mark the source so it's clear this came from a video:

```markdown
### [emoji] [Insight title] *(from video: [Video Title])*

[2–3 sentences, condensed from the note.]

> *Full note: [[path/to/insight-note]]*
```

Then, if an insight advances or resolves a recurring thread, update that thread's
one-line status in the thread index. Keep every thread to a single line.

## Present the insights

The insights **are** the response. State how many transcripts were processed, then
show each video's 2–3 insights in full, exactly as written to the note. No extra
summary or "key takeaways" on top.
