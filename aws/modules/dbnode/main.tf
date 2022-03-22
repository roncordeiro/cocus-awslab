resource "aws_instance" "node" {
  ami                         = var.ami
  key_name                    = var.key_name
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.db-awslab-node-sg.id]
  subnet_id                   = var.subnet_ids[0]
  associate_public_ip_address = true

  tags = {
    Name = "${var.environment}_node_${var.project}"
  }
}

resource "aws_security_group" "db-awslab-node-sg" {
  name   = "db-awslab-node-security-group"
  vpc_id = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 3110
    to_port     = 3110
    cidr_blocks = ["172.16.1.0/24"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["172.16.1.0/24"]
  }

  ingress {
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

