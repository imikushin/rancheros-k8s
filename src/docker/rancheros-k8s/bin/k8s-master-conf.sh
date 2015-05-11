#!/bin/bash
set -x -e

NODE_IP=${NODE_IP:?"NODE_IP not set"}
K8S_MASTER_PORT=${K8S_MASTER_PORT:-8080}
K8S_MASTER_ENDPOINT="http://${NODE_IP}:${K8S_MASTER_PORT}"

etcdctl set /rancher.io/k8s/master ${K8S_MASTER_ENDPOINT}
ros c set environment.K8S_MASTER_ENDPOINT ${K8S_MASTER_ENDPOINT}
