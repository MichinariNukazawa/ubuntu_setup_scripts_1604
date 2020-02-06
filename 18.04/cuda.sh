#!/bin/bash

set -eu
set -o pipefail
set -x

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR

# apps
sudo apt update
sudo apt install nvidia-driver-390 libcuda1-384 libcufft9.0 nvidia-cuda-toolkit

