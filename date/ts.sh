#!/bin/bash

# 判断变量是否为数字
if [[ "$1" =~ ^[0-9]+$ ]];then
  # 将时间戳转换为日期时间格式
  date_format="%Y-%m-%d %H:%M:%S"
  date_str=$(date -d @$1 +"$date_format")
  echo "$date_str"  
fi

# 判断是否我时间格式

# 定义时间格式的正则表达式
time_regex="^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}$"
day_regex="^[0-9]{4}-[0-9]{2}-[0-9]{2}$"
if [[ "$1" =~ $time_regex || "$1" =~ $day_regex  ]]; then
  date=$(date -d "$1" +'%s')
  echo "$date"
fi

