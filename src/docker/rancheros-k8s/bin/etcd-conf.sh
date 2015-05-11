#!/bin/bash
set -ex

NODE_IP=${NODE_IP:?"NODE_IP not set"}

ros c set environment.ETCD_INITIAL_ADVERTISE_PEER_URLS http://${NODE_IP}:2380
ros c set environment.ETCD_LISTEN_PEER_URLS http://${NODE_IP}:2380
ros c set environment.ETCD_LISTEN_CLIENT_URLS http://0.0.0.0:2379,http://0.0.0.0:4001
ros c set environment.ETCD_ADVERTISE_CLIENT_URLS http://${NODE_IP}:2379,http://${NODE_IP}:4001
