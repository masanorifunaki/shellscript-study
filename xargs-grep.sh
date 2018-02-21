#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

dir="$1"

# 拡張子.shのファイルから、"bin"という文字列を検索
# 対象のファイルに/dev/nullを加えることで、grepコマンドの出力に必ず
# ファイル名を含むようにするための処理になる。
# grepコマンドでは複数のファイルを対象とした場合、先頭にファイル名をつけて
# マッチした行を出力する。
find "$dir" -name "*.sh" -print | xargs grep "bin" /dev/null #1
