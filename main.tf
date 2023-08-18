provider "google" {
  credentials = file("/Users/Cos-Ibe/sandbox-project-362420-658ff4695523.json")
  project = "PROJECT_ID"
  region  = "europe-west1"  # Change this to your desired region
}

resource "google_compute_instance" "hashicorp_instance" {
  name         = "hashicorp"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"
  tags         = ["hashicorp-vm"]
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install vault
  EOF
}
