#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

url_template="http://www.example.org/download/img_%03d.jpg"

# 1 カウンタ変数 countを、指数値で宣言
declare -i count=0

while [ $count -le 10 ]
do
    url=$(printf "$url_template" $count)
    curl  -O "$url"
    
    # 2 countを1増やす
    count=count+1
done