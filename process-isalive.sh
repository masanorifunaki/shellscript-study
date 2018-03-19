#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 監視するプロセスのコマンド
commname="/user/libexec/mysqld"

# 対象コマンドのプロセス数をカウントする
count=$(ps ax -o command | grep "$commname" | grep -v "^grep" | wc -l )

# grepコマンドの出力結果がゼロ行ぼ場合にはプロセスが
# 存在しないたため、監視通知処理を行う
if [[ "$count" -eq 0 ]]; then
    echo "見つかりません"
fi