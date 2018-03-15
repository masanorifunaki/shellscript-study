#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

#1 テスト転送ファイルのファイル名、転送先などの定義
username="user1" # sshユーザー名
filename="transfer.dat" # 転送ファイル名
hostname="" # 転送先のホスト
path="/var/tmp" # 転送先パス
tmpfile="timetmp.$$" # 時間計測のための一時ファイル

#2 scpコマンドでファイルを転送。
# timeコマンドで時間を測り、一時ファイルに出力する
(time -p scp -C "$filename" ${username}@${hostname}: "${path}") 2> "$tmpfile"

#3 timeコマンドの出力一時ファイルから、各timeを抽出
realtime=$(awk '/^real /' '{print $2}' "$tmpfile")
usertime=$(awk '/^user /' '{print $2}' "$tmpfile")
systime=$(awk '/^sys /' '{print $2}' "$tmpfile")

#4 CPU利用率から、CPU利用率を計算する
cpu_percentage=$(echo  "scale=2; 100 * ($usertime + $systime) / $realtime" | bc )
echo "scp転送時 CPU利用率： $cpu_percentage (%)"

# 一時ファイルの削除
rm -f "$tmpfile"