#!/usr/bin/env bash

echo "[Progress] Install Slack";

SLACK_FILE='google-chrome.deb';

wget -O ${SLACK_FILE} https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.7-amd64.deb;

sudo gdebi ${SLACK_FILE};

rm ${SLACK_FILE};
