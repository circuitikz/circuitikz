#!/bin/bash
set -euo pipefail

TARGET_BRANCH="gh-pages"

if [ -z "${GITHUB_TOKEN:-}" ]; then
    echo "GITHUB_TOKEN is not set"
    exit 1
fi

if [ -z "${RELEASE_NAME:-}" ]; then
    echo "RELEASE_NAME is not set"
    exit 1
fi

if [ -z "${RELEASE_TAG:-}" ]; then
    echo "RELEASE_TAG is not set"
    exit 1
fi

SOURCE_SHA="$(git rev-parse HEAD)"
REPO_URL="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

rm -rf out
git clone "$REPO_URL" --single-branch --depth=1 --branch "$TARGET_BRANCH" out

cp circuitikzgit.sty out/
cp t-circuitikzgit.tex out/
cp circuitikzmanualgit.pdf out/
cp ctikzstylesgit.zip out/

python3 tools/update-gh-pages-info.py out/

cd out

git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

git add .
git status

if git diff --cached --quiet; then
    echo "No generated-file changes to deploy."
else
    git commit -m "Deploy release artifacts ${RELEASE_TAG}: ${SOURCE_SHA}"
    git push origin "$TARGET_BRANCH"
fi

# This is the important SHA: the gh-pages commit containing the generated files.
ARTIFACT_SHA="$(git rev-parse HEAD)"

# update timestamp
cd ..
python3 tools/update-gh-pages-info.py out/
cd out

python3 - "$RELEASE_NAME" "$ARTIFACT_SHA" "$GITHUB_REPOSITORY" <<'PY'
from pathlib import Path
import re
import sys

release_name, artifact_sha, repo = sys.argv[1:4]

# Expected example:
#   CTAN release 1.8.6 (2026-05-24)
m = re.fullmatch(
    r"CTAN release\s+([0-9][0-9A-Za-z.\-]*)\s+\((\d{4}-\d{2}-\d{2})\)",
    release_name.strip(),
)
if not m:
    raise SystemExit(
        "Release name does not match expected form: "
        "'CTAN release X.Y.Z (YYYY-MM-DD)'"
    )

version, release_date = m.groups()

index = Path("index.html")
text = index.read_text(encoding="utf-8")

begin = "<!-- CTIKZ_RELEASES_BEGIN -->"
end = "<!-- CTIKZ_RELEASES_END -->"

start = text.find(begin)
finish = text.find(end)

if start == -1 or finish == -1 or finish < start:
    raise SystemExit("Could not find CTIKZ_RELEASES marker block in index.html")

insert_at = start + len(begin)
managed_block = text[insert_at:finish]

if f"Version {version} ({release_date})" in managed_block:
    print(f"Version {version} ({release_date}) already present; not inserting again.")
    sys.exit(0)

stanza = f'''
  <li><a href="https://github.com/{repo}/raw/{artifact_sha}/circuitikzgit.sty">
  Version {version} ({release_date})</a>; also the corresponding
  <a href="https://github.com/{repo}/blob/{artifact_sha}/ctikzstylesgit.zip?raw=true">
  styles </a> and
  <a href="https://github.com/{repo}/blob/{artifact_sha}/circuitikzmanualgit.pdf?raw=true">
  manual</a>.
</li>'''

text = text[:insert_at] + stanza + text[insert_at:]
index.write_text(text, encoding="utf-8")

print(f"Inserted Version {version} ({release_date}) pointing to gh-pages commit {artifact_sha}")
PY

git add index.html
git status

if git diff --cached --quiet; then
    echo "No index.html changes to deploy."
    exit 0
fi

git commit -m "Add release ${RELEASE_TAG} to index"
git push origin "$TARGET_BRANCH"
