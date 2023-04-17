# see https://dashboard.ngrok.com/cloud-edge/domains
# and https://registry.terraform.io/providers/ngrok/ngrok/latest/docs/resources/reserved_domain
resource "ngrok_reserved_domain" "main" {
  name = var.ngrok_domain

  #  # enable CA management ONLY if you use a custom domain. ngrok-managed domains provide their own TLS certificates
  #  certificate_management_policy {
  #    authority        = "letsencrypt"
  #    private_key_type = "ecdsa"
  #  }
}
