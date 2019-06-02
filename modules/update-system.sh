#!/usr/bin/env bash

sudo apt update

sudo apt full-upgrade --yes

sudo apt autoremove --yes

sudo apt autoclean --yes

#if [[ command -v yarn > /dev/null ]]; then
#    yarn global upgrade
#fi
#
#if [[ command -v composer > /dev/null ]]; then
#    sudo composer self-update
#    composer global update
#fi
