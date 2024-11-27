# K8s Resources

This directory contains the Kubernetes manifests for deploying and managing the Elastic Stack and other related resoures in your Kubernetes cluster. The resources are modular and can be used in different combinations to customize the setup. 

## Overview

The resources directory is organized into separate subdirectories: 
 
 * **cluster/**: Contains cluster-wide resources and configurations
 * **elasticsearch/base**: Contains the manifests for deploying a basic stack with Elasticsearch and Kibana. 
 * **elasticsearch/ingress/**: Manifest to set up ingress resources for external access. An ingress controller must be available in the cluster in order for this to work.
 * **elasticsearch/apm/**: Elastic Application Performance Monitoring (APM) server.

## DNS Hostname Configuration for elasticsearch/ingress

The `ingress.yaml` file under elasticsearch/ingress uses a placeholder `{{dns_hostname}}` for the DNS hostname. This value should be replaced with the actual DNS hostname during deployment.

You can replace it manually or use the following command to do it dynamically with `envsubst`:

### Manually Replacing the Hostname

Open the `ingress.yaml` file and replace the placeholder `{{dns_hostname}}` with the actual DNS hostname.

### Using `envsubst` to Dynamically Replace the Hostname

You can also dynamically replace the placeholder using the following command:

```bash
export dns_hostname=your-dynamic-hostname.example.com
envsubst < ingress.yaml | kubectl apply -f -

