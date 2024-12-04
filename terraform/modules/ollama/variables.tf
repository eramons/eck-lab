variable "demo_name" {
  description = "Used as prefix for the GCP resource names"
  type        = string
}

variable "gcp_project" {
  description = "GCP project of the Cloud DNS service hosting the DNS record"
  type        = string
}

variable "gcp_location" {
  description = "Zone for the 1-node GKE cluster"
  type        = string
}

variable "gcp_vpc_name" {
  description = "The name of the VPC the VM for Ollama should be attached to"
  type        = string
}

variable "gcp_vpc_self_link" {
  description = "The self_link of the VPC"
  type        = string
}

variable "gcp_vpc_subnet_self_link" {
  description = "The self_link of the subnet in the VPC"
  type        = string
}
