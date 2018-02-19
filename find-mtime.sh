#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

logdir="$1"

# 4日前から2日前までに更新されたファイル一覧を表示する
# -mtime オプション
# -mtime -n nより未来 4日前から未来
# -mtime +n nより過去 2日前から過去
# -mtime n+1 n+1前から、n日前まで
# FreeBSDでは、-mtime +nのよきに端数の時間を切り上げるため、
# -mtime +1で「1日前よりも過去」となる。
find $logdir -name "*.sh" -mtime -4 -mtime +1 -print