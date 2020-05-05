#!/bin/env bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
# rebuild the site
docker run --rm -v "$PWD":/site hugo-builder hugo
# add changes
git -C public add .
git add .
MSG="rebuilding site $(date +%Y/%m/%d-%H:%M)"
if [ $# -eq 1 ]
  then MSG="$1"
fi
git commit -m "$MSG"
git -C public commit -m "$MSG"
# Push source and build repos.
echo -e "\033[0;32mPushing public files...\033[0m"
git -C public push
echo -e "\033[0;32mPush source files...\033[0m"
git push