#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

#1
url_tmp="http://www.example.org/img_%03d.jpg"

# seqコマンドで連番整数を生成する
for i in $(seq 10)
do
    url=$(printf "$url_tmp" $i)
    curl -O "$url"
done