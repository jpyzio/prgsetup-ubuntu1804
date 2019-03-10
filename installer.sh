#!/usr/bin/env bash

set -e

CURRENT_DIR=$(dirname "$0");

if [[ ! -d ${CURRENT_DIR}/installer ]]; then
	echo "Installation has been done previously.";
	exit 1;
fi

sudo apt update && sudo apt full-upgrade -y

${CURRENT_DIR}/installer/zsh.sh;
${CURRENT_DIR}/installer/misc.sh;
${CURRENT_DIR}/installer/php.sh;
${CURRENT_DIR}/installer/yarn.sh;
${CURRENT_DIR}/installer/docker.sh;
${CURRENT_DIR}/installer/google-chrome.sh;
${CURRENT_DIR}/installer/slack.sh;
${CURRENT_DIR}/installer/jetbrains-toolbox.sh;
${CURRENT_DIR}/installer/spotify.sh;


echo "[ -f ${CURRENT_DIR}/.zshrc ] && source ${CURRENT_DIR}/.zshrc" >> ~/.zshrc;

rm -Rf ${CURRENT_DIR}/installer;
