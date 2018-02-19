#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

logdir="$1"

# 最終変更日時が1年以上前の古いファイルを削除する
# xargsコマンド主な使い方は、
# findコマンドで特定の条件にマッチするファイルリストを出力し、
# それをパイプでxargsコマンドが受け取って処理する。
# rmコマンド
# -f オプション 該当ファイルが1つもないときにエラーとならないようにする
# -v オプション 削除したファイル名を表示する
# ファイル名に空白文字（スペース）を含む場合は、エラーとなるため
# 文字列の区切りに空白ではなく、ヌル文字が使われているとみなす、
# オプションを使う
# find -print0 | xargs -0
# find $logdir -name "*.log" -mtime +364 -print0 | xargs -0 rm -fv
find $logdir -name "*.log" -mtime +364 -print | xargs rm -fv #1