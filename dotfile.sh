#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# IFSに改行を設定する
IFS='
'
# カレントディレクトリ配下のファイルを$filenameとして順に処理
for filename in $(ls -AF)
do
  case "$filename" in
    .*/)
      echo "dot directory: $filename"
    ;;
    .*)
      echo "dot file: $filename"
    ;;
  esac
done