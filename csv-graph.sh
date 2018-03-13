#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

csvfile="data.csv" # データCSVファイル 1
GRAPH_WIDTH=50    # グラフの横幅値

markprint(){ #2
    local i=0 #3
    while [ $i -lt "$1" ] #4
    do
        echo -n "*" #5
        i=$(( i + 1))
    done
}

# データから最大値を取得する。逆順ソートして先頭を取ればよい
max=$(awk -F, '{print $3}' "$csvfile" | sort -nr | head -n 1) #6

# データのすべてが0の場合は最大値を1とする
if [[ $max -eq 0 ]]; then
    max=1
fi

# csvファイルを読み込み、値ごとの値をグラフ出力する。
while IFS=, read id name score
do
    markprint $(( $GRAPH_WIDTH * $score / $max ))
    echo "[$name]"
done < $csvfile