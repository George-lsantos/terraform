#Criação de VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = local.vpc_tag.vpc
}

#Criação de Internet_gateway"
resource "aws_internet_gateway" "igw_vpc" {
  vpc_id = aws_vpc.vpc.id
  tags = local.vpc_tag.igw
}

#Criação de  subnet publica
resource "aws_subnet" "subnet_public" {
  count = length(var.cidr_block_subnet_public)
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_block_subnet_public[count.index]
  availability_zone = "${var.az_pub[count.index]}"
  tags = {
    Name = "subnet-public-${var.az_pub[count.index]}"
  }
}

#Criação de  subnet privada
resource "aws_subnet" "subnet_private" {
  count = length(var.cidr_block_subnet_private)
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_block_subnet_private[count.index]
  availability_zone = "${var.az_priv[count.index]}"
  tags = {
    Name = "subnet-private-${var.az_priv[count.index]}"
  }
}

#Criação de Route table public
resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc.id
  }

  tags = local.vpc_tag.rtb_public
}


# Criar Elastic IPs para o NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}


# Criar NAT Gateway na subnet pública
resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnet_public[0].id  # NAT ficará na primeira subnet pública

  tags = {
    Name = "nat-gateway"
  }
}


# Criar Route Table para subnets privadas
resource "aws_route_table" "rtb_private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT.id
  }

  tags = local.vpc_tag.rtb_private
}


# Associar Route Table pública às subnets públicas
resource "aws_route_table_association" "rtb_p_subnet" {
  count          = length(aws_subnet.subnet_public)
  subnet_id      = aws_subnet.subnet_public[count.index].id
  route_table_id = aws_route_table.rtb_public.id
}

# Associar Route Table privada às subnets privadas
resource "aws_route_table_association" "rtb_p_subnet_private" {
  count          = length(aws_subnet.subnet_private)
  subnet_id      = aws_subnet.subnet_private[count.index].id
  route_table_id = aws_route_table.rtb_private.id
}
