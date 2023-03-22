#!/bin/bash

# 判断变量是否为数字
if [[ "$1" =~ ^[0-9]+$ ]];then
  # 将时间戳转换为日期时间格式
  date=$(date -d @$1 +"%Y-%m-%d %H:%M:%S")
  echo "$date"  
fi

# 判断是否我时间格式
if [ -n "$1" ] && date -d "$1" > /dev/null 2>&1; then
  date=$(date -d "$1" +'%s')
  echo "$date"
fi

