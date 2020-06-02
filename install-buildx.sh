#!/usr/bin/env bash

mkdir -p "~/.docker/cli-plugins"

unamestr=`uname -m`
if [[ "$unamestr" == 'x86_64' ]]; then
  echo " Detected x86_64 architecture";
  wget -O "~/.docker/cli-plugins/docker-buildx" https://github.com/docker/buildx/releases/download/v0.4.1/buildx-v0.4.1.linux-amd64
elif [[ "$unamestr" == 'aarch64' ]]; then
  echo " Detected aarch64 architecture";
  wget -O "~/.docker/cli-plugins/docker-buildx" https://github.com/docker/buildx/releases/download/v0.4.1/buildx-v0.4.1.linux-arm64
fi

chmod a+x "~/.docker/cli-plugins/docker-buildx"
