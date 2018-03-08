#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

ipaddr="192.168.2.52"
faillog="fail-port.log"

# テストするポートは80.2222.8080
for port in 80 2222 8080
do
    nc -w 5 -z $ipaddr $port
    if [[ $? -ne 0 ]]; then
        echo "Failed at port: $port" >> "$faillog"
    fi
done