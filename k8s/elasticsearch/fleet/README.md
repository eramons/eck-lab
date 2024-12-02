# Fleet Overlay

This overlay is built on top of the ingress overlay. It deploys Fleet and the Elastic Agent as part of the Elastic Stack environment in Kubernetes. 

Fleet is used to manage and monitor Elastic Agents in a centralized manner. The Elastic Agents can be used to collect logs, metrics and APM data. 

## Prerequisites

 * Kubernetes Cluster: you need to have a running Kubernetes cluster with ```kubectl``` configured to access it.
 * Custom Resource Definitions, ECK Operator and a Cluster Issuer for managing certificate issuance with Let's Encrypt.

## Overview

The Fleet overlay inclues the following resources: 

 * Base configuration: contains the basic setup for Elasticsearch and Kibana.
 * Ingress: configures an ingress to externally access the Kibana service over a trusted SSL-protected HTTPS endpoint.
 * Fleet server: The manifest for the fleet server which centrally manages the elastic agents.
 * Kibana Patch: Includes the definition of policies to add the K8s and Fleet integrations.
 * Elastic Agent: A DaemonSet for deploying the elastic agent on all worker nodes to collect data for the K8s integration

## Deploy

To apply the Fleet overlay, first apply the cluster resources:
```
kubectl apply -k k8s/cluster/
```
Then apply the fleet overlay, which also includes the elasticsearch, kibana and ingress configuration:
```
kubectl apply -k k8s/elasticsearch/fleet/
```
