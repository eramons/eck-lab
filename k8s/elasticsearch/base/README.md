The initial setup focuses on a **basic Elasticsearch and Kibana deployment**.

## Prerequisites

- **Kubernetes** (locally with K3s or another Kubernetes distribution or in cloud as CaaS).
- **kubectl** configured to access your Kubernetes cluster.

## Deploying the Base Elasticsearch and Kibana Setup

To deploy the basic Elasticsearch and Kibana setup, use `kubectl` with **Kustomize**.

First, apply the cluster resources:
```bash
kubectl apply -k k8s/modules/cluster
```

Second, apply the elasticsearch basic resources:
```bash
kubectl apply -k k8s/modules/elasticsearch/base
```
