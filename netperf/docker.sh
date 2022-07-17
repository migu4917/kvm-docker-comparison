#!/bin/sh
# ./docker.sh 192.168.137.1 20 > results/latency-docker.log
TESTSERVER=$1
TIMES=$2
DIR=`pwd`

# build the container (assumes the spyre git repo is in NFS)
cp /usr/bin/netperf .
docker build -t netperf $DIR

# sudo service netperf stop
# ssh $SERVER docker run -d -p 12865:12865 netserver

docker run --network host --rm netperf -l $TIMES -H ${TESTSERVER} -t TCP_RR -- -r 100,200 -O "MIN_LAETENCY, MAX_LATENCY, MEAN_LATENCY, P90_LATENCY, P99_LATENCY, STDDEV_LATENCY, THROUGHPUT, THROUGHPUT_UNITS"
docker run --network host --rm netperf -l $TIMES -H ${TESTSERVER} -t UDP_RR -- -r 100,200 -O "MIN_LAETENCY, MAX_LATENCY, MEAN_LATENCY, P90_LATENCY, P99_LATENCY, STDDEV_LATENCY, THROUGHPUT, THROUGHPUT_UNITS"

# clean up
#ssh $SERVER docker stop netserver

wait
echo Experiment completed
