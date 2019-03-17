#!/usr/bin/env bash

progress "ZSH"

CURRENT_DIR=$(dirname "$0");

sudo apt install -y zsh gawk;

message "PRESS [ENTER], after oh-my-zsh installation, press CTRL+D to resume installation";

sh -c "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

echo "[ -f ${CURRENT_DIR}/../.zshrc ] && source ${CURRENT_DIR}/../.zshrc || echo 'Missing .zshrc from installer';" >> ${HOME}/.zshrc;

#curl -sL git.io/antibody | sh -s;
