FROM ubuntu:12.04
MAINTAINER Michael Neale <mneale@cloudbees.com>

RUN apt-get update
RUN echo deb http://pkg.jenkins-ci.org/debian binary/ >> /etc/apt/sources.list

RUN apt-get install -y wget
RUN apt-get install -y git build-essential cmake make

RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -

RUN apt-get update
RUN apt-get install -y jenkins=1.577

ENTRYPOINT exec su jenkins -c "java -jar /usr/share/jenkins/jenkins.war --httpPort=$PORT"
