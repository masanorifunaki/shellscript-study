#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# IPアドレスを取得したいホスト名を定義
fqdn="www.google.com"
echo "Address of $fqdn"
echo "=============="

# hostコマンドでIPアドレスを取得し、awkで加工して出力
host $fqdn | \
awk '/has address/ {print $NF, "IPv4"} \
/has IPv6 address/ {print $NF, "IPv6"}'