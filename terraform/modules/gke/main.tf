###############
# VPC Network #
###############

resource "google_compute_network" "vpc" {
  name                    = "${var.demo_name}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.demo_name}-subnet"
  region        = var.gcp_region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}

output "gcp_vpc_name" {
  value = google_compute_network.vpc.name
}

output "gcp_vpc_self_link" {
  value = google_compute_network.vpc.self_link
}

output "gcp_vpc_subnet_self_link" {
  value = google_compute_subnetwork.subnet.self_link
}


####################
# Public static IP #
####################
resource "google_compute_address" "default" {
  name   = "${var.demo_name}-static-ip-address"
  region = var.gcp_region
}

output "ingress_ip" {
  value = google_compute_address.default.address
}

###############
# GKE cluster #
###############

# Use a data source to retrieve the K8s cluster credentials
data "google_client_config" "default" {}

# K8s Cluster
resource "google_container_cluster" "primary" {
  name     = "${var.demo_name}-gke"
  # Provide location instead of region for 1-zone cluster
  location   = var.gcp_location
  #location  = var.gcp_region
  initial_node_count = 1  
  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  # Allow terraform to destroy the cluster 
  deletion_protection = false

  # kube-state-metrics
  monitoring_config {
  }

  # Manage the node pool separately
  remove_default_node_pool = true
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = google_container_cluster.primary.name
  # Providing location instead of region for 1-zone cluster 
  location   = var.gcp_location
  #location = var.gcp_region
  cluster    = google_container_cluster.primary.name
  node_count = 1 
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    # preemptible  = true
    machine_type = "n1-standard-4"
    tags         = ["gke-node", "${var.demo_name}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_region" {
  value = google_container_cluster.primary.location
}

output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "cluster_ca_certificate" {
  value = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
}

output "pod_cidr" {
  value = google_container_cluster.primary.cluster_ipv4_cidr
}


################
# DNS A Record #
################

resource "google_dns_record_set" "a" {
  name         = var.dns_hostname
  managed_zone = var.dns_managed_zone
  type         = "A"
  ttl          = 300
  rrdatas      = [google_compute_address.default.address]
}
