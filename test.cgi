#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# CGIヘッダの出力
echo "Content-Type: text/plain" #1
echo

# コマンドを実行してブラウザに表示させる
echo "Test CGI: uptime" #2
uptime