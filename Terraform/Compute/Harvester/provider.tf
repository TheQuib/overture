terraform {
  required_version = ">= 0.13"
  required_providers {
    harvester = {
      source  = "harvester/harvester"
      version = "0.3.2"
    }
  }
}

provider "harvester" {
    kubeconfig = var.kubeconfig
}