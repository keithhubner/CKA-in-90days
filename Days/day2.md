# Day 2 - Cluster Architecture Overview

## Overview

A Kubernetes cluster is made up of a number of nodes, traditionally these are split into nodes which run workloads i.e. containers and a node (or potentially multiple in a HA environment) which runs the "control services". This is often referenced as "the control plane" and is the "brain" which manages what runs where and how (plus a few other things...).

Each "worker node" includes 3 main components, the [kubelet](https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet/) (agent), a [container runtime])(https://kubernetes.io/docs/setup/production-environment/container-runtimes/) (the software that runs the containers, e.g. Docker Engine, containerd) and the [kube-proxy](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-proxy/) (networking proxy).

> Take time to read each to the links to get a full understanding of what these node components do.

Let's take a look at the components which manage the cluster, these typically run on the control-plane node.

> Many public cloud Kubernetes services host the control-plane for you bringing many advantages including providing in built resiliency. 

## etcd

Highly avilablale key value store (database) 

## kube-apiserver

Primary management compnent. 
The kube-apiserver manages on communication to and from the cluster. This could be from outside the cluster or other services from within the cluster, everything happens "through" the kube-apiserver.

## kube-scheduler
The kube-scheduler basically manages what runs where. The kube scheduler ensures that settings like affinity rules are upheld, capacity workload etc, taints and toleration's etc. 

## Controller manager:
node-controller : Nodes, new nodes, when ones go offline / unavailable 
replication-controller: Desired number of containers in replication group

## kube-proxy
Rules that allow 

All these components can actually be run in containers! 

Nodes:

kubelet

Status of the containers, what is running, talks to the control-plane.

kube-proxy

COmmunication between the worker nodes and the containers. Makes suyre the rules are in place

Container Runtime












## etcd



Container Runtimes