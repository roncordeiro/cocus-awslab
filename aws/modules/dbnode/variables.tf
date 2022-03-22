
variable "instance_type" {
  default     = "t3.micro"
  description = "Instance type, see a list at: https://aws.amazon.com/ec2/instance-types/"
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "environment" {
  description = "Environment tag, e.g prod"
}

variable "project" {
  type = string
}

variable "ami" {
  type = string
}
variable "subnet_ids" {
  description = "Ids of subnets where to create mongodb instances"
  type = list
}
variable "key_name" {
  type = string
  description = "Nome da AWS KEY PAIR"
}