#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o xtrace

# shellcheck disable=SC2034
CONFIGURATOR_VERSION="18.04"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULES_DIR="${ROOT_DIR}/modules"

input() {
  zenity --entry --title="Ubuntu Configurator" --text="${1}"
}

password_input() {
  zenity --password --title="Ubuntu Configurator" --text="${1}"
}

# shellcheck disable=SC1090
source "${MODULES_DIR}"/check.sh

sudo echo -e "\e[32mLet's start the installation ;)\e[39m"

CHOICES=$(whiptail --checklist "Select which services do you want install. " \
  30 77 22 \
  "update-system" "Update system" on \
  "system-tools" "System tools" on \
  "diagnostic-tools" "Diagnostic tools" on \
  "dev-tools-backend" "Tools for backend developers" on \
  "dev-tools-common" "Tools for all developers" on \
  "dev-tools-frontend" "Tools for frontend developers" on \
  "terminal" "Eg. Z Shell and other modifications" on \
  "browsers" "Eg. Chrome, Firefox" on \
  "gpg" "GNU Privacy Guard Keys" off \
  "git" "with custom hooks and configs" on \
  "ide-editors" "Eg. Sublime Text 3, Atom, Jetbrains Toolbox" on \
  "docker" "With docker-compose" on \
  "ssh-keygen" "Generate SSH Key" on \
  "communication" "Eg. Slack" on \
  "office" "Eg. Libre Office, GIMP" on \
  "graphics" "Graphics programs" on \
  "security" "Eg. Firewall" on \
  "media" "Eg. Spotify, VLC" on \
  "ssh-server" "With secure configuration" off \
  "virtualbox" "If you want install other systems ;)" off \
  "documentation" "Generators, converters etc" off \
  "jakubs-custom" "Jakub's customization" off \
  "cnc" "CNC" off \
  3>&2 2>&1 1>&3)

# shellcheck disable=SC1090
source "${MODULES_DIR}"/required.sh

for CHOICE in ${CHOICES}; do
  CHOICE=$(echo "${CHOICE}" | tr --delete '"')
  # shellcheck disable=SC1090
  source "${MODULES_DIR}/${CHOICE}.sh"
done

if zenity --question --text="Do you want to reboot your system?"; then
  reboot
fi
