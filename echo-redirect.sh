#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

#1 2 中カッコでグルーピングして、リダイレクトを1つにまとめる
{
    echo "[Script start]"
    date
    ls
    echo "[Script end"
} > output.log