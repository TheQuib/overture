variable "pm_api_url" {
    type = string
}

variable "pm_api_token_id" {
    type = string
}

variable "pm_api_token_secret" {
    type = string
    sensitive = true
}

variable "pm_target_node" {
    type = string
}

variable "pm_clone_name" {
    type = string
}

variable "pm_disk_storage" {
    type = string
}

variable "linux_user" {
    type = string
}

variable "linux_password" {
    type = string
    sensitive = true
}

variable "linux_sshKeys" {
    type = string
    sensitive = true
}

variable "linux_sshPrivKey" {
    type = string
    sensitive = true
}