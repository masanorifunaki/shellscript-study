#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

backup_dir="/Users/mfunaki/workspace/shellscript-study/tmp002/backup"
# tmp001ディレクトリを、$backup_dir下にバックアップコピー
# -aオプション
# ファイル属性を保持したままコピーできる。
# バックアップ用途で使う。-R(recursive)も同時に指定されたとみなされ、
# サブディレクトリを含めてファイルツリーをそのままコピーする。
while getopts "a" option
do
    case "$option" in
        a)
            cp -a tmp001 "$backup_dir"
            exit
        ;;
    esac
done

cp -R tmp001 "$backup_dir"
