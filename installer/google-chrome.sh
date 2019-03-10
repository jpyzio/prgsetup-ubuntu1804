#!/usr/bin/env bash

set -e

CHROME_FILE='google-chrome.deb';

wget -O ${CHROME_FILE} https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;

sudo gdebi -n ${CHROME_FILE};

rm ${CHROME_FILE};
