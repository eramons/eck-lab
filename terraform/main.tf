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
  credentials = var.gcp_key_path
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
  gcp_key_path = var.gcp_key_path
  dns_hostname = var.dns_hostname
  dns_managed_zone = var.dns_managed_zone
}

output "gke_cluster_endpoint" {
  value = module.gke.cluster_endpoint
}

output "cluster_ca_certificate" {
  value = module.gke.cluster_ca_certificate
}

# Call Helm Module
module "helm" {
  source = "./modules/helm"

  # depends_on = [null_resource.wait_for_k8s]

  # Pass the GKE cluster details to the Helm module
  gke_cluster_endpoint      = module.gke.cluster_endpoint
  gke_cluster_ca_certificate = module.gke.cluster_ca_certificate
  gke_cluster_token         = data.google_client_config.default.access_token
  ingress_ip                = module.gke.ingress_ip
}
