#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 1 メニュープロント文の定義
PS3='Menu: '

# メニュー表示の定義。メニューの各項目はinへのリストとして指定する。
# $itemには選択されたリストの文字列が、$REPLYには入力された数値が代入される
select item in "list file" "current directory" "exit"
do
    case "$REPLY" in
        1)
            ls
        ;;
        2)
            pwd
        ;;
        3)
            exit
        ;;
        *)
            echo "エラー"
        ;;
    esac
done