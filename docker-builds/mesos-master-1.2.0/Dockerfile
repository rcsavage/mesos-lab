FROM centos:7 
MAINTAINER Rory A. Savage <rsavage.epicor@gmail.com>

RUN yum install -y tar wget git
RUN wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
RUN yum install -y epel-release
ADD includes/repo.txt /etc/yum.repos.d/wandisco-svn.repo

RUN yum update -y systemd
RUN yum groupinstall -y "Development Tools"
RUN yum install -y apache-maven python-devel python-virtualenv \
        java-1.8.0-openjdk-devel zlib-devel libcurl-devel openssl-devel \
        cyrus-sasl-devel cyrus-sasl-md5 apr-devel subversion-devel \
        apr-util-devel

# Obtain the mesos code
RUN wget http://www.apache.org/dist/mesos/1.2.0/mesos-1.2.0.tar.gz
RUN tar -zxf mesos-1.2.0.tar.gz

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.131-3.b12.el7_3.x86_64

# Change working directory.
RUN cd mesos-1.2.0 \
    && ./bootstrap \
    && mkdir build \
    && cd build \
    && ../configure \
    && make \
    && make install

ADD includes/entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
