##
# CentOS 7 plus Jenkins
##
FROM dawidmalina/docker-java8
MAINTAINER Dawid Malinowski <dawidmalina@gmail.com>

# some env
ENV REFRESHED_AT 2014-11-12
ENV NEXUS_VERSION nexus-2.10.0-02

RUN yum -y install unzip && yum clean all

RUN cd /usr/local && \
    curl -LO http://download.sonatype.com/nexus/oss/$NEXUS_VERSION-bundle.zip && \
    unzip $NEXUS_VERSION-bundle.zip
 
EXPOSE 8081

CMD RUN_AS_USER=root /usr/local/$NEXUS_VERSION/bin/nexus console
