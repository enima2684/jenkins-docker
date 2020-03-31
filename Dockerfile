FROM jenkins/jenkins:2.222.1

USER root

# Prepare docker install
RUN apt-get update && apt-get upgrade && \
    curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    usermod -aG docker jenkins    

# Install docker-compose
RUN apt-get install -y libffi-dev libssl-dev && \
    apt-get install -y python3 python3-pip && \
    apt-get remove python-configparser && \
    pip3 install docker-compose

# drop back to the regular jenkins user - good practice
USER jenkins:docker
