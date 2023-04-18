# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest
resource "kubernetes_manifest" "consul_intention" {
  manifest = {
    "apiVersion" = "consul.hashicorp.com/v1alpha1"
    "kind"       = "ServiceIntentions"

    "metadata" = {
      "name"      = "ngrok-ingress-controller-kubernetes-ingress-controller"
      "namespace" = "default"
    }

    "spec" = {
      "destination" = {
        "name" = "dashboard"
      }

      "sources" = [{
        action = "allow"
        name   = "ngrok-ingress-controller-kubernetes-ingress-controller"
      }]
    }
  }
}
