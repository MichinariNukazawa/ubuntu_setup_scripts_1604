#!/bin/bash

set -eu
set -o pipefail

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR


# unity 時計
gsettings set com.canonical.indicator.datetime time-format "custom"
gsettings set com.canonical.indicator.datetime custom-time-format "'%x (%a) %H:%M'"


# vi(vim)タブ入力補完
#set -o vi

# git エディタをvimへ切り替え
git config --global core.editor 'vim -c "set fenc=utf-8"'

