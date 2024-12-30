#!/usr/bin/env bash
#
# Author: mirschao
# Date: 2024-12-30
# Version: 1.0
# ----------------------------------
# description:
# this script is used to configure kernel tuning settings on a system.
# ----------------------------------
# Changelog:
# 2024-12-30 - Initial version
# ----------------------------------
# Script starts here


# add config to file
function addConfigToFile(){
    local keywords=`echo $1| awk -F "[= ]+" '{print $1}'`
    local SearchResult=`grep "^${keywords}" "$2"`
    if [ -z "${SearchResult}" ]; then
        echo $1 >> $2
    else
        sed -i "s/^${keywords}.*/$1/" $2
    fi
}


# kernel tuning settings
cp -a /etc/sysctl.conf /etc/sysctl.conf.${current_time} > /dev/null 2>&1
arch_ratio=$([[ ! -z $(uname -a | grep x86_64) ]] && expr 64 / 32 || expr 32 / 32)
memory_size=$(free -b| awk 'NR==2{print $2}')
nf_conntrack_size=$(expr ${memory_size} / 16384 / ${arch_ratio})
#开启反向路径过滤
addConfigToFile "net.ipv4.conf.default.rp_filter = 1" /etc/sysctl.conf
addConfigToFile "net.ipv4.conf.all.rp_filter = 1" /etc/sysctl.conf
#处理无源路由包
addConfigToFile "net.ipv4.conf.all.accept_source_route = 0" /etc/sysctl.conf
addConfigToFile "net.ipv4.conf.default.accept_source_route = 0" /etc/sysctl.conf
#core文件名中添加pid作为扩展名
addConfigToFile "kernel.core_uses_pid = 1" /etc/sysctl.conf
#开启syn洪水攻击保护
addConfigToFile "net.ipv4.tcp_syncookies = 1" /etc/sysctl.conf
#修改消息队列长度
addConfigToFile "kernel.msgmnb = 65536" /etc/sysctl.conf
addConfigToFile "kernel.msgmax = 65536" /etc/sysctl.conf
#修改最大内存共享段大小bytes
addConfigToFile "kernel.shmmax = 68719476736" /etc/sysctl.conf
addConfigToFile "kernel.shmall = 4294967296" /etc/sysctl.conf
#timewait数量默认18000
addConfigToFile "net.ipv4.tcp_max_tw_buckets = 600" /etc/sysctl.conf
addConfigToFile "net.ipv4.tcp_sack = 1" /etc/sysctl.conf
addConfigToFile "net.ipv4.tcp_window_scaling = 1" /etc/sysctl.conf
addConfigToFile "net.ipv4.tcp_rmem = 4096 87380 16777216" /etc/sysctl.conf
addConfigToFile "net.ipv4.tcp_wmem = 4096 65536 16777216" /etc/sysctl.conf
addConfigToFile "net.core.rmem_default = 8388608" /etc/sysctl.conf
addConfigToFile "net.core.wmem_max = 16777216" /etc/sysctl.conf
#未收到客户端确认信息连接请求的最大值
addConfigToFile "net.ipv4.tcp_max_syn_backlog = 262144" /etc/sysctl.conf
#放弃建立连接之前发送的synack包
addConfigToFile "net.ipv4.tcp_syn_retries = 2" /etc/sysctl.conf
#开启重用，允许time—wait socket 重新用语新的tcp连接
addConfigToFile "net.ipv4.tcp_tw_reuse = 1" /etc/sysctl.conf
addConfigToFile "net.ipv4.tcp_fin_timeout = 1" /etc/sysctl.conf
#防止简单的ddos攻击
addConfigToFile "net.ipv4.tcp_max_orphans = 3276800" /etc/sysctl.conf
#启用timewait快速收回
addConfigToFile "net.ipv4.tcp_tw_recycle = 0" /etc/sysctl.conf
#keeptime启用时tcp发送keepalive消息的频度，默认2h
addConfigToFile "net.ipv4.tcp_keepalive_time = 600" /etc/sysctl.conf
#允许系统打开的端口范围
addConfigToFile "net.ipv4.ip_local_port_range = 1024 65535" /etc/sysctl.conf
#资源回收
addConfigToFile "net.ipv4.tcp_tw_recycle = 0" /etc/sysctl.conf
#路由转发
addConfigToFile "net.ipv4.ip_forward = 1" /etc/sysctl.conf
#修改防火墙连接跟踪表大小，默认65535
addConfigToFile "net.netfilter.nf_conntrack_max = ${nf_conntrack_size}" /etc/sysctl.conf
addConfigToFile "net.nf_conntrack_max = ${nf_conntrack_size}" /etc/sysctl.conf
#解禁ping
addConfigToFile "net.ipv4.icmp_echo_ignore_all = 0" /etc/sysctl.conf
modprobe bridge
sysctl -p > /dev/null 2>&1
