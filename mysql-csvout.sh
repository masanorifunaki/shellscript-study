#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 1 データベース接続設定
DBHOST="192.168.11.5"
DBUSER="backup"
DBPASS="PASSWORD"
DBNAME="hamilton"

# 2 mysqlコマンドのフルパス
MYSQL="/usr/bin/mysql"

# 3 CSVファイルの出力先パスと、レポート作成SQL文のファイル名を指定
csv_outputdir="/home/user1/output"
sqlfile="/home/user1/bin/select.sql"

# 4 SQL ファイルの存在をチェック
if [[ ! -f "$sqlfile" ]]; then
    echo "SQLファイルが存在しません"
    exit 1
fi

# 5 CSV ファイルの出力先ディレクトリをチェック
if [[ ! -d "$csv_outputdir" ]]; then
    echo "CSV出力先のディレクトリが存在しません"
    exit 1
fi

# 6 今日の日付を YYYYMMDD で取得
today=$(date '+%Y%m%d')

# 7 CSV出力を行う。-Nでカラム名を表示しない。
# tr コマンドでタブをカンマに置換する
$MYSQL -h "${DBHOST}" -u "${DBUSER}" -p"${DBPASS}" -D "${DBNAME}" -N \
< "$sqlfile" | tr "\t" "," > "${csv_outputdir}/data-${today}.csv"