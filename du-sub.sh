#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

data_dir="$1"

# ディレクトリ$data_dir配下の、サブディレクトリの
# 容量をサマリ表示する
du -sk ${data_dir}/*/ | sort -rn #1
