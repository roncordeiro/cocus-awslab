# cocus-awslab
COCUS - Site Reliability Engineer Challenge

AWS LAB

- cocus-awslab-bcp 

    bcp = best current pratice for IaC
- the project requirement are:

    Terragrunt version v0.35.14

    Terraform version v1.1.0+

    Configured AWS access key and create a profile called [cocus-devops]
- why terragrunt?

  terragrunt is a great tool to organize and sync HCL files on cloud, you can manage the environment and files on a S3 Bucket and DynamoDB table, so you can prevent loss of terraform configuration data.
- this project generates access keys on the /node/keys/ folder, so you can use it to connect and access the EC2 Instance through ssh.

- how to deploy 

  needs to create an Aws S3 bucket called awslab-terraform-bcp and activate versioning in the same region.   

  in CMD, on the aws/cocus/network/ folder run...

  terragrunt init
  
  terragrunt plan

  terragrunt apply --auto-approve

  the same 3 commands above to the /aws/cocus/webnode and /aws/cocus/dbnode folders 


Ronaldo Cordeiro
