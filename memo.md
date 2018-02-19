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
### No.30
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

