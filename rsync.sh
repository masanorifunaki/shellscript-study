#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

log_dir="$1"
backup_dir="/Users/mfunaki/workspace/shellscript-study/tmp002/backup"

# log_dirを
# /Users/mfunaki/workspace/shellscript-study/tmp002/backup
# ディレクトリにコピーする
rsync -av "$log_dir" "$backup_dir"
