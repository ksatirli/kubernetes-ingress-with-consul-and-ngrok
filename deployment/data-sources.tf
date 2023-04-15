# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region
data "aws_region" "current" {}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current" {}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones
data "aws_availability_zones" "available" {}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "eks_default" {
  most_recent = true

  owners = [
    "amazon"
  ]

  filter {
    name = "name"

    values = [
      "amazon-eks-node-${local.cluster_version}-v*"
    ]
  }
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "eks_default_arm" {
  most_recent = true

  owners = [
    "amazon"
  ]

  filter {
    name = "name"

    values = [
      "amazon-eks-arm64-node-${local.cluster_version}-v*"
    ]
  }
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "eks_default_bottlerocket" {
  most_recent = true

  owners = [
    "amazon"
  ]

  filter {
    name = "name"

    values = [
      "bottlerocket-aws-k8s-${local.cluster_version}-x86_64-*"
    ]
  }
}