# eck-lab
**Modular, cloud-native Elasticsearch and Kibana demo environment with Terraform and Kubernetes**

This repository contains a modular demo environment for **Elasticsearch** and **Kibana**, deployed using [Elastic Cloud on Kubernetes (ECK)](https://www.elastic.co/guide/en/cloud-on-k8s/current/index.html). 

The environment is organized into separate modules, which can be applied independently. 

## Kubernetes Resources

The K8s resources are organized into Kubernetes manifests using **Kustomize**.

[K8s](k8s/)

## Terraform Resources


The terraform configuration examples provide a way to spin up the necessary Google Cloud Platform (GCP) infrastructure to deploy the ECK examples.

[Terraform](terraform/).
