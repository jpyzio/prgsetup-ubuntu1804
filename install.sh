#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o xtrace

CONFIGURATOR_VERSION="18.04"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULES_DIR="${ROOT_DIR}/modules"

input() {
    zenity --entry --title="Ubuntu Configurator" --text="${1}"
}

password_input() {
    zenity --password --title="Ubuntu Configurator" --text="${1}"
}

source ${MODULES_DIR}/check.sh

sudo echo -e "\e[32mLet's start the installation ;)\e[39m";

CHOICES=$(whiptail --checklist "Select which services do you want install. " \
    30 77 22 \
    "update-system" "Update system" on \
    "gpg" "GNU Privacy Guard Keys" off \
    "git" "with custom hooks and configs" on \
    "ssh-keygen" "Generate SSH Key" on \
    "system-tools" "System tools" on \
    "diagnostic-tools" "Diagnostic tools" on \
    "dev-tools-backend" "Tools for backend developers" on \
    "dev-tools-common" "Tools for all developers" on \
    "dev-tools-frontend" "Tools for frontend developers" on \
    "terminal" "Eg. Z Shell and other modifications" on \
    "browsers" "Eg. Chrome, Firefox" on \
    "ide-editors" "Eg. Sublime Text 3, Atom, Jetbrains Toolbox" on \
    "docker" "With docker-compose" on \
    "communication" "Eg. Slack" on \
    "office" "Eg. Libre Office, GIMP" on \
    "security" "Eg. Firewall" on \
    "media" "Eg. Spotify, VLC" on \
    "ssh-server" "With secure configuration" off \
    "documentation" "Generators, converters etc" off \
    "jacobs-custom" "Jacob's customization" off \
    "virtualbox" "If you want install other systems ;)" off \
    3>&2 2>&1 1>&3 )

source ${MODULES_DIR}/required.sh

for CHOICE in ${CHOICES}; do
    source "${MODULES_DIR}/`echo ${CHOICE} | tr --delete '"'`.sh"
done

if zenity --question --text="Do you want to reboot your system?"; then
    reboot
fi
