#!/usr/bin/env bash

echo "[Progress] Install Google Chrome";

CHROME_FILE='google-chrome.deb';

wget -O ${CHROME_FILE} https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;

sudo gdebi ${CHROME_FILE};

rm ${CHROME_FILE};
