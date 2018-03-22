#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 1 監視対象のURL
url="http://www.google.com"

# 2 ダウンロードファイルのファイル名定義
newfile="new.dat"
oldfile="old.dat"

# 3 ファイルをダウンロード
curl -so "$newfile" "$url"

# 4 ダウンロードしたファイルとの比較
cmp -s "$newfile" "$oldfile"

# 5 cmpコマンドの終了ステータスが非ゼロなら差があった
if [[ $? -ne 0 ]]; then
    # 6
    date_str=$(date '+%Y/%m/%d %H:%M:%S')
    
    # 7 ファイル変更の通知
    echo "$url"
fi