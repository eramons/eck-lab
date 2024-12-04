############
# GoogleVM #
############

# Firewall rule to allow SSH traffic via IAP only
resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.demo_name}-allow-ssh-iap"
  network    = var.gcp_vpc_self_link 

  # Allow TCP ingress traffic from IAP's IP range on port 22
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Define the source range for IAP
  source_ranges = ["35.235.240.0/20"]

  target_tags = ["ssh-access"]  # Tag to apply to VM for this rule
}

# Firewall rule to allow the elasticsearch pods to connect to the ollama VM
resource "google_compute_firewall" "allow_gke_to_vm" {
  name    = "${var.demo_name}-allow-gke-to-vm"
  network = "${var.gcp_vpc_name}"
  priority = 1000
  direction = "INGRESS"

  # Allow traffic from GKE Pod CIDR
  source_ranges = ["10.124.0.0/14"]

  # Target the specific VM by its network tag
  target_tags = ["${var.demo_name}-ollama-vm"] # Ensure this tag is added to your VM

  # Allow traffic on the Llama model port (11434)
  allow {
    protocol = "tcp"
    ports    = ["11434"]
  }
}

# Configure the VM
resource "google_compute_instance" "ollama_vm" {
  name         = "${var.demo_name}-ollama-vm"
  machine_type = "n1-standard-2"
  zone         = var.gcp_location

  # Define the boot disk and its image
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-focal-v20241016"
      size  = 20
    }
  }

  # Network configuration to use internal IP only
  network_interface {
    network    = var.gcp_vpc_self_link 
    subnetwork = var.gcp_vpc_subnet_self_link 

    # Assign an external IP so the VM can connect to Internet
    access_config {}
  }

   # Attach the firewall tag for SSH access
  tags = ["ssh-access", "${var.demo_name}-ollama-vm"]  # This allows the firewall rule to apply

  # Startup script to install Ollama
  metadata_startup_script = <<-EOT
  #!/bin/bash
  echo "Starting Ollama installation" > /var/log/ollama-install.log

  # Run the installation script directly from Ollama's website
  curl -fsSL https://ollama.com/install.sh | sh >> /var/log/ollama-install.log 2>&1

  # Verify if Ollama is installed
  if command -v ollama > /dev/null; then
      echo "Ollama installation complete" >> /var/log/ollama-install.log
  else
      echo "Ollama installation failed" >> /var/log/ollama-install.log
  fi

  # Modify systemd service to bind Ollama to 0.0.0.0
  echo "Setting OLLAMA_HOST=0.0.0.0 in the systemd service" >> /var/log/ollama-install.log
  echo "Environment=OLLAMA_HOST=0.0.0.0" | sudo tee -a /etc/systemd/system/ollama.service >> /var/log/ollama-install.log

  # Reload systemd and restart Ollama service
  echo "Reloading systemd and restarting Ollama service" >> /var/log/ollama-install.log
  sudo systemctl daemon-reload
  sudo systemctl enable ollama
  sudo systemctl restart ollama

  # Start the Ollama service
  systemctl start ollama || echo "Failed to start Ollama service" >> /var/log/ollama-install.log

  # Verify Ollama is running
  if ps aux | grep '[o]llama' > /dev/null; then
      echo "Ollama is running" >> /var/log/ollama-install.log
  else
      echo "Ollama failed to start" >> /var/log/ollama-install.log
      exit 1
  fi

EOT

}

