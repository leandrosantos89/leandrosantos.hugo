+++
title = "docker-compose"
description = "docker-compose"
date = 2020-04-21T07:13:50Z
author = "Leandro Santos"
tags = [
    "docker",
]
+++ 
## Como instalar
* Documentação oficial: https://docs.docker.com/compose/install/

* EASY WAY
	- ubuntu: `apt install docker-compose`
	- não é a versão *latest*
* __SCRIPT RAIZ__
```bash
#!/bin/bash
VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest \
	| grep tag_name \
	| cut -d '"' -f 4)
DESTINATION=/usr/local/bin/docker-compose
sudo curl \
	--location https://github.com/docker/compose/releases/download/${VERSION}/\
	docker-compose-$(uname -s)-$(uname -m) \
	--output $DESTINATION
sudo chmod 755 $DESTINATION
``` 

## Básico
```yml
version:'3'
services:
 app:
  container_name:app
  build:
   context: .
  volumes:
   - .:/home/app
  environment:
   - VARIAVEL: $BLA
  ports
   - 80
```
## Variáveis de ambiente - .env
__.env__
```
BLA="teste"
```

## Fazendo build da imagem
* `docker-compose up --build --force-recreate -d`