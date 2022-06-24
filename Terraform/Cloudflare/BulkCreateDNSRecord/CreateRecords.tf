resource "cloudflare_record" "create_records" {
  count = length(var.record_names)

  zone_id = var.cloudflare_zone_id
  name = element(var.record_names, count.index)
  value = element(var.record_values, count.index)
  type = var.record_type
  ttl = var.record_ttl
  proxied = var.proxied
}