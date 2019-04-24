#!/usr/bin/env bash

CHROME_FILE="${ROOT_DIR}/google-chrome.deb"

wget --output-document=${CHROME_FILE} https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo gdebi -n ${CHROME_FILE}

rm ${CHROME_FILE}
