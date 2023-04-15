# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy
resource "aws_iam_policy" "node_additional" {
  name        = "${var.project_identifier}-additional"
  description = "Example usage of node additional policy"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]

        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# see https://registry.terraform.io/modules/terraform-aws-modules/key-pair/aws/2.0.2
module "key_pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "2.0.2"

  key_name_prefix    = var.project_identifier
  create_private_key = true
}

# see https://registry.terraform.io/modules/terraform-aws-modules/kms/aws/1.5.0
module "ebs_kms_key" {
  source  = "terraform-aws-modules/kms/aws"
  version = "1.5.0"

  description = "Customer managed key to encrypt EKS managed node group volumes"

  # Policy
  key_administrators = [
    data.aws_caller_identity.current.arn
  ]

  key_service_roles_for_autoscaling = [
    # required for the ASG to manage encrypted volumes for nodes
    "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling",
    # required for the cluster / persistentvolume-controller to create encrypted PVCs
    module.eks.cluster_iam_role_arn,
  ]

  aliases = [
    "eks/${var.project_identifier}/ebs"
  ]
}

# see https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/5.17.0
module "vpc_cni_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.17.0"

  role_name_prefix      = "VPC-CNI-IRSA"
  attach_vpc_cni_policy = true
  vpc_cni_enable_ipv6   = true

  oidc_providers = {
    main = {
      provider_arn = module.eks.oidc_provider_arn

      namespace_service_accounts = [
        "kube-system:aws-node"
      ]
    }
  }
}