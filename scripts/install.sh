#!/usr/bin/env bash
# aegntic-video plugin installer - universal, provider-agnostic.
# Links the skills/ directory into any agent's skill location and clones the
# two upstream libraries (video-shotcraft, ultrademo) into _upstream/.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
UPSTREAM="$REPO_DIR/_upstream"

# agent name -> skill directory. All agents read SKILL.md from one of these.
link_target() {
  case "$1" in
    claude-code)  echo "${HOME}/.claude/skills" ;;
    codex)        echo "${HOME}/.codex/skills" ;;
    cursor)       echo "${HOME}/.cursor/skills" ;;
    opencode)     echo "${HOME}/.config/opencode/skills" ;;
    gemini-cli)   echo "${HOME}/.gemini/skills" ;;
    windsurf)     echo "${HOME}/.codeium/windsurf/skills" ;;
    universal)    echo "${HOME}/.agents/skills" ;;
    *)            return 1 ;;
  esac
}

AGENTS="${AEGNTIC_AGENTS:-}"
if [ -z "$AGENTS" ]; then
  if [ -t 0 ]; then
    echo "Agents to link (space-separated):"
    echo "  claude-code codex cursor opencode gemini-cli windsurf universal"
    printf "Choice [universal]: "
    read -r INPUT
    AGENTS="${INPUT:-universal}"
  else
    AGENTS="universal"
  fi
fi

for agent in $AGENTS; do
  dest="$(link_target "$agent")" || { echo "unknown agent: $agent (skipped)"; continue; }
  mkdir -p "$dest"
  for skill_dir in "$REPO_DIR"/skills/*/; do
    name="$(basename "$skill_dir")"
    link="$dest/$name"
    if [ -L "$link" ] || [ -e "$link" ]; then
      echo "  exists: $link (leaving as-is)"
    else
      ln -s "$skill_dir" "$link"
      echo "  linked: $link -> $skill_dir"
    fi
  done
done

# Upstream libraries (cloned, never forked - licenses and updates stay clean)
mkdir -p "$UPSTREAM"
clone() {
  local url="$1" dir="$2"
  if [ -d "$UPSTREAM/$dir/.git" ]; then
    echo "upstream ok: $dir (re-run with AEGNTIC_REFRESH=1 to update)"
  else
    git clone --depth 1 "$url" "$UPSTREAM/$dir"
  fi
}
if [ "${AEGNTIC_REFRESH:-0}" = "1" ]; then
  git -C "$UPSTREAM/video-shotcraft" pull --ff-only 2>/dev/null || true
  git -C "$UPSTREAM/ultrademo" pull --ff-only 2>/dev/null || true
fi
clone https://github.com/Vincentwei1021/video-shotcraft video-shotcraft
clone https://github.com/new-xp/ultrademo ultrademo

# Remotion official skills: recommend, install if the skills CLI is available
if command -v npx >/dev/null 2>&1; then
  echo
  echo "Recommended next step (installs official Remotion Agent Skills):"
  echo "  npx skills add remotion-dev/skills"
fi

echo
echo "Done. Skills linked for: $AGENTS"
echo "Upstream libraries: $UPSTREAM"
