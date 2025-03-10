output "ec2_id" {
  value = aws_instance.srv-linux[*].id
}