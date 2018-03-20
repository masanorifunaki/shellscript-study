#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

#1
idele_limit=10.0

# 2 監視するCPUの%idleをiostartコマンドで取得。
cpu_idle=$(iostat 1 6 | awk 'NR >= 4 {sum += $(NF-3)} END{print sum/5.0 }')

# 3 現在の%idleと閾値をbcコマンドで比較
is_alert=$(echo "$cpu_idle < $idele_limit" | bc)