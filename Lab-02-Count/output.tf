output "SRV" {
  value = aws_instance.SRV-Linux[*].id
}


output "Subnet_public_id" {
  value = aws_subnet.Subnet_public[*].id
}