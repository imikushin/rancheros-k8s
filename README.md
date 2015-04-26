# Kubernetes on RancherOS (take 2)

TODO: write something about it.

## Launch

We'll launch Kubernetes on RancherOS on Amazon EC2.

Choose rancheros-v0.3.0-hvm-1 image.

Configure Instance Details -> Advanced Details 

Enter User data. Use either:   
```yml
#cloud-config
rancher:
  environment:
    ETCD_DISCOVERY: "${DISCOVERY_URL}"
  services_include:
  - k8s-common: true
  - k8s-master: true
```
or:
```yml
#cloud-config
rancher:
  environment:
    ETCD_DISCOVERY: "${DISCOVERY_URL}"
  services_include:
  - k8s-common: true
  - k8s-minion: true
```
as a template.

Replace `${DISCOVERY_URL}` with a real **NEW** discovery URL for your cluster, e.g. 
`https://discovery.etcd.io/daa02a8fafee1519ea54795a14965d3c`

**Every time** you recreate your cluster, **get a new etcd discovery URL** for use in your instances' cloud-config
    
    curl "https://discovery.etcd.io/new?size=1"

WARNING: In case you try to reuse this URL for another cluster, your `etcd` nodes will try to become 
peers in another (possibly dead) cluster. 
