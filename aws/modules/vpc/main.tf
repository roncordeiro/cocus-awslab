
locals {
  private_subnets_ids           = var.create_vpc ? [module.vpc.private_subnets[0]] : []
  public_subnets_ids            = var.create_vpc ? [module.vpc.public_subnets[0]] : []
  azs                           = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

data "aws_availability_zones" "available" {
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"

  name                  = var.vpc_name
  cidr                  = var.cidr
  azs                   = local.azs
  public_subnets        = var.public_subnets
  private_subnets       = var.private_subnets
  enable_nat_gateway    = true
  single_nat_gateway    = true
  enable_dns_hostnames  = true
  create_vpc            = var.create_vpc
  public_subnet_tags    = var.public_subnet_tags
  private_subnet_tags   = var.private_subnet_tags
}

resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "172.16.0.0/24",
    ]
  }
  count = var.create_vpc ? 1 : 0
}

resource "aws_security_group" "worker_group_mgmt_two" {
  name_prefix = "worker_group_mgmt_two"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "172.16.1.0/24",
    ]
  }
  count = var.create_vpc ? 1 : 0
}

resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
      "172.16.0.0/23"
    ]
  }

  count = var.create_vpc ? 1 : 0
}

