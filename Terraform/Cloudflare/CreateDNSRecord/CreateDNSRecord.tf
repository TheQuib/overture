resource "cloudflare_record" "single_record" {
  zone_id = var.cloudflare_zone_id
  name = "terraform"
  value = "8.8.8.8"
  type = "A"
  ttl = 1 # Automatic: 1, value in seconds otherwise
}