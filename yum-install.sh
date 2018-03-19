#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# インストールするパッケージ名の定義
pkglist="httpd zsh xz git"

# パッケージリストから順に1行ずつ読み込み
for pkg in $pkglist
do
    yum -y install $pkg
done