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
# Build the project.
`docker run --rm -v $PWD:/blog hugo hugo` # if using a theme, replace with `hugo -t <YOURTHEME>`
git -C public add .
# Go To Public folder
cd public
# Add changes to git.
git add .
# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
git -C public push origin master
# Push source and build repos.
git push origin master
# Come Back up to the Project Root
cd ..
```

## nginx reverse proxy
`docker run -itd -p 80:80 --name proxy -v $PWD/public:/usr/share/nginx/html nginx`
