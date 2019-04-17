#!/usr/bin/env bash

set -e

INSTALLER_VERSION="18.04"

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
INSTALLER_DIR="${ROOT_DIR}/installer"

progress() {
    notify-send "Installation progress: ${1}"
}

message() {
    zenity --text "${1}" --info --width=200 --height=50 > /dev/null 2>&1
}

input() {
    zenity --entry --title="Ubuntu Configurator" --text="${1}"
}

source ${INSTALLER_DIR}/check.sh

CHOICES=$(whiptail --checklist "Select which services do you want install. " \
    20 55 15 \
    "zsh" "Z Shell" off \
    "diagnostic" "Diagnostic tools" on \
    "google-chrome" "Google Chrome" on \
    "git" "Git" on \
    "git-hooks" "Hooks for Git" off \
    "jetbrains-toolbox" "Jetbrains Toolbox" on \
    "docker" "Docker & Docker Compose" on  \
    "ssh-keygen" "Generate RSA key" on \
    "slack" "Slack communicator" on \
    "office" "Office apps" on \
    "ufw" "Enable firewall" on \
    "vpn-client" "VPN Client" on \
    "php" "PHP 7.2 with extensions" off  \
    "frontend-tools" "Node.js + Yarn + Vue" off \
    "spotify" "Spotify" off \
    "ssh-server" "Open SSH Server" off \
    "gpg" "GPG Key" off \
    "atom" "Atom editor" off \
    "virtualbox" "VirtualBox" off \
    "rest-tools" "REST Tools" off \
    "sublime3" "Sublime Text 3" off \
    3>&2 2>&1 1>&3 )

source ${INSTALLER_DIR}/misc.sh

for CHOICE in ${CHOICES}; do
    source "${INSTALLER_DIR}/`echo ${CHOICE} | tr -d '"'`.sh"
done

message "Press [OK] to reboot system"
reboot
