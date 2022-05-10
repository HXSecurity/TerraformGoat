provider "google" {
  region  = "us-central1"
  project = var.gcp_project_id
}

resource "google_compute_instance" "huoxian_terraform_goat_instance" {
  name         = "huoxian-terraform-goat-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  depends_on = [
    google_compute_network.huoxian_terraform_goat_vpc,
    google_compute_subnetwork.huoxian_terraform_goat_subnetwork
  ]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
  network_interface {
    network    = google_compute_network.huoxian_terraform_goat_vpc.name
    subnetwork = google_compute_subnetwork.huoxian_terraform_goat_subnetwork.name
    access_config {
    }
  }

  metadata = {
    startup-script = <<EOF
#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install apache2
sudo apt-get -y install php
sudo apt-get -y install php-curl
sudo sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
sudo /etc/init.d/apache2 restart
cd /var/www/html
sudo apt-get -y install wget
sudo wget https://huocorp-oss.oss-cn-beijing.aliyuncs.com/terraform-goat-dependency-files/command-execution-lab.zip
sudo apt-get -y install unzip
sudo unzip command-execution-lab.zip
sudo mv ./command-execution-lab/static/flag69152201.txt /
EOF
  }
}

resource "google_compute_network" "huoxian_terraform_goat_vpc" {
  name                    = "huoxian-terraform-goat-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "huoxian_terraform_goat_subnetwork" {
  name          = "huoxian-terraform-goat-subnetwork"
  ip_cidr_range = "10.77.0.0/20"
  network       = google_compute_network.huoxian_terraform_goat_vpc.name
  region        = "us-central1"
  depends_on    = [google_compute_network.huoxian_terraform_goat_vpc]
}

resource "google_compute_firewall" "huoxian_terraform_goat_firewall" {
  name       = "huoxian-terraform-goat-firewall"
  network    = google_compute_network.huoxian_terraform_goat_vpc.name
  depends_on = [google_compute_network.huoxian_terraform_goat_vpc]

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_network" "huoxian_terraform_goat_network" {
  name = "huoxian-terraform-goat-network"
}