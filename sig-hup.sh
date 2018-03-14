#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

#1 環境初期化のシェル関数。ログ出力先を設定したsetting.confを読み込む
loadconf()
{
    . ./setting.conf
}

#2 HUPシグナルの割り込みで設定を読み込みなおすように定義
trap 'loadconf' HUP

#3 通常起動時の、はじめの初期化を行う
loadconf

#4 無限ループで実行
while :
do
    #5 uptime コマンドの結果を、setting.confで指定されたパスにログ出力
    uptime >> "${UPTIME_FILENAME}"
    sleep 1
done