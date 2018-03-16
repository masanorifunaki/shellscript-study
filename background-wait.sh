#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 2つのホストに並列してpingを実行する。6回実行するため、
# それぞれ約5秒の待ち時間がかかる。
ping -c 6  > host1.log &
ping -c 6  > host2.log &

#2 2つのpingコマンドが終了するまで待ち、同期をとる
wait

#3 pingコマンドの結果を表示する
cat host1.log host2.log