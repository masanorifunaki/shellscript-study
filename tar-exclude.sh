#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}
# gzipコマンドのオプション。除外させたい、ディレクトリがある時に使う。
# --exclude ディレクトリ名
# --exclude パス\n -X
# --exclude リスト 除外したいファイルがたくさんある場合には、-Xオプションにより外部ファイルに記述した除外リストを適用できる。
tar cvf tmp.tar --exclude "*.sh" "$1"