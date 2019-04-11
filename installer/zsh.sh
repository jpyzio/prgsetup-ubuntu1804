#!/usr/bin/env bash

progress "ZSH"

sudo apt install -y zsh gawk

message "After the installation of the oh-my-zsh, the ZSH terminal will appear. Press [CTRL]+D to continue installing the next packages"
sh -c "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "
bindkey \"^[[1;3C\" forward-word
bindkey \"^[[1;3D\" backward-word
" | tee -a ~/.zshrc
