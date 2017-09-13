#!/bin/bash

# ホスト名
host=

# pingを行う回数
count=10

# pingを実行
ping $host -c $count > ping.txt

# 結果のテキストを整形
average=`cat ping.txt | awk '{print $7}' | sed '/^$/d' | sed '$d' | sed -e "s/time=//" | awk 'BEGIN{m=0}{m+=$1}END {print m/NR}'`

# 出力確認
# echo ${average}
# if文ように型を変換
average_int=${average%.*}

#閾値
threshold=5

# 確認用
if [ $average_int -gt $threshold ]; then
 echo ${average}
fi
