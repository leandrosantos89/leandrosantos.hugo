+++
title = "Gitlab-ci"
description = "gitlab-ci + docker"
date = 2020-04-11T07:13:50Z
author = "Leandro Santos"
tags = [
    "gitlab",
    "docker",
]
+++ 
[Série Docker](/posts/2020/04/docker-parte-1)

## O que gitlab-ci + links

## Gitlab-runner
## Como usar gitlab-ci + docker


```yaml
Build:
  stage: build
  before_script:
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
  script:
    - docker build --file Dockerfile --tag $IMAGE_TAG .    
    - docker push $IMAGE_TAG
  only:
    refs:
      - master
    changes:
      - "Dockerfile"
      - "requirements.txt"

Atualiza imagem produção:
  stage: build
  script:
    - ssh server "docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY && docker pull $IMAGE_TAG"
    - ssh server "docker container"
```