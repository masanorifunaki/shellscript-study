#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
#set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 1 監視するディスク使用量の閾値パーセンテージ
used_limit=90

# 2 df コマンドの出力結果一時ファイル名
tmpfile="df.tmp.$$"

# 3 dfコマンドでディスク使用量を表示。1行目はヘッダなので除外する
df -P | awk 'NR >= 2 {print $5,$6}' > "$tmpfile"

# 4 df コマンドでディスク使用量が規定値以上ならばアラート
while read percent mountpoint
do
    # 5 31% を 31 に、末尾の%記号を削除する
    percent_val=${percent%\%}
    
    # 6 ディスク使用量が規定値以上ならばアラート
    if [[ $percent_val -ge $used_limit ]]; then
        # 7 現在日付を[2013/02/01 13:15:44]の形で組み立て
        date_str=$(date '+%Y/%m/%d %H:%M:%S')
        echo "[$date_str] Disk Capacity Alert: $mountpoint ($percent used)"
    fi
done < "$tmpfile"

# 8 一時ファイル削除
rm -f "$tmpfile"