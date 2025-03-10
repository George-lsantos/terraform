resource "aws_instance" "srv-linux" { 
  for_each = var.instance_namesf
  ami = "ami-04b4f1a9cf54c11d0"
  instance_type = each.value
  subnet_id = aws_subnet.subnet_public[0].id
  tags = {
    Name = each.key
  }
}

