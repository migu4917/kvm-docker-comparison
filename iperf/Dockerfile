# in production this should probably be busybox, but let's use ubuntu for a
# fair comparison 
FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -qq install iperf3 -y

ENTRYPOINT ["iperf3"]
# CMD [] works around a bug in old versions of Docker
CMD []
