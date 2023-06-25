variable "tunnel_setup_local" {
    type = bool
    description = "Switch to determine whether or not to set up the local tunnel server"
}

variable "tunnel_setup_type" {
    type = string
    description = "Value to set to determine what type to set up... Acceptable values are ec2"

    validation {
      condition = contains(["ec2", "azure", "proxmoxVm", "proxmoxCt"], var.tunnel_setup_type)
      error_message = "The tunnel_setup_type value must be a valid choice of \"ec2\", \"azure\", \"proxmoxVm\", or \"proxmoxCt\""
    }
}

variable "cloudflare_api_token" {
    type = string
    description = "Your Cloudflare API token value"
}