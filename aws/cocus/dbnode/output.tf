
output "private_key_file" {
  value = module.key_pair.private_filename
}
output "public_key" {
  value = module.key_pair.public_filename
}
output "public_dns" {
  value = module.node.public_dns
}
output "security_group_id" {
  value = module.node.security_group_id
}
output "public_ip" {
  value = module.node.public_ip
}
output "private_ip" {
  value = module.node.private_ip
}