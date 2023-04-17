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
