resource "linode_instance" "web" {
    label = var.linode_instance_label
    image = var.linode_instance_image
    region = var.linode_instance_region
    type = var.linode_instance_type
    #authorized_keys = ["ssh-rsa AAAA...Gw== user@example.local"]
    root_pass = var.linode_instance_root_pass

    #group = "foo"
    #tags = [ "foo" ]
    #swap_size = 256
    #private_ip = true
}