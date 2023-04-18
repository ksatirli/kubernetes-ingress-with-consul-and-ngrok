# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret
resource "kubernetes_secret" "dockerconfigjson" {
  metadata {
    name = "dockerconfigjson-github-com"
  }

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "ghcr.io" = {
          "auth" = base64encode("${var.ghcr_user}:${var.ghcr_token}")
        }
      }
    })
  }

  type = "kubernetes.io/dockerconfigjson"
}

