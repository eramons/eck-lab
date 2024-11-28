# K8s Resources

This directory contains the Kubernetes manifests for deploying and managing the Elastic Stack and other related resoures in your Kubernetes cluster. The resources are modular and can be used in different combinations to customize the setup. 

- **`k8s/resources/elasticsearch/`(elasticsearch/base/README.md)**: Contains a basic configuration for deploying Elasticsearch and Kibana.

## Overview

The resources directory is organized into separate subdirectories: 
 
 * **cluster/**: Contains cluster-wide resources and configurations, including the ECK Custom Resource Definitions (CRDs), the ECK Operator, and the ClusterIssuer for SSL certificate issuance.
 * [**elasticsearch/base**](k8s/resources/elasticsearch/base/README.md): Contains the manifests for deploying a basic stack with Elasticsearch and Kibana. 
 * **elasticsearch/ingress/**: Manifest to set up ingress resources for external access. An ingress controller must be available in the cluster in order for this to work.
 * **elasticsearch/apm/**: Elastic Application Performance Monitoring (APM) server.
