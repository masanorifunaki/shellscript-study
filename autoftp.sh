#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# FTP接続のための設定
server="192.168.2.5"
user="user1"
password="xxxxxxxx" #1
dir="/home/user1/myapp/log"
filename="app.log"

#2
ftp -n "$server" << _EOT_
user "$user" "$password"
binary
cd "$dir"
get "$filename"
_EOT_