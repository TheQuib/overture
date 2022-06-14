variable "pm_api_url" {
    type = string
    description = "Proxmox API endpoint url, ends with 'api2/json'"
}

variable "pm_api_token_id" {
    type = string
    description = "Proxmox API token ID (user)"
}

variable "pm_api_token_secret" {
    type = string
    sensitive = true
    description = "Proxmox API token secret (API Key)"
}

variable "pm_vm_name" {
    type = string
    description = "Name of VM to create"
}

variable "pm_target_node" {
    type = string
    description = "Node to create VM on"
}

variable "pm_clone_name" {
    type = string
    description = "Name of VM to clone from"
}

variable "pm_disk_storage" {
    type = string
    description = "Proxmox disk location to store VM"
}

variable "linux_user" {
    type = string
    description = "User to create on VM with cloud-init"
}

variable "linux_password" {
    type = string
    sensitive = true
    description = "Password to set on user with cloud-init"
}

variable "linux_sshKeys" {
    type = string
    description = "Public SSH keys to set with cloud-init"
}

variable "linux_sshPrivKey" {
    type = string
    sensitive = true
    description = "Private SSH key to authenticate to the VM with"
}