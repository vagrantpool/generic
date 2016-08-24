#!/bin/sh

# Get hostname and IP from command-line args.
hostname=$1
ipaddr=$2

# Setup system-wide mirror for package-managing.
cat > /etc/apt/sources.list <<-'EOF'
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

echo 'nameserver 119.29.29.29' > /etc/resolvconf/resolv.conf.d/base

timedatectl set-timezone 'Asia/Shanghai'
apt-get -y install ntpdate
ntpdate pool.ntp.org
apt-get -y install ntp
service ntp start

hostnamectl set-hostname "$hostname.localdomain"
echo "$ipaddr	$hostname.localdomain	$hostname" >> /etc/hosts

adduser --disabled-password --gecos '' example
echo 'example:example' | chpasswd
echo 'example ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/example
