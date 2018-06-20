FROM alpine:3.7

MAINTAINER hardcattle@gmail.com

COPY apache-tomcat-8.5.31 /usr/local/apache-tomcat-8.5.31

RUN apk add --no-cache --update-cache curl bash openjdk8-jre-base \
	&& rm -rf /var/cache/apk/* \
	&& chmod a+x /usr/local/apache-tomcat-8.5.31/bin/*.sh

ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV TOMCAT_HOME /usr/local/apache-tomcat-8.5.31
ENV PATH ${PATH}:${JAVA_HOME}/bin:${TOMCAT_HOME}/bin

ENTRYPOINT ["/usr/local/apache-tomcat-8.5.31/bin/catalina.sh", "run"]




