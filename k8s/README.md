# K8s Resources

This directory contains the Kubernetes manifests for deploying and managing the Elastic Stack and other related resoures in your Kubernetes cluster. The resources are modular and can be used in different combinations to customize the setup. 

## Overview

The resources directory is organized into separate subdirectories: 
 
 * [**cluster/**](cluster/): Contains cluster-wide resources and configurations, including the ECK Custom Resource Definitions (CRDs), the ECK Operator, and the ClusterIssuer for SSL certificate issuance.
 * [**elasticsearch/base**](elasticsearch/base/): Contains the manifests for deploying a basic stack with Elasticsearch and Kibana. 
 * [**elasticsearch/ingress**](elasticsearch/ingress/): expose Kibana service externally via ingress through a trusted ssl-protected https endpoint.
 * [**elasticsearch/fleets**](elasticsearch/fleet/): Set up a fleet server and an elastic agent. 
 * [**elasticsearch/apm/**](elasticsearch/apm/): Application Performance Monitoring (APM) server.
 * [**elasticsearch/ml/**](elasticsearch/ml/): Add a dedicated machine learning elasticsearch node.

## DNS Configuration for Ingress

The `ingress.yaml` file under elasticsearch/ingress uses a placeholder `{{dns_hostname}}` for the DNS hostname. This value should be replaced with the actual DNS hostname during deployment.
