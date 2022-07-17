# in production this should probably be busybox, but let's use ubuntu for a
# fair comparison 
FROM ubuntu:18.04

# MAINTAINER Wes Felter, wmf@us.ibm.com

RUN apt-get update
RUN apt-get -qq install -y fio

ADD test.fio /

VOLUME ["/ferrari"]
ENTRYPOINT ["fio"]
# CMD [] works around a bug in old versions of Docker
CMD []
