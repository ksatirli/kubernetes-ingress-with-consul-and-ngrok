# see https://github.com/ngrok/kubernetes-ingress-controller#installation
# and https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release
resource "helm_release" "ngrok_ingress_controller" {
  name = "ngrok-ingress-controller"

  # see https://github.com/ngrok/kubernetes-ingress-controller
  repository = "https://ngrok.github.io/kubernetes-ingress-controller"
  chart      = "kubernetes-ingress-controller"
  namespace  = "default"

  # see https://github.com/ngrok/kubernetes-ingress-controller/releases/tag/kubernetes-ingress-controller-0.6.0
  version = "0.6.0"

  values = [
    templatefile("./templates/ngrok.values.tftpl.yml", {
      kubernetes_cluster_ip = var.kubernetes_cluster_ip
    })
  ]

  set {
    name  = "credentials.apiKey"
    value = var.ngrok_apikey
  }

  set {
    name  = "credentials.authtoken"
    value = var.ngrok_authtoken
  }

  set {
   name = "consul.hashicorp.com/connect-service"
   value = "ngrok-ingress-controller-kubernetes-ingress-controller"
  }
}

# see https://github.com/ngrok/kubernetes-ingress-controller/tree/main/docs/examples/consul#installing-the-ingress-controller
# and https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service
resource "kubernetes_service" "ngrok_ingress_controller" {
  metadata {
    name      = "ngrok-ingress-controller-kubernetes-ingress-controller"
    namespace = "default"

    labels = {
      app = "ngrok-ingress-controller-kubernetes-ingress-controller"
    }
  }

  spec {
    port {
      name        = "http"
      protocol    = "TCP"
      port        = var.sample_app_port
      target_port = "${var.sample_app_port}"
    }

    selector = {
      "app.kubernetes.io/name" = "kubernetes-ingress-controller"
    }
  }
}
