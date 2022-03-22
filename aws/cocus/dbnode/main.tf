data "aws_ami" "amazon" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = [var.architecture]
  }

  name_regex = lookup(var.amis_os_map_regex, var.os)
  owners     = [length(var.amis_primary_owners) == 0 ? lookup(var.amis_os_map_owners, var.os) : var.amis_primary_owners]
}

module "node" {
  source              = "../../modules/dbnode"
  instance_type       = "t3a.large"
  vpc_id              = var.vpc_id
  environment         = var.environment
  project             = var.project
  ami                 = data.aws_ami.amazon.id
  subnet_ids          = var.public_subnet_ids
  key_name            = module.key_pair.name
}

# Save at tmp to some modules use it 
resource "local_file" "save_private_to" {
  content  = module.key_pair.private_key
  filename = "/tmp/${module.key_pair.private_filename}"
  file_permission = "0600"
}

module "key_pair" {
  source       = "../../modules/aws-key-pair"
  environment  = var.environment
  project      = var.project
  save_to      = ["./keys/"]
  service_name = "node"
}

/*
Attach temp disk
*/

resource "aws_ebs_volume" "awslab" {
  availability_zone = "eu-west-2a"
  size              = 200
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.awslab.id
  instance_id = module.node.instance_id
}

resource "null_resource" "key_permission" {
  provisioner "local-exec" {
    command = "cd keys && chmod 400 *.*"
  }
  depends_on = [module.node]
}

