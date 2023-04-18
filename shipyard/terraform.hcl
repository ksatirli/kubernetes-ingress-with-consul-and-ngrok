# see https://shipyard.run/docs/resources/copy/
copy "kubectl_config" {
  source      = k8s_config(var.consul_k8s_cluster)
  destination = "../terraform/shipyard.kubectl_config"

  depends_on = [
    "module.consul"
  ]
}

template "kubernetes_cluster_ip" {
  source = <<EOF
# This is a Shipyard-managed file. Any manual changes will be overwritten.

kubernetes_cluster_ip = "${docker_ip()}"
EOF

  destination = "../terraform/shipyard-config.auto.tfvars"

  vars = {
    cluster_ip = "${docker_ip()}"
  }
}
