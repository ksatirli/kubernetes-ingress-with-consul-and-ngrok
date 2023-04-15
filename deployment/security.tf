# see https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/4.7.0
module "irsa-ebs-csi" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "4.7.0"

  create_role  = true
  role_name    = "AmazonEKSTFEBSCSIRole-${module.eks.cluster_name}"
  provider_url = module.eks.oidc_provider

  role_policy_arns = [
    data.aws_iam_policy.ebs_csi_policy.arn
  ]

  oidc_fully_qualified_subjects = [
    "system:serviceaccount:kube-system:ebs-csi-controller-sa"
  ]
}