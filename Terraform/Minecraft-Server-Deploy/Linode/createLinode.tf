resource "linode_instance" "minecraft" {
    label = var.linode_instance_label
    image = var.linode_instance_image
    region = var.linode_instance_region
    type = var.linode_instance_type
    #authorized_keys = var.linode_instance_ssh_keys
    root_pass = var.linode_instance_root_pass
    tags = ["terraform", "minecraft"]

    connection {
        type = "ssh"
        user = "root"
        password = var.linode_instance_root_pass
        host = self.ip_address
    }

    provisioner "file" {
        source = "docker-compose.yml"
        destination = "/root/docker-compose.yml"
    }

    provisioner "remote-exec" {
        inline = [
            "apt update",
            # Install Docker dependencies
            "apt install ca-certificates curl gnupg lsb-release -y",
            # Install Docker with convinience script
            "curl -fsSL https://get.docker.com -o get-docker.sh",
            "chmod +x get-docker.sh",
            "./get-docker.sh",
            # Run Minecraft server from docker-compose.yml file
            "docker compose up -d"
        ]
    }
}