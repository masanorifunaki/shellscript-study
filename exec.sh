#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# TMPDIR環境変数の設定
TMPDIR="/disk1.tmp"
export TMPDIR

# execコマンドでmyappを実行。コマンドライン引数を"$@"で渡す
exec ./myappd "$@"