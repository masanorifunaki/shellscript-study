#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 比較する2るのディレクトリのイェイ義
#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 比較する2つのディレクトリの定義
dir1="$1"
dir2="$2"

# comm コマンドで出力を比較。中間ファイルを作らなくても
# プロセス置換えで処理できる
comm <(ls "$dir1") <(ls "$dir2")