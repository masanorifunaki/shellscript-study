#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 1 ダウンロードするファイルのURL
url="http://www.ponywatches.com/11/18/15/sample-stamp-png.html"
filename="sample-stamp-png.html"

# 2 ファイルをダウンロード
curl -sO "${url}" && md5 "$filename"

# 3 ダウンロードしたファイルを削除して終了する。
rm -f "$filename"