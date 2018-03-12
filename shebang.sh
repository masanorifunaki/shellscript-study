#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 対象スクリプトファイルの存在を確認する
if [[ ! -f "$1" ]]; then #1
    echo "指定されたファイルが見つかりませんでした: $1" >$2
    exit 1
fi

# ファイルの先頭行を読み出す
headline=$(head -n 1 "$1") #2

# ファイルの先頭行ごとに拡張子を判定して付加する
case "$headline" in
    */bin/sh|*bash*)
        mv -v "$1" "${1}.sh"
    ;;
    *perl*)
        mv -v "$1" "${1}.pl"
    ;;
    *ruby*)
        mv -v "$1" "${1}.rb"
    ;;
    *)
        echo "Unknown Type: $1"
esac