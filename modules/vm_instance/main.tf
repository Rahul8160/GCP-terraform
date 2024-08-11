resource "google_compute_instance" "terra_instance" {
  name         = "terra_instance"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    access_config {
      // Ephemeral public IP
    }
  }
}
