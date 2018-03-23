#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 1 指定されたIDファイルから、[$id $status]として1行ずつ
# read コマンドで読み込む
while read id status
do
    # シェル変数idの先頭2文字が"AC"かをチェックする
    if [[ ${id:0:2} = "AC" ]]; then
        echo "$id $status"
    fi
done < "$1"