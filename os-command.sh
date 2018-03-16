#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
#set -o xtrace
readonly SCRIPT_NAME=${0##*/}

#1 echo コマンドのパスを、環境によって変えてシェル変数 ECHO に
# 代入する。
case "$(uname -s)" in
    #2 Macの場合はシェルビルドインではなく、/bin/echo を用いる
    Darwin)
        ECHO="/bin/echo"
    ;;
    *)
        ECHO="echo"
    ;;
esac

$ECHO -n "ここ改行しない"
$ECHO "メッセージです。"