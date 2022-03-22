variable "vpc_name" {
  type        = string
  description = "Nome da vpc"
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overriden"
  default     = "0.0.0.0/0"
}
variable "public_subnets" {
  description = "Public Subnets da VPC - Geralmente entregue pelo time de Cloud da Porto (Thiago Ferraz). Na dúvida utilize http://www.davidc.net/sites/default/subnets/subnets.html"
  type        = list(string)
  default     = []
}
variable "private_subnets" {
  description = "Subnets privadas da VPC - Geralmente entregue pelo time de Cloud da Porto (Thiago Ferraz). Na dúvida utilize http://www.davidc.net/sites/default/subnets/subnets.html"
  type        = list(string)
  default     = []
}

variable "create_vpc" {
  type        = bool
  description = "Controla se a VPC será criada"
}

variable "public_subnet_tags" {
  type = map(string)
}
variable "private_subnet_tags" {
  type = map(string)
}
