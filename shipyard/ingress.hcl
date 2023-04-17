# see https://shipyard.run/docs/resources/ingress
ingress "public" {
  source {
    driver = "local"

    config {
      port = 19090
    }
  }

  destination {
    driver = "k8s"

    config {
      cluster = "k8s_cluster.${var.consul_k8s_cluster}"
      address = "api.default.svc"
      port    = 9090
    }
  }
}
