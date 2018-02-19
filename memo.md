# ShellScript 学習用

## 3章
### No.030
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


