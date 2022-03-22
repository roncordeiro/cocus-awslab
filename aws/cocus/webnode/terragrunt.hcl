include {
  path = find_in_parent_folders()
}

dependency "infra" {
  config_path = "../network"
  skip_outputs = false

  mock_outputs = {
    vpc_id     = "vpc-065d2ecebd22d533c"
  }
}

inputs = {
  vpc_id            = "vpc-0f88ff4b0d725c4b8" #dependency.infra.outputs.vpc_id
  public_subnet_ids = ["subnet-00fdc6a10ef6b7abf"] #dependency.infra.outputs.public_subnets_ids
}

generate "provider" {
  path = "_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
#
# Provider AWS
# Se colocar ALIAS, dá ruim
#
provider "aws" {
  region  = var.region
  profile = var.profile
}
variable "region" {
  type        = string
}

variable "profile" {
  type = string
}
EOF
}