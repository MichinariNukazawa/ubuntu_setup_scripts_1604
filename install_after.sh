#!/bin/bash

set -eu
set -o pipefail
set -x

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR

sudo update-alternatives --set editor /usr/bin/vim.basic

git config --global user.email "michinari.nukazawa@gmail.com"
git config --global user.name "MichinariNukazawa"

