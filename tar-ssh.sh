#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# username="user1"
# server="192.168.1.5"
# tar cvf - myapp/log | ssh ${username}@${server} "cat > /backup/myapplog.tar" #2
tar cvf - "tmp001" | cat > /Users/mfunaki/workspace/shellscript-study/tmp002/tmp001.tar

