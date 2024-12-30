#!/usr/bin/env bash
#
# Author: mirschao
# Date: 2024-12-30
# Version: 1.0
# ----------------------------------
# description:
# this script is used to configure time settings on a system.
# ----------------------------------
# Changelog:
# 2024-12-30 - Initial version
# ----------------------------------
# Script starts here


timedatectl set-timezone Asia/Shanghai
systemctl enable --now chronyd
