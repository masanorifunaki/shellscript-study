#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# ping実行結果のステータス。0で成功とみなすため、1で初期化
result=1

# 対象サーバがコマンドライン引数で指定されていなければ
# エラーとして終了
if [[ -z "$1" ]]; then
    echo "対象ホストを指定してください" >&2
    exit 1
fi

# pingコマンドを3回実行するループ。成功したらresultを0とする
i=0
while [ $i -lt 3 ]
do
    # pingコマンドを実行。終了ステータスのみが必要なたため、
    # 表示は /dev/null へリダイレクトして捨てる
    ping -c 1 "$1" > /dev/null
    
    # pingコマンドの終了ステータスを判断。成功ならresult=0としてループから抜ける。
    # 失敗なら3秒のウェイトを入れて再実行
    if [[ $? -eq 0 ]]; then
        result=0
        break
    else
        sleep 3
        i=$(( $i + 1))
    fi
done

# 現在日付を[2013/02/01 13:15:44]の形で組み立て
date_str=$(date '+%Y/%m/%d %H:%M:%S')
# pingの実行結果を$resultから判断して表示する
if [[ $result -eq 0 ]]; then
    echo "[$date_str] Ping OK: $1"
else
    echo "[$date_str] Ping NG: $1"
fi