resource "proxmox_vm_qemu" "terraform" {
    name = var.pm_vm_name
    target_node = var.pm_target_node
    clone = var.pm_clone_name

    # If you want to set a custom ID
    # Default is the next-up ID starting from 100
    #vmid = 100

    # Set if you want to assign to a resource pool
    #pool = ""

    cores = 2
    sockets = 1
    memory = 2048

    # If you want to add more disks
    #disk {
    #    storage = var.pm_disk_storage
    #    type = "virtio"
    #    size = "32G"
    #    format = "qcow2"
    #}

    os_type = "cloud-init"

    # Network Config
    network {
        bridge = "vmbr0"
        model = "virtio"
        # VLAN tag
        tag = "50"
    }
    # Static IP:
    #ipconfig0 = "ip=192.168.100.50/24,gw=192.168.100.1"

    # OR
    
    # Dynamic IP:
    ipconfig0 = "ip=dhcp"
    nameserver = "192.168.23.104"

    # Authentication settings
    ssh_user = var.linux_user
    ciuser = var.linux_user
    cipassword = var.linux_password
    sshkeys = var.linux_sshKeys

    # Provisioner connection settings
    connection {
        type = "ssh"
        user = var.linux_user
        private_key = var.linux_sshPrivKey
        host = self.ssh_host
        port = self.ssh_port
    }
    # Provisioner actions
    provisioner "remote-exec" {
        inline = [
            "ip a"
        ]
    }
}