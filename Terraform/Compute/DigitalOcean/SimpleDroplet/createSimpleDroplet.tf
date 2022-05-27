resource "digitalocean_droplet" "simpleDroplet" {
    # Explicit dependency for creation of SSH key
    depends_on = [
      digitalocean_ssh_key.default_key
    ]

    name = var.droplet_name
    image = var.droplet_image
    region = var.droplet_region
    size = var.droplet_size
    ssh_keys = [digitalocean_ssh_key.default_key.fingerprint]
    monitoring = var.droplet_monitor
}