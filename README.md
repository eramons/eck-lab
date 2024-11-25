# eck-lab
Modular, cloud-native Elasticsearch and Kibana demo environment with Terraform and Kubernetes

This repository contains a modular demo environment for **Elasticsearch** and **Kibana**, deployed using [Elastic Cloud on Kubernetes (ECK)](https://www.elastic.co/guide/en/cloud-on-k8s/current/index.html). 

The environment is organized into separate modules, which can be applied independently. 

## Table of Contents

1. [Setup Instructions](#setup-instructions)
2. [Kubernetes Resources](#kubernetes-resources)
   - [Elasticsearch and Kibana](k8s/modules/elasticsearch/README.md)
   - [Fleet](k8s/modules/fleet/README.md)
   - [APM](k8s/modules/apm/README.md)
3. [Terraform Modules](#terraform-modules)
   - [GKE Setup](terraform/modules/gke/README.md)
   - [Helm Resources](terraform/modules/helm/README.md)
   - [Ollama](terraform/modules/ollama/README.md)

## Setup Instructions

The initial setup focuses on a **basic Elasticsearch and Kibana deployment**.

For detailed instructions see the documentation for each module:

### [Kubernetes Resources](k8s/modules/)

## Kubernetes Resources

The project is organized into Kubernetes manifests using **Kustomize**.

- **`k8s/modules/elasticsearch/`**: Contains the configuration for deploying Elasticsearch and Kibana. [Link to README](k8s/modules/elasticsearch/README.md)
- **`k8s/modules/fleet/`**: Future module for Fleet (coming soon).
- **`k8s/modules/apm/`**: Future module for APM (coming soon).

## Terraform Resources

To fully automate the infrastructure setup, you can use the Terraform modules provided in this project. 

The Terraform module documentation is **coming soon**.

### [Terraform Modules](terraform/modules/) (coming soon).

- **GKE Setup**: Set up a GKE cluster for your Kubernetes resources.
- **Ollama VM**: Set up a VM running Ollama for machine learning integration.
- **Helm Resources**: Install and configure ingress controllers and cert-manager via Helm.
