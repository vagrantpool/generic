#!/bin/sh

# Setup system-wide mirror for package-managing:
cat > /etc/apt/sources.list << EOF
deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted
deb http://mirrors.aliyun.com/ubuntu/ trusty universe
deb-src http://mirrors.aliyun.com/ubuntu/ trusty universe
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates universe
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates universe
deb http://mirrors.aliyun.com/ubuntu/ trusty multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted
deb http://mirrors.aliyun.com/ubuntu/ trusty-security universe
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security universe
deb http://mirrors.aliyun.com/ubuntu/ trusty-security multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security multiverse
EOF
apt-get update
