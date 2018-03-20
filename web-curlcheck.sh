#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 1 監視対象URLを指定する
url="http://www.google.com"

# 2 現在日付を[2013/02/01 13:15:44]の形で組み立て
date_str=$(date '+%Y/%m/%d %H:%M:%S')

# 3 監視URLにcurlコマンドでアクセスし、終了ステータスを変数 curlresult　に代入
httpstatus=$(curl -s "$url" -o /dev/null -w "%{http_code}")
curlresult=$?

# 4 curlコマンドが失敗していれば、HTTP接続自体が異常とみなす
if [[ "$curlresult" -ne 0 ]]; then
    echo "[$date_str] HTTP接続異常: curl exit status[$curlresult]"
    # 5 400番台、500番台のHTTPステータスコードならばエラーとみなして警告
    echo "[$date_str] HTTP接続異常: curl exit status[$curlresult]"
fi