#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"

# Save some useful information
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
	echo "Skipping deploy; just done a build."
	exit 0
fi

# Clone the existing gh-pages for this repo into out/
git clone $REPO --single-branch --depth=1 --branch $TARGET_BRANCH out

cp circuitikzgit.sty out/
cp circuitikzmanualgit.pdf out/

# Now change to gh-pages folder and check in compiled files
cd out

git config user.name "Travis CI"
git config user.email "travis@circuit.tikz"

git add .
git status

# Commit the "changes", i.e. the new version.
git commit -m "Deploy to GitHub Pages: ${SHA}"
git push $SSH_REPO $TARGET_BRANCH
