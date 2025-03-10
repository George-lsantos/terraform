module "vpc" {
  source = "../../modules/vpc"

        cidr_block = "10.0.0.0/16"
        cidr_block_subnet_public = ["10.0.1.0/24","10.0.2.0/24", "10.0.3.0/24"]
        cidr_block_subnet_private = ["10.0.4.0/24","10.0.5.0/24", "10.0.6.0/24"]
        az_pub = ["us-east-1a", "us-east-1b", "us-east-1c"]  # 🔹 Defina as AZs manualmente
        az_priv = ["us-east-1a", "us-east-1b", "us-east-1c"] 
        availability_zones_suffix = ["a", "b", "c", "d", "e", "f"]  # 🔹 Define as letras das AZs manualmente
}

module "ec2" {
  source = "../../modules/EC2"
}