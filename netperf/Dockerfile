# in production this should probably be busybox, but let's use ubuntu for a
# fair comparison 
FROM ubuntu:18.04

# COPY netserver /usr/bin/netserver
COPY netperf /usr/bin/netperf

ENTRYPOINT ["netperf"]
# EXPOSE 12865
# CMD [] works around a bug in old versions of Docker
CMD []
