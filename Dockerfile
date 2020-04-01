FROM ubuntu:19.10

ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT 50000

# Jenkins is ran with user `jenkins`, uid = 1000
# If you bind mount a volume from host/volume from a data container,
# ensure you use same uid
RUN useradd -d "$JENKINS_HOME" -u 1000 -m -s /bin/bash jenkins

# Install utils
RUN apt-get update && apt-get install -y gnupg2 wget git openjdk-8-jdk curl

# Install Jenkins
RUN mkdir -p /opt/jenkins && \
        cd /opt/jenkins && \
        wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war

RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh

RUN usermod -aG docker jenkins

## Install docker-compose
#RUN curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose  && \
#    chmod +x /usr/local/bin/docker-compose

RUN apt-get update && \
    apt-get install -y  libffi-dev libssl-dev && \
    apt-get install -y python3 python3-pip && \
    apt-get remove python-configparser && \
    pip3 install docker-compose

CMD  ["java", "-jar", "/opt/jenkins/jenkins.war", "--httpPort=7100"]
