#!/usr/bin/env bash

CHROME_FILE_PATH="${ROOT_DIR}/google-chrome.deb"

wget -O ${CHROME_FILE_PATH} https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo gdebi -n ${CHROME_FILE_PATH}

rm ${CHROME_FILE_PATH}
