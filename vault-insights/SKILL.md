---
name: vault-insights
description: Surface short, powerful, evidence-grounded insights from the user's Obsidian second-brain vault. Reads the running insights log first so it never repeats itself, then mines the notes for new or changed patterns and returns exactly four insights — a positive one, an interesting observation, a key point to improve, and a between-the-lines insight the user likely hasn't noticed. Use whenever the user asks to "bring me insights", "what do my notes say about me", "insights from my second brain", "what am I missing", "read between the lines of my notes", invokes /vault-insights, or otherwise wants reflection drawn from their own notes rather than generic advice.
metadata:
  author: Yuvi Gerstein
  version: "1.0"
---

# Vault Insights

This skill reflects the user's own vault back at them — patterns, tensions, and
blind spots that are visible across many notes but invisible from inside any one
of them. The value is **synthesis the user can't easily do themselves**, because
they wrote each note in isolation and rarely read all of them at once. Generic
self-help advice is worthless here; insights must be earned from what's actually
on the page and grounded in specific notes so the user can verify them.

## Setup (adjust to your vault)

All paths are relative to the vault root. Change these to match your folders:

| What | Default path |
|---|---|
| Folder for AI-generated files and outside material | `AI-Context/` |
| Running insights log | `AI-Context/Vault insights.md` |
| Thread index (a short map of recurring themes) | `AI-Context/Vault insights — threads.md` |
| Private folder that is off-limits | `Morning Pages/` |

If the log or thread index doesn't exist yet, create it on the first run.

## Off-limits folder

**Never read, reference, or draw insights from the private folder** (by default
`Morning Pages/`). It holds raw, unfiltered writing. Skip it entirely unless the
user explicitly asks in that specific conversation.

## The hard rule

Never create, edit, rewrite, or rephrase the body content of any note. The ideas
are the user's alone. The **only** files this skill writes are the insights log and
the thread index — they hold *your* observations about the notes, not the user's
own prose, which is why it's safe to write to them.

## Workflow

### 1. Read the thread index first, then the recent log tail

Once the log grows large, it becomes too big to read in one pass. So orient in this order:

1. **Read the thread index first.** It's the map: every recurring thread with a
   one-line current status, the session dates it appears in, and a
   **"Retracted / handle with care"** section. Treat that section as binding —
   never re-serve a framing the user has pushed back on.
2. **Then read only the recent tail** of the insights log — roughly the last two
   weeks of dated `##` sections — for the freshest material.
3. **Only dive deeper into the old log** when a new insight genuinely builds on a
   specific older one and you need the exact wording; use the dates in the thread
   index to jump straight there.

The log serves two purposes — dedup and raw material:

- **Dedup check:** an insight already in the log shouldn't be served again
  **unless** something in the vault has genuinely changed it — in which case
  present it as an *update* ("Last time I noted X; the newer notes now show Y").
- **Source material:** prior insights are fair game to build from. A new insight
  can combine two *old* insights that were never connected before, take an old
  insight further now that new notes give it more evidence, or name a pattern
  *in the log itself* — a thread that keeps resurfacing without ever being named.

Always cite the earlier date(s) you're drawing from so the user can trace the thread back.

### 2. Survey the vault — read, don't skim

Prioritize:

- **Recently updated notes** — sort by the `updated:` frontmatter date (or file
  modification time). What the user has been writing lately is where the live
  thinking is. Anything touched since the last log entry deserves a close read.
- **The substantive, cross-cutting notes** — longer reflective ones (about
  themselves, their work, relationships, fears, ambitions) carry more signal than
  short factual stubs. Person/place stubs are context, not source.

You're hunting for **patterns across notes**, not summaries of single notes. The
richest material tends to be:

- A claim in one note that another note validates or contradicts (e.g. stated
  self-doubt vs. external recognition recorded elsewhere).
- A theme that recurs across many notes without the user naming it as a theme.
- A tension the user circles repeatedly but hasn't resolved.
- Something stated as an aside in one note that's actually load-bearing.
- Two log entries written weeks apart that turn out to be the same pattern seen twice.
- An old insight that a brand-new note quietly confirms, complicates, or resolves.

### 3. Compose exactly four insights — short but powerful

Always return these four, in this order, each as a tight paragraph (a few
sentences — lead with the claim, then the evidence):

1. **🟢 Positive** — a genuine strength, win, or healthy pattern the notes reveal.
   Not flattery; something the evidence supports, ideally something the user undersells.
2. **🔵 Interesting observation** — a realization, a thought worth reflecting back,
   or something learned from people or events recorded in the notes.
3. **🟡 Key point to improve** — one concrete thing to work on, framed
   constructively and tied to evidence. One sharp point beats three vague ones.
4. **🟣 Between the lines** — the differentiator. Something the user likely has
   *not* consciously noticed: an implication, an unspoken assumption, a connection
   between two unrelated-looking notes. If it merely restates what a note already
   says outright, it's not between the lines; dig further.

**Format:** keep `[[wikilinks]]` out of the paragraph itself — write clean prose
(short quoted phrases from a note are fine, as evidence in the user's own words).
End each insight with its own citation line:

`Sources: [[Note A]], [[Note B]]`

**Quality bar:** would the user say "I hadn't put it that way"? If an insight reads
like something a generic life coach could say without having read the vault, throw
it out and go back to the notes.

### 4. Append to the log

Append a new dated section to the insights log: a `## YYYY-MM-DD` heading followed
by the four insights, each still ending in its `Sources:` line. Append below previous
entries — never overwrite history. If an insight updates an earlier one, say so and
reference the earlier date.

### 5. Update the thread index

Revise the one-line status of any thread this run touched (and add today's date to
its session list), add a new thread only if a genuinely new pattern emerged, and move
anything the user pushed back on into "Retracted / handle with care." **Keep every
thread to a single status line** — otherwise the index becomes a second log.

## Style

- Address the user directly; reflect their own framing back where it's vivid.
- Be direct and warm. The improvement and between-the-lines insights can be
  pointed; the user asked to be shown what they're missing, not coddled.
- Brevity is a feature. Four crisp insights they'll remember beat a long report they'll skim.
