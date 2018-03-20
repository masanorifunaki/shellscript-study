#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 1 監視するスワップ発生回数。これ以上ならば警告する
swapcount_limit=10

# vm_stat コマンドの出力からスワップイン・スワップアウト値を取得する
swapcount=$(vm_stat -c 1 6 | awk 'NR >= 4 {sum += $19 + $20} END{print sum}')

# スワップ回数が閾値を越えていれば警告
if [[ $swapcount -ge $swapcount_limit ]]; then
    date_str=$(date '+%Y/%m/%d %H:%M:%S')
    
    # スワップ発生の警告
    echo "[$date_str] Swap Alert: $swapcount (si+so)"
fi