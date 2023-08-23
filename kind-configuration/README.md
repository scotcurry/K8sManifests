# Overview

[kind](https://kind.sigs.k8s.io/) is a tool for running Kubernetes locally using docker container nodes.  The challenge is getting
traffic routed into the cluster from the host.

## Setup

This document assumes that kind is already up and running on the host.  To make sure it is run:
```
kind --version
```

To see if there is already a cluster configured run:
```
kind get clusters
```

If port mapping wasn't set up during cluster initializtion run the following command:
```
kind delete cluster 
```

To create the cluster use the kind-config.yaml file with the following command:
```
kind create cluster --config=kind-config.yaml
```

## Networking - Port Forwarding from Host to Cluster

kind uses [Extra Port Mappings](https://kind.sigs.k8s.io/docs/user/configuration/#extra-port-mappings) to allow ingress.
In this case the rssfeedpuller service exposed port 6020.  We need to make that port available to the host as well.  This is 
done with the following configuration file:
```
#  Minimal configuration
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4

# If you pass name on the command line it will override this paramter
name: curryware-kind

# This section is the requirement to allow for ingress to the cluster.
nodes:
- role: control-plane
  # port forward port 6020 on the host to 6020 on this node
  extraPortMappings:
  - containerPort: 6020
    hostPort: 6020
    protocol: TCP
```