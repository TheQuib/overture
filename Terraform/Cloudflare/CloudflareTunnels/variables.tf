variable "tunnel_ip_address" {
    type = string
    description = "Your Cloudflare tunnel server's IP address"
}
variable "tunnel_username" {
    type = string
    description = "Username to authenticate to the tunnel server with"
}
variable "tunnel_privKey" {
    type = string
    description = "Private key to authenticate to the tunnel server with"
}

variable "cf_tunnel_name" {
    type = string
    description = "Desired name of tunnel"
}
variable "cf_api_token" {
    type = string
    description = "Your Cloudflare API token value"
}
variable "cf_account_id" {
    type = string
    description = "value"
}