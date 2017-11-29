FROM centos:7.3.1611

MAINTAINER dapeng.jiao@ericsson.com

RUN yum install -y  epel-release\
                    fio \
                    ioping

COPY run_benchmark.sh /root
WORKDIR /root
CMD ["/bin/bash", "-c", "/root/run_benchmark.sh"]