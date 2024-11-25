# ECK Lab - Elasticsearch & Kibana Demo Environment

This repository contains a modular demo environment for **Elasticsearch** and **Kibana**, deployed using [Elastic Cloud on Kubernetes (ECK)](https://www.elastic.co/guide/en/cloud-on-k8s/current/index.html). This environment can be easily expanded to include additional components like Fleet, APM, and more, but the initial setup focuses on a **basic Elasticsearch and Kibana deployment**.

## Project Structure

The project is organized into Kubernetes manifests using **Kustomize** for easier customization and deployment. 

- **`k8s/modules/elasticsearch/`**: Contains the configuration for deploying Elasticsearch and Kibana.
- **`k8s/modules/fleet/`**: Future module for Fleet (coming soon).
- **`k8s/modules/apm/`**: Future module for APM (coming soon).

## Prerequisites

- **Kubernetes** (with K3s or another Kubernetes distribution).
- **kubectl** configured to access your Kubernetes cluster.

## Deploying the Base Elasticsearch and Kibana Setup

### 1. Apply the Base Setup

To deploy the basic Elasticsearch and Kibana setup, use `kubectl` with **Kustomize**:

```bash
kubectl apply -k k8s/modules/elasticsearch/base

