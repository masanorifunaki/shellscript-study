#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 対象ファイル
filename="$1"

# 行頭が#であるコメント行を除外して、cutコマンドで、
# * 2番目の値を表示 [-f 2]
# * 区切り記号は : [-d " "]
# として表示する
grep -v "^#" "$filename" | cut -f 2 -d " "