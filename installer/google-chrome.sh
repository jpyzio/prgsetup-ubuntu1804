#!/usr/bin/env bash

CURRENT_DIR=$(dirname "$0")

CHROME_FILE_PATH="${CURRENT_DIR}/google-chrome.deb"

wget -O ${CHROME_FILE_PATH} https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo gdebi -n ${CHROME_FILE_PATH}

rm ${CHROME_FILE_PATH}
