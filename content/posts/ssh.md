+++
title = "SSH"
description = "O comando SSH"
date = 2020-04-21T09:13:50Z
author = "Leandro Santos"
tags = [
    "openssh",
    "linux",
]
+++
## Instalação - client+server
* `apt install openssh-client`

## Troca de chaves
* `ssh-keygen -b 4096`
* `ssh-copy-id user@server`

### Acessando com chave privada
* Permissão da chave:
  - A chave não pode ter permissão muito aberta. Use algo do tipo:
  `chmod 600 chave.pem`
    - somente seu user pode editar a chave
  - Se a permissão for muito permissiva, aparecerá um *warning* e a conexão não será efetuada.

## Organize os acessos com o arquivo `~/.ssh/config`
* Pode ser por user `~/.ssh/config` ou system-wide `/etc/ssh/ssh_config`
* Edite (ou crie) o arquivo da seguinte forma: `vim ~/.ssh/config`
```conf
Host server01
   HostName 10.200.66.69
   User root
   UserKnownHostsFile=/dev/null
Host server02
   HostName 10.200.66.6
   User core
   IdentityFile /~/server02.pem  
```

* Dessa forma é possível logar no server assim:
`ssh server01`

## HOT TIPS
* QUIET
* Tempo de execução do comando ssh