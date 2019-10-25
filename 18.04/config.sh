#!/bin/bash

set -eu
set -o pipefail

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR


# HiDPI font size
# /media/nuka/dc942100-526b-4f0b-a9ca-db2bbe31a40f/home/nuka/ubuntu_setup_scripts_1604/16.04/config.sh

# Gnome 時計
gsettings set org.gnome.desktop.interface clock-show-date true


