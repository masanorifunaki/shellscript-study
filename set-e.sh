#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

#1 コマンドの終了ステータスが非ゼロの場合は、
# スクリプトをただちに終了する
set -e

#2 削除ファイルの格納ディレクトリ（をミスタイプしている）
deldir="/var/log/myapp-"

#3 4 ディレクトリ$deldirに移動して、拡張子.logのファイルを削除する。
# set -e しているため、ディレクトリ移動に失敗すればrmコマンドは実行されない
cd "$deldir"
rm -f *.log