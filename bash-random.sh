#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# テスト通信先の定義
ipaddr="192.168.2.1"
port=80

# 1から10までの整数値の乱数を、RANDOM変数から取得する
waittime=$((RANDOM % 10 + 1))

# テストコマンドを、ウェイトを入れて2回実行する。
nc -w 5 -zv $ipaddr $port
echo "Wait: $waittime sec."
sleep $waittime
nc -w 5 -zv $ipaddr $port
