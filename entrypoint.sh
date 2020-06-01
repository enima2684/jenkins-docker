#!/usr/bin/env bash

docker buildx create --use --name sauron-build
docker buildx --append --name sauron-build tcp://192.168.1.21:2375
java -jar /opt/jenkins/jenkins.war --httpPort=7100