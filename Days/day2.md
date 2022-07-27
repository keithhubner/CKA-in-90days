# Day 2 - Cluster Architecture 

## Overview

A Kubernetes cluster is made up of a number of nodes, traditionally these are split into nodes which run workloads i.e. containers and a node (or potentially multiple in a HA environment) which runs the "control plane". The control plane is the "brain" which manages what runs where and how. 

Each "worker node" includes 3 main components, the [kubelet](https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet/) (agent), a [container runtime])(https://kubernetes.io/docs/setup/production-environment/container-runtimes/) (the software that runs the containers, e.g. Docker Engine, containerd) and the [kube-proxy](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-proxy/) (networking proxy).

> Take time to read each to the links to get a full understanding of what these node components do.



kube-apiserver

communication from outside and inside the cluster

## kube-proxy
Rules that allow 

## kube-scheduler
Status of nodes and what's running on them


## Controller manager:
node-controller 
replication-controller






## etcd



Container Runtimes