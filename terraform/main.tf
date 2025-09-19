terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  project     = var.gcp_project
  region      = var.gcp_region
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = module.gke.cluster_endpoint
  cluster_ca_certificate = module.gke.cluster_ca_certificate
  token                  = data.google_client_config.default.access_token
}

provider "helm" {
  kubernetes {
    host                   = module.gke.cluster_endpoint
    cluster_ca_certificate = module.gke.cluster_ca_certificate
    token                  = data.google_client_config.default.access_token
  }
}

# Call GCP Module
module "gke" {
  source = "./modules/gke"
  demo_name = var.demo_name
  gcp_project = var.gcp_project
  gcp_region = var.gcp_region
  gcp_location = var.gcp_location
  dns_hostname = var.dns_hostname
  dns_managed_zone = var.dns_managed_zone
}

output "gke_cluster_name" {
  value = module.gke.cluster_name
}

output "gke_cluster_region" {
  value = module.gke.cluster_region
}

output "gke_cluster_endpoint" {
  value = module.gke.cluster_endpoint
}

output "public_ip" {
  value = module.gke.ingress_ip
}

#output "cluster_ca_certificate" {
#  value = module.gke.cluster_ca_certificate
#}

# Call Helm Module
module "helm" {
  source = "./modules/helm"

  # Pass the GKE cluster details to the Helm module
  gke_cluster_endpoint      = module.gke.cluster_endpoint
  gke_cluster_ca_certificate = module.gke.cluster_ca_certificate
  gke_cluster_token         = data.google_client_config.default.access_token
  ingress_ip                = module.gke.ingress_ip
}

# Optionally call Ollama Module
module "ollama" {
  source = "./modules/ollama"
  gcp_project = var.gcp_project
  gcp_location = var.gcp_location
  demo_name = var.demo_name

  # Pass the networking information from the GKE module, so the K8s cluster and the VM are in the same subnet
  gcp_vpc_name             = module.gke.gcp_vpc_name
  gcp_vpc_self_link        = module.gke.gcp_vpc_self_link
  gcp_vpc_subnet_self_link = module.gke.gcp_vpc_subnet_self_link
  gcp_vpc_pod_cidr         = module.gke.pod_cidr

  # Only deploy if the flag is true
  count = var.deploy_ollama ? 1 : 0
}

# Optionally call Opentel Module
module "opentel" {
  source = "./modules/opentel"
 
  # Pass the GKE cluster details to the Helm module
  gke_cluster_endpoint      = module.gke.cluster_endpoint
  gke_cluster_ca_certificate = module.gke.cluster_ca_certificate
  gke_cluster_token         = data.google_client_config.default.access_token

  # Only deploy if the flag is true
  count = var.deploy_opentel ? 1 : 0
}
