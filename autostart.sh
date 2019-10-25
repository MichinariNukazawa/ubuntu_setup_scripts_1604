#!/bin/bash
#ログイン時の自動起動を登録する

#自動起動の設定ファイルを配置するディレクトリのパス
AUTOSTART_PATH_BASE="${HOME}/.config/autostart"

#自動起動の登録関数に設定値を渡すための変数
AS_EXEC=""		#変数 AS_EXEC：登録コマンド
AS_NAME=""		#変数 AS_NAME：登録名(オプション)

#自動起動を登録する関数
function add_autostart(){
	#AS_NAMEが指定されなかった場合、AS_EXECをそのまま書く
	if [ "" = "${AS_NAME}" ] ; then
		AS_NAME="${AS_EXEC}"
	fi

	#登録を実行(ファイルを書く)
	#設定ファイルを配置するディレクトリがなければ作成
	mkdir -p "${AUTOSTART_PATH_BASE}" 2> /dev/null
	#設定ファイルのパスを生成
	AUTOSTART_FILE_PATH="${AUTOSTART_PATH_BASE}/${AS_NAME}.desktop"
	#同名の設定ファイルが存在したらエラー
	if [ -a "${AS_NAME}" ] ; then
		echo -e "error. already exist :${AS_NAME}"
		return
	fi

#設定ファイルを書き込む
cat << _EOF_ >> "${AUTOSTART_FILE_PATH}"
[Desktop Entry]
Type=Application
Exec=${AS_EXEC}
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[ja_JP]=${AS_NAME}
Name=${AS_NAME}
Comment[ja_JP]=
Comment=
_EOF_

	#変数をクリア(次回AS_NAME省略時に前回設定が残っていないよう)
	AS_EXEC=""
	AS_NAME=""
}


#自動起動の登録を行う

AS_EXEC="rhythmbox"
add_autostart
AS_EXEC="chromium-browser"
add_autostart
AS_EXEC="firefox"
add_autostart
AS_EXEC="skypeforlinux"
add_autostart
AS_EXEC="thunderbird"
add_autostart
AS_NAME="terminal"
AS_EXEC="gnome-terminal"
add_autostart
AS_EXEC="gimp"
add_autostart
AS_NAME="homedir"
AS_EXEC="nautilus"
add_autostart

