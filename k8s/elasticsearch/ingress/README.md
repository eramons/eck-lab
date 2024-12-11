# Ingress Overlay

This overlay is built on top of the basic configuration adding ingress resources to enable external access to Kibana. It relies on an ingress controller installed in your Kubernetes cluster to route traffic and manage SSL termination.

## Prerequisites

 * A K8s cluster with kubectl configured to access it 
 * An ingress controller installed in the Kubernetes cluster (nginx, traefik)
 * A valid DNS hostname for external access to the services

## Overview

This overlay includes:

 * Base: basic configuration for elasticsearch and kibana
 * Ingress: add an ingress to externally access the Kibana service over a trusted SSL-protected HTTPS endpoint.

## DNS Configuration for Ingress

The `ingress.yaml` file under elasticsearch/ingress uses a placeholder `{{dns_hostname}}` for the DNS hostname. This value should be replaced with the actual DNS hostname during deployment.
