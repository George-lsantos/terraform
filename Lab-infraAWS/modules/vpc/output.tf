output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_public_cidr" {
  value = aws_subnet.subnet_public[*].id
}

output "subnet_private_cidr" {
  value = aws_subnet.subnet_private[*].id
}

output "aws_route_table_association" {
  value = aws_route_table_association.rtb_p_subnet[*].id
}
