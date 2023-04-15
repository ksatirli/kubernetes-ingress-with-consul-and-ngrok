variable "aws_region" {
  type        = string
  description = "AWS Region to provision resources in."
  default     = "eu-west-1"
}

variable "project_identifier" {
  type        = string
  description = "Project Identifier."
  default     = "consul-ngrok"
}

locals {
  cluster_version = "1.25"
  vpc_cidr        = "10.0.0.0/16"
  azs             = slice(data.aws_availability_zones.available.names, 0, 3)
}
