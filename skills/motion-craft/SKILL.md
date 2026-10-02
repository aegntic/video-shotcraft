---
name: motion-craft
description: Motion-design law for Remotion - rules, patterns, verify loop.
metadata:
  aegntic:
    category: video
    keywords: [motion, animation, easing, spring, design, verify]
    source: haidrrrry/claude-remotion-skill (MIT), extended with shotcraft aesthetic case law
---

# Motion craft

Remotion renders React components frame-by-frame. Code quality is not the
bottleneck; motion-design craft is. Untrained output has linear easing,
opacity-only fades, simultaneous entrances, flat colors, no texture - the
generic AI-video look. This skill is the cure. Read it fully before writing
any Remotion code.

## Ten non-negotiable rules (apply to every composition)

1. **No linear interpolation.** Every `interpolate()` gets an easing curve;
   entrances prefer `spring()`. Always `extrapolateLeft/Right: "clamp"`.
2. **Entrances animate 2-3 properties together** (opacity + translateY +
   scale). A lone fade is forbidden.
3. **Stagger everything.** Lists, words, cards: 3-6 frame offsets. Nothing
   enters simultaneously.
4. **Exits exist and are faster than entrances** (~10 frames vs ~20).
5. **Five-layer stack in every scene**, bottom to top: background mesh ->
   assets -> graphics/type -> color grade -> grain + vignette. Never a flat
   solid background.
6. **Every still gets Ken Burns** (slow scale 1 -> 1.08 + pan). Every video
   asset uses `<OffthreadVideo>`, never `<Video>`.
7. **Idle elements breathe**: anything on screen over 2s gets sin-wave
   micro-motion.
8. **All timing derives from `fps`** via `useVideoConfig()`. No magic frame
   numbers.
9. **One theme object** (colors, easings, spring presets, fonts) at the top
   of the project. Never inline a hex color or easing in a component.
10. **Render, extract frames, look at them, fix, re-render.** Never deliver
    an unverified render.

## Setup

```bash
npm install remotion @remotion/cli react react-dom
# optional: @remotion/transitions @remotion/motion-blur @remotion/google-fonts
```

Copy this skill's `assets/theme.ts` into `src/theme.ts`, adjust the palette
to the brand. Structure: `src/index.ts` (registerRoot) -> `src/Root.tsx`
(Composition with duration/fps/size) -> `src/scenes/*.tsx` ->
`src/components/*.tsx`.

Scope first: duration, fps (30 default; 60 only for heavy fast motion),
dimensions (1080x1920 vertical, 1920x1080 landscape), what assets exist, and
whether this is a new composition or an edit. When editing an existing
project, read `src/` fully, find or create the theme, and fix rule
violations before adding features.

## Component library

`references/motion-patterns.md` has working implementations: premium
entrance, staggered children, word-by-word reveal, background mesh, color
grade, procedural grain, vignette, Ken Burns, counters, sparks, exits,
breathing, parallax, transitions. Import `theme` from the project's
`src/theme.ts`. Read it before writing components. Both reference files are
vendored from [haidrrrry/claude-remotion-skill](https://github.com/haidrrrry/claude-remotion-skill)
(MIT) with notice.

`references/design-rules.md` has palettes, typography, pacing, sound design,
and the pre-delivery checklist. Read it before designing scenes and again
before final delivery.

## Verification loop (mandatory, never skip)

```bash
npx remotion render src/index.ts <CompId> out/video.mp4 --codec h264 --crf 17
ffmpeg -v error -i out/video.mp4 \
  -vf "select='eq(n\,15)+eq(n\,45)+eq(n\,90)+eq(n\,N-10)'" -vsync 0 check_%d.png
```

Look at every extracted frame. Fix, in order of frequency:

- Spacing bugs: `gap`/`margin` in `em` resolves against the parent font size,
  not the text size - use px in flex containers around large type.
- Text overflowing or touching frame edges (keep critical content in the
  middle 75% vertically for 9:16 - platform UI covers the extremes).
- Elements visible before their entrance or after their exit (missing clamp).
- Color/contrast failures: at most one hero-colored element per frame; dim
  text unreadable over the grade.
- Layer order mistakes: grain and vignette on top, grade above content.

Fix, re-render, re-extract, re-inspect. Only deliver after a clean pass, then
run the checklist at the end of `references/design-rules.md`.

## Escalation path

Need a specific shot treatment (camera move, data viz, typographic effect)?
Load `shotcraft-cards` and pick a recipe card. Need current framework API?
Load `remotion-core`. Building on real captured pages? Capture first
(`shotcraft-cards` capture script or the `live-demo` lane), then compose
here.
