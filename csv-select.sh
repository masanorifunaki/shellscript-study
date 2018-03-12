#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# CSVファイルを指定
csvfile="data.csv"

# IDが指定されていなければ終了
if [[ -z $1 ]]; then #1
    echo "IDを指定してください。" >&2
    exit 1
fi

# CSVファイルが存在しなければ終了
if [[ ! -f "$csvfile" ]]; then
    echo "CSVファイルが存在しません。: $csvfile" >&2
    exit 1
fi

while read line #3
do #4
    # 行内の各カラムをcutコマンドで取り出す
    id=$(echo $line | cut -f 1 -d ',')
    name=$(echo $line | cut -f 2 -d ',')
    score=$(echo $line | cut -f 3 -d ',')
    # IDカラムが、コマンドライン引数で指定されたIDと一致する
    # 場合には、名前フィールドを表示する
    if [[ $1 = "$id" ]]; then
        echo "$name"
    fi
done < $csvfile