output "public_ip_of_my_server" {
  description = "this is the public IP"
  value       = aws_instance.my-server.public_ip
}

output "private_ip_of_my_server" {
  description = "this is the public IP"
  value       = aws_instance.my-server.private_ip
}
