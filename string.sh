#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 検索したいエラーメッセージ
message="bash"

strings -f "{$1}/*" | grep "$message" #11