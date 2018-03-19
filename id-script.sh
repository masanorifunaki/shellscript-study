#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 1 このスクリプトの実行を許可するユーザの定義
script_user="batch1"

# 2 idコマンドで現在のユーザを取得し、定義と一致するか確認
if [[ $(id -nu) = "$script_user" ]]; then
    :
else
    echo "ユーザーではありません。"
    exit 1
fi