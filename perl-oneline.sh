#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

#1 テスト通信先の定義
ipaddr="172.16.128.9"
port=80

#2 1から10まえｄの整数値の乱数を、Perlのワンライナーで生成する
waittime=$(perl -e 'print 1 + int(rand(10))')

# テストコマンドを、ウェイトを入れて2回実行する
nc -w 5 -zv $ipaddr $port
echo "Wait: $waittime sec."
sleep $waittime
nc -w 5 -zv $ipaddr $port
