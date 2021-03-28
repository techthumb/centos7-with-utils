FROM centos:7
RUN yum install -y epel-release
RUN yum update -y && yum upgrade -y
RUN yum install -y sysbench python3 hwloc-libs hwloc-gui iproute stress-ng nc unzip
RUN rpm -ivh http://repo.iotti.biz/CentOS/7/x86_64/netperf-2.7.0-1.el7.lux.x86_64.rpm
COPY openonload-7.0.0.176-1.el7.centos.x86_64.rpm /tmp
RUN rpm -ivh /tmp/openonload-7.0.0.176-1.el7.centos.x86_64.rpm
WORKDIR /app
COPY ./serve.sh /app/serve.sh
RUN chmod +x serve.sh
CMD ./serve.sh
EXPOSE 8080
