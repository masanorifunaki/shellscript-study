#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 出力ディレクトリの定義
outdir="newdir"

# 出力ディレクトリの依存チェック。なければエラー終了
if [[ ! -d "$outdir" ]]; then
    echo "出力ディレクトリの存在チェック。なければエラー終了: $outdir" >&2
    exit 1
fi

# カレントディレクトリのhtmlファイルを処理
for htmlfile in *.html
do
    # ファイル内のテキストで/img/というパスを/images/に変換する。
    sed 's%/img/%/images/%g' "$htmlfile" > "${outdir}/${htmlfile}"
done