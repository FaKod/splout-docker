# This is a comment
FROM sequenceiq/hadoop-docker:2.6.0
MAINTAINER Fakod <fakod666@gamil.com>

USER root

RUN yum install -y wget

ENV HADOOP_INSTALL /usr/local/hadoop
ENV PATH $PATH:$HADOOP_INSTALL/bin
ENV PATH $PATH:$HADOOP_INSTALL/sbin

ENV SPLOUT_HADOOP_COMMON_HOME $HADOOP_INSTALL/share/hadoop/common
ENV SPLOUT_HADOOP_HDFS_HOME $HADOOP_INSTALL/share/hadoop/hdfs
ENV SPLOUT_HADOOP_MAPRED_HOME $HADOOP_INSTALL/share/hadoop/mapreduce
ENV SPLOUT_HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop

RUN wget -q -O splout.tgz http://search.maven.org/remotecontent?filepath=com/splout/db/splout-distribution/0.3.0/splout-distribution-0.3.0-mr2.tar.gz
RUN tar -xzf splout.tgz -C /usr/local && rm splout.tgz

ADD start.sh /etc/start.sh
RUN chown root:root /etc/start.sh
RUN chmod 700 /etc/start.sh

ADD sploutexamples.sh /root/sploutexamples.sh
RUN chown root:root /root/sploutexamples.sh
RUN chmod 700 /root/sploutexamples.sh

EXPOSE 4412
