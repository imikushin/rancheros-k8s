#!/bin/bash
set -x -e

NODE_IP=${NODE_IP:?"NODE_IP not set"}

ros c set environment.K8S_MASTER $(etcdctl get /rancher.io/k8s/master)
