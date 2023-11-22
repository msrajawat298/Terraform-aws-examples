output "instance_id" {
  value = aws_instance.example_instance_myk.id
}
output "public_ip" {
  value = aws_instance.example_instance_myk.public_ip
}
output "private_ip" {
  value = aws_instance.example_instance_myk.private_ip
}
output "private_key" {
  value     = local_file.private_key_file.filename
  sensitive = true
}