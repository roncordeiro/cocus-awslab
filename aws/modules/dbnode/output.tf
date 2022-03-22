
output "public_ip" {
  value = aws_instance.node.public_ip
}

output "private_ip" {
  value = aws_instance.node.private_ip
}

output "security_group_id" {
  value = aws_security_group.db-awslab-node-sg.id
}

output "public_dns" {
  value = aws_instance.node.public_dns
}
output "instance_id" {
  value = aws_instance.node.id
}