#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

logfile="access_log"

# ログファイルが存在しなければ終了
if [[ ! -f "$logfile" ]]; then
    echo "対象のログファイルが存在しません： $logfile" >&2
    exit 1
fi

# ログファイルから、GETメソッドで取得されたファイルのアクセス回数を集計する
# awkコマンドでファイルを取り出し、sort+uniqでカウント後に降順ソートする
awk '$6=="\"GET" {print $7}' "$logfile" | sort | uniq -c | sort -nr