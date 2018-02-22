#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

logdir="$1"

cd "$logdir"

# logdir内のログファイルを、
# パスワード付きzipでアーカイブする。
# zipファイルを作成する時に使う。
# zip [オプション] <zipファイル> <対象ファイル>
# -r オプション ディレクトリ内を再帰的に処理する。指定パスにサブディレクトリがある場合にはその中身を対象とする。
# -e (Encrypt)パスワード付きのzipファイル作成する時に使う
zip -e -r log.zip *.log