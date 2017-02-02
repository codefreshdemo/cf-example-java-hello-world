FROM ubuntu:14.04

RUN apt-get update

# Add oracle java 8 repository
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN apt-get install -y oracle-java8-installer maven wget
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/cache/oracle-jdk8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Install Maven, wget
RUN apt-get -y install maven wget

COPY . /app
WORKDIR /app

RUN ls -l
RUN mvn install

RUN mkdir -p /opt/tomcat/webapps/

RUN ls -l target/

RUN cp target/ROOT.war /opt/tomcat/webapps/

RUN ls -l /opt/tomcat/webapps/

EXPOSE 8080