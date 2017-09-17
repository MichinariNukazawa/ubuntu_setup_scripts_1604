#!/bin/bash
#
#引数に指定されたユーザとパスワードをSambaサーバのユーザに追加する
#
#引数1: 追加したいユーザ名
#引数2: 追加したいユーザに設定するパスワード
#
#WARNING:
#本スクリプトは、Sambaにユーザ追加するにあたって、
#最低限のチェックしかしていません。
#	 * Sambaサーバを再起動します
#	 * bashのhistoryに追加したパスワードが残ります
#		(history -c コマンドによる全履歴消去などで対応してください)
#あくまで手順確認、または問題発生時に対処できる方が手間を省く用途と思ってください。


#ルート権限をチェック。
if [ ! ${EUID:-${UID}} = 0 ]; then
	echo -e "No root parmit. user:`whoami`"
	exit
fi

USER_NAME="$1"
USER_PASSWD="$2"
#引数が空文字でないかチェック
if [ "" = "${USER_NAME}" ] ; then
	echo "no set argument(s) 1. username :${USER_NAME}"
	exit
elif [ "" = "${USER_PASSWD}" ] ; then
	echo "no set argument(s) 2. passwd :${USER_PASSWD}"
	exit
fi


#sambaユーザ用のグループを作成して所属させる
#(これをしなくてもSambaユーザへの登録はできる)
groupadd samba_users 2> /dev/null

#OS側にユーザを作成
useradd ${USER_NAME} -p ${USER_PASSWD} -s /usr/sbin/nologin -M -G samba_users
RET=$?
if [ 0 -ne ${RET} ] ; then
	echo "useradd error :${RET}"
	exit
fi

#Sambaにユーザを登録
( echo ${USER_PASSWD} ; echo ${USER_PASSWD} ) | smbpasswd -s -a ${USER_NAME}
RET=$?
if [ 0 -ne ${RET} ] ; then
	echo "smbpasswd error :${RET}"
	exit
fi

#Sambaを再起動
systemctl restart smbd.service
RET=$?
if [ 0 -ne ${RET} ] ; then
	echo "smbd restart error :${RET}"
	exit
fi

#ユーザ一覧を表示(登録したユーザが表示されれば成功)
echo "pdbedit output :"
pdbedit -L

echo "success."

exit

