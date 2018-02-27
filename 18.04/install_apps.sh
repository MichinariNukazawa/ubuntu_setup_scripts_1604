#!/bin/bash

set -eu
set -o pipefail
set -x

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR

# apps
sudo apt update
sudo apt install \
	mdadm samba squid gimp chromium-browser thunderbird \
	git revelation vlc synaptic gjiten gparted vim \
	nautilus-dropbox \
	-y
# skypeforlinux
# fcitx-mozc

