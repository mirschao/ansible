#!/usr/bin/env bash
#
# Author: mirschao
# Date: 2024-12-30
# Version: 1.0
# ----------------------------------
# description:
# this script is used to configure system tuning settings on a system.
# ----------------------------------
# Changelog:
# 2024-12-30 - Initial version
# ----------------------------------
# Script starts here


cp -a /etc/security/limits.conf /etc/security/limits.conf.${current_time}
cat > /etc/security/limits.conf <<EOF
*           soft    nofile          100000
*           hard    nofile          100000
*           soft    nproc           65535
*           hard    nproc           65535
*           soft    core            unlimited
*           hard    core            unlimited
EOF
