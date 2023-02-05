output "instance1_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web[0].public_ip
}

output "instance2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web[1].public_ip
}

output "instance3_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web[2].public_ip
}