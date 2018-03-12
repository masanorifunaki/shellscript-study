#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# ハッシュ値を出力する一時ファイルを初期化する
tmpfile="hash.txt"
: > $tmpfile #1

# シェルの区切り文字を改行のみとする
IFS=$'\n'

# 指定されたテキストファイルから1行ずつ読み込み
while read -r line #3
do
    # 各行のMD5ハッシュを取得する
    # コマンドの後ろにはファイル名が付くため、1カラム目を取り出す
    echo  -n "$line" | md5 | awk '{print $1}' >> $tmpfile #5
done < $1

# 元のテキストファイルと、ハッシュ値を出力した一時ファイルを、
# カンマ区切りで連結して表示する
paste -d, "$1" $tmpfile #6