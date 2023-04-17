# see https://registry.terraform.io/providers/hashicorp/helm/latest/docs
provider "helm" {
  kubernetes {
    config_path    = var.kubernetes_config_path
    config_context = var.kubernetes_context
  }
}

# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs#schema
provider "kubernetes" {
  config_path    = var.kubernetes_config_path
  config_context = var.kubernetes_context
}

# see https://registry.terraform.io/providers/ngrok/ngrok/latest/docs
provider "ngrok" {
  api_key      = var.ngrok_apikey
  api_base_url = "https://api.ngrok.com"
}
