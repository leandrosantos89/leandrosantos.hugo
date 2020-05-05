#!/bin/env bash

# rebuild the site
docker run --rm -v "$PWD":/site hugo-builder hugo
# add changes
git -C public add .
git add .
MSG="rebuilding site $(date +%Y/%m/%d-%H:%M)"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$MSG"
# Push source and build repos.
echo "push public files"
git -C public push
echo "push source files"
git push
