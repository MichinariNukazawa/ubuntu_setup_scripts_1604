#!/bin/bash

set -eu
set -o pipefail

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR


SCRIPT_DIR=$(cd $(dirname $0); pwd)


cat ${SCRIPT_DIR}/data/smb.conf | sudo tee -a /etc/samba/smb.conf

sudo systemctl restart smbd


