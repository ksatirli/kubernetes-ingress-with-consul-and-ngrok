# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster
data "aws_eks_cluster" "main" {
  name = var.project_identifier
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_authr
data "aws_eks_cluster_auth" "main" {
  name = var.project_identifier
}
