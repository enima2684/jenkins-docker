FROM jenkins/jenkins:2.222.1

USER root

# Prepare docker install
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-cache policy docker-ce

# Install docker
RUN apt-get install -y docker-ce && \
    usermod -aG docker jenkins

# Install docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose  && \
    chmod +x /usr/local/bin/docker-compose

# drop back to the regular jenkins user - good practice
USER jenkins:docker
