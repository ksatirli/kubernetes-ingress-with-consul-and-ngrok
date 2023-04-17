# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace
resource "kubernetes_namespace" "main" {
  metadata {
    name = var.project_identifier
  }
}
