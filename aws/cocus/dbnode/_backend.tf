# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket         = "awslab-terraform-bcp"
    dynamodb_table = "awslab-terraform-bcp"
    encrypt        = true
    key            = "aws/cocus/dbnode/terraform.tfstate"
    profile        = "protofire-devops"
    region         = "eu-west-2"
  }
}