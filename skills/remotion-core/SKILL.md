---
name: remotion-core
description: Current Remotion framework setup, markup, and render guidance.
metadata:
  aegntic:
    category: video
    keywords: [remotion, api, render, compositions, captions, maps]
    source: remotion-dev/remotion official Agent Skills (loaded at runtime)
---

# Remotion core

The framework truth. This plugin never vendors Remotion's official skills or
answers Remotion API questions from memory - the API moves, and stale
knowledge produces broken renders. Install the official skills once per
machine:

```bash
npx skills add remotion-dev/skills
```

That installs `remotion-best-practices` (router), `remotion-create`,
`remotion-markup`, `remotion-render`, `remotion-studio`, `remotion-captions`,
`remotion-maps`, `remotion-multimedia`, `remotion-docs` and more into your
agent's skill directory, where they load alongside this plugin.

## If the official skills are not installed

Fall back to live documentation, which is always current:

1. Search: `POST https://plsduol1ca-dsn.algolia.net/1/indexes/*/queries?x-algolia-api-key=3e42dbd4f895fe93ff5cf40d860c4a85&x-algolia-application-id=PLSDUOL1CA`
   with `{"requests":[{"query":"<query>","indexName":"remotion","params":"attributesToRetrieve=[\"hierarchy.lvl1\",\"hierarchy.lvl2\",\"url\"]&hitsPerPage=10"}]}`
2. Fetch any docs URL with a `.md` suffix for clean markdown:
   `https://www.remotion.dev/docs/use-video-config.md`

Never guess API signatures. One version-stale prop (e.g. an old
`<Video>` instead of `<OffthreadVideo>`) costs a re-render cycle.

## Version alignment

The craft skills here (motion-craft, shotcraft-cards) were written against
Remotion 4.x. Pin the template's versions (`remotion` and `@remotion/cli`
from `_upstream/video-shotcraft/template/package.json`) unless you have a
reason to upgrade, and read the official `remotion-upgrade` skill when you
do.

## Division of labor

- This skill: where framework knowledge lives and how to fetch it.
- `motion-craft`: how to make output look designed, not generated.
- `shotcraft-cards`: shot vocabulary and the full-promo pipeline.
- `live-demo`: capturing a real app and rendering the walkthrough.
