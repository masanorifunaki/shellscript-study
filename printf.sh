#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
#set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 検索する文字列の定義
search_text="ERROR 19:"

# カレントディレクトリの拡張子.logファイルを順に処理
for filename in *.log
do
    # マッチする行数を-cオプションで取得
    count=$(grep -c "$search_text" "$filename")
    # printfコマンドで、右詰め6桁で整形して出力する。
    printf '%6s (%s)\n' "$count" "$filename"
done