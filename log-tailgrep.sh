#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 1 監視対象のログファイル名を設定
logfile="/var/log/myapp/application.log"

# tail コマンドでログ監視：
# * -F リアルタイムに監視
# * -n 0 追記分のみを対象とする
tail -F -n 0 "$logfile" | \
while read line
do
    case "$line" in
        # 3 ログマッチする文字列があれば警告表示する
        *"File Not Found"*)
            echo "ファイルが見つかりません: $line"
        ;;
        *"Application Error"*)
            echo "アプリケーション異常: $line"
        ;;
    esac
done