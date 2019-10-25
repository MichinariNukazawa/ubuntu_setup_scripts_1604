#!/bin/bash

#下記UUIDの有無にて、本設定が追記済みであるか判定する
UUID=14a93b55-eb34-4ea3-9374-9de99a8df20d

#既に設定ファイルが存在する場合
if [ -f ~/.vimrc ] ; then

	#UUIDの有無にて、本設定が追記済みであるか判定する
	if [ 0 -ne $(cat ~/.vimrc | grep ${UUID} | wc -l) ] ; then
		echo -e "already written. exit."
		exit
	fi

fi

#Vimの設定を行う。
cat << _EOF_ >> ~/.vimrc

" header: writen by "$(basename $0)" script.

" 下記UUIDの有無にて、本設定が追記済みであるか判定する
"${UUID}


" インデントの設定
set tabstop=8
set shiftwidth=8		" シフト移動幅 (tabstopと合わせておく)
set smarttab			" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set autoindent			" 新しい行を自動インデント
set smartindent			" 新しい行を作ったときに高度な自動インデントを行う
filetype indent on		" html等ファイルの種類に合わせたフォーマットを行う


" 編集ファイルの表示の設定
set number			" 行番号を表示する
set showmatch			" 括弧入力時の対応する括弧を表示
syntax on			" コードの色分け
set list			" タブ文字、行末など不可視文字を表示する


" vimの表示の設定
set title			" 編集中のファイル名を表示
set notitle			" 『vimを使ってくれてありがとう』を出さなくする
set showtabline=2		" タブページを常に表示


" その他
"  listで表示される文字のフォーマットを指定する
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:¬

" ファイル名補完 (挙動が変わる)
"  「:split」などで複数ファイルを開く際などにTABで行う補完の挙動を変更する
set wildmode=list:longest,full


" footer: writen by "$(basename $0)" script.

_EOF_

