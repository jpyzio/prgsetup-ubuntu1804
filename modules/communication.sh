#!/usr/bin/env bash

### BEGIN Slack
SLACK_FILE="${ROOT_DIR}/slack.deb"

wget --output-document="${SLACK_FILE}" https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb

sudo gdebi --non-interactive "${SLACK_FILE}"

rm "${SLACK_FILE}"
### END Slack

### BEGIN Thunderbird
sudo apt install --yes thunderbird
### END Thunderbird
