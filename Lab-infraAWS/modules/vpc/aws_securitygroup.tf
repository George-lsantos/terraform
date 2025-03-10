variable "allowed_ports" {
  type    = list(object({ port = number, protocol = string }))
  default = [
    { port = 80, protocol = "tcp" },
    { port = 443, protocol = "tcp" },
    { port = 22, protocol = "tcp" }
  ]
}

resource "aws_security_group" "sg" {
  name = "meu-sg"
  vpc_id = aws_vpc.vpc.id
  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "security group-padrao"
  }
}

