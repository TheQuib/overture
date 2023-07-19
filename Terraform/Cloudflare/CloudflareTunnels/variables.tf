variable "cf_tunnel_name" {
    type = string
    description = "Desired name of tunnel"
}
variable "cf_api_token" {
    type = string
    description = "Your Cloudflare API token value"
    sensitive = true
}
variable "cf_account_id" {
    type = string
    description = "value"
}
variable "pm_api_url" {
    type = string
    description = "Proxmox API url to interact with"
}
variable "pm_api_token_id" {
    type = string
    description = "Proxmox API token ID"
}
variable "pm_api_token_secret" {
    type = string
    description = "Proxmox API token secret"
    sensitive = true
}
variable "pm_target_node" {
    type = string
    description = "Target Proxmox node to create CT on"
}
variable "pm_ct_username" {
    type = string
    description = "Username to use for CT creation"
    default = "admin"
}
variable "pm_ct_pubKey" {
    type = string
    description = "Public key to install on container"
}
variable "pm_ct_privKey" {
    type = string
    description = "Public key to use for provisioning"
    sensitive = true
}
variable "pm_img_storage_location" {
    type = string
    description = "Storage location of CT image"
    default = "local"
}
variable "pm_img_name" {
    type = string
    description = "Name of CT image to use"
    default = "ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}
variable "pm_ct_location" {
    type = string
    description = "Location to store the CT"
}