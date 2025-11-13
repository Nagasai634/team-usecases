provider "google" {
  project = "venkat-473005"
  region  = "us-central1"
  #credentials = file("creds.json")
}

resource "google_compute_instance" "vms" {
  count        = 2
  name         = "terraform-${count.index}"
  zone         = "us-central1-a"
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {

    }
  }
  metadata_startup_script = <<-EOF
    #!/bin/bash
    set -e
    exec > >(tee /var/log/startup-script.log) 2>&1
    echo "=== Starting inline startup script ==="
    apt-get update -y
    apt-get install -y nginx
    systemctl start nginx
    systemctl enable nginx
    echo "Nginx installed and started successfully"
    EOF
}
