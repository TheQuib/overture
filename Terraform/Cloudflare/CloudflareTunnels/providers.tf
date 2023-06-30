provider "cloudflare" {
  api_token = var.cf_api_token
}

provider "random" {
}

provider "local" {
}