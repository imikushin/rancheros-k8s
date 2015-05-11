#!/bin/bash
set -x -e

ros c set environment.K8S_MASTER_ENDPOINT $(etcdctl get /rancher.io/k8s/master)
