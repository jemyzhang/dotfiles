#!/bin/bash

#aliyun
pip_mirrorsite="https://mirrors.aliyun.com/pypi/simple/"
npm_mirrorsite="https://registry.npm.taobao.org"

echo "Setting up mirrors of pypi..."
if pip yarn > /dev/null 2>&1; then
    pip install -i $pipe_mirrorsite pip -U
    pip config set global.index-url $pip_mirrorsite
fi

echo "Setting up mirrors of npmjs..."
if hash yarn > /dev/null 2>&1; then
    yarn config set registry $npm_mirrorsite
fi
if hash npm > /dev/null 2>&1; then
    npm config set registry $npm_mirrorsite
fi

echo "Setting up mirrors of dockerhub..."
if hash docker > /dev/null 2>&1; then
    cat << EOF | sudo tee -a /etc/docker/daemon.json
{
  "registry-mirrors": [
    "https://dockerhub.azk8s.cn",
    "https://hub-mirror.c.163.com"
  ]
}
EOF
    sudo systemctl daemon-reload
    sudo systemctl restart docker
fi
