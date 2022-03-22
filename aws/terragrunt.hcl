skip = true
locals {
    account = "aws"
}

remote_state {
  backend = "s3"
  generate = {
    path      = "_backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "awslab-terraform-bcp"
    key            = "${local.account}/${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "awslab-terraform-bcp"
    profile        = "protofire-devops"
  }
}

terraform {
  extra_arguments "conditional_vars" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh",
      "destroy"
    ]

    required_var_files = [
      "${get_parent_terragrunt_dir()}/terraform.tfvars.json"
    ]
  }

}