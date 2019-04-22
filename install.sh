#!/usr/bin/env bash

set -e

INSTALLER_VERSION="18.04"

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
INSTALLER_DIR="${ROOT_DIR}/installer"
CONFIG_FILE="${ROOT_DIR}/config.sh"

input() {
    zenity --entry --title="Ubuntu Configurator" --text="${1}"
}

source ${INSTALLER_DIR}/check.sh

sudo echo -e "\e[32mLet's start the installation ;)\e[39m";

CHOICES=$(whiptail --checklist "Select which services do you want install. " \
    20 55 15 \
    "diagnostic" "Diagnostic tools" on \
    "zsh" "Z Shell" off \
    "google-chrome" "Google Chrome" on \
    "gpg" "GPG Key" off \
    "git" "Git" on \
    "git-hooks" "Hooks for Git" on \
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
    "atom" "Atom editor" off \
    "virtualbox" "VirtualBox" off \
    "rest-tools" "REST Tools" off \
    "sublime3" "Sublime Text 3" off \
    3>&2 2>&1 1>&3 )

if [[ -f ${CONFIG_FILE} ]]; then
    source ${CONFIG_FILE}
fi

source ${INSTALLER_DIR}/misc.sh

for CHOICE in ${CHOICES}; do
    source "${INSTALLER_DIR}/`echo ${CHOICE} | tr -d '"'`.sh"
done

if [[ -f ${CONFIG_FILE} ]]; then
    if zenity --question --text="Do you want safely remove your configuration?"; then
        shred --remove --iterations=100 ${CONFIG_FILE}
    fi
fi

if zenity --question --text="Do you want to reboot your system?"; then
    reboot
fi
