#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

#　実行回数カウンタ 1
count=0
# 通信テストの対象サーバ 2
server="192.168.2.105"

# シグナルUSR1にトラップを設定。現在の$countを表示する 3
trap 'echo "Try count: $count"' USR1

# ncコマンドでの連続通信テストのループ 4
while [ "$count" -le 1000 ]
do
    # カウンタを1増やし、ncコマンドで通信テストを行う
    # 最後に1秒のウェイトをいれる
    count=$(( $count + 1))
    nc -zv "$server" 80
    sleep 1
done