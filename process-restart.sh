#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 監視するプロセスのコマンド
commname="/usr/sbin/httpd"

# 監視プロセスの起動コマンド
start="service httpd start"

# 監視対象コマンドのプロセス数をカウントする
count=$(ps ax -o command | grep "$commname" | grep -v "^grep" | wc -l )

# grepコマンドの出力結果がゼロ行の場合にはプロセスが
# 存在しないため、異常とみなしてプロセスを起動する
if [[ $count -eq 0 ]]; then
    # 日付を入れてログ出力
    data_str=$(date '+%Y/%m/%d %H:%M:%S')
    echo "[$data_str] プロセス $commname が見つかりません"
    
    # 監視プロセスの起動
    $start
fi
