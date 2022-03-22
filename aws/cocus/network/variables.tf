variable "environment" {
  type        = string
  description = "Environment"
}

variable "project" {
  type        = string
  description = "Name of project"
}

variable "vpc" {
  type = object({
    vpc_id                        = string
    public_subnets_ids            = list(string)
    private_subnets_ids           = list(string)
    cidr                          = string,
    public_subnets                = list(string)
    private_subnets               = list(string)
    create_vpc                    = bool
  })

  description = "VPC related variables"
}
