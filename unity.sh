#!/bin/bash

set -eu
set -o pipefail

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR


gsettings set com.canonical.indicator.datetime time-format "custom"
gsettings set com.canonical.indicator.datetime custom-time-format "'%x (%a) %H:%M'"


