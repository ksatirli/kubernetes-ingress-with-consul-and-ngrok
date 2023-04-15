terraform {
  #  # see https://developer.hashicorp.com/terraform/language/settings/terraform-cloud
  #  cloud {
  #    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#organization
  #    organization = "ksatirli"
  #
  #    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#workspaces
  #    workspaces {
  #      name = "service-mesh-with-consul-and-ngrok-configuration"
  #    }
  #  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/4.63.0/
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.63.0, < 5.0.0"
    }

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
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.4.5"
}
