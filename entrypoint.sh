#!/usr/bin/env bash

# Add the build hosts

# ARM64 builder
docker buildx create --use --name sauron-build tcp://192.168.1.32:2375

# AMD64 builder
docker buildx create --append --name sauron-build tcp://192.168.1.21:2375

# Launch java server
java -jar /opt/jenkins/jenkins.war --httpPort=7100