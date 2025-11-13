provider "google" {
    project = ""
    region = ""
    credentials = file("")
}

resource "google_compute_instance" "vm" {
    count = 2
    name = "vm-${count.index}"
    zone = ""
    machine_type = ""
    boot_disk {
      initialize_params {
        image = ""
      }
    }
    network_interface {
      network = ""
      access_config {
        
      }
    }
    metadata_startup_script = file("startup-script.sh")
}