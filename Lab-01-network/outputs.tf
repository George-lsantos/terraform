output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.vpc.id
}

output "subnet_public_id" {
  description = "ID da subnet pública"
  value       = aws_subnet.subnet_public.id
}

output "subnet_private_id" {
  description = "ID da subnet private"
  value       = aws_subnet.subnet_private.id
}