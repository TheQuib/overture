provider "cloudflare" {
  api_token = var.cf_api_token
}

provider "random" {
}

provider "local" {
}

provider "proxmox" {
  pm_api_url = var.pm_api_url
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
}