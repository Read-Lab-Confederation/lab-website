#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -d ../read-lab-confederation.github.io # if using a theme, replace with `hugo -t <YOURTHEME>`

# Add changes to git.
cd ../read-lab-confederation.github.io && git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
cd ../read-lab-confederation.github.io && git commit -m "$msg"

# Push source and build repos.
cd ../read-lab-confederation.github.io && git push origin master
