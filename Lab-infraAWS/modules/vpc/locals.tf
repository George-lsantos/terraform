locals {
  vpc_tag = {
    subnet_public  = { Name = "Subnet-Public" }
    subnet_private = { Name = "Subnet-Private" }
    rtb_public = {Name = "rtb-public"}
    rtb_private = {Name = "rtb-private"}
    igw = {Name = "Internet Gateway"}
    vpc = {Name = "Minha-VPC"}

    }
}