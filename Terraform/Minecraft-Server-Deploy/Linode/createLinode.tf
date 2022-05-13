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

    provisioner "remote-exec" {
        inline = [
            "apt update",
            "apt install openjdk-17-jre -y",
            "wget -O server.jar ${var.minecraft_server_url}",
            "java -Xmx1024M -Xms1024M -jar server.jar nogui",
            "sed -i 's/eula=false/eula=true/' eula.txt",
            "java -Xmx1024M -Xms1024M -jar server.jar nogui"
        ]
    }
}