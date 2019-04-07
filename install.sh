#!/usr/bin/env bash

set -e

INSTALLER_VERSION="18.04"

UBUNTU_VERSION=`lsb_release -r -s`
ROOT_DIR=$(dirname "$0")
INSTALLER_DIR="${ROOT_DIR}/installer"

progress(){
    notify-send "Installation progress: ${1}"
}

message(){
    zenity --text "${1}" --info --width=200 --height=50 > /dev/null 2>&1
}

input(){
    zenity --entry --title="Ubuntu Configurator" --text="${1}"
}

if [[ "${UBUNTU_VERSION}" != "${INSTALLER_VERSION}" ]] ; then
    message "ERROR: This installer is only for Ubuntu "
    exit 1;
fi

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
    "yarn" "Node.js + Yarn" off \
    "spotify" "Spotify" off \
    "ssh-server" "Open SSH Server" off \
    "gpg" "GPG Key" off \
    "java8" "Java 8" off \
    "atom" "Atom editor" off \
    3>&2 2>&1 1>&3 )

source ${INSTALLER_DIR}/misc.sh

for CHOICE in ${CHOICES}; do
    source "${INSTALLER_DIR}/`echo ${CHOICE} | tr -d '"'`.sh"
done

message "Press [OK] to reboot system"
reboot
