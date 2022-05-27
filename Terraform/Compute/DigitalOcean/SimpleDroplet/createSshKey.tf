resource "digitalocean_ssh_key" "default_key" {
    name = var.sshKey_name
    public_key = file(var.sshKey_file)
}