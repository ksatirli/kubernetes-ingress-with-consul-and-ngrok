# This is a Terraform-managed file; manual changes will be overwritten.
# see https://github.com/workloads/github-organization/blob/main/templates/.tflint.hcl

# https://github.com/terraform-linters/tflint/blob/master/docs/user-guide/module-inspection.md
config {
  module = false
}

plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

# see https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_naming_convention.md
rule "terraform_naming_convention" {
  enabled = true
  format  = "snake_case"
}

# see https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_comment_syntax.md
rule "terraform_comment_syntax" {
  enabled = true
}

# see https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_documented_outputs.md
rule "terraform_documented_outputs" {
  enabled = true
}

# see https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_documented_variables.md
rule "terraform_documented_variables" {
  enabled = true
}

# see https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_workspace_remote.md
rule "terraform_workspace_remote" {
  enabled = true
}
