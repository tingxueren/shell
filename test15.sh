#!/bin/bash

echo "启动迅雷离线："

#screen -d -m python 
#screen -d -m /usr/bin/python /home/mars/work/xunlei-lixian/lixian_cli.py 
#screen -d -m
#python /home/mars/work/xunlei-lixian/lixian_cli.py  list
#screen -d -m goagent 
#screen -d -m python /home/mars/Dropbox/soft/goagent/local/proxy.py
screen -dm  python /home/mars/work/xunlei-lixian/lixian_cli.py list
