#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# netstatコマンドの出力からデフォルトゲートウェイを取得。
# カラム1が"default"の行の、カラム2を取り出す
gateway=$(netstat -nr | awk '$1 == "default" {print $2}') #1

# デフォルトゲートウェイにping実行
ping -c 1 $gateway > /dev/null 2>&1 #2

# pingコマンドの終了ステータスで成功・失敗判断
if [[ $? -eq 0 ]]; then
    echo "[Success] ping -> $gateway"
else
    echo "[Failed] ping -> $gateway"
fi