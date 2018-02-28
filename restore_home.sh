#!/bin/bash

set -eu
set -o pipefail
set -x

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR

# check argument
[ 1 -eq $# ]

SRC_DIR=$1
[ -d ${SRC_DIR} ]
[ -d ${SRC_DIR}/.mozilla ]

# backup
# bash ./backup_home.sh ${HOME}

rm -rf ~/.mozilla
cp -r ${SRC_DIR}/.mozilla ~/
rm -rf ~/.ssh
cp -r ${SRC_DIR}/.ssh ~/
rm -rf ~/.thunderbird
cp -r ${SRC_DIR}/.thunderbird ~/
rm -rf ~/.revelation_passwd
cp -r ${SRC_DIR}/.revelation_passwd ~/
rm -rf ~/.config/chromium
cp -r ${SRC_DIR}/chromium ~/.config/
rm -rf ~/.gconf/apps/revelation
cp -r ${SRC_DIR}/revelation

