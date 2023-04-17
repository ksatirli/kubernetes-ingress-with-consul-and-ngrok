variable "consul_health_check_timeout" {
  default     = "240s"
  description = "Increase the timeout for when running on CI, Consul startup can take longer due to limited resources"
}

variable "consul_k8s_cluster" {
  default = "dc1"
}

variable "consul_k8s_network" {
  default = "dc1"
}

variable "consul_smi_controller_enabled" {
  description = "Should the SMI controller be installed"
  default     = false
}

variable "consul_acls_enabled" {
  description = "Enable ACLs for securing the Consul server"
  default     = true
}

variable "consul_tls_enabled" {
  description = "Enable TLS to secure the Consul server"
  default     = true
}

variable "consul_ingress_gateway_enabled" {
  description = "Should ingress gateways be enabled?"
  default     = true
}

variable "consul_mesh_gateway_enabled" {
  description = "Should mesh gateways be enabled?"
  default     = false
}

variable "consul_mesh_gateway_create_federation_secret" {
  description = "Should a federation secret be created?"
  default     = false
}

variable "consul_transparent_proxy_enabled" {
  description = "Enable the transparent proxy feature for then entire cluster for consul service mesh"
  default     = true
}

variable "consul_auto_inject_enabled" {
  description = "Enable the automatic injection of sidecar proxies for kubernetes pods"
  default     = true
}
