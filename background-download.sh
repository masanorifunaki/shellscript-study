#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 並列ダウンロードのため、複数のサイトからのダウンロードを
# それぞれをバックグラウンドで処理する
curl -sO http:// &
curl -sO http:// &
curl -sO http:// &