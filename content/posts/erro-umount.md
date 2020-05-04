+++
title = "Erro estranho umount [RESOLVIDO?] "
description = "gitlab-ci + docker"
date = 2020-04-11T07:13:50Z
author = "Leandro Santos"
tags = [
    "umount",
    "linux",
]
+++ 
## O erro
O comando `umount -f /data/sync/ &> /dev/null` dava um erro: *umount: /home device is busy*

## Como resolvi?
Utilizei a opção `-l`:
```
-l : Also known as Lazy unmount. Detach the filesystem from the filesystem 
hierarchy now, and cleanup all references to the filesystem as soon as it is 
not busy anymore. This option works with kernel version 2.4.11+ and above only.
```