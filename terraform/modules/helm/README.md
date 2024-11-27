# Helm Module

This modules installs utility software packaged as helm charts. The idea is to use the `gke_cluster` outputs from the gke module as the K8s cluster to deploy the charts, but it's also possible to provide custom values to the variable so use this module independently.

## Resources

The Helm module deploys following resources:

* [**Ingress-NGINX**](https://kubernetes.github.io/ingress-nginx/) ingress controller, for managing SSL termination and forwarding external requests to the kibana service.
* [**Certificate Manager**](https://cert-manager.io/), to retry valid and trusted certificates from Mozilla's Let's Encrypt certificate authority for the external kibana endpoint.
* [**Kube-state-metrics**](https://github.com/kubernetes/kube-state-metrics), a utility to expose telemetry data from the GKE cluster, enabling Elastic's K8s integration to gather and visualize K8s metrics in Kibana.

## Variables

| Name                       | Description                                                            | Type   | Default | Required |
|----------------------------|------------------------------------------------------------------------|--------|---------|----------|
| `gke_cluster_endpoint`      | The endpoint for the GKE cluster.                                      | string |         | yes      |
| `gke_cluster_ca_certificate`| The certificate authority certificate for the GKE cluster.                    | string |         | yes      |
| `gke_cluster_token`         | The access token for authenticating with the GKE cluster.              | string |         | yes      |
| `ingress_ip`                | The static IP address to be used for the ingress controller service.   | string |         | yes      |
