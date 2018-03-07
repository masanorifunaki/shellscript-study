#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

ipaddr=""

macaddr=$(arp -an | awk "/\($ipaddr\)/ {print \$4}") #1

if [[ -n $macaddr ]]; then
    echo "$ipaddr -> $macaddr"
else
    echo "$ipaddr は ARP キャッシュにありません。"
fi