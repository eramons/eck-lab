# eck-lab
Modular, cloud-native Elasticsearch and Kibana demo environment with Terraform and Kubernetes

This repository contains a modular demo environment for **Elasticsearch** and **Kibana**, deployed using [Elastic Cloud on Kubernetes (ECK)](https://www.elastic.co/guide/en/cloud-on-k8s/current/index.html). 

The environment is organized into separate modules, which can be applied independently. 

## Kubernetes Resources

The project is organized into Kubernetes manifests using **Kustomize**.

- **`k8s/modules/elasticsearch/`**: Contains the configuration for deploying Elasticsearch and Kibana. [Link to README](k8s/modules/elasticsearch/README.md)
- **`k8s/modules/fleet/`**: Future module for Fleet (coming soon).
- **`k8s/modules/apm/`**: Future module for APM (coming soon).

## Terraform Resources

To fully automate the infrastructure setup, you can use the Terraform modules provided in this project. 

The Terraform module documentation is **coming soon**.
