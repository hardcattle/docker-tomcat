FROM alpine:3.7

MAINTAINER hardcattle@gmail.com

RUN apk add --no-cache --update-cache curl bash tar fontconfig ttf-dejavu openjdk8-jre \
	&& curl -O http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz \
	&& tar xzf apache-tomcat-8.5.31.tar.gz -C /usr/local/ \
	&& rm -rf apache-tomcat-8.5.31.tar.gz \
	&& rm -rf /var/cache/apk/* \
	&& chmod a+x /usr/local/apache-tomcat-8.5.31/bin/*.sh

ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV TOMCAT_HOME /usr/local/apache-tomcat-8.5.31
ENV PATH ${PATH}:${JAVA_HOME}/bin:${TOMCAT_HOME}/bin

ENTRYPOINT ["/usr/local/apache-tomcat-8.5.31/bin/catalina.sh", "run"]




