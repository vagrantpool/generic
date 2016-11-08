#!/bin/sh

# Get hostname and IP from command-line args.
hostname=$1
ipaddr=$2

NEWUSER=example
PASSWD=example

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

timedatectl set-timezone 'Asia/Shanghai'
apt-get -y install ntp ntpdate
service ntp stop
ntpdate pool.ntp.org
service ntp start

hostnamectl set-hostname "$hostname.localdomain"
echo "$ipaddr	$hostname.localdomain	$hostname" >> /etc/hosts

adduser --disabled-password --gecos '' $NEWUSER
echo "$NEWUSER:$PASSWD" | chpasswd
echo "$NEWUSER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$NEWUSER
