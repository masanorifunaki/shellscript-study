#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 事前設定をしておかないとエラーになる環境変数の定義
envname="TMPVAR" #1

# envコマンドで環境変数一覧を表示し、cutコマンドで,
# * 1番目の値を表示 [-f 1]
# * 区切り記号は: [-d "="]
# として表示する
env | cut -f 1 -d "=" > env.lst #2

# チェックする環境変数名がenv.lstにマッチするかで
# 未定義かどうかを確認する
grep -q "^${envname}" env.lst #3

if [[ $? -eq 0 ]]; then
    # 環境変数がしていされていれば、start.shを実行
    echo "環境変数 $envname は設定されています"
    ./start.sh
else
    echo "環境変数 $envname が設定されていません。"
fi