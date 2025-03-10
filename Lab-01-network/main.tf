resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = local.vpc_tag.vpc
}

#Criação de IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = local.vpc_tag.igw
}

#Criação de subnet public
resource "aws_subnet" "subnet_public" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_public
  availability_zone = "us-east-1a"
  tags = local.vpc_tag.subnet_public
}

#Criação de subnet private
resource "aws_subnet" "subnet_private" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_private
  availability_zone = "us-east-1b"
  tags = local.vpc_tag.subnet_private
}

#Criação de RT public
resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = local.vpc_tag.rtb_public
}

#Assoc. rtb public -para- subnet public
resource "aws_route_table_association" "rtb_p_subnet" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.rtb_public.id
}

#Criação de RTB private
resource "aws_route_table" "rtb_private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0" 
    nat_gateway_id = aws_nat_gateway.NAT.id  # Rota para o NAT Gateway
  }

  tags = local.vpc_tag.rtb_private
}

#Criar o NAT Gateway
# Criar Elastic IP para o NAT Gateway, NAT Gateway precisa de um Elastic IP e deve estar em uma subnet pública.
# Criar Elastic IP para o NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# Criar NAT Gateway na subnet pública
resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnet_public.id  # O NAT Gateway precisa estar em uma subnet pública

  tags = {
    Name = "nat-gateway"
  }
}

# Associar a RTB privada às Subnets Privadas
resource "aws_route_table_association" "rtb_p_subnet_private" {
  subnet_id      = aws_subnet.subnet_private.id
  route_table_id = aws_route_table.rtb_private.id
}