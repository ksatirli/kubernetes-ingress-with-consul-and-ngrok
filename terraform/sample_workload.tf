# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment
resource "kubernetes_deployment" "game_2048" {
  metadata {
    name = "game-2048"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "game-2048"
      }
    }

    template {
      metadata {
        labels = {
          app = "game-2048"
        }
      }

      spec {
        container {
          name  = "backend"
          image = "alexwhen/docker-2048"

          port {
            name           = "http"
            container_port = var.sample_app_port
          }
        }
      }
    }
  }
}

# see https://github.com/ngrok/kubernetes-ingress-controller/blob/main/docs/examples/hello-world/README.md#setup-ingress-for-a-service
# and https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service
resource "kubernetes_service" "game_2048" {
  metadata {
    name = "game-2048"
  }

  spec {
    port {
      name        = "http"
      port        = var.sample_app_port
      target_port = var.sample_app_port
    }

    selector = {
      app = "game-2048"
    }
  }
}

# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress_v1
resource "kubernetes_ingress_v1" "game_2048" {
  metadata {
    name = "game-2048"
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
              name = "game-2048"

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
