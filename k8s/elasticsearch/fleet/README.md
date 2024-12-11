# Fleet Overlay

This overlay is built on top of _base_. It deploys Fleet and the Elastic Agent as part of the Elastic Stack environment in Kubernetes. 

Fleet is used to manage and monitor Elastic Agents in a centralized manner. The Elastic Agents can be used to collect logs, metrics and APM data. 

## Prerequisites

 * Kubernetes Cluster: you need to have a running Kubernetes cluster with ```kubectl``` configured to access it.
 * Custom Resource Definitions and the ECK Operator
 * Elasticsearch and Kibana deployed as ECK resources and up and running

## Overview

The Fleet overlay inclues the following resources: 

 * Fleet server: The manifest for the fleet server which centrally manages the elastic agents.
 * Elastic Agent: A DaemonSet for deploying the elastic agent on all worker nodes to collect data for the K8s integration
 * Kibana Patch: Includes the definition of policies to add the K8s and Fleet integrations.
