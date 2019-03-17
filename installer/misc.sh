#!/usr/bin/env bash

sudo apt update;

sudo apt full-upgrade -y;

sudo apt install -y git gdebi htop iotop nload net-tools curl wget jq \
libreoffice-calc libreoffice-math libreoffice-writer \
gimp gpa xclip zenity;
