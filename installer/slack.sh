#!/usr/bin/env bash

progress "Slack"

SLACK_FILE="${ROOT_DIR}/slack.deb"

wget -O ${SLACK_FILE} https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.7-amd64.deb

sudo gdebi -n ${SLACK_FILE}

rm ${SLACK_FILE}
