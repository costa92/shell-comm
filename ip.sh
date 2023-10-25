#!/bin/sh
IP=`ifconfig eth0|grep inet|sed 's/.*addr://g'|sed 's/B.*//g'`
echo $IP