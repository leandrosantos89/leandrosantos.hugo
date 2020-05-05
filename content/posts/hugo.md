+++
title = "Deploy hugo to github-pages"
description = "hugo+github-pages"
date = 2020-05-01T21:13:50Z
author = "Leandro Santos"
tags = [
    "hugo",
    "github",
]
+++

* blog/
	- deploy.sh
	- public/

## github
* tem somente o diretório /public do hugo

## Build
`docker run --rm -v $PWD:/blog hugo hugo`

## deploy to github
__deploy.sh__
```bash
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
# Push source and build repos.
echo -e "\033[0;32mPushing public files...\033[0m"
git -C public push
echo -e "\033[0;32mPush source files...\033[0m"
git push

```

## nginx reverse proxy
`docker run -itd -p 80:80 --name proxy -v $PWD/public:/usr/share/nginx/html nginx`
