#!/usr/bin/env bash

set -e

CURRENT_DIR=$(dirname "$0");

sudo apt install -y zsh gawk;

read -p "PRESS [ENTER], after oh-my-zsh installation, press CTRL+D to resume installation"
sh -c "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#curl -sL git.io/antibody | sh -s
