<div align="center">

# video-shotcraft

The video-production plugin for AI coding agents. Cinematic product films,
recorded app demos, motion graphics - rendered from code with
[Remotion](https://remotion.dev). No paid video-generation API, no credits, no
footage dependency. Works on Claude Code, Codex, Cursor, OpenCode, Windsurf,
Gemini CLI, and anything that reads `SKILL.md` or `AGENTS.md`.

[![License: MIT](https://img.shields.io/badge/License-MIT-3fb950.svg?style=flat-square)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/aegntic/video-shotcraft?style=flat-square&color=fdb515)](https://github.com/aegntic/video-shotcraft/stargazers)
[![Remotion](https://img.shields.io/badge/Remotion-4.x-0B84F3.svg?style=flat-square)](https://remotion.dev)
[![Node](https://img.shields.io/badge/node-%E2%89%A518-339933.svg?style=flat-square)](https://nodejs.org)
[![Claude Code](https://img.shields.io/badge/Claude_Code-ready-d97757.svg?style=flat-square)](https://claude.com/claude-code)
[![Codex](https://img.shields.io/badge/Codex-ready-412991.svg?style=flat-square)](https://openai.com/codex)
[![Cursor](https://img.shields.io/badge/Cursor-ready-111827.svg?style=flat-square)](https://cursor.com)
[![No paid APIs](https://img.shields.io/badge/video%20gen-%240%20APIs-8b5cf6.svg?style=flat-square)](#why-code-not-generation)

[Install](#install) · [Choose your lane](#choose-your-lane) · [How it compounds](#how-it-compounds) · [Benchmarks](#benchmarks) · [FAQ](#faq)

</div>

---

Three sources of craft, one brain. This plugin distills the three strongest
open Remotion skill projects into a single provider-agnostic plugin, bridges
the official Remotion Agent Skills for current framework truth, and routes
every brief to the right lane. Installed separately, the three projects are
three dialects with no arbitration. Wired together, they cover the whole
pipeline: shot vocabulary, design law, framework truth, and live app capture
in one agent session.

<div align="center">

```text
 ┌───────────────────────────────────────────────────────────┐
 │                  aegntic-video (router)                   │
 └──────────────────────────┬────────────────────────────────┘
     ┌──────────────┬───────┴────────┬───────────────────┐
     ▼              ▼                ▼                   ▼
 motion-craft   shotcraft-cards  remotion-core      live-demo
  design law     157 shots +      live API truth    recorded
      │          Ink Press                          app demos
      └─────┬─────┘                    │                 │
            ▼                          │                 │
   cinematic scenes ───────────────────┘                 │
            ▲                                            │
            └──── captured clips as OffthreadVideo ──────┘
```

*The router picks a lane; lanes hand off explicitly. Captured clips feed the
cinematic stack; every lane ends in frame-verified output.*

</div>

## Choose your lane

| | Lane | What you get | Built from |
|---|---|---|---|
| 🎬 | **Product film** (promo, launch, title sequence) | Storyboard → shot cards → animated scenes → beat-synced sound → verified MP4 | `motion-craft` + `shotcraft-cards` |
| 🖥️ | **App demo** (real clicks, narration) | Scout → script gate → Playwright capture → offline TTS → rendered walkthrough | `live-demo` |
| 🔀 | **Hybrid** | Real captured pages that then go cinematic (2.5D camera, grade, grain) | both, in order |
| 📚 | **Just the API** | Current Remotion docs, never stale, never from memory | `remotion-core` |

## Install

One line, any agent:

```bash
npx skills add aegntic/video-shotcraft
```

The installer asks which agent you use (Claude Code, Codex, Cursor, OpenCode,
Windsurf, Gemini CLI, or universal `~/.agents/skills/`). It links the skills
and clones the two upstream libraries on first use.

Manual, no CLI:

```bash
git clone https://github.com/aegntic/video-shotcraft.git
cd video-shotcraft
./scripts/install.sh                              # pick agents interactively
AEGNTIC_AGENTS="claude-code codex" ./scripts/install.sh   # or silently
```

> **Prompt it:** `Use video-shotcraft to make a 30-second launch film for my
> product` - or `make a narrated demo of my app at localhost:3000`. The router
> skill picks the lane.

## The four skills

| Skill | Reads as | Job |
|---|---|---|
| **`aegntic-video`** | router | Brief → lane. One clarifying question max, then it commits. |
| **`motion-craft`** | law | Ten non-negotiable motion rules, 17 copy-paste components, the mandatory render → inspect frames → fix → re-render loop, one-theme design system. |
| **`shotcraft-cards`** | vocabulary | 157 shot recipe cards in 10 categories, the validated Ink Press template (36s film, beat-synced, 30+ pinned SFX), capture tooling, 149 SFX + 5 BGM. |
| **`remotion-core`** | truth | Live Remotion docs search + official Agent Skills bridge. Never answers from memory. |
| **`live-demo`** | capture | Playwright-driven walkthroughs with two human gates, offline-first narration (Piper → ElevenLabs → `say`), re-render without re-shoot. |

<details>
<summary><strong>Shot card categories (157 cards)</strong></summary>

| Category | Cards | Examples |
|---|---|---|
| ui-entrance | 28 | `deck-deal-flyin`, `row-embed`, `list-stack-press` |
| typography | 26 | `blur-slide`, `brace-expand`, `cel-flash-stomp` |
| transition | 19 | warm-flash cuts, match-cuts, whip pans |
| effects | 17 | light sweeps, sparkles, 2.5D shadows |
| interaction | 15 | type-and-filter, click push-ins |
| data | 13 | counters, digit rolls, radar lists |
| opening | 11 | `spotlight-hero-card`, ink-stamp brand opens |
| rhythm | 11 | beat-pinned cuts, breath holds |
| camera | 10 | `basic-3d-scene`, crash zooms, orbits |
| outro | 7 | `outro-group-photo-launch` finale |

Every card: intent, exact interpolation math, parameter table with tuning
feel, known pitfalls, and a working demo. Credit for the card library and
template belongs to [Vincentwei1021/video-shotcraft](https://github.com/Vincentwei1021/video-shotcraft)
(Apache-2.0); this plugin clones it rather than forking, so upstream updates
are one command away.

</details>

## How it compounds

```text
            ┌─────────────────────────────────────────────┐
            │              aegntic-video (router)         │
            └──────────────────┬──────────────────────────┘
        ┌──────────────┬───────┴───────┬────────────────┐
        ▼              ▼               ▼                ▼
  motion-craft   shotcraft-cards  remotion-core   live-demo
   (design law)   (157 shots +     (live API       (recorded
        │          Ink Press)       truth)          app demos)
        └──────┬───────┘                │                │
               ▼                        │                │
      cinematic scenes ─────────────────┘                │
               ▲                                         │
               └──── captured clips as OffthreadVideo ───┘
```

1. **Router reads the brief.** Promo? Demo? Both? One question at most.
2. **Law before code.** `motion-craft` rules load first: no linear easing, no
   lone fades, five-layer scene stack, fps-derived timing, one theme.
3. **Vocabulary on demand.** Specific shots pull recipe cards with exact
   interpolation math instead of improvised motion.
4. **Truth before trust.** Framework questions fetch current docs, so version
   drift never silently breaks a render.
5. **Verify before delivery.** Every lane ends the same way: frames
   extracted, looked at, fixed, re-rendered.

## Why code, not generation

| | Generated footage | video-shotcraft |
|---|---|---|
| Cost | per-second API credits | **$0** - renders on your machine |
| Determinism | re-roll and pray | same code, same film, every time |
| Revisions | re-generate the whole shot | change one prop, re-render in minutes |
| Text accuracy | hope for legible logos | it's React - text is text |
| Brand fidelity | approximate | exact palette, fonts, components |
| Captures & music | N/A | real page screenshots + bundled SFX/BGM (attribution included) |

The product-film workflow can use screenshots and captured pages, and it
bundles music and sound effects - the motion graphics and rendering stay
fully code-driven, so the finished film never depends on generated footage.

## Requirements

| | |
|---|---|
| Node.js | ≥ 18 (20+ for the demo lane) |
| ffmpeg + ffprobe | rendering and frame verification |
| Chromium | demo lane only (`npx playwright install chromium`) |
| Remotion skills | `npx skills add remotion-dev/skills` (recommended; plugin falls back to live docs without it) |
| A voice | optional: Piper (free, offline) or an ElevenLabs key for premium narration |

macOS, Linux, and Windows (WSL) all work. Nothing in the core lanes needs a
GPU or a paid service.

## Benchmarks

Real numbers from the upstream projects this plugin distills (measured by
their authors, linked so you can check):

| Metric | Result | Source |
|---|---|---|
| Cut-to-beat accuracy | ≤ 2.2 frames across an 18-cut, 70s film (perception threshold ≈ 3 frames) | shotcraft `music-beat-sync.md` |
| Shot card library | 157 cards, 214 styles, 209 motion previews | video-shotcraft |
| Sound kit | 149 categorized SFX + 5 BGM | video-shotcraft `assets/audio/` |
| Template | validated 36.2s promo, 1085 frames, 10 shots | video-shotcraft `template/` |
| Verification loop | render → ffmpeg frame extraction → visual inspection → fix → re-render, mandatory in every lane | this plugin |

## Comparison

How this plugin relates to the projects it draws from:

| | video-shotcraft (this) | video-shotcraft (upstream) | claude-remotion-skill | ultrademo |
|---|---|---|---|---|
| Provider lock-in | **none** | Claude Code / Codex | Claude family | any agent + AGENTS.md |
| Shot recipe cards | **157 (linked)** | 157 | – | – |
| Motion rules + verify loop | **yes** | partial (aesthetic case law) | **yes (10 rules)** | – |
| Full-promo template | **yes (linked)** | **yes** | – | – |
| Live app demo capture | **yes (linked)** | – | – | **yes** |
| Official Remotion skills bridge | **yes** | – | – | – |
| Offline narration | **optional lane** | – | – | **yes** |
| Install footprint | **5 light skills + on-demand clones** | full 100 MB repo | light | pipeline repo |

The plugin adds none of its own heavy assets: it routes, hardens, and
connects. Upstream libraries stay cloned (not forked) under `_upstream/`, so
license notices travel intact and `git pull` keeps them current.

## Repository layout

```text
video-shotcraft/
├── skills/
│   ├── aegntic-video/       # router - start here
│   ├── motion-craft/        # design law + components + verify loop
│   ├── shotcraft-cards/     # shot vocabulary entry (cards live upstream)
│   ├── remotion-core/       # framework truth bridge
│   └── live-demo/           # recorded app walkthrough lane
├── scripts/install.sh       # universal installer (agent picker, upstream clones)
├── .claude-plugin/          # optional Claude Code manifest (others ignore it)
└── _upstream/               # git-cloned libraries (created at install)
```

## FAQ

<details>
<summary><strong>Does this need a paid video API?</strong></summary>

No. Rendering is Remotion on your machine. Narration can be Piper (free,
offline) or skipped entirely; sound design uses the bundled, attributed SFX
kit. An ElevenLabs key is an optional upgrade for the demo lane, with
per-line caching so re-renders don't re-bill.

</details>

<details>
<summary><strong>Which agents does it work with?</strong></summary>

Anything that reads SKILL.md or AGENTS.md: Claude Code, Codex, Cursor,
OpenCode, Windsurf, Gemini CLI, Kimi Code, and others. The `.claude-plugin/`
manifest is an optional shim; every other agent ignores it. The installer
links into each agent's own skills directory.

</details>

<details>
<summary><strong>Why clone upstream instead of vendoring?</strong></summary>

Licenses stay intact and attributed, the plugin repo stays small, and
`AEGNTIC_REFRESH=1 ./scripts/install.sh` pulls upstream improvements. The
skill files teach the agent how to find and use the library; the library
itself remains the source of truth.

</details>

<details>
<summary><strong>How is this different from installing the three repos separately?</strong></summary>

Three separate installs gives you three dialects and no arbitration: which
easing rules win, when to capture vs. animate, which docs are current. This
plugin is the arbitration layer - one router, one universal rule set, one
verification loop, and explicit hand-offs between lanes.

</details>

<details>
<summary><strong>Vertical video supported?</strong></summary>

Yes. `motion-craft` scopes 1080×1920 for Reels/Shorts with safe-zone rules;
the demo lane renders a 9:16 cut from the same capture.

</details>

## Credits

Built on three open projects, with thanks:

- [Vincentwei1021/video-shotcraft](https://github.com/Vincentwei1021/video-shotcraft) - shot recipe cards, Ink Press template, SFX/BGM kit, capture tooling (Apache-2.0)
- [haidrrrry/claude-remotion-skill](https://github.com/haidrrrry/claude-remotion-skill) - the ten motion rules, component patterns, render-inspect-revise loop (MIT, vendored with notice)
- [new-xp/ultrademo](https://github.com/new-xp/ultrademo) - the capture-render demo pipeline (Apache-2.0)
- [remotion-dev/remotion](https://github.com/remotion-dev/remotion) - Remotion itself and the official Agent Skills (loaded at runtime)

## License

MIT for this plugin's original content. See [LICENSE](LICENSE). Bundled craft
references keep their upstream licenses; upstream libraries are cloned, never
redistributed.

<div align="center">
<sub>Every frame from code. Every agent welcome.</sub>
</div>
