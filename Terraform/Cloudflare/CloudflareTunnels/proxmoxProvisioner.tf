resource "proxmox_lxc" "cloudflareTunnel_container" {
    pm_target_node = var.pm_target_node
    hostname = "cloudflareTunnel"
    ostemplate = "${pm_img_storage_location}:${pm_img_name}"
    unprivileged = true
    ostype = "ubuntu"
    ssh_public_keys = var.pm_ct_pubKey
    rootfs {
        storage = var.pm_ct_location
        size = "8G"
    }
    network {
        name = "eth0"
        bridge = "vmbr0"
        ip = "dhcp"
    }
    features {
        nesting = true
    }


    connection {
        type = "ssh"
        host = proxmox_lxc.cloudflareTunnel_container.ip
        user = var.pm_ct_username
        private_key = var.pm_ct_privKey
    }

    provisioner "file" {
        source = "${path.module}/docker-compose.yml"
        destination = "docker-compose.yml"
    }

    provisioner "remote-exec" {
        inline = [
            "docker compose up -d"
        ]
    }

    provisioner "remote-exec" {
        when = destroy
        inline = [
            "docker compose down",
            "rm -f docker-compose.yml"
        ]
    }
}

# Create file
resource "local_file" "compose_file" {
  depends_on = [ cloudflare_tunnel.terraform_tunnel ]
  filename = "${path.module}/docker-compose.yml"
  content = local.compose_file_contents
}