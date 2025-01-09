# K8s Resources

This directory contains the Kubernetes manifests for deploying and managing the Elastic Stack and other related resoures in a Kubernetes cluster. The resources are modular and can be used in different combinations to customize the setup. 

## Overview

The K8s resources are organized into separate subdirectories: 
 
 * [**cluster/**](cluster/): Contains cluster-wide resources and configurations, including the ECK Custom Resource Definitions (CRDs) and the ECK Operator.
 * [**elasticsearch/base**](elasticsearch/base/): Contains the manifests for deploying a basic stack with Elasticsearch and Kibana. 
 * [**elasticsearch/ingress**](elasticsearch/ingress/): expose Kibana service externally via ingress through a trusted ssl-protected https endpoint. It includes a ClusterIssuer for certificate issuance with Let's Encrypt.
 * [**elasticsearch/fleets**](elasticsearch/fleet/): Set up a fleet server and an elastic agent. 
 * [**elasticsearch/apm/**](elasticsearch/apm/): Application Performance Monitoring (APM) server.
 * [**elasticsearch/ml/**](elasticsearch/ml/): Add a dedicated machine learning elasticsearch node.
 * [**elasticsearch/search/**](elasticsearch/search/): Add Enterprise Search. 
