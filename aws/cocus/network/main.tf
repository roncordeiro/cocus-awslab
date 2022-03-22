locals {
  vpc_id                        = var.vpc.vpc_id
  private_subnets_ids           = var.vpc.private_subnets_ids
  public_subnets_ids            = var.vpc.public_subnets_ids
  cluster_name                  = "${var.project}-awslab-${var.environment}"
}

module "network" {
  source                    = "../../modules/vpc"
  vpc_name                  = local.cluster_name
  cidr                      = var.vpc.cidr
  private_subnets           = var.vpc.private_subnets
  public_subnets            = var.vpc.public_subnets
  create_vpc                = var.vpc.create_vpc
  public_subnet_tags = {
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = local.cluster_name
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }
  private_subnet_tags = {
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = local.cluster_name
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}