#!/usr/bin/env bash
#
# Author: mirschao
# Date: 2024-12-30
# Version: 1.0
# ----------------------------------
# description:
# this script is used to configure software settings on a system.
# ----------------------------------
# Changelog:
# 2024-12-30 - Initial version
# ----------------------------------
# Script starts here


# close the firewall && disable selinux
systemctl disable --now firewalld
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# setting the company's yum repository
# sed -i 's/mirrors.rockylinux.org/[YOUR_MIRRORS]/g' /etc/yum.repos.d/Rocky-*.repo

# update the system
yum update -y --exclude=kernel*
sleep 5

# install epel-release
yum install -y epel-release
sleep 5

# install the development tools
yum groupinstall -y "Development Tools"
sleep 5

# install tools packages
yum install -y  yum-utils iptables-services bridge-utils \
                screen lrzsz telnet iptraf traceroute sysstat \
                dstat iotop iftop
sleep 5

# install python environment packages
yum install -y python3 python3-pip python3-devel
