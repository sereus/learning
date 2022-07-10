terraform {
  required_providers {
    google = {
        source  = "hashicorp/google"
        version = "~>3.0"
    }
  }
}

variable "gcp_region" {
    type = string
    description = "Region for GCP provider"
    default = "europe-central2"  
}

variable "gcp_project" {
  type        = string
  description = "Project to use for this config"
  default = "solidpotential"
}

variable "europe_central" {
    type = string
    description = "Zone for Europe"
    default = "europe-central2-a"
}

provider "google" {
    credentials = file("~/Nauka/terraform/jsons/cred/solidpotential-27c53dd26c1a.json")
    region  = var.gcp_region
    project = var.gcp_project
    zone    = var.europe_central
}

resource "google_compute_network" "vpc_solid" {
  name = "solid-lab-network"
}

resource "google_compute_instance" "task-1" {
  name         = "task-1"
  machine_type = "e2-micro"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
    }
  
  network_interface {
    network = "solid-lab-network"
    }
  }
