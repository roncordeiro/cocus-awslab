# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
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
