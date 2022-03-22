locals {
  private_filename = "${var.environment}_${var.service_name}_${lower(var.project)}.pem"
  public_filename = "${var.environment}_${var.service_name}_${lower(var.project)}.pub"
}
resource "aws_key_pair" "key" {
  key_name   = "${var.environment}_ssh_${var.service_name}_${lower(var.project)}"
  public_key = tls_private_key.chave.public_key_openssh
}

resource "local_file" "save_private_to" {
  count    = length(var.save_to)
  content  = tls_private_key.chave.private_key_pem
  filename = "${var.save_to[count.index]}/${local.private_filename}"
}
resource "local_file" "save_public_to" {
  count    = length(var.save_to)
  content  = tls_private_key.chave.public_key_openssh
  filename = "${var.save_to[count.index]}/${local.public_filename}"
}

resource "tls_private_key" "chave" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
