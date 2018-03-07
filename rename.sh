#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

for filename in * #1
do
    case "$filename" in #2
        *.html | *.htm) #3
            # ファイル名の前の部分を取得 (index)
            headname=${filename%.*} #4
            
            # ファイル名を .txtに変換
            mv "$filename" "${headname}.txt" #5
    esac
done