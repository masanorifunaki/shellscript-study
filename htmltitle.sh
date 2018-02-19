#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# カレントディレクトリの .html ファイルを対象
for htmlfile in *.html #1
do
    # ファイル名から、拡張子を含まない文字列を取得する
    fname=$(basename "$htmlfile" .html) #2
    
    # <title>タグの中身を後方参照\1として抽出し、ファイル出力する
    sed -n 's/^.*<title>\(.*\)<\/title>.*$/\1/p' $htmlfile > output/${fname}.txt #3
done