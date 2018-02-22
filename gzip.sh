#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

tar cf archive.tar "$1"

# gzipは圧縮速度は速くは無いが、解凍速度は速く、圧縮サイズは中くらい。
# bzip2は圧縮速度は速い。解凍速度は遅く、圧縮サイズは小さい。
# xzは圧縮速度は圧倒的に遅い。解凍速度は速く、圧縮サイズは小さい。
# -9 オプションで圧縮率を最大にする
gzip -9 archive.tar #1