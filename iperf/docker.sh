#!/bin/sh

DIR=`pwd`

SERVER=$1
TIMES=$2

TESTSERVER=$1
TIMES=$2

docker build -t iperf3 $DIR

echo "Start Testing TCP bandwidth"

docker run --rm -v /ferrari:/ferrari iperf3 -V -c ${SERVER} -p 8080 -b 1G -t ${TIMES}

echo ""

echo "Start Testing UDP bandwidth"
docker run --rm -v /ferrari:/ferrari iperf3 -V -u -c ${SERVER} -p 8080 -b 1G -t ${TIMES}

wait
echo Experiment completed
