# Ingress Overlay

This overlay adds ingress resources to enable external access to Kibana. It relies on an ingress controller installed in your Kubernetes cluster to route traffic and manage SSL termination.

## Prerequisites
 
 * An ingress controller installed in the Kubernetes cluster (nginx, traefik)
 * A valid DNS hostname for external access to the services

## DNS Configuration for Ingress

The `ingress.yaml` file under elasticsearch/ingress uses a placeholder `{{dns_hostname}}` for the DNS hostname. This value should be replaced with the actual DNS hostname during deployment.

You can replace it manually or use the following command to do it dynamically with `envsubst`:

### Manually Replacing the Hostname

Open the `ingress.yaml` file and replace the placeholder `{{dns_hostname}}` with the actual DNS hostname.

### Using `envsubst` to Dynamically Replace the Hostname

You can also dynamically replace the placeholder using the following command:

```bash
export dns_hostname=your-dynamic-hostname.example.com
envsubst < ingress.yaml | kubectl apply -f -

