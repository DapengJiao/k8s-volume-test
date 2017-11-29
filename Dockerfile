FROM centos:7.3.1611

MAINTAINER dapeng.jiao@ericsson.com

RUN yum update -y; yum clean all
RUN yum install -y epel-release
RUN yum install -y fio ioping

COPY run_benchmark.sh /home/
RUN ["chmod", "+x", "/home/run_benchmark.sh"]
CMD ["/bin/bash", "-c", "/home/run_benchmark.sh"]