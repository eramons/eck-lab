variable "demo_name" {
  description = "Used as prefix for the GCP resource names"
  type        = string
}

variable "gcp_project" {
  description = "GCP project of the Cloud DNS service hosting the DNS record"
  type        = string
}

variable "gcp_region" {
  description = "Region of the GCP project"
  type        = string
}

variable "gcp_location" {
  description = "Zone for the 1-node GKE cluster"
  type        = string
}

variable "dns_hostname" {
  description = "Hostname associated with the public IP"
  type        = string
}

variable "dns_managed_zone" {
  description = "Managed zone to host the DNS record"
  type        = string
}

variable "deploy_ollama" {
  description = "Flag to control if the ollama module needs to be deployed"
  type        = bool
  default     = false
}

variable "deploy_opentel" {
  description = "Flag to control if the opentel module needs to be deployed"
  type        = bool
  default     = false
}
