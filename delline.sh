#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 変更後のファイル出力用ディレクトリのチェック
outdir="newdir" #1

# ファイル出力用ディレクトリのチェック
if [[ ! -d $outdir ]]; then
    echo "Not a directory: $outdir" #2
    exit 1
fi

for filename in *.js #3
do
    # 空行およびスペースやタブのみ行を、sedコマンドのdで削除
    sed '/^[[:blank:]]*$/d' "$filename" > "${outdir}/${filename}" #4
done