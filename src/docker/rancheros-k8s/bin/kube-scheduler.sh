#!/bin/bash
set -ex

K8S_MASTER_ENDPOINT=${K8S_MASTER_ENDPOINT:?"K8S_MASTER_ENDPOINT not set"}

kube-scheduler --master=${K8S_MASTER_ENDPOINT} --v=2 --logtostderr=true
