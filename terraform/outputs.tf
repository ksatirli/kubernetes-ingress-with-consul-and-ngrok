output "command_ngrok_tunnel" {
  description = "Command to create an ngrok Tunnel."
  value       = "ngrok http --domain='${ngrok_reserved_domain.main.name}' ${var.sample_app_port}"
}
