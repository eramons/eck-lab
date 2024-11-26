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

variable "gcp_key_path" {
  description = "API key for GCP"
  type        = string
  sensitive   = true
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

