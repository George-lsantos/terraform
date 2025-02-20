#criação de VPC
resource "aws_vpc" "VPC" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Minha VPC"
  }
}

#Criação de  subnet
resource "aws_subnet" "Subnet_public" {
  count = length(var.cidr_block_subnet_public)
  vpc_id = aws_vpc.VPC.id
  cidr_block = var.cidr_block_subnet_public[count.index]
  availability_zone = "${var.availability_zones[count.index]}"
  tags = {
    Name = "subnet-public-${var.availability_zones[count.index]}"
  }
}
variable "cidr_block_subnet_public"{
  type = list(string)
  default = ["10.0.1.0/24","10.0.2.0/24", "10.0.3.0/24"]
}

# Variável para definir as AZs desejadas
variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1a"]  # 🔹 Defina as AZs manualmente
}
variable "availability_zones_suffix" {
  type    = list(string)
  default = ["a", "b", "c"]  # 🔹 Define as letras das AZs manualmente
}


resource "aws_instance" "SRV-Linux" { 
  subnet_id = aws_subnet.Subnet_public[0].id
  count = 3
  ami = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"

  tags = {
    Name = "${count.index}-Servidor"
  }
}

/*O operador % (módulo) retorna o resto da divisão entre dois números.

Por que isso é útil?

O % garante que count.index sempre fique dentro do limite da lista de subnets, mesmo que tenhamos mais instâncias do que subnets.
Se tivermos 3 instâncias e 2 subnets, os valores seriam:
  0 % 2 = 0 → Instância 0 usa Subnet 0
  1 % 2 = 1 → Instância 1 usa Subnet 1
  2 % 2 = 0 → Instância 2 volta para Subnet 0
  Isso cria um balanceamento automático entre as subnets! 


subnet_id = aws_subnet.Subnet_public[count.index % length(aws_subnet.Subnet_public)].id
Isso significa:
  aws_subnet.Subnet_public é uma lista de subnets (porque você usou count).
  count.index % length(aws_subnet.Subnet_public) faz com que as instâncias sejam distribuídas alternadamente entre as subnets criadas.
  Se tivermos 3 subnets e 3 EC2, a distribuição será:
  Instância 0 → Subnet 0
  Instância 1 → Subnet 1
  Instância 2 → Subnet 2

Solução: Criar todas as EC2 em apenas uma subnet específica
  resource "aws_instance" "SRV-Linux" { 
  count = 3

  # Todas as instâncias ficarão na primeira subnet criada
  subnet_id = aws_subnet.Subnet_public[0].id  

  ami = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"

  tags = {
    Name = "${count.index}-Servidor"
  }
}

*/