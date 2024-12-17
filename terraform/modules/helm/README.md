# Helm Module

This module installs utility software packaged as helm charts. 

The Helm module deploys following resources:

* [**Ingress-NGINX**](https://kubernetes.github.io/ingress-nginx/) ingress controller, for managing SSL termination and forwarding external requests to the kibana service.
* [**Certificate Manager**](https://cert-manager.io/), to retry valid and trusted certificates from Mozilla's Let's Encrypt certificate authority for the external kibana endpoint.
* [**Kube-state-metrics**](https://github.com/kubernetes/kube-state-metrics), a utility to expose telemetry data from the GKE cluster, enabling Elastic's K8s integration to gather and visualize K8s metrics in kibana.
