# eck-lab
Modular, cloud-native Elasticsearch and Kibana demo environment with Terraform and Kubernetes

This repository contains a modular demo environment for **Elasticsearch** and **Kibana**, deployed using [Elastic Cloud on Kubernetes (ECK)](https://www.elastic.co/guide/en/cloud-on-k8s/current/index.html). 

The environment is organized into separate modules, which can be applied independently. 

## Kubernetes Resources

The project is organized into Kubernetes manifests using **Kustomize**.

- **`k8s/modules/elasticsearch/`(k8s/modules/elasticsearch/README.md)**: Contains the configuration for deploying Elasticsearch and Kibana. 
- **`k8s/modules/fleet/`**: Future module for Fleet (coming soon).
- **`k8s/modules/apm/`**: Future module for APM (coming soon).

## Terraform Resources


The terraform configuration examples provide an optional way to deploy the Google Cloud Platform (GCP) infrastructure to support a Kubernetes-based demo environment.

For more details, check the [Terraform README](terraform/README.md).
