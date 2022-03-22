output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets_ids" {
  description = "O ID das vpcs privadas. Infelizmente esta chumbado. No maximo 3 subnets publicas do primeiro cidr e 3 do segundo cidr."
  value       = local.private_subnets_ids
}

output "public_subnets_ids" {
  description = "O ID das vpcs publicas. Infelizmente esta chumbado. No maximo 3 subnets publicas do primeiro cidr e 3 do segundo cidr."
  value       = local.public_subnets_ids
}

output "vpc" {
  value = module.vpc
}
