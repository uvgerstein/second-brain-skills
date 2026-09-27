#!/usr/bin/env bash
# Lists transcript files in AI-Context/yt-transcripts/ that have NO matching
# output note in AI-Context/watched-videos-ai-insights/ (matched by base name,
# ignoring extension). Prints one full transcript path per unprocessed video.
#
# Run from the vault root:  bash <skill>/scripts/find-unprocessed.sh
set -euo pipefail

TRANSCRIPTS="AI-Context/yt-transcripts"
OUTPUT="AI-Context/watched-videos-ai-insights"

# Base names (no extension) that already have an output note.
processed="$(find "$OUTPUT" -maxdepth 1 -name '*.md' -exec basename {} .md \; 2>/dev/null | sort -u)"

found=0
# Transcripts are .txt or .md in the transcripts folder.
while IFS= read -r f; do
  [ -z "$f" ] && continue
  base="$(basename "$f")"
  base="${base%.*}"
  if ! grep -qxF "$base" <<<"$processed"; then
    echo "$f"
    found=1
  fi
done < <(find "$TRANSCRIPTS" -maxdepth 1 \( -name '*.txt' -o -name '*.md' \) | sort)

if [ "$found" -eq 0 ]; then
  echo "No new transcripts to process" >&2
fi
