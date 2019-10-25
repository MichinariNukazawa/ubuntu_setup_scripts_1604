#!/bin/bash

set -eu
set -o pipefail
set -x

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR

LANG=C xdg-user-dirs-gtk-update

set +e
#rmdir ダウンロード
#rmdir テンプレート
#rmdir デスクトップ
#rmdir ドキュメント
#rmdir ビデオ
#rmdir ピクチャ
#rmdir ミュージック
#rmdir 公開

rmdir ~/Desktop
rmdir ~/Documents
#rmdir ~/Downloads
rmdir ~/Music
rmdir ~/Pictures
rmdir ~/Public
rmdir ~/Templates
rmdir ~/Videos
rm ~/examples.desktop
set -eu

