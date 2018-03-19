#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# ifconfigコマンドで有効なインターフェースを表示して、
# awk コマンドでインターフェース名とIPアドレスを抽出する
ifconfig | awk '/^[a-z]/ {print "[" $1 "]"} /inet / {print $2 }'