#!/usr/bin/env bash
sudo apt update

sudo apt install --yes xclip


### BEGIN zsh
sudo apt install --yes zsh gawk
### END zsh


### BEGIN OH MY ZSH
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sudo chsh -s /bin/zsh
### END OH MY ZSH


### BEGIN FZF for zsh and bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
### END FZF for zsh and bash


### BEGIN Tuning zsh
echo "
bindkey \"^[[1;3C\" forward-word
bindkey \"^[[1;3D\" backward-word
" | tee --append ~/.zshrc
### END Tuning zsh