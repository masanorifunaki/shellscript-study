#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 抽出条件などの定義
match_id=1
csvfile="data.csv"

if [[ ! -f $csvfile ]]; then
    echo "CSVファイルが存在しません" >&2
    exit 1
fi

while read line
do
    id=$(echo $line | cut -f 1 -d ',')
    name=$(echo $line | cut -f 2 -d ',')
    
    if [[ $id -eq $match_id ]]; then
        echo "$name"
    fi
done < "$csvfile"