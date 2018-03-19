#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 1 データファイルの定義
datafile="/home/user1/myapp/sample.dat"

# 2 データファイルの存在チェック
if [[ -f "$datafile" ]]; then
    # 3 仕様変更で不要となったためコメントアウトしたものとする
    # 4 ./myapp "$datafile"
    :
else
    echo "データファイルが存在しません： $1" >&2
    exit 1
fi