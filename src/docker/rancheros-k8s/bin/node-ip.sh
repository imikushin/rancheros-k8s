#!/bin/bash
set -ex

NODE_IP=$(ip route get $(ip route | awk '$1 == "default" {print $3}') | awk '$4 == "src" {print $5}')

rancherctl c set environment.NODE_IP ${NODE_IP}
