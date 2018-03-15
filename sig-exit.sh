#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

#1 一時ファイルを定義し、ファイルの中を空に初期化する
tmpfile="calctmp.$$"
: > "$tmpfile"

#2 トラップの設定。終了時に一時ファイルを削除する
trap 'rm -f "$tmpfile"' EXIT

#3 長い計算を行う外部スクリプトを実行する
./calcA.sh >> "$tmpfile"
./calcB.sh >> "$tmpfile"

#4 計算結果を足し合わせて、最終数値を計算する
awk  '{sum += $1} END{print sum}' "$tmpfile"