+++
title = "Boas práticas em bash/sh - shell scripts"
description = "Como desenvolver scritps melhores"
date = 2020-05-03T14:36:50Z
author = "Leandro Santos"
tags = [
    "linux",
    "bash",
]
categories = [
    "linux",
    "bash",
]
+++

## Comentários
* https://cleitonbueno.com/shell-script-comentarios/
  - comentários de várias linhas não funcionam em todos os SHELL

## Debug
* `set -vx` and `set +vx`
* `bash -vx script.sh`
* https://www.cyberciti.biz/tips/debugging-shell-script.html
  - `function DEBUG`
* ShellCheck: https://www.cyberciti.biz/programming/improve-your-bashsh-shell-script-with-shellcheck-lint-script-analysis-tool/
  - install plugin in vim
## Exit codes

## vim
https://www.cyberciti.biz/faq/turn-on-or-off-color-syntax-highlighting-in-vi-or-vim/
```bash
mkdir ~/.vim/autoload -p
cd .vim/autoload/
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

