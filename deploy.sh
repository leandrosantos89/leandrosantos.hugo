#!/usr/bin/env bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
# rebuild the site
docker run --rm -v "$PWD":/site hugo-builder hugo
# add changes
git -C public add .

MSG="rebuilding site $(date +%Y/%m/%d-%H:%M)"
if [ $# -eq 1 ]
  then MSG="$1"
fi

git -C public commit -m "$MSG"
echo -e "\033[0;32mPushing public files...\033[0m"
git -C public push

git add .
git commit -m "$MSG"
echo -e "\033[0;32mPushing source files...\033[0m"
git push
