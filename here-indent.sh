#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# コマンドライン引数のチェック
if [[ -z "$1" ]]; then
    echo "title要素を引数で指定してください。" >&2
    exit 1
else
    # コマンドライン引数 $1 の文字列を title要素に入れて表示。
    # ヒアドキュメントに-(ハイフン)指定して、
    # 行頭タブを無視してインデントしている
  cat <<-END
  <html>
    <head>
      <title>$1</title>
    </head>
  </html>
END
fi