# Create tunnel in Cloudflare dashboard
resource "cloudflare_tunnel" "terraform_tunnel" {
  account_id = var.cf_account_id
  name       =  var.cf_tunnel_name
  secret     = resource.random_string.cf_generated_secret.result
}

# Build docker-compose.yml into compose_file_contents variable
locals {
  compose_file_contents = <<-EOT
    ## docker-compose.yml
    ## Generated by Terraform
    version: '3.9'

    services:
      cloudflare_tunnel:
        container_name: cloudflaretunnel
        image: cloudflare/cloudflared:latest
        environment:
          - TUNNEL_TOKEN=${cloudflare_tunnel.terraform_tunnel.tunnel_token}
        command: tunnel --no-autoupdate run
  EOT
  compose_file_path = "/home/${var.tunnel_username}/docker-compose.yml"
}

# Create file
resource "local_file" "compose_file" {
  depends_on = [ cloudflare_tunnel.terraform_tunnel ]
  filename = "${path.module}/docker-compose.yml"
  content = local.compose_file_contents
}

resource "terraform_data" "docker-host" {
  depends_on = [ local_file.compose_file ]

  connection {
    type = "ssh"
    host = var.tunnel_ip_address
    user = var.tunnel_username
    private_key = var.tunnel_privKey
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
}

# On destroy - DOES NOT WORK
#resource "terraform_data" "docker-host" {
#  connection {
#    type = "ssh"
#    host = var.tunnel_ip_address
#    user = var.tunnel_username
#    private_key = var.tunnel_privKey
#  }
#
#  provisioner "remote-exec" {
    when = destroy
    inline = [
      "docker compose down",
      "rm -f docker-compose.yml"
    ]
#  }
#}