terraform {
    required_version = ">= 0.13"
    required_providers {
        linode = {
        source  = "linode/linode"
        version = "1.27.2"
        }
    }
}

# Configure the Linode Provider
provider "linode" {
    token = var.linode_token
}