variable "aws_region" {
  type        = string
  description = "AWS Region to provision resources in."
  default     = "us-west-2"
}

variable "project_identifier" {
  type        = string
  description = "Project Identifier."
  default     = "consul-ngrok"
}
