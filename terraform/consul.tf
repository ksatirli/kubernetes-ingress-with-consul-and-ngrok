# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress_v1
resource "kubernetes_ingress_v1" "ingress_consul" {
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
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
