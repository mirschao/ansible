#!/usr/bin/env bash
#
# author: mirschao
# date: 2024/10/30
# usage: ansible adhoc execute site interface.


function scan_kernel_version() {
    ansible -i inventorys/hosts_machines machines -m shell -a 'uname -r'
}

function main() {
    scan_kernel_version || return $?
}

main "$@"
