---
name: shotcraft-cards
description: 157 cinematic shot recipe cards + Ink Press template for product films.
metadata:
  aegntic:
    category: video
    keywords: [shot-cards, promo, storyboard, camera, typography, sfx]
    source: Vincentwei1021/video-shotcraft (Apache-2.0)
---

# Shotcraft cards

A self-contained production library: shot recipe cards (each with intent,
motion math, parameter tables, and known pitfalls), a validated full promo
template (Ink Press), reusable components, and a sound-design kit. Focus is
web/desktop product films, but the cards are a general motion vocabulary -
pull a single card for any one shot in any video.

**Upstream first run:** the heavy library (recipe cards, template project,
audio kit, demo sources) is not stored in this plugin. If
`../_upstream/video-shotcraft/` does not exist, run:

```bash
bash "$(dirname "$0")/../../scripts/install.sh"   # clones it once
```

(or `git clone --depth 1 https://github.com/Vincentwei1021/video-shotcraft`
into `../_upstream/video-shotcraft/`). All paths below are relative to that
clone. Card text is bilingual (Chinese/English); the motion math and
parameter tables are language-independent.

## Three modes for a full promo - pick before gathering assets

1. **Template mode**: keep the Ink Press structure, swap product screenshots,
   copy, and brand. Read `_upstream/video-shotcraft/template/TEMPLATE.md`
   and follow its per-shot replacement guide.
2. **Autonomous free creation**: you own creative and engineering decisions.
   Read `references/pipeline.md` (eight stages) and drive straight through;
   do not pause per stage.
3. **Co-creation**: confirm with the user at each gate - product brief,
   requirements, visual direction, shot mapping, final storyboard - then
   continue from stage 4 of the pipeline.

If the user named specific cards ("use deck-deal-flyin and row-embed"),
resolve them from the gallery names, read each card fully, and follow its
reference implementation; the named cards are constraints, not a mode
choice. If the user has not chosen a mode, do a minimal read-only product
check, recommend one of the three with reasons, and ask once.

## The card library

`references/shots/` - 10 categories: opening (11), camera (10),
ui-entrance (28), typography (26), data (13), interaction (15), effects
(17), transition (19), rhythm (11), outro (7). Each card file is a recipe:
intent, motion core (exact interpolation math), parameter table with tuning
feel, known pitfalls, and a pointer to a working demo under `demos/`.

Working picks: `blur-slide` (typography, the default title reveal),
`deck-deal-flyin` (ui-entrance, grid deal-in), `row-embed` (ui-entrance,
detail rows landing one by one), `spotlight-hero-card` (opening),
`basic-3d-scene` (camera, impress.js-style spatial journey),
`outro-group-photo-launch` (outro finale).

Supporting craft files:

- `references/pipeline.md` - eight-stage production pipeline.
- `references/aesthetic-rules.md` - case-law aesthetics: rule + precedent +
  self-check question for each. Walk the full list at final review and
  output `id: pass` or `id: fail(location)` per line.
- `references/music-beat-sync.md` - BGM beat grid measurement; all cuts on
  beats within a 3-frame tolerance.
- `references/sound-design.md` - SFX vocabulary, alignment tricks; sound is
  a timeline-level asset in one pinned-frame table, not per-scene code.
- `references/final-review.md` - independent final review checklist (run in
  a clean context, without production history).

## Assets

- `assets/lib/` - reusable Remotion components: PageCam (3D page planes),
  Caption, DigitRoll, FlashCut, VerticalTicker, helpers.
- `assets/audio/` - 149 categorized SFX + 5 BGM tracks (attribution in
  `ATTRIBUTION.md`). Template consumes them via `staticFile`, so copy what
  you use into your project's `public/`.
- `assets/brand/` - example brand board and logo lockups.
- `assets/scripts/capture-template.mjs` - puppeteer capture pipeline:
  full-page 2x screenshots, per-element transparent cutouts, layout.json
  bounding boxes. Hard prerequisite: inject fictional-but-realistic demo
  data before shooting. Empty states and lorem ipsum make dead footage;
  real customer data must never appear.

## Template quick start (mode 1)

```bash
cd _upstream/video-shotcraft/template
npm install
npx remotion studio src/index.ts    # preview
npx remotion render src/index.ts AiflPromo out/promo.mp4
npx remotion still src/index.ts AiflPromo out/qa/f150.png --frame=150
```

Swap materials per `TEMPLATE.md`'s shot table: ten shots, energy arc from
brand open to assembly finale, four title cards with breathing holds, six
caption strips, 30+ pinned SFX. Verify with stills at shot boundaries, then
run the verification loop from `motion-craft`.

## Escalation

Motion fundamentals (easing, layer stack, theme) -> `motion-craft`.
Framework API (fonts, transitions, OffthreadVideo) -> `remotion-core`.
Recorded app walkthrough with narration -> `live-demo`.
