#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 現在の西暦を4桁で取得
year=$(date '+%Y') #1

#logfile="$1"

# 西暦を割った余りを計算する
mod1=$((year % 4))
mod2=$((year % 100))
mod3=$((year % 400))

# うるう年かどうかの判定
if [[ $mod1 -eq 0 && $mod2 -ne 0 || $mod3 -eq 0 ]]; then
    echo "leap year:$year"
else
    echo "not leap year:$year"
fi
