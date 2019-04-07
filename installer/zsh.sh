#!/usr/bin/env bash

progress "ZSH"

sudo apt install -y zsh gawk

message "PRESS [ENTER], after oh-my-zsh installation, press CTRL+D to resume installation"

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sh -c "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
