#!/usr/bin/env bash

CURRENT_DIR=$(dirname "$0");

echo "[Progress] Install ZSH";
sudo apt install zsh;

echo "[Progress] Install zplug"
if [[ ! -d ${CURRENT_DIR}/bin/.zplug ]]; then
    git clone https://github.com/zplug/zplug ${CURRENT_DIR}/../bin/.zplug;
    source ${CURRENT_DIR}/../bin/.zplug/init.zsh && zplug update --self;
fi
