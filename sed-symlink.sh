#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

filename="tmp002.txt"

if [[ ! -e "$filename" ]]; then
    # 対象ファイルが存在しなければエラー終了
    echo "ERROR: File not exists." >&2
    exit 1
    elif [ -h "$filename" ]; then
    # 対象ファイルがシンボリックりんくならば、readlinkコマンドで
    # 実体ファイルに対して処理を行う
    sed -i '.bak' 's/Docu/docu/g' "$(readlink "$filename")" #3
else
    sed -i '.bak' 's/Docu/docu/g' "$filename"
fi