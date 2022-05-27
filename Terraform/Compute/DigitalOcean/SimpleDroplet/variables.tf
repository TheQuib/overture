# Provider variable
variable digitalOcean_token {
    description = "Token recieved from the DigitalOcean API section"
    type = string
    sensitive = true
}

# SSH key creation variables
variable sshKey_name {
    description = "Name of SSH key to create"
    type = string
}
variable sshKey_file {
    description = "File location of SSH key"
    type = string
}

# Droplet variables
variable droplet_name {
    description = "Name of the Droplet to create"
    type = string
}
variable droplet_image {
    description = "Image to use for the Droplet"
    type = string
}
variable droplet_region {
    description = "Region to place the Droplet in"
    type = string
}
variable droplet_size {
    description = "Size of Droplet to create"
    type = string
}
variable droplet_monitor {
    description = "Whether or not to install DigitalOcean's monitor"
    type = bool
}