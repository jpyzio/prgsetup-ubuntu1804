#!/usr/bin/env bash

CURRENT_DIR=$(dirname "$0");

if [[ ! -d ${CURRENT_DIR}/installer ]]; then
	echo "Installation has been done previously.";
	exit 1;
fi

source ${CURRENT_DIR}/.zshrc-aliases;

echo "[Progress] System update";
upd;


${CURRENT_DIR}/installer/misc.sh;
${CURRENT_DIR}/installer/php.sh;
${CURRENT_DIR}/installer/yarn.sh;
${CURRENT_DIR}/installer/zsh.sh;
${CURRENT_DIR}/installer/docker.sh;
${CURRENT_DIR}/installer/google-chrome.sh;
${CURRENT_DIR}/installer/slack.sh;
${CURRENT_DIR}/installer/jetbrains-toolbox.sh;


echo "[Progress] Add main custom zshrc file to user's zshrc";
echo "[ -f ${CURRENT_DIR}/.zshrc ] && source ${CURRENT_DIR}/.zshrc" >> ~/.zshrc;

rm -Rf ${CURRENT_DIR}/installer;
