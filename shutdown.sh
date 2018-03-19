#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 自分以外のユーザがログインしていないかを、whoコマンドの出力から
# チェックする
other_user=$(who | wc -l )
if [[ other_user -ge 2 ]]; then
    echo "作業中のユーザがいます" >&2
    exit 1
fi

# 事前に停止しておくべきプロセスが、起動したままでないかをチェック
commname="/usr/libexec/mysqld"
ps ax -o command | grep -q "^$commname"
if [[ $? -eq 0 ]]; then
    echo "シャットダウンを中止：プロセス $commname が起動中" >&2
    exit 2
fi

# シャットダウンを実行