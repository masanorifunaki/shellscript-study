#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# route コマンドの出力からデフォルトゲートウェイを取得。
# カラム1が"0.0.0.0"の行の、カラム2と取り出す
gateway=$(route -n | awk '$1 == "0.0.0.0" {print $2}') #1

# デフォルトゲートウェイにping実行
ping -c 1 $gateway > /dev/null 2>&1 #2

if [[ $? -eq 0 ]]; then
    echo "[Success] ping -> $gateway"
else
    echo "[Failed] ping -> $gateway"
fi