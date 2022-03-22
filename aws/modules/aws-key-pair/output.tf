output "name" {
    value = aws_key_pair.key.key_name
}   
output "public_filename" {
    value = local.public_filename
}
output "private_filename" {
    value = local.private_filename
}
output "public_key" {
    value = tls_private_key.chave.public_key_openssh
}
output "private_key" {
    value = tls_private_key.chave.private_key_pem
}