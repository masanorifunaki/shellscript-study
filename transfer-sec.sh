#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 転送速度を測る一時ファイルのサイズ指定。単位はキロバイト(KB)
filesize=1024 #1
# 転送速度を測る一時ファイルのファイル名（テンポラリ）
tmpdata="tmpdata.tmp" #2
timefile="timecount.tmp"

# 転送に用いる一時ファイルを作成する
dd if=/dev/zero of="$tmpdata" count=$filesize bs=1024 2> /dev/null #3

# FTP接続してファイルをPUTする
server="192.168.2.5" #4
user="user1"
password="xxxxxxxxxxxxxx"

echo "Filesize: $filesize (KB)"
echo "FTP Server: $server"

#5
(time -p ftp -n "$server") << _EOT_ 2> "$timefile"
time ftp -n "$server" << _EOT_
user "$user" "$password"
binary
put "$tmpdata"
_EOT_

# time コマンドの出力結果から実時間を取得し、割り算を
# 行って速度を求める
realtime=$(awk '/^real/ {print $2}' "$timefile") #6
speed=$(echo "${filesize}/${realtime}" | bc) #7
echo "Transfer Speed: $speed (KB/sec)"

# 転送一時ファイルの削除
rm -f "$tmpdata" "$timefile"
