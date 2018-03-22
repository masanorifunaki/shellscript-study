#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 1 bashのブレース展開{}でIPアドレスリストを削除する
for ipaddr in 192.168.2.{1..5}
do
    ping -c 1 "$ipaddr" > /dev/null 2>&1
    
    if [[ $? -eq 0 ]]; then
        echo "OK $ipaddr"
    else
        echo "NG $ipaddr"
    fi
done