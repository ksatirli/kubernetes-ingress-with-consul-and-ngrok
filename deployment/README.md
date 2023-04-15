# EKS Cluster Deployment

> This directory contains [AWS](https://registry.terraform.io/providers/hashicorp/aws) Resources.

## Requirements

* [HashiCorp Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) `v1.4.5` or later
* AWS [account](https://aws.amazon.com/free/)

## Downstream Consumption

The Kubernetes Cluster can be consumed via the [aws_eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) data source:

```hcl
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster
data "aws_eks_cluster" "main" {
  name = "consul-ngrok"
}
```

<!-- BEGIN_TF_DOCS -->
## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| aws_region | AWS Region to provision resources in. | `string` | no |
| project_identifier | Project Identifier. | `string` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster_endpoint | Endpoint for EKS control plane |
| cluster_name | Kubernetes Cluster Name |
| cluster_security_group_id | Security group ids attached to the cluster control plane |
| command_install_consul | Command to install Consul on Kubernetes. |
| command_update_kubectl | Command to update kubectl configuration. |
<!-- END_TF_DOCS -->
