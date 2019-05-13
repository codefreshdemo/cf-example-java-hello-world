FROM maven:3.5.2-jdk-7-alpine

COPY . /app
WORKDIR /app

RUN mvn install

RUN mkdir -p /opt/tomcat/webapps/

RUN ls -l target/

RUN cp target/ROOT.war /opt/tomcat/webapps/

RUN ls -l /opt/tomcat/webapps/

EXPOSE 8080