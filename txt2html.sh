#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# HTMLとしてエスケープが必要な記号を文字参照に置換え、
# 最後に行末を<br>タグに置き換えする。
sed -e 's/&/\$amp;/g' \
-e 's/</\&lt;/g' \
-e 's/>/\&gt;/g' \
-e "s/'/\&#39;/g" \
-e 's/"/\&quot;/g' \
-e 's/$/<br>/g' \
"$1"