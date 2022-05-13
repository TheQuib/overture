variable linode_token {
    type = string
    description = "API token created in linode with access to desired resources"
    sensitive = true
}

# Instance Settings
variable linode_instance_label {
    type = string
    description = "Label for the Linode instance"
}
variable linode_instance_image {
    type = string
    description = "Image for the Linode instance"
}
variable "linode_instance_region" {
    type = string
    description = "Region to place the Linode instance"
}
variable "linode_instance_type" {
    type = string
    description = "Type of Linode instance to create"
}
variable "linode_instance_ssh_keys" {
    type = list
    description = "List of authorized SSH keys to install on the instance"
}
variable "linode_instance_root_pass" {
    type = string
    description = "Root password for Linode instance"
    sensitive = true
}

# Minecraft settings
variable "minecraft_server_url" {
    type = string
    description = "URL of server jarfile to download"
}