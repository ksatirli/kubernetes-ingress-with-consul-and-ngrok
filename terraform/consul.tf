# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress_v1
resource "kubernetes_ingress_v1" "consul" {
  metadata {
    name      = "ingress-consul"
    namespace = "default"
  }

  spec {
    ingress_class_name = "ngrok"

    rule {
      host = ngrok_reserved_domain.main.name

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "dashboard"

              port {
                number = var.sample_app_port
              }
            }
          }
        }
      }
    }
  }
}

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

      "sources" = [
        {
          action = "allow"
          name   = "ngrok-ingress-controller-kubernetes-ingress-controller"
        },
      ]
    }
  }
}