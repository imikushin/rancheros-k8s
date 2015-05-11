# Kubernetes on RancherOS (take 2)

TODO: write something about it.

## Launch

We'll launch Kubernetes on RancherOS on Amazon EC2.

Choose rancheros-v0.3.1-hvm-1 image.

Configure Instance Details -> Advanced Details 

Enter User data. Use either:   
```yml
#cloud-config
rancher:
  environment:
    ETCD_DISCOVERY: <discovery_url>
    FLANNEL_NETWORK: <flannel_network>
    K8S_MASTER_PORT: 8080
    K8S_PORTAL_NET: 10.100.0.0/16
  services_include:
  - https://raw.githubusercontent.com/imikushin/rancheros-k8s/master/k8s-common.yml: true
  - https://raw.githubusercontent.com/imikushin/rancheros-k8s/master/k8s-master.yml: true
```
or:
```yml
#cloud-config
rancher:
  environment:
    ETCD_DISCOVERY: <discovery_url>
    FLANNEL_NETWORK: <flannel_network>
  services_include:
  - https://raw.githubusercontent.com/imikushin/rancheros-k8s/master/k8s-common.yml: true
  - https://raw.githubusercontent.com/imikushin/rancheros-k8s/master/k8s-minion.yml: true
```
as a template.

Replace `<discovery_url>` with a real **NEW** discovery URL for your cluster, e.g. 
`https://discovery.etcd.io/daa02a8fafee1519ea54795a14965d3c`

Replace `<flannel_network>` with a CIDR range for flannel overlay network. This CIDR should not overlap 
with any existing network you are using, e.g. `10.255.0.0/16` 

**Every time** you recreate your cluster, **get a new etcd discovery URL** for use in your instances' cloud-config
    
    curl "https://discovery.etcd.io/new?size=1"

**WARNING**: In case you try to reuse this URL for another cluster, your `etcd` nodes will try to become 
peers in another (possibly dead) cluster. 


------------------
Copyright (c) 2015 [Ivan Mikushin](https://github.com/imikushin)
