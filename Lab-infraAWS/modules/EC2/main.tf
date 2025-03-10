resource "aws_instance" "SRV-Linux" { 
  for_each = var.instance_namesf
  ami = "ami-04b4f1a9cf54c11d0"
  instance_type = each.value
  subnet_id = aws_subnet.Subnet_public[0].id
  tags = {
    Name = each.key
  }
}

variable "instance_namesf" {
  type    = map(string)
  default = {
    "web"  = "t2.micro"
    "db"   = "t3.medium"
    "cache" = "t3.micro"
  }
}