variable cloudflare_email {
    type = string
    description = "Your email registered at Cloudflare"
}
variable cloudflare_api_key {
    type = string
    description = "Your cloudflare account API key"
}

variable cloudflare_zone_id {
    type = string
    description = "Your Cloudflare domain zone ID"
}

variable record_names {
    type = list
    description = "List of DNS names to create"
}
variable record_values {
    type = list
    description = "List of DNS values (addresses) for each name"
}
variable record_type {
    type = string
    description = "Type of record to create"
}
variable record_ttl {
    type = number
    description = "TTL of record to create, 1 = Auto, in seconds otherwise"
}
variable proxied {
    type = bool
    description = "Whether or not to proxy the records through Cloudflare's proxy"
}