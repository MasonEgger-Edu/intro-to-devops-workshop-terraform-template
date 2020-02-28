variable do_token {}
variable domain_name {}

provider digitalocean {
    token = var.do_token
}

data "digitalocean_domain" "web" {
    name = var.domain_name
}

resource "digitalocean_record" "COPY_THIS_AND_PUT_YOUR_NAME" {
    domain = data.digitalocean_domain.web.name
    type   = "A"
    name   = "my-dns-record"
    value  = "PUT_YOUR_IP_HERE"
    ttl    = 30
}
