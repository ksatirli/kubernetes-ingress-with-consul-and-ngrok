variable "kubernetes_cluster_ip" {
  type        = string
  description = "Shipyard-provided Kubernetes Cluster IP."
}

variable "kubernetes_config_path" {
  type        = string
  description = "Path to `kubectl` Configuration."

  # If not using Shipyard, use the default `kubectl` configuration path
  # default     = "~/.kube/config"

  # If using Shipyard, use the default path for Shipyard's kubectl configuration
  default = "./shipyard.kubectl_config"
}

variable "kubernetes_context" {
  type        = string
  description = "Kubernetes Context."
  default     = "default"
}

variable "ngrok_apikey" {
  type        = string
  description = "ngrok API Key."
  sensitive   = true
}

variable "ngrok_authtoken" {
  type        = string
  description = "ngrok CLI Auth Token."
  sensitive   = true
}

variable "ngrok_domain" {
  type        = string
  description = "ngrok Custom Domain."
}

variable "sample_app_port" {
  type        = number
  description = "Sample Application Network Port."
  default     = 80
}
