#!/bin/bash

set -eu
set -o pipefail
set -x

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR

sudo update-alternatives --set editor /usr/bin/vim.basic

git config --global user.email "michinari.nukazawa@gmail.com"
git config --global user.name "MichinariNukazawa"

sudo groupadd vboxusers
sudo groupadd vboxsf
sudo usermod -a -G vboxusers "$USER"
sudo usermod -a -G vboxsf "$USER"

