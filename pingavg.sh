#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

ipaddr="" #1
count=10

echo "Ping to: $ipaddr" #2
echo "Ping count: $count"
echo "Ping average[ms]:"

# Pingコマンドを実行し、結果を一時ファイルに出力
ping -c $count $ipaddr > ping.$$ #3

# "time=4.32ms" の部分をsedで取り出し、awkで平均値を集計する
sed -n 's/^.*time=\(.*\)ms/\1/p' ping.$$ | \
awk '{sum+=$1} END{print sum/NR}' #5

# 一時ファイルを削除
rm -f ping.$$