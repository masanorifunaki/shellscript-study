#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

#1 コマンドライン引数をチェック
if [[ -z "$1" ]]; then
    echo "第3オクテットまでのIPアドレスを引数として指定してください" >&2
    exit 1
fi

#2 対象のIPアドレスを、外部ファイルping_target.lstから、
# %ADDR_HEAD%の部分を置換えして順に取得する

for ipaddr in $(sed "s/%ADDR_HEAD%/$1/" ping_target.lst)
do
    # pingコマンドを実行。出力結果は不要のため、/dev/nullへリダイレクト
    ping -c 1 $ipaddr > /dev/null 2>&1
    
    #3 終了ステータスで成功・失敗を表示
    if [[ $? -eq 0 ]]; then
        echo "[Success] ping -> $ipaddr"
    else
        echo "[Failed] ping -> $ipaddr"
    fi
done
