#!/bin/bash

set -eu
set -o pipefail

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR

# git エディタをvimへ切り替え
git config --global core.editor 'vim -c "set fenc=utf-8"'

