#!/bin/bash

set -eu
set -o pipefail
set -x

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR

# apps
sudo apt update
sudo apt install vim -y
sudo apt install \
	mdadm \
	gimp chromium-browser thunderbird \
	git vim \
	vlc synaptic gjiten \
	gparted \
	nautilus-dropbox \
	rhythmbox \
	virtualbox \
	-y
# skype vscode blender virtualbox
sudo snap install --classic code
sudo snap install --classic skype

