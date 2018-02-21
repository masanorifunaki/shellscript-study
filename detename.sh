#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

file="$1"

bak_filename="${file}.$(date '+%Y%m%d')" #1

# すでにhoge.20170220 などがあった場合は、秒まで入れて
# バックアップファイルを作成する
if [[ -e $bak_filename ]]; then
    bak_filename="${file}.$(date '+%Y%m%d%H%M.%S')" #2
fi

cp -v "$file" "$bak_filename" #3