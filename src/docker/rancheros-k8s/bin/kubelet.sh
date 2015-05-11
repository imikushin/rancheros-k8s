#!/bin/bash
set -ex

NODE_IP=${NODE_IP:?"NODE_IP not set"}
K8S_MASTER_ENDPOINT=${K8S_MASTER_ENDPOINT:?"K8S_MASTER_ENDPOINT not set"}

kubelet  --address=0.0.0.0 --hostname_override=${NODE_IP} \
  --api_servers=${K8S_MASTER_ENDPOINT} --v=2 --logtostderr=true
