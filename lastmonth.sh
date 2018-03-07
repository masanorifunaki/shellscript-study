#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

loggir="$1"

# 今月の15日の日付を取得する
thismonth=$(date '+%Y/%m/15 00:00:00') #1

# 先月の日付をYYYYMMで取得する
# 1 month ago は先月の同日をとるため、末日とならないよう
# 変数thismonthに15日を指定した
last_YYYYMM=$(date -v-1m "+%Y%m")  #2

# 先月のログファイルをまとめてアーカイブ
tar cvf ${last_YYYYMM}.tar ${loggir}/access.log-${last_YYYYMM}* #3