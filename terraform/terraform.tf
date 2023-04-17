terraform {
  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/helm/2.9.0
    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/kubernetes/2.19.0
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.19.0"
    }

    # see https://registry.terraform.io/providers/ngrok/ngrok/0.1.4
    ngrok = {
      source  = "ngrok/ngrok"
      version = "0.1.4"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.4.5"
}
