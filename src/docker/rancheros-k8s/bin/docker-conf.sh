#!/bin/bash
set -ex

. /var/run/flannel/subnet.env

ros c set user_docker.args "[docker, -d, -s, overlay, -G, docker, --bip=${FLANNEL_SUBNET}, --mtu=${FLANNEL_MTU}]"
