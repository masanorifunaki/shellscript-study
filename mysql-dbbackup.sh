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

# 2 データベースバックアップ設定
BACKUP_DIR="/home/user1/backup"
BACKUP_ROTATE=3
MYSQLDUMP="/usr/bin/mysqldump"

# 3 バックアップ出力先ディレクトリのチェック
if [[ ! -d "$BACKUP_DIR" ]]; then
    echo "バックアップ出力先ディレクトリが存在しません。"
    exit 1
fi

# 4 今日の日付を YYYYMMDD で取得
today=$(date '+%Y%m%d')

# 5 mysqldump コマンドでデータベースのバックアップを取得
$MYSQLDUMP -h "${DBHOST}" -u "${DBUSER}" -p "${DBPASS}" "${DBNAME}" > "${BACKUP_DIR}/${DBNAME}-${today}.dump"

# 6 mysqldump コマンドの終了ステータス $?で、成功・失敗を確認
if [[ $? -eq 0 ]]; then
    gzip "${BACKUP_DIR}/${DBNAME}-${today}.dump"
    
    # 7 古いバックアップファイルを削除する
    find "$BACKUP_DIR" -nam "${DBNAME}-*.dump.gz" -mtime +${BACKUP_ROTATE} | xargs rm -f
else
    echo "失敗"
    exit 2
fi