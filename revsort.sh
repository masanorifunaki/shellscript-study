#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 一時ファイルの指定
tmpfile="sort.lst"

# 対象IDファイルを確認する
if [[ ! -f "$1" ]]; then
    echo "IDリストファイルを指定してください" >&2 #1
    exit 1
fi

# IDの末尾の数字でリストをソートする
rev "$1" | sort | rev > $tmpfile #2

# 末尾ソートされたIDリストでreportを作成する
cat $tmpfile > report.txt

# 一時ファイルを削除する
rm -f $tmpfile