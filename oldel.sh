#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

log1="log1.log"
log2="log2.log"

# 引数のファイルが存在するか調べ、存在しない場合は終了する
filecheck() #1
{
    if [[ ! -e $1 ]]; then #2
        echo "ERROR: File $1 does not exist. "
        exit 1;
    fi
}

filecheck "$log1" #3
filecheck "$log2"

# ２つのファイルの新旧を比べ、古い方を削除する
if [[ $log1 -nt $log2 ]]; then
    echo "[$log1]-> newr, [$log2]->older" #4
    rm $log2
else
    echo "[$log2]-> newr, [$log1]->older"
    rm $log1
fi