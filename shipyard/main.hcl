# see https://shipyard.run/docs/resources/k8s_cluster
k8s_cluster "dc1" {
  driver = "k3s"
  nodes  = 1

  network {
    name = "network.dc1"
  }
}

# see https://shipyard.run/docs/resources/module
module "consul" {
  source = "./modules/consul"
}

# see https://shipyard.run/docs/resources/k8s_config
k8s_config "app" {
  cluster = "k8s_cluster.dc1"

  paths = [
    "./app/consul-config.yaml",
  ]

  wait_until_ready = true

  depends_on = [
    "module.consul"
  ]
}