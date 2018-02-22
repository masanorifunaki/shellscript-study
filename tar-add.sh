#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# tmp001.tarに引数で指定したファイルを追加する。
tar rvf "/Users/mfunaki/workspace/shellscript-study/tmp002/tmp001.tar" "$1"