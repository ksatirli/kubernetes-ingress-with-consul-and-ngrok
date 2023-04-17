output "command_ngrok_tunnel" {
  description = "Command to create an ngrok Tunnel."
  value       = "ngrok http --domain='${ngrok_reserved_domain.main.name}' 80"
}
