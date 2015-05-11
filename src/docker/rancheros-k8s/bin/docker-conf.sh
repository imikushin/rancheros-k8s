#!/bin/bash
set -ex

. /var/run/flannel/subnet.env

ros c set user_docker.args "[docker, -d, -s, overlay, -G, docker, -H, unix:///var/run/docker.sock, --bip=${FLANNEL_SUBNET}, --mtu=${FLANNEL_MTU}]"

ip link delete docker0
