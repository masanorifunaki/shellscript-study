#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# チェック対象のURL
url=

# 無限ループを開始
while true
do
    # curl コマンドでテスト対象のURLからダウンロード。
    # ファイル自体は不要のため /dev/nullへ捨てる
    curl -so /dev/null "$url"
    
    # curlコマンドの終了ステータスで、OK/NGを判断
    if [[ $? -eq 0 ]]; then
        echo "OK"
    else
        echo "NG"
    fi
    
    # 5秒ウェイト
    sleep 5
done