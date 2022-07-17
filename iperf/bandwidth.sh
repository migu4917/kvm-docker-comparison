# !/bin/bash

SERVER=$1
TIMES=$2

# sudo apt install -y iperf3
# iperf3 -s -p 8080 &
# echo ${SERVER} ${TIMES}
# -i 0 以秒为单位，设置带宽（还有抖动，丢包等）测试报告打印输出的周期
echo "Start Testing TCP bandwidth"
iperf3 -V -c ${SERVER} -p 8080 -b 1G -t ${TIMES}

echo ""

echo "Start Testing UDP bandwidth"
iperf3 -V -u -c ${SERVER} -p 8080 -b 1G -t ${TIMES}

# pkill iperf3
