# GKE Module

This module provisions the [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine) cluster and associated resources on Google Cloud Platform (GCP).

## Requirements

- Google Cloud Platform (GCP) account
- Terraform 0.12+ installed
- GCP credentials with sufficient permissions to create a GKE cluster and associated resources

## Resources

The GKE module deploys following resources:

 * A VPC network and a subnet
 * A public static IP: for exposing the ingress controller load balancer service
 * A Kubernetes (K8s) cluster with a separately managed node pool
 * A DNS A record to make the public IP accessible over the **dns_hostname** (see variables below) 

## Variables 

| Name            | Description                                     | Type   | Default | Required |
|-----------------|-------------------------------------------------|--------|---------|----------|
| `demo_name`     | The name of the demo environment.                | string |         | yes      |
| `gcp_project`   | The GCP project where the resources will be created. | string |         | yes      |
| `gcp_region`    | The GCP region to deploy the resources in.       | string |         | yes      |
| `gcp_location`  | The GCP location for regional resources.         | string |         | yes      |
| `gcp_key_path`  | Path to the GCP service account key file.        | string |         | yes      |
| `dns_hostname`  | DNS hostname for the GKE cluster.               | string |         | yes      |
| `dns_managed_zone` | The DNS zone in GCP for managing records.     | string |         | yes      |
