#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"

function doCompile {
	make manual-git 
}

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
	echo "Skipping deploy; just doing a build."
	doCompile
	exit 0
fi

# Get the deploy key by using Travis's stored variables to decrypt deploy_key.enc
# ENCRYPTION_LABEL is set at .travis.yml
openssl aes-256-cbc -K encrypted_${ENCRYPTION_LABEL}_key -iv encrypted_${ENCRYPTION_LABEL}_iv -in tools/deploy_key.enc -out tools/deploy_key -d
chmod 600 tools/deploy_key
eval `ssh-agent -s`
ssh-add tools/deploy_key

# Save some useful information
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`

git config user.name "Travis CI"
git config user.email "$COMMIT_AUTHOR_EMAIL"

# Clone the existing gh-pages for this repo into out/
git clone $REPO --singlebranch --depth=1 --branch=$TARGET_BRANCH out

# Run our compile script
doCompile

cp circuitikzgit.sty out/
cp circuitikzmanualgit.pdf out/

# Now change to gh-pages folder and check in compiled files
cd out

git add .
git status

# Commit the "changes", i.e. the new version.
git commit -m "Deploy to GitHub Pages: ${SHA}"
git push $SSH_REPO $TARGET_BRANCH
