#!/bin/bash
set -ex

NODE_IP=${NODE_IP:?"NODE_IP not set"}
K8S_MASTER_PORT=${K8S_MASTER_PORT:-8080}
K8S_PORTAL_NET=${K8S_PORTAL_NET:-10.100.0.0/16}

kube-apiserver --address=0.0.0.0 --port=${K8S_MASTER_PORT} --portal_net=${K8S_PORTAL_NET} \
  --etcd_servers=http://127.0.0.1:2379 --public_address_override=${NODE_IP} --v=2 --logtostderr=true
