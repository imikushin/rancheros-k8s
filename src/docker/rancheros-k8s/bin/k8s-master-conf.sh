#!/bin/bash
set -x -e

NODE_IP=${NODE_IP:?"NODE_IP not set"}
MASTER_PORT=8080
MASTER_ENDPOINT="http://${NODE_IP}:${MASTER_PORT}"

etcdctl set /rancher.io/k8s/master ${MASTER_ENDPOINT}
