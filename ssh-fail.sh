#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# sshdのログファイル
securelog="/var/log/secure"

# IPアドレスを抜き出すためのパターンマッチ。長いため変数として格納
pattern="^.*sshd\[.*\].*Failed password for.* from \(.*\) port .*" #1

# パスワード認証失敗ログからIPアドレス抽出し、カウントして表示する
sed -n 's/\($pattern\)/\1/p' "$securelog" | sort | uniq -c | sort -nr
