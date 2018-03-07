#!/bin/sh

# 比べる2つのディレクトリ名
dirA="dirA"
dirB="dirB"

# dirA とdirB のファイルリストの差を調べる。
( cd ${dirA}; find . -maxdepth 1 -type f -print | sort ) > temfile1.lst #1
( cd ${dirB}; find . -maxdepth 1 -type f -print | sort ) > temfile2.lst

comm temfile1.lst temfile2.lst