#!/bin/sh

# Setup system-wide mirror for package-managing:
cat > /etc/apt/sources.list << EOF
deb http://mirrors.ustc.edu.cn/ubuntu trusty main restricted universe multiverse
deb http://mirrors.ustc.edu.cn/ubuntu trusty-security main restricted universe multiverse
deb http://mirrors.ustc.edu.cn/ubuntu trusty-updates main restricted universe multiverse
deb http://mirrors.ustc.edu.cn/ubuntu trusty-proposed main restricted universe multiverse
deb http://mirrors.ustc.edu.cn/ubuntu trusty-backports main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu trusty main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu trusty-security main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu trusty-updates main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu trusty-proposed main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu trusty-backports main restricted universe multiverse
EOF
apt-get update
