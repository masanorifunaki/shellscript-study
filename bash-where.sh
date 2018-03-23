#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 1 探索コマンドを取得
command="$1"

# 2 引数チェック
if [[ -z $command ]]; then
    echo "エラー"
    exit 1
fi

# 3 環境変数$PATHのコロンをスペースに置換し、for文のループ対象の
# リストする
for dir in ${PATH//:/ }
do
    if [[ -f ${dir}/${command} ]]; then
        echo "${dir}/${command}"
    fi
done