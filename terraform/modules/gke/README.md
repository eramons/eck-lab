# GKE Module

This module provisions the [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine) cluster and associated resources on Google Cloud Platform (GCP).

The GKE module deploys following resources:

 * A VPC network and a subnet
 * A public static IP: for exposing the ingress controller load balancer service
 * A Kubernetes (K8s) cluster with a separately managed node pool
 * A DNS A record to make the public IP accessible over the **dns_hostname** (see variables below) 
