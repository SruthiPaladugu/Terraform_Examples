terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.87.0"
    }
  }
}

provider "google" {
  credentials = file("my_Key.json")
  project = "terraformdemo1-327716"
  region  = "us-central1"
}

resource "google_container_cluster" "primary" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      foo = "bar"
    }
    tags = ["foo", "bar"]
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}