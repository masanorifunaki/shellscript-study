#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

tmpfile="tmp.$$" #1

date > $tmpfile #2
sleep 10

cat $tmpfile #3
rm -f $tmpfile