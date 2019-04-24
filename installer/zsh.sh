#!/usr/bin/env bash

sudo apt install -y zsh gawk

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sudo chsh -s /bin/zsh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "
bindkey \"^[[1;3C\" forward-word
bindkey \"^[[1;3D\" backward-word
" | tee --append ~/.zshrc
