#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 対象IPアドレスがコマンドライン引数で指定されていなければ
# エラーとして終了
if [[ -z "$1" ]]; then
    echo "IPアドレスを指定してください" >&2 #1
    exit 1
fi

# テスト対象ネットワークならばpingコマンドを実行する
case "$1" in
    192.168.2.* | 192.168.10.* )
        #2
        ping -c 1 "$1" > /dev/null 2>&1 #3
        
        if [[ $? -eq 0 ]]; then
            echo "Ping to $1 : [OK]"
        else
            echo "Ping to $1 : [NG]"
        fi
    ;;
    *) #5
        echo "$1 はテスト対象ではありません" >&2
    ;;
esac