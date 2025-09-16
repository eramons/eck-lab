variable "gke_cluster_endpoint" {
  description = "The endpoint for the GKE cluster"
  type        = string
}

variable "gke_cluster_ca_certificate" {
  description = "The cluster CA certificate"
  type        = string
}

variable "gke_cluster_token" {
  description = "The token for the Kubernetes cluster"
  type        = string
}

variable "ingress_ip" {
  description = "The IP address for the ingress NGINX service"
  type        = string
}

variable "controller_type" {
  description = "Type of ingress controller to deploy: 'ingress' or 'gatewayapi'"
  type        = string
  default     = "ingress"
}
