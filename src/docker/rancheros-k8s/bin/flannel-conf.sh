#!/bin/bash
set -ex

FLANNEL_NETWORK=${FLANNEL_NETWORK:?"FLANNEL_NETWORK is not set"}

until etcdctl cluster-health; do
  sleep 2
done

etcdctl set /coreos.com/network/config <<EOF
{"Network":"${FLANNEL_NETWORK}","Backend":{"Type":"vxlan"}}
EOF
