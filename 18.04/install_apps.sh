#!/bin/bash

set -eu
set -o pipefail
set -x

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR

# apps
sudo apt update
sudo apt install \
	mdadm samba \
	gimp chromium-browser thunderbird \
	git vlc synaptic gjiten \
	gparted vim \
	nautilus-dropbox \
	exfat-fuse exfat-utils \
	-y
# skypeforlinux
# fcitx-mozc

