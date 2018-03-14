#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# 変換後のファイル出力先ディレクトリのチェック
outdir="newdir" #1

# ファイル出力先ディレクトリのチェック
if [[ ! -d "$outdir" ]]; then
    echo "Not a directory: $outdir" #2
    exit 1
fi

# カレントディレクトリの.htmlファイルを対象
for filename in *.html #3
do
    # grepコマンドでmetaタグのContent-Type行を選択し、
    # sedコマンドでcharset=指定部分を抜きだす
    charset=$(grep -i '<meta ' "$filename" | grep -i 'http-equiv="Content-Type"' | sed -n 's/.*charset=\([-_a-zA-Z0-9]*\)".*/\1/p') #4
    
    # charsetが取得できていない場合は、iconvコマンドを実行せずにスキップする
    if [[ -z $charset ]]; then
        echo "charset not found: $filename" >&2
        continue
    fi
    
    # metaタグから取り出した文字コードから、UTF-8へと変換し、
    # ディレクトリ$outdirに出力する
    iconv -c -f "$charset" -t UTF-8 "$filename" > "${outdir}/${filename}" #6
done