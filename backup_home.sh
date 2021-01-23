#!/bin/bash

set -eu
set -o pipefail
set -x

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR

# check argument
[ 1 -eq $# ]

SRC_HOME=$1
[ -d ${SRC_HOME} ]
[ -e ${SRC_HOME}/.bashrc ]
[ ${HOME} != ${SRC_HOME} ]

DATE=$(date '+%Y%m%d_%Hh%Mm')
DST_DIR=~/home_${DATE}
[ ! -d ${DST_DIR} ]
mkdir -p ${DST_DIR}
mkdir -p ${DST_DIR}/sys

pushd ${SRC_HOME}

#cp -r Dropbox ${DST_DIR}
cp -r .mozilla ${DST_DIR}
cp -r .ssh ${DST_DIR}
cp -r .thunderbird ${DST_DIR}
cp -r snap/chromium/ ${DST_DIR}

cp -r .bashrc ${DST_DIR}/sys
cp -r .vimrc ${DST_DIR}/sys
#cp -r .vim ${DST_DIR}
cp -r .bash_history ${DST_DIR}/sys/bash_history

cp -r ../../etc/fstab ${DST_DIR}/sys/
cp -r ../../etc/mdadm/mdadm.conf ${DST_DIR}/sys/
cp -r ../../etc/samba/smb.conf ${DST_DIR}/sys/

popd

