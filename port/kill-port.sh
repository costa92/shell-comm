#!/bin/bash
# read -p "input port:" port

if [ "$1" != "" ] 
then 
  pcount=$(lsof -i:$1|grep -v PID|awk 'NR>0'|awk '{print $2}' |awk '{a+=NF}END{print a}')
if [ "$pcount" != "" ] 
then
  lsof -i:$1|grep -v PID|awk 'NR>0'| awk '{print $2}' |xargs kill -9
  echo "已处理"
else
  echo "$port 端口不存在"
fi
fi
