# ShellScript 学習用

## 3章
### No.029
```bash
# 後方参照
# nオプションは、処理後のパターンスペースの内容を出力しないようにするオプション
# pフラグ、マッチした場合のみパターンスペースを出力する。
# <titel>タグの中身をパターンマッチで抽出してファイルに出力している。
sed -n 's/^.*<title>\(.*\)<\/title>.*$/\1/p' $htmlfile > output/${fname}.txt
```
```bash
# ファイルの拡張子を取り除きたい時に使う
fname=$(basename "$htmlfile" .html)
```
### No.030
```bash
# 4日前から2日前までに更新されたファイル一覧を表示する
# -mtime オプション
# -mtime -n nより未来 4日前から未来
# -mtime +n nより過去 2日前から過去
# -mtime n+1 n+1前から、n日前まで
# FreeBSDでは、-mtime +nのよきに端数の時間を切り上げるため、
# -mtime +1で「1日前よりも過去」となる。
find $logdir -name "*.sh" -mtime -4 -mtime +1 -print
```
### FreeBSD
* 使い勝手がUNIXっぽい
* タダで使える
* 中身が公開されている（オープンソース）
#### UNIXとLinuxの違い
UNIXが師匠でLinuxが弟子

### No.031
```bash
# 最終変更日時が1年以上前の古いファイルを削除する
# xargsコマンド主な使い方は、
# findコマンドで特定の条件にマッチするファイルリストを出力し、
# それをパイプでxargsコマンドが受け取って処理する。
# rmコマンド
# -f オプション 該当ファイルが1つもないときにエラーとならないようにする
# -v オプション 削除したファイル名を表示する
# ファイル名に空白文字（スペース）を含む場合は、エラーとなるため
# 文字列の区切りに空白ではなく、ヌル文字が使われているとみなす、
# オプションを使う
# find -print0 | xargs -0
# find $logdir -name "*.log" -mtime +364 -print0 | xargs -0 rm -fv
find $logdir -name "*.log" -mtime +364 -print | xargs rm -fv #1
```
#### パッチ（patch）
ソフトに変更を加えるために用意された、後付けのプログラムのこと
* おかしなところを直す
* ソフトをパワーアップさせる

### No.032
```bash
# 拡張子.shのファイルから、"bin"という文字列を検索
# 対象のファイルに/dev/nullを加えることで、grepコマンドの出力に必ず
# ファイル名を含むようにするための処理になる。
# grepコマンドでは複数のファイルを対象とした場合、先頭にファイル名をつけて
# マッチした行を出力する。
find "$dir" -name "*.sh" -print | xargs grep "bin" /dev/null #1
```
#### ARG_MAX定数
UNIXでは、コマンドライン引数の上限値はARG_MAX定数で決め打ちされている。
`xargs`コマンドは、ARG_MAXの値を超えないように引数を適度に区切って、指定されたコマンドを実行する。

### No.033
```bash

bak_filename="${file}.$(date '+%Y%m%d')" #1

# すでにhoge.20170220 などがあった場合は、秒まで入れて
# バックアップファイルを作成する
if [[ -e $bak_filename ]]; then
    bak_filename="${file}.$(date '+%Y%m%d%H%M.%S')" #2
fi

cp -v "$file" "$bak_filename" #3
```

#### dateコマンド
dateコマンドは引数+で始まる場合、現在の時刻（日付）を指示して表示できる。
引数としてフィールド名を与えることで、年月日や時分秒を自由に組み合わせて文字列を作れる。
##### dateコマンドのフィールド
* %Y 年(1970~)
* %y 年の下2桁(00~99)
* %m 月(01~12)
* %d日(01~31)
* %H時(00~23)
* %M 分(00~59)
* %S 秒(00~59)

### No.034
```bash
# log_dirを
# /Users/mfunaki/workspace/shellscript-study/tmp002/backup
# ディレクトリにコピーする
rsync -av "$log_dir" "$backup_dir"
```
##### rsyncコマンド
* コピー時に、コピー元とコピー先の差分を元に、変更のあったファイルのみコピーする。
* ファイル属性をそのまままコピーできる。
* sshを利用してリモートサーバからのコピーも行える
```bash
# 使い方
# -a アーカイブモード　ファイル属性をそのまままコピーする
# -v verboseモード　実際にコピーを行ったファイルリストや転送量を表示する
# -n dry-runモード 実際のファイルコピーは行なわず、処理される対象のファイルリストのみ出力される
# --delete 完全にディレクトリを同期させる時に使う。
# コピー元のディレクトリの最後が、スラッシュで終わる場合、「ディレクトリ自身はコピーせず、
# そのディレクトリの中のファイル、サブディレクトリ全て」を意味する
rsync [オプション] <コピー元> <コピー先>
```

### No.035
#### リモートホスト
* ネットワークでつながっている相手方のPC
* 接続してきた相手のホスト名かIPアドレスのこと

```bash
#!/bin/bash
#「-」オプションで標準出力にtarアーカイブを出力する。
# パイプで受け取り、catコマンドでリダイレクトして、tarファイルを
# 作成する。
# tar cvf - myapp/log | ssh ${username}@${server} "cat > /backup/myapplog.tar" #2
tar cvf - "tmp001" | cat > /Users/mfunaki/workspace/shellscript-study/tmp002/tmp001.tar
```

### No.036

```bash
#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

logdir="$1"

cd "$logdir"

# logdir内のログファイルを、
# パスワード付きzipでアーカイブする。
# zipファイルを作成する時に使う。
# zip [オプション] <zipファイル> <対象ファイル>
# -r オプション ディレクトリ内を再帰的に処理する。指定パスにサブディレクトリがある場合にはその中身を対象とする。
# -e (Encrypt)パスワード付きのzipファイル作成する時に使う
zip -e -r log.zip *.log
```

### No.037

```bash
#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

tar cf archive.tar "$1"

# gzipは圧縮速度は速くは無いが、解凍速度は速く、圧縮サイズは中くらい。
# bzip2は圧縮速度は速い。解凍速度は遅く、圧縮サイズは小さい。
# xzは圧縮速度は圧倒的に遅い。解凍速度は速く、圧縮サイズは小さい。
# -9 オプションで圧縮率を最大にする
gzip -9 archive.tar #1
```

### No.038
```bash
#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}
# gzipコマンドのオプション。除外させたい、ディレクトリがある時に使う。
# --exclude ディレクトリ名
# --exclude パス\n -X
# --exclude リスト 除外したいファイルがたくさんある場合には、-Xオプションにより外部ファイルに記述した除外リストを適用できる。
tar cvf tmp.tar --exclude "*.sh" "$1"
```

### No.039
```bash
#!/bin/bash
# 実行コマンドを表示
# set -v
# 実行しようとしているコマンドが表示される。変数は展開される
set -o xtrace
readonly SCRIPT_NAME=${0##*/}

# tmp001.tarに引数で指定したファイルを追加する。
tar rvf "/Users/mfunaki/workspace/shellscript-study/tmp002/tmp001.tar" "$1"
```

### No.040
#### umaskコマンド
パーミッションの既定値を決めるときに使う。

#### recursive
ある作業中にさらに同じ作業を呼び出して処理する。

#### preserve
保護する