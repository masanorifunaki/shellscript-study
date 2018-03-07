#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

tomorrow=$(date -v+1d "+%d") #1
if [[ "$tomorrow" = 01 ]]; then
    #　今日が月末ならば、月次reportを作成するための
    # 外部スクリプトを実行
    echo "外部スクリプトを実行"
else
    echo "実行しない"
fi