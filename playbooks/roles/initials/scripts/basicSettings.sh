#!/usr/bin/env bash
#
# Script to create a new Ansible role
# Usage: ./basicSettings.sh
# Author: mirschao
# Date: 2024-12-30
# Version: 1.0
# ----------------------------------
# Description:

# ----------------------------------
# Changelog:
# 2024-12-30 - Initial version
# ----------------------------------
# Script starts here


# close the firewall && disable selinux
systemctl disable --now firewalld
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# install epel-release
yum install -y epel-release
yum clean all
yum makecache

# update the system
yum update -y --exclude=kernel*

# install the development tools
yum groupinstall -y "Development Tools"

# install tools packages
yum install -y vim git wget curl net-tools bind-utils yum-utils \
                iptables-services bridge-utils bash-completion \
                kexec-tools sos psacct screen lrzsz tree telnet \
                tcpdump nmap-ncat ntpdate ntp chrony zip unzip \
                bzip2 gzip lsof strace sysstat dstat iotop iftop \
                iptraf mtr traceroute
