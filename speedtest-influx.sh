#!/bin/sh

# define annotation headers
a0="#constant measurement,speed"
a1="#datatype tag,tag,double,double,double,long,long,long,long,tag,long,double,double,double,double,double,double,double,double,double,double"
a2='"server name","server id","idle latency","idle jitter","packet loss","download","upload","download bytes","upload bytes","share url","download server count","download latency","download latency jitter","download latency low","download latency high","upload latency","upload latency jitter","upload latency low","upload latency high","idle latency low","idle latency high"'

# run speedtest
m=$(/root/speedtest -f csv 2>&1)

# echo to influxdb
echo -e $a0"\n"$a1"\n"$a2"\n"$m | /root/influx write --bucket speedtest --format csv -
