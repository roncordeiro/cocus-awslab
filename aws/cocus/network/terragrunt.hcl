include {
  path = find_in_parent_folders()
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