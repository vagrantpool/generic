#!/bin/sh

# Get hostname and IP from command-line args.
HOSTNAME=$1
IPADDR=$2

USER=example
PASSWD=example

# Setting system-wide mirror for package-managing.
tee /etc/yum.repos.d/CentOS-Base.repo <<-'EOF'
[base]
name=CentOS-$releasever - Base
baseurl=http://mirrors.ustc.edu.cn/centos/$releasever/os/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[updates]
name=CentOS-$releasever - Updates
baseurl=http://mirrors.ustc.edu.cn/centos/$releasever/updates/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[extras]
name=CentOS-$releasever - Extras
baseurl=http://mirrors.ustc.edu.cn/centos/$releasever/extras/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[centosplus]
name=CentOS-$releasever - Plus
baseurl=http://mirrors.ustc.edu.cn/centos/$releasever/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF

yum -y makecache

timedatectl set-timezone 'Asia/Shanghai'

hostnamectl set-hostname "$HOSTNAME.localdomain"
echo "$IPADDR	$HOSTNAME.localdomain	$HOSTNAME" >> /etc/hosts

adduser $USER
echo "$USER:$PASSWD" | chpasswd
usermod -aG wheel $USER
echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER

sed -i '1iPasswordAuthentication yes' /etc/ssh/sshd_config
systemctl restart sshd.service
