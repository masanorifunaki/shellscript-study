#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# CSVファイルが存在しなければ終了
if [[ ! -f "$1" ]]; then #1
    echo "対象のCSVファイルが存在しません： $1" >&2
    exit 1
fi

# 拡張子を除いたファイル名を取得
filename=${1%.*} #2

awk -F, '{sum += $3} END{print sum / NR}' "$1" > ${filename}.avg