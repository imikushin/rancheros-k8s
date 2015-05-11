#!/bin/bash
set -ex

K8S_MASTER_ENDPOINT=${K8S_MASTER_ENDPOINT:?"K8S_MASTER_ENDPOINT not set"}

kube-proxy --master=${K8S_MASTER_ENDPOINT} --v=2 --logtostderr=true
