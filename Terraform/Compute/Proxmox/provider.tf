terraform {

    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
            source = "Telmate/proxmox"
            version = "2.9.8"
        }
    }
}

provider "proxmox" {
    pm_api_url = var.pm_api_url
    pm_api_token_id = var.pm_api_token_id
    pm_api_token_secret = var.pm_api_token_secret

    # If your Proxmox server doesn't have a trusted certificate,
    # Uncomment the following line:
    #pm_tls_insecure = true
}