#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# ハイフンを削除するかどうかのフラグ。1ならば削除す
d_flag=0

# getoptsコマンドで、削除オプション(-d)指定を判別
while getopts "d" option
do
    case "$option" in
        d)
            d_flag=1
        ;;
        \?)
            exit 1
        ;;
    esac
done

# コマンドライン引数で指定された郵便番号ファイルを、
# シェル変数filenameに代入する。

shift $((OPTIND - 1))
filename="$1"

# d_flagが指定されていればハイフンを削除、指定なければハイフン追加
if [[ d_flag -eq 1 ]]; then
    # *ハイフンを削除する
    # awk で前後スペース除去 →　フォーマットチェック →　ハイフン削除
    awk '{print $1 }' "$filename" | grep '^[0-9]\{3\}-[0-9]\{4\}$' | sed 's/-//'
else
    awk '{print $1 }' "$filename" | grep '^[0-9]\{7\}$' | sed 's/\(...\)/\1-/'
fi