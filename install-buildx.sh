#!/usr/bin/env bash

mkdir -p "$JENKINS_HOME/.docker/cli-plugins"

unamestr=`uname -m`
if [[ "$unamestr" == 'x86_64' ]]; then
  echo " Detected x86_64 architecture";
  wget -O "$JENKINS_HOME/.docker/cli-plugins/docker-buildx" https://github.com/docker/buildx/releases/download/v0.4.1/buildx-v0.4.1.linux-arm64
elif [[ "$unamestr" == 'aarch64' ]]; then
  echo " Detected aarch64 architecture";
  wget -O "$JENKINS_HOME/.docker/cli-plugins/docker-buildx" https://github.com/docker/buildx/releases/download/v0.4.1/buildx-v0.4.1.linux-arm64
fi

chmod a+x "$JENKINS_HOME/.docker/cli-plugins/docker-buildx"
