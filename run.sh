#!/bin/bash

set -eu
set -o pipefail
set -x

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR

SCRIPT_DIR=$(cd $(dirname $0); pwd)

pushd ${SCRIPT_DIR}

bash ./english_home.sh
bash ./bashrc.sh
bash ./vimrc.sh
bash ./autostart.sh

#bash ./config.sh

popd

